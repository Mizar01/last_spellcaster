-- SCREEN OBJ UTILS -------------------------------
-- ALL OBJECTS MUST have .x, .y, .hitbox, .speed, .spr table (see player for example)
c_obj = cstar("c_obj", {
 	__new = function(n, x, y, parent_mgr)
		local o = dstarc([[
parent_mgr=*3
hitbox={x=0;y=0;x2=7;y2=7}
speed=0.4
destroyed=false
phase=idle
x=*1
y=*2
spawn_x=*1
spawn_y=*2
]], {x or 0, y or 0, parent_mgr or nil})

		o.spr = dstarc([[
idle = { sprites = { 64; 65 }; fps = 2;  loop = true }
flip_x = false
flip_y = false
time_start = 0	
effect = none
last_frame = 0
rot_speed = 1
offview = false
]])
		if (o.parent_mgr) o.parent_mgr:add(o)
		return o
	end,
	update = function(self)
	end,
	draw = function(self)
		self:draw_sprite()
 	end,
	respawn = function(self, x, y)
		self.x, self.y, self.spawn_x, self.spawn_y = x, y, x, y
	end,
    del = function(self)
        self.destroyed = true
        if (self.parent_mgr) then
            self.parent_mgr:del(self)
        end
    end,
	draw_sprite = function(self)

		if (cam:offview(self)) then return end

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
			h1.y += toly
			h1.y2 -= toly
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
})
--------------------------------------------------

----------------------------------------------
-- MANAGER BASE CLASS
----------------------------------------------
c_mgr = cstar("c_mgr", {
	__new = function(n)
		local m = {}
		m.objs = {}
		m.update_in_pause = false
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
})