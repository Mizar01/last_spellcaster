-- A method for all directions
-- TODO: move into c_obj
function obj_move(obj, d, ovd_speed)
	local sx = ovd_speed or obj.speed
	local sy = ovd_speed or obj.speed
	local speed_x = d == dir_left and -sx or (d == dir_right and sx or 0)
	local speed_y = d == dir_up and -sy or (d == dir_down and sy or 0)
	local hbp = obj:hitbox_pos(speed_x, speed_y)
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
----------------------------------------------
-- MAP UTILS
----------------------------------------------

-- Get if a tile is solid by pixel coordinates
function mget2_by_px_solid(x, y, tw, th)
	local mtile = mget2_by_px(x, y, tw, th)
	return is_solid(mtile.tile)
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

function is_solid(tile)
	return fget(tile, fsolid_idx)
end

function is_solid_at_grid(tx, ty)
	local tile = mget(tx, ty)
	return is_solid(tile)
end

function random_grid_pos(tiles_x, tiles_y, offx, offy)
	return {
		x = flr(rnd(tiles_x or 15)) + (offx or 0),
		y = flr(rnd(tiles_y or 15)) + (offy or 0)
	}
end

function stage_config_get()
    return stage_config[stage]
end

function is_last_stage_with_last_gem()
	local stage_gems = stage_config_get().gems
	return (stage == #stage_config and player.gems == stage_gems - 1)
end

function player_tile_check(tx, ty)
	local m = mget2_by_px(player.x, player.y)
	return m.tx == tx and m.ty == ty
end

function build_stage_config_item(name, music, theme, npcdata)
	return {
		name = name,
		music = music,
		theme = themes[theme],
        npcdata = npcdata,
	}
end

function map_tiles_by_theme(tile_variant, theme)
    local m = {
        [ncn_none] = theme.tile_maps[2],
        [ncn_up] = theme.tile_maps[1],
        [ncn_down] = theme.tile_maps[2],
        [ncn_left] = theme.tile_maps[5],
        [ncn_right] = theme.tile_maps[4],
        [ncn_up_down] = theme.tile_maps[1],
        [ncn_left_right] = theme.tile_maps[3],
        [ncn_up_left] = theme.tile_maps[1],
        [ncn_up_right] = theme.tile_maps[1],
        [ncn_down_left] = theme.tile_maps[5],
        [ncn_down_right] = theme.tile_maps[4],
        [ncn_up_down_left] = theme.tile_maps[1],
        [ncn_up_down_right] = theme.tile_maps[1],
        [ncn_up_left_right] = theme.tile_maps[1],
        [ncn_down_left_right] = theme.tile_maps[3],
        [ncn_all] = theme.tile_maps[1],
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
            converted_type_map[y][x] = tile_char
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

	local map_w, map_h = 128, 32

    -- FIRST PASS: set tile types
    local converted_type_map = matrix_map(map_h, map_w, "")  -- 0 based map of tile types
    if (use_sample_map) then
        for ty=1, map_h do
            for tx=1,map_w do
                local pos = (ty - 1) * map_w * 2 + (tx - 1) * 2 + 1
                local c = sub(sample_map, pos, pos)
                if (c == " ") c = "0"
                converted_type_map[ty - 1][tx - 1] = c
            end
        end
    else
        load_rle_map(map_string, map_w, converted_type_map)
    end

     -- SECOND PASS: set tile variations according to theme
	local emgr = game.mgr.enemy_mgr
    local mmgr = game.mgr.misc_mgr
    local swarr = {}
    local dswarr = dstarc("M={};N={};O={};P={}")
    for ty=0,map_h - 1 do
        for tx=0,map_w - 1 do
            local t = converted_type_map[ty][tx]
            mset(tx, ty, 0) -- reset tile
			local px = tx * 8
			local py = ty * 8
            if (t == "1") then -- solid tile
                -- check neighbors to set variations
                local tile_variant = neighbor_conf(converted_type_map, tx, ty)
                local tile_to_set = map_tiles_by_theme(tile_variant, theme) or 1
                mset(tx, ty, tile_to_set)
            elseif (t == "f") then -- player start position
                player:respawn(px, py)
            elseif (t == "a" or t == "b") then -- bats
                c_bat.new(px, py, t == "a", emgr)
            elseif (t == "6") then -- focuslith
                c_focuslith.new(px, py, mmgr)
			elseif (t == "8") then -- dead
            elseif (t == "e") then -- dog
				c_walk_en.new(px, py, "dog")
            elseif (t == "g") then -- spider
                c_walk_en.new(px, py, "spider")
            elseif (t == "h") then
                c_vine.new(px, py, emgr)
            elseif (instr("XYZ", t)) then
                c_shard.new(px, py, t == "X" and 1 or t == "Y" and 3 or 5, true)
            elseif (instr("pqrstuvwxyz", t)) then
                local npcdata = stage_cfg.npcdata[t]
                -- flog("stage = " .. tostr(t))
                c_npc.new(px, py, npcdata.cname, npcdata.msg)
            elseif (instr("ABCD", t)) then -- element scrolls
                c_scroll.new(px, py, ord(t) - ord("A") + 1)
            elseif (instr("MNOP", t)) then -- element launchers
                add(dswarr[t], c_door.new(px, py, mmgr))
            elseif (instr("QRST", t)) then -- switches
                swarr[t] = c_switchlith.new(px, py, mmgr)
            end
        end
    end
    flog(dswarr["M"])
    for k,v in pairs(swarr) do
        local kt = sub("MNOP",ord(k) - ord("Q"),1)
        for dsw in all(dswarr[kt]) do
            v:link_switch(dsw)
        end
    end

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
	local max_y = #ctm - 1
	local max_x = #ctm[0] - 1
    local up = (ty > 0) and (ctm[ty - 1][tx] == "1") or ty == 0
    local down = (ty < max_y) and (ctm[ty + 1][tx] == "1") or ty == max_y
    local left = (tx > 0) and (ctm[ty][tx - 1] == "1") or tx == 0
    local right = (tx < max_x) and (ctm[ty][tx + 1] == "1") or tx == max_x
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
    update = function(self)
        self.x += (player.x - self.x) * self.csfx
        self.y += (player.y - self.y) * self.csfy
        self.x = mid(self.ox, self.x, (128 * 8) - self.ox - 16)
        self.y = mid(self.oy, self.y, (32 * 8) - 40)
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
}