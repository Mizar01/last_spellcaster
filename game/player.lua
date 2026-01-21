c_player = {
	new = function(x, y)
		local p = c_obj.new(x, y)
		dstar(p.spr, [[
			idle = { sprites = { 64; 65 }; fps = 2 }
			walk = { sprites = { 80; 81; 82 }; fps = 6 }
			jump = { sprites = { 97; 98; 99; 100; 101; 102 }; fps = 8 }
			dead = { sprites = { 68; 69; 70; 71; 72 }; fps = 4; loop = false }
		]])
		dstar(p, [[
			name=player
			p.prev_btn = {}
			invisible=false
			blocked=false
			invulnerable=false
			nodmg_t=nil
			jforce=1.7
			jstack=0
			max_jstack=15
			speed_y_decay=0.95
			speedy=0
			max_speedy=2
			phase=idle
			max_speed=1
			speed=0
			init_speed=0.1
			inc_speed_factor=0.2
			life=20
			max_life=20
			init_max_life=20
			coins=0
			stinky_socks=false
			cur_el=nil
			avail_el = {false;false;false;false}
			lev_el = {1;1;1;1}
			el_cooldown = _fn_t1_1
			shine_star=0
			interaction_fn=nil
			hitbox = { x = 2; y = 3; x2 = 5; y2 = 7 }
			t_respawn=nil
			shards = 100
			bounce_map=false
		]])
		return sm(p, c_player)
	end,
	reset_stage_props = function(self)
		self:reset_jump_vars()
	end,
	update = function(self)
		if game.paused then return end

		local p = self

		local btn = {
			left = btn(0),
			right = btn(1),
			jump = btn(4),
			jump_start = btnp(4),
			action = btnp(5)
			-- d = btnp(3,1), -- d key (for debug)
		}

		if (p.phase == "dead") then
			if (p.prev_btn.left) obj_move(p, dir_left) 
			if (p.prev_btn.right) obj_move(p, dir_right) 
			p.speed = p.speed * 0.9
			p:apply_forces(btn)
			if (p.t_respawn:adv()) then
				-- respawn the player
				p:respawn(p.spawn_x, p.spawn_y)
				p.life = p.max_life
				p.phase = "idle"
				p.invulnerable = false
			end
			return
		end


		-- if (btn.d) debug = not debug

		-- Movements and forces influenced by blocked status
		if (not p.blocked) then
			if (btn.left) p:move_left()
			if (btn.right) p:move_right()
			if (not btn.left and not btn.right) then
				-- slow down
				p.speed = p.speed * 0.7
				if (p.speed < 0.1) p.speed = 0
			end
			p:apply_forces(btn)
		end

		p.prev_btn = btn

		if (btn.left == false and btn.right == false and p:on_ground()) then
			p.phase = "idle"
		end

		if (p.nodmg_t ~= nil) then
			if (p.nodmg_t:adv()) then
				p.spr.effect = "none"
				p.invulnerable = false
			end
		end

		if btn.action then
			if (self.interaction_fn != nil) then
				self.interaction_fn = nil
			else
				self:attack()
			end
		end

		if self.el_cooldown:adv() then
			-- show a little shining start above the player head for some frames.
			self.shine_star = 10
		end

		-- reset interaction function at every frame. NOTE: it's mandatory that the function must be assigned before updating the player
		--  in order to be executed.
		self.interaction_fn = nil
	end,
	draw = function(self)
		local p = self
		if (p.invisible) return
		p:draw_sprite()
		if (self.shine_star > 0) then
			line(self.x + 3, self.y - 1, self.x + 5, self.y - 1, 10)
			line(self.x + 4, self.y - 2, self.x + 4, self.y, 10)
			self.shine_star -= 1
		end
	end,
	dmg = function(self, dmg)
		local p = self
		if not p.invulnerable then
			p.life -= dmg
			if (p.life <= 0) then
				p.phase = "dead"
				p.invulnerable = true
				p.t_respawn = c_timer.new(5) -- time before respawn
			else
				p.nodmg_t = c_timer.new(1) -- invincibility frames
				p.spr.effect = "blink_white"
				sfx(sfx_player_hit)
				p.invulnerable = true
			end
		end
	end,
	increase_life = function(self, amount)
		local p = self
		p.life = min(p.life + amount, p.max_life)
	end,
	inc_speed = function(self, initial)
		local p = self
		if initial then
			-- Initial speed
			p.speed = p.init_speed
		else
			-- Increment current speed until max
			p.speed = min(p.speed + p.inc_speed_factor, p.max_speed)
		end
	end,
	move_left = function(self)
		local p = self
		self:inc_speed(not (p.prev_btn.left or false))
		obj_move(p, dir_left)
		if (p.phase == "idle") p.phase = "walk"
		p.spr.flip_x = true
	end,
	move_right = function(self)
		local p = self
		self:inc_speed(not (p.prev_btn.right or false))
		obj_move(p, dir_right)
		if (p.phase == "idle") p.phase = "walk"
		p.spr.flip_x = false
	end,
	apply_forces = function(self, btn)
		-- jump and jump stack
		if (not self.blocked and btn.jump_start) then
			self:set_start_jump()
		end
		if (not btn.jump and self.jstack > 0) then
			self.jstack = 0 -- interrupt stacking
		end

		if (self.jstack > 0) then
			self.speedy = -self.jforce
			self.jstack -= 1
		end
		if self.speedy < 0 and not btn.jump then
			self.speedy *= self.speed_y_decay
		end
		self.speedy += gravity
		self.speedy = min(self.speedy, self.max_speedy)
		local m = obj_move(self, self.speedy < 0 and dir_up or dir_down, abs(self.speedy))
		if (m == 0) then
			self:reset_jump_vars()
			if (self.phase == "jump") self.phase = "idle"
		end
	end,
	reset_jump_vars = function(self)
		self.speedy = 0
		self.jstack = 0
	end,
	set_start_jump = function(self)
		if (self.phase == "dead") return
		if self:on_ground() then
			self:reset_jump_vars()
			self.phase = "jump"
			self.spr.time_start = nil
			self.jstack = self.max_jstack
			if (sfx_on) sfx(sfx_jump)
		end
	end,
	on_ground = function(self)
		local p = self
		local hbp = p:hitbox_pos(0, 1)
		local solid_left = map_or_obj_solid_at_px(hbp.x, hbp.y2)
		local solid_right = map_or_obj_solid_at_px(hbp.x2, hbp.y2)
		return solid_left or solid_right
	end,
	apply_end_stage_upgrades = function(self)
		-- local p = self
		-- for _, upgrade in pairs(p.permanent_upgrades.after_stage) do
		-- 	upgrade(p)
		-- end
	end,
	attack = function(self)
		if (self.cur_el == nil) return
		if (self.el_cooldown.t <= 0) then
			-- default attack does nothing
			el_cls[self.cur_el].new(self.spr.flip_x and dir_left or dir_right, game.mgr.misc_mgr)
			self.el_cooldown:restart()
		end
	end,
	switch_element = function(self)
		if (self.cur_el == nil) return
		local s1 = (self.cur_el) % 4 + 1
		while true do
			if (self.avail_el[s1]) then
				self.cur_el = s1
				c_slide_text.new(30, el_cls[s1].name)
				break
			end
			s1 = s1 % 4 + 1
		end
	end
}
clsinh(c_player, c_obj)