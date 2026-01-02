-- SCREEN OBJ UTILS -------------------------------
-- ALL OBJECTS MUST have .x, .y, .hitbox, .speed, .spr table (see player for example)
c_obj = {
 	new = function(x, y, parent_mgr)
		local o = {
			name = "obj",
			x = x or 0,
			y = y or 0,
			parent_mgr = parent_mgr or nil,
			hitbox = {x=0,y=0,x2=7,y2=7}, -- default full tile hitbox
			speed = 0.4,
			-- Sprite configuration
			spr = { 
				-- sprite config for idle phase. You can add more phases as needed
				--  arguments: sprites = array of sprite indexes, fps = frames per second, loop = bool (default true)
				--             ss = single sprite index (for non-animated phases)
				idle = { sprites = { 64, 65 }, fps = 2,  loop = true },
				-- other_phase = { ss = 12 }, -- example of another phase that uses a single sprite
				flip_x = false,
				flip_y = false,
				time_start = 0, 	-- time when the animation started. It is useful to calculate next frame based on fps
				effect = "none", 	-- special effect for drawing (like blink_white, rotx, roty, rotz, etc)
				last_frame = 0,
				rot_speed = 1, -- for rotation effects (1 -> 1 full turn per second)
			},
			phase = "idle",
		}
		if (o.parent_mgr) then
			o.parent_mgr:add(o)
		end
		setmetatable(o, c_obj)
		return o
	end,
	update = function(self)
	end,
	draw = function(self)
		self:draw_sprite()
 	end,
	draw_sprite = function(self)

		if (debug) then
			-- draw hitbox for debugging
			local hb = self:hitbox_pos(0, 0)
			rect(hb.x, hb.y, hb.x2, hb.y2, 8)
		end

		local s  = self.spr

		if (s.effect == "blink_white") then

			local cover = (time() % 0.2 < 0.1) 
			if (cover) then
				for c = 0, 15 do pal(c, 7) end -- white override for entire palette
			end

		end

		local sprph = s[self.phase]

		local next_sprite = nil
		if (sprph.ss ~= nil) then
			-- single sprite phase
			next_sprite = sprph.ss
		else
			if (sprph.loop ~= nil and sprph.loop == false and sprph.sprites[#sprph.sprites] == s.last_frame) then
				next_sprite = s.last_frame
			else
				if (s.time_start == nil or s.time_start == 0) then
					s.time_start = time()
				end
				next_sprite = sprph.sprites[1 + flr((time() - s.time_start) / (1 / sprph.fps)) % #sprph.sprites]
			end
		end

		if (s.effect == "rotx" or s.effect == "roty") then
			local w = 8
			local h = 8
			local rot_speed = s.rot_speed or 1
			if (s.effect == "roty") then
				w = cos(t() * rot_speed) * 8
			else -- rotx
				h = cos(t() * rot_speed) * 8
			end
			sspr(
				next_sprite % 16 * 8,
				flr(next_sprite / 16) * 8, 
				8, 
				8, 
				self.x + 4 - (w / 2), 
				self.y, 
				w, 
				h,
				false, 
				false
			)
		else 
			spr(
				next_sprite, 
				self.x, 
				self.y, 
				1, 
				1, 
				s.flip_x or false, 
				s.flip_y or false,
				7
			)
		end
	
		pal()  -- reset palette
		s.last_frame = next_sprite

	end,
	-- tolerance is used to make collision less strict
	collide = function(self, other, tolx, toly)
		local h1 = self:hitbox_pos(0, 0)
		local h2 = other:hitbox_pos(0, 0)
		if (tolx != nil) then
			h1.x += tolx
			h1.x2 -= tolx
			h2.x += tolx
			h2.x2 -= tolx
		end
		return not (h1.x2 < h2.x or h1.x > h2.x2 or h1.y2 < h2.y or h1.y > h2.y2)
	end,
	-- Get the hitbox vertex points of an object in world coordinates, with optional offsets ox, oy
	 --  if you must calculate a destination point.
	hitbox_pos = function(self, ox, oy)
		ox = ox or 0
		oy = oy or 0
		return {
			x = self.x + ox + self.hitbox.x,
			y = self.y + oy + self.hitbox.y,
			x2 = self.x + ox + self.hitbox.x2,
			y2 = self.y + oy + self.hitbox.y2,
		}
	end,
}
c_obj.__index = c_obj
--------------------------------------------------

----------------------------------------------
-- MANAGER BASE CLASS
----------------------------------------------
c_mgr = {
	new = function()
		local m = {}
		m.objs = {}
		m.update_in_pause = false
		setmetatable(m, c_mgr)
		return m
	end,
	restart = function(self)
		self.objs = {}
	end,
	add = function(self, obj)
		add(self.objs, obj)
	end,
    del = function(self, obj)
        del(self.objs, obj)
    end,
	update = function(self)
		if (game.paused and not self.update_in_pause) then
			return
		end
        for o in all(self.objs) do
            o:update()
        end
	end,
	draw = function(self)
        for o in all(self.objs) do
            o:draw()
        end
	end,
}
c_mgr.__index = c_mgr

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
		local ttop = mget2_by_px(side_x, hbp.y)
		local tbottom = mget2_by_px(side_x, hbp.y2)
		if (not is_solid(ttop.tile) and not is_solid(tbottom.tile)) then
			obj.x = obj.x + speed_x
			return 1
		else
			-- move at the leftmost/rightmost possible position before the tile
			obj.x = d == dir_left and (ttop.ox + 8 + obj.hitbox.x - 4) or (ttop.ox - 8 + obj.hitbox.x)
			return 0
		end
	elseif (d == dir_up or d == dir_down) then
		local side_y = d == dir_up and hbp.y or hbp.y2
		local tleft = mget2_by_px(hbp.x, side_y)
		local tright = mget2_by_px(hbp.x2, side_y)
		if (not is_solid(tleft.tile) and not is_solid(tright.tile)) then
			obj.y = obj.y + speed_y
			return 1
		else
			-- move at the topmost/bottommost possible position before the tile
			-- obj.y = d == dir_up and (tleft.oy + 8 - hbp.y) or (tleft.oy - 8 + hbp.y2 - 1)
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

function build_shop_item(name, desc1, desc2, price, enable_after_stage, reusable, fn)
    return {
        name = name,
        desc1 = desc1,
        desc2 = desc2,
        price = price,
        used = false,
        reusable = reusable,
        enable_after_stage = enable_after_stage or 1,
        fn = fn or nil,
    }
end

function build_stage_config_item(name, music, theme, gems)
	return {
		name = name,
		music = music,
		theme = themes[theme],
		gems = gems,
	}
end

function map_tiles_by_theme(tile_variant, theme)
    local m = {
    [neighbor_conf_codes.none] = theme.tile_maps[2],
    [neighbor_conf_codes.up] = theme.tile_maps[1],
    [neighbor_conf_codes.down] = theme.tile_maps[2],
    [neighbor_conf_codes.left] = theme.tile_maps[5],
    [neighbor_conf_codes.right] = theme.tile_maps[4],
    [neighbor_conf_codes.up_down] = theme.tile_maps[1],
    [neighbor_conf_codes.left_right] = theme.tile_maps[3],
    [neighbor_conf_codes.up_left] = theme.tile_maps[1],
    [neighbor_conf_codes.up_right] = theme.tile_maps[1],
    [neighbor_conf_codes.down_left] = theme.tile_maps[5],
    [neighbor_conf_codes.down_right] = theme.tile_maps[4],
    [neighbor_conf_codes.up_down_left] = theme.tile_maps[1],
    [neighbor_conf_codes.up_down_right] = theme.tile_maps[1],
    [neighbor_conf_codes.up_left_right] = theme.tile_maps[1],
    [neighbor_conf_codes.down_left_right] = theme.tile_maps[3],
    [neighbor_conf_codes.all] = theme.tile_maps[1],
    }
    return m[tile_variant]
end

-- The format is compressed like that:
--  - 1 line only (its implicit that the map is given by the rows and cols of the string array)
--  - every digit from 0 to f represents a tile type or an object in the stage
--  see iws_map_compressor.lua for the full list of tile types/objects
--  - for rows x0 = "x", x1 = "xx", x2 = "xxx", x3 = "xxxx" etc (for example 14 times '1' is 1d)
-- Example of a 16x16 map with borders and empty inside:
-- "1f100d00100d00100d00100d00100d00100d00100d00100d00100d00100d00100d00100d00100d00100d001f"
-- In few words the odd characters are tile types, the even characters are counts (in hex) of how many times to repeat the previous tile type
-- Note that the minimum to get a meaningful info on map tile is made by 2 chars.
function setup_stage_from_string()

    local map_string = stage_compressed_maps[stage]
    local stage_cfg = stage_config_get()
    local theme = stage_cfg.theme
	local main_tile_type = 1

	local map_w, map_h
	if (use_sample_map) then
		map_w = (#(sample_map[1]) + 1) / 2
		map_h = #sample_map
	else 
		map_w = 128
		map_h = 32
	end
	flog("WH: " .. map_w .. "x" .. map_h)
	

    -- FIRST PASS: set tile types
    local converted_type_map = matrix_map(map_h, map_w, 0)
    if (use_sample_map) then
        for ty=0,map_h - 1 do
            for tx=0,map_w - 1 do
                local pos = (tx + 1) * 2 - 1
                local c = sub(sample_map[ty + 1], pos, pos)
                if (c == " ") c = "0"
                converted_type_map[ty][tx] = tonum("0x" .. c)
            end
        end
    else

        local x = 0
	    local y = 0

	    while #map_string > 0 do

            local tt_string = sub(map_string, 1, 1)
            if (tt_string == " ") tt_string = "0"
            local cnt_str = sub(map_string, 2, 2)
            local tile_type = tonum("0x" .. tt_string)
            local count = tonum("0x" .. cnt_str) + 1

            for _ = 1, count do
                converted_type_map[y][x] = tile_type
                x += 1
                if (x >= map_w) then
                    x = 0
                    y += 1
                end
            end

            if (#map_string > 2) then
                map_string = sub(map_string, 3)	
            else
                break
            end

        end
    end

     -- SECOND PASS: set tile variations according to theme
	local emgr = game.mgr.enemy_mgr
    for ty=0,map_h - 1 do
        for tx=0,map_w - 1 do
            local t = converted_type_map[ty][tx]
            mset(tx, ty, 0) -- reset tile
			local px = tx * 8
			local py = ty * 8
            if (t == main_tile_type) then -- solid tile
                -- check neighbors to set variations
                local tile_variant = neighbor_conf(converted_type_map, tx, ty)
                local tile_to_set = map_tiles_by_theme(tile_variant, theme) or main_tile_type
                mset(tx, ty, tile_to_set)
            elseif (t == 15) then -- player start position
                player.x = tx * 8
                player.y = ty * 8
            elseif (t >= 10 and t <= 11) then -- drones
            elseif (t == 6) then -- teleport pair 1
            elseif (t == 7) then -- teleport pair 2
			elseif (t == 8) then -- dead
            elseif (t == 14) then -- dog
				c_dog.new(px, py, emgr)
            elseif (t >= 12 and t <= 13) then -- laser cannons
            end
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
function neighbor_conf(converted_type_map, tx, ty)
    -- outside map edges are considered solid
	local max_y = #converted_type_map - 1
	local max_x = #converted_type_map[0] - 1
    local ctm = converted_type_map
    local up = (ty > 0) and (ctm[ty - 1][tx] == 1) or ty == 0
    local down = (ty < max_y) and (ctm[ty + 1][tx] == 1) or ty == max_y
    local left = (tx > 0) and (ctm[ty][tx - 1] == 1) or tx == 0
    local right = (tx < max_x) and (ctm[ty][tx + 1] == 1) or tx == max_x
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
		local cx, cy = self:calc_center()
		camera(cx, cy)
    end,
    -- draw = function(self)
	-- 	-- draw black rectangle in the bottom part (hiding sprites for the memory shared part of the map with sprites)
	-- 	-- rectfill(-64, 32 * 8, 128 * 8 + 64, 128 * 8 + 64, 0) -- bottom
	-- 	test_point(10, 10)
    -- end,
	place = function(self, x, y)
		self.x = x
		self.y = y
	end,
	calc_center = function(self)
		return flr(self.x) - self.ox, flr(self.y) - self.oy
	end,
}