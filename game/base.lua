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
            destroyed = false,
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
    del = function(self)
        self.destroyed = true
        if (self.parent_mgr) then
            self.parent_mgr:del(self)
        end
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