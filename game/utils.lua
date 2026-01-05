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

	local map_w, map_h
	if (use_sample_map) then
		map_w = (#(sample_map[1]) + 1) / 2
		map_h = #sample_map
	else 
		map_w = 128
		map_h = 32
	end

    -- FIRST PASS: set tile types
    local converted_type_map = matrix_map(map_h, map_w, "")
    if (use_sample_map) then
        for ty=0,map_h - 1 do
            for tx=0,map_w - 1 do
                local pos = (tx + 1) * 2 - 1
                local c = sub(sample_map[ty + 1], pos, pos)
                if (c == " ") c = "0"
                converted_type_map[ty][tx] = c
            end
        end
    else
        load_rle_map(map_string, map_w, converted_type_map)
    end

     -- SECOND PASS: set tile variations according to theme
	local emgr = game.mgr.enemy_mgr
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
                player.x = tx * 8
                player.y = ty * 8
            elseif (t >= "a" and t <= "b") then -- bats
                c_bat.new(px, py, t == "a", emgr)
            elseif (t == "6") then -- switchlith
                c_switchlith.new(px, py, game.mgr.misc_mgr)
            elseif (t == "7") then -- teleport pair 2
			elseif (t == "8") then -- dead
            elseif (t == "e") then -- dog
				c_dog.new(px, py, emgr)
            elseif (t >= "c" and t <= "d") then -- laser cannons
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