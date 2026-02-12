-- A method for all directions
-- TODO: move into c_obj
function obj_move(obj, d, ovd_speed)
	local sx = ovd_speed or obj.speed
	local sy = ovd_speed or obj.speed
	local speed_x = d == dir_left and -sx or (d == dir_right and sx or 0)
	local speed_y = d == dir_up and -sy or (d == dir_down and sy or 0)
	local hbp = obj:hitbox_pos(speed_x, speed_y)
    if (obj.bounce_map and (hbp.x < 0 or hbp.y < 0 or hbp.x2 > map_wpx or hbp.y2 > map_hpx)) then
        return 0
    end
	if (d == dir_right or d == dir_left) then
		local side_x = d == dir_left and hbp.x or hbp.x2
		local ttop = map_or_obj_solid_at_px(side_x, hbp.y)
		local tbottom = map_or_obj_solid_at_px(side_x, hbp.y2)
		if (not ttop and not tbottom) then
			obj.x = obj.x + speed_x
			return 1
		else
			return 0
		end
	elseif (d == dir_up or d == dir_down) then
		local side_y = d == dir_up and hbp.y or hbp.y2
		local tleft = map_or_obj_solid_at_px(hbp.x, side_y)
		local tright = map_or_obj_solid_at_px(hbp.x2, side_y)
		if (not tleft and not tright) then
			obj.y = obj.y + speed_y
			return 1
		else
			return 0
		end
	end
end

-- utils to check object is null or do things.
function obj_destroyed(obj) return obj == nil or obj.destroyed end
function obj_del(obj) if (obj != nil and not obj.destroyed) then obj:del() end end
    

----------------------------------------------
-- MAP UTILS
----------------------------------------------

-- Get if a tile is solid by pixel coordinates
function mget2_by_px_solid(x, y, tw, th)
	local mtile = mget2_by_px(x, y, tw, th)
	return fget(mtile.tile, fsolid_idx)
end

-- Get the object at pixel coordinates (x, y) among the temporarily solid objects
function osget_by_px(x, y)
    for o in all(obj_solids) do
        local hbp = o:hitbox_pos(0,0)
        if (x >= hbp.x and x < hbp.x2 and y >= hbp.y and y < hbp.y2) then
            return o
        end
    end
    return nil
end

function map_or_obj_solid_at_px(x, y, tw, th)
    return mget2_by_px_solid(x, y, tw, th) or (osget_by_px(x, y) != nil)
end

function obj_mem_ch(obj, state)
    stage_changes_mem[stage][flr(obj.spawn_x / 8)][flr(obj.spawn_y / 8)] = tostr(state)
end

function stage_config_get()
    return stage_config[stage]
end

function build_stage_config_item(main_props, npcdata)
    main_props.theme = themes[main_props.theme]
    main_props.npcdata = npcdata
    return main_props
end

function map_tiles_by_theme(tile_variant, theme)
    local m = {
        [ncn_none] = 2,
        [ncn_up] = 1,
        [ncn_down] = 2,
        [ncn_left] = 5,
        [ncn_right] = 4,
        [ncn_up_down] = 1,
        [ncn_left_right] = 3,
        [ncn_up_left] = 1,
        [ncn_up_right] = 1,
        [ncn_down_left] = 5,
        [ncn_down_right] = 4,
        [ncn_up_down_left] = 1,
        [ncn_up_down_right] = 1,
        [ncn_up_left_right] = 1,
        [ncn_down_left_right] = 3,
        [ncn_all] = 1,
    }
    return m[tile_variant]
end

function load_rle_map(str, map_width, converted_type_map)
    local x = 0
    local y = 0
    
    for i=1, #str, 2 do
        local tile_char = sub(str, i, i)
        
        local count_char = sub(str, i+1, i+1)
        local count = ord(count_char) - 32
        for k=1, count do
            converted_type_map[x][y] = tile_char
            x = x + 1
            if x >= map_width then
                x = 0
                y = y + 1
            end
        end
    end
    return converted_type_map
end

