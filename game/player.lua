c_player = {
	new = function(x, y)
		local p = c_obj.new(x, y)
		p.name = "player"
		p.spr = {
			idle = { sprites = { 64, 65 }, fps = 2 },
			walk = { sprites = { 80, 81, 82 }, fps = 6 },
			jump = { sprites = { 97, 98, 99, 100, 101, 102 }, fps = 8 },
			dead = { sprites = { 68, 69, 70, 71, 72 }, fps = 4, loop = false },
			flip_x = false,
			flip_y = false,
			time_start = 0,
			effect = "none",
		}
		p.invisible = false
		p.blocked = false
		p.invulnerable = false
		p.no_damage_timer = nil

		-- jump properties
		p.jforce = 1.7
		p.jstack = 0 -- buffer for jump stack
		p.max_jstack = 15 -- max jump stacks
		p.speed_y_decay = 0.95
		p.speedy = 0
		p.max_speedy = 2 -- terminal velocity (< 8 to avoid overlapping walls)

		p.phase = "idle" -- idle, walk, jump
		p.hitbox = {x = 2, y = 3, x2 = 5, y2 = 7}

		-- speed properties
		p.max_speed = 1
		p.speed = 0 -- speed is 0 when not moving left or right
		p.init_speed = 0.1  -- initial speed when starting to move
		p.inc_speed_factor = 0.2 -- speed increase factor

		p.prev_btn = {} -- prev frame button state
		p.life = 20
		p.max_life = 20
		p.init_max_life = 20 -- used for starting reference to show a larger life bar, doesnt need changes.
		p.life_dec_speed = 0.1 -- life decrease per second
		p.coins = 0
		p.coin_inc = 0 -- no coins is added to the gem coin value.
		p.gems = 0
		p.hearts = 0
		p.stinky_socks = false -- makes dogs chase the player slower
		-- p.permanent_upgrades = {
		-- 	after_stage = {},
		-- }
		setmetatable(p, c_player)
		return p
	end,
	reset_stage_props = function(self)
		-- reset properties that must be reset at stage start
		local p = self
		p.speed = 0
		p.phase = "idle"
		p.invisible = false
		p.blocked = false
		p.invulnerable = false
		self:reset_jump_vars()
		p.gems = 0
	end,
	update = function(self)

		if (game.paused) then return end

		local p = self

		if (p.phase == "dead") then
			if (p.prev_btn.left) obj_move(p, dir_left)
			if (p.prev_btn.right) obj_move(p, dir_right)
			p.speed = p.speed * 0.9
			p:apply_forces()
			return
		end	

		local btn = {
			left = btn(0,0),
			right = btn(1,0),
			jump = btn(4,0),
			jump_start = btnp(4,0),
			action = btnp(5,0),
			-- d = btnp(3,1), -- d key (for debug)
		}

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

		if (p.no_damage_timer ~= nil) then
			local trig = p.no_damage_timer:adv()
			if (trig) then
				p.spr.effect = "none"
				p.invulnerable = false
			end
		end

		if (btn.action) then
			self:attack(p)
		end

		p.life = max(0, p.life - p.life_dec_speed * (1/fps))

	end,
	draw = function(self)
		local p = self
		if (p.invisible) return
		p:draw_sprite()
	end,
	take_damage = function(self, dmg)
		local p = self
		if (not p.invulnerable) then
			p.life -= dmg
			if (p.life <= 0) then
				p.phase = "dead"
				p.invulnerable = true
				game.game_over_msg = rnd(game.game_over_msgs)
				game:set_game_over()
			else 
				p.no_damage_timer = c_timer.new(1)  -- invincibility frames
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
		if (initial) then
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
			self.speedy = - self.jforce
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
		if (self:on_ground()) then
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
		local solid_left = mget2_by_px_solid(hbp.x, hbp.y2)
		local solid_right = mget2_by_px_solid(hbp.x2, hbp.y2)
		return solid_left or solid_right
	end,
	on_ceiling = function(self)
		local p = self
		local hbp = p:hitbox_pos(0, -1)
		local solid_left = mget2_by_px_solid(hbp.x, hbp.y)
		local solid_right = mget2_by_px_solid(hbp.x2, hbp.y)
		return solid_left or solid_right
	end,
	apply_end_stage_upgrades = function(self)
		-- local p = self
		-- for _, upgrade in pairs(p.permanent_upgrades.after_stage) do
		-- 	upgrade(p)
		-- end
	end,
	attack = function(self)
		-- default attack does nothing
		c_fireball.new(self.x + 8, self.y, self.spr.flip_x and dir_left or dir_right, game.mgr.misc_mgr)
		flog("attack")
	end,

}
class_inherit(c_player, c_obj)