function setup_stage_from_string()

    local map_string = stage_compressed_maps[stage]
    local stage_cfg = stage_config_get()
    local theme = stage_cfg.theme

    -- FIRST PASS: set tile types
    local converted_type_map = nil
    local stage_changes_map = nil
    if (stage_mem[stage] == nil) then
        converted_type_map = matrix_map(map_h, map_w, "")  -- 0 based map of tile types
        stage_changes_map = matrix_map(map_h, map_w, "")  -- 0 based map of tile changes

        if (use_sample_map and spawn1) then
            for ty=1, map_h do
                for tx=1,map_w do
                    local pos = (ty - 1) * map_w * 2 + (tx - 1) * 2 + 1
                    local c = sub(sample_map, pos, pos)
                    if (c == " ") c = "0"
                    converted_type_map[tx - 1][ty - 1] = c
                end
            end
        else
            load_rle_map(map_string, map_w, converted_type_map)
        end
    else
        converted_type_map = stage_mem[stage]
        stage_changes_map = stage_changes_mem[stage]
    end

     -- SECOND PASS: set tile variations according to theme
    local mmgr = game.mgr.misc_mgr
    local swarr = {}
    local dswarr = dstarc("M={};N={};O={};P={}")
    local respw = false
    for ty=0,map_h - 1 do
        for tx=0,map_w - 1 do
            local t = converted_type_map[tx][ty]
            local c = stage_changes_map[tx][ty]
            -- if (c != "") flog("tile at "..tx..","..ty.." type "..tostr(t).." change "..tostr(c))
            mset(tx, ty, 0) -- reset tile
			local px = tx * 8
			local py = ty * 8
            if (t == "1") then -- solid tile
                -- check neighbors to set variations
                local tile_variant = neighbor_conf(converted_type_map, tx, ty)
                local tile_to_set = theme.tile_maps[map_tiles_by_theme(tile_variant, theme)] or 1
                mset(tx, ty, tile_to_set)
            elseif (instr("2345", t)) then -- background items
                local off = stage_cfg.bg_item_off[tonum(t) - 1]
                local io = c_obj.new(px + off[1], py + off[2], mmgr)
                io.spr.idle.sprites = stage_cfg.bg_item_spr[tonum(t) - 1]
                io.tw = off[1] == 0 and 1 or 2
                io.th = off[2] == 0 and 1 or 2
                add(mmgr, io)
            elseif (t == "f") then -- player start position
                if ovd_respawn != nil then
                    player:respawn(ovd_respawn[1] * 8, ovd_respawn[2] * 8)
                else player:respawn(px, py) end
                if (ovd_avail_els != nil and spawn1) player.avail_el = ovd_avail_els
                if (ovd_cur_el != nil and spawn1) player.cur_el = ovd_cur_el
                respw = true
            elseif (instr("abcd", t)) then -- bats
                c_fly_en.new(px, py, en_map[t])
            elseif (t == "6") then
                c_focuslith.new(px, py, mmgr)
			elseif (t == "8") then
            elseif (instr("egi", t)) then
				c_walk_en.new(px, py, en_map[t])
            elseif (t == "h") then
                if (c == "") c_vine.new(px, py)
            elseif (instr("XYZ", t)) then
                if (c == "") c_shard.new(px, py, t == "X" and 1 or t == "Y" and 3 or 5, true)
            elseif (instr("pqrstuvwxyz", t)) then
                local npcdata = stage_cfg.npcdata[t] or {cname="c_npc_stage"..stage, msg="undefined msg"}
                c_npc.new(px, py, npcdata.cname, npcdata.msg)
            elseif (instr("ABCDEFGHIJKL", t)) then
                if (c=="") c_scroll.new(px, py, t)
            elseif (instr("MNOP", t)) then
                local d = c_door.new(px, py, false, 0, c == "1")
                add(dswarr[t], d)
            elseif (instr("UVW", t)) then
                c_door.new(px, py, true, door_cost_map[t], c == "1")
            elseif (instr("QRST", t)) then
                local s = c_switchlith.new(px, py, mmgr)
                if (c=="1") s.on = true
                -- flog("Door is initially "..tostr(s.on).." at "..tx..","..ty)
                swarr[t] = s
            end
        end
    end

    -- for safety if I forget to place the player start on the map
    if (stage > 1 and not respw) then
        player:respawn(ovd_respawn[1] * 8, ovd_respawn[2] * 8)
    end

    for k,v in pairs(swarr) do
        local kt = sub(sub("MNOP",ord(k) - ord("Q") + 1), 1,1)
        -- flog("Linking switch "..k.." to door of type "..kt)
        for dsw in all(dswarr[kt]) do
            v:link_switch(dsw)
        end
    end

    stage_mem[stage] = converted_type_map
    stage_changes_mem[stage] = stage_changes_map

end

-- Configs:
--  0: no neighbors
--  1: up
--  2: down
--  4: left
--  8: right
-- combinations are sums of the above
function neighbor_conf(ctm, tx, ty)
    -- outside map edges are considered solid
    local up = (ty > 0) and (ctm[tx][ty - 1] == "1") or ty == 0
    local down = (ty < map_h) and (ctm[tx][ty + 1] == "1") or ty == map_h - 1
    local left = (tx > 0) and (ctm[tx - 1][ty] == "1") or tx == 0
    local right = (tx < map_w - 1) and (ctm[tx + 1][ty] == "1") or tx == map_w - 1
    local conf = 0
    if up then conf += 1 end
    if down then conf += 2 end
    if left then conf += 4 end
    if right then conf += 8 end
    return conf
end

cam = {
    x = 0,
    y = 0,
    ox = 64 - 8,
    oy = 94 - 8,
    csfx = 0.05,
	csfy = 0.07,
    offvtol = 90,
    update = function(self)
        self.x += (player.x - self.x) * self.csfx
        self.y += (player.y - self.y) * self.csfy
        self.x = mid(self.ox, self.x, (map_w * 8) - self.ox - 16)
        self.y = mid(self.oy, self.y, (map_h * 8) - 40)
		local cx, cy = self:calc_center()
		camera(cx, cy)
    end,
    -- sudden placing of the camera to the given position
	place = function(self, x, y)
		self.x = x
		self.y = y
	end,
	calc_center = function(self)
		return flr(self.x) - self.ox, flr(self.y) - self.oy
	end,
    offview = function(self, obj)
        return abs(flr(self.x - obj.x)) > self.offvtol or abs(flr(self.y - obj.y)) > self.offvtol
    end,
}