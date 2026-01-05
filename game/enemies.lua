-- Base class for enemies
c_enemy = {
    new = function(etype, x, y, speed, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        -- override default properties and add new ones
        l.etype = etype
        l.hitbox = {x = 2, y = 2, x2 = 5, y2 = 5}
        l.hitbox_orig = l.hitbox
        l.speed = speed or 1
        l.life = 100
        l.time_last_death = 0
        l.respawn_timer = c_timer.new(10, false)
        l.dmg_time = c_timer.new(1, false)
        l.frozen_t = c_timer.new(10, false)
        l.frozen_t.t = 0
        return sm(l, c_enemy)
    end,
    dmg = function(self, dmg)
        self.life -= dmg
        self.dmg_time:restart()
        self.spr.effect = "blink_white"
        if (self.life <= 0) then
            self:del()
            -- c_explosion.new(self.x + 4, self.y + 4, 6, game.mgr.misc_mgr)
        end
    end,
    freeze = function(self)
        self.frozen_t:restart()
        add(obj_solids, self)
        self.hitbox = {x = 0, y = 0, x2 = 7, y2 = 7}
    end,
    unfreeze = function(self)
        self.frozen_t.t = 0
        self.spr.effect = "none"
        del(obj_solids, self)
        self.hitbox = self.hitbox_orig
    end,
    update = function(self)
        c_obj.update(self)
        if (self.dmg_time:adv()) then
            self.spr.effect = "none"
        end
        if (self.frozen_t:adv()) then 
            self:unfreeze()
        else
            if (self.frozen_t:t_left_btw(0.1, 2)) self.spr.effect = "blink_white"
        end
    end,
    draw = function(self)
        if (self.frozen_t.t > 0) then
            spr(139, self.x, self.y)
        end
        c_obj.draw(self)
    end,
    del = function(self)
        self.time_last_death = time()
        del(obj_solids, self)
        c_obj.del(self)
    end,
}
clsinh(c_enemy, c_obj)

c_bat = {
    new = function(x, y, horizontal, parent_mgr)
        local l = c_enemy.new("bat", x, y, 0.3, parent_mgr)
        l.spr = {
			idle = {sprites = { 128, 129 }, fps = 4, loop = true },
			flip_x = false,
			flip_y = false,
			frame = 0,
		}
        l.horizontal = horizontal
        l.hitbox = {x = 2, y = 2, x2 = 5, y2 = 5}
        l.dir = l.horizontal and dir_right or dir_down
        return sm(l, c_bat)
    end,
    update = function(self)
        c_enemy.update(self)
        if (self:collide(player)) then
            player:dmg(1)
        end
        if (self.frozen_t.t > 0) then
            return
        end
        local m = obj_move(self, self.dir)
        if (m == 0) then
            self.dir = (self.horizontal and 0 or 2) + ((self.dir + 1) % 2)
        end
    end,
}
clsinh(c_bat, c_enemy)

c_dog = {
    new = function(x, y, parent_mgr)
        local l = c_enemy.new("dog", x, y, 1.5, parent_mgr)
        l.spr = {
            idle = { sprites = { 144, 145 }, fps = 2,  loop = true },
            run = { sprites = { 146, 147 }, fps = 4, loop = true },
            flip_x = false,
            flip_y = false,
            frame = 0,
        }
        l.speed = player.stinky_socks and 0.2 or 0.4
        l.hitbox = {x = 0, y = 3, x2 = 7, y2 = 7}
        l.basex = x
        l.basey = y
        return sm(l, c_dog)
    end,
    update = function(self)
        c_enemy.update(self)
        self.phase = "idle"
        if (self.frozen_t.t > 0) then
            return
        end
        -- collide with player with a tolerance of 2 pixels
        if (self:collide(player, 2)) then
            player:dmg(2)
            game.mgr.player_msg_mgr.dog_bites += 1
        else
            -- move towards player
            if (abs(player.x - self.x) < 50 and abs(player.y - self.y) < 4) then
                self.spr.flip_x = (player.x - self.x) > 0
                local d = (player.x - self.x) > 0 and dir_right or dir_left
                local xck = d == dir_right and self.x + self.speed + 7 or self.x - self.speed
                local yck = self.y + 8
                -- check the ground tile to the side
                if (mget2_by_px_solid(xck, yck)) then
                    -- check if there isn't a wall in front
                    if (not mget2_by_px_solid(xck, self.y)) then
                        obj_move(self, d)
                        self.phase = "run"
                    end
                end 
            else
                -- return to base position
                if (abs(self.basex - self.x) > 3) then
                    self.spr.flip_x = (self.basex - self.x) > 0
                    obj_move(self, (self.basex - self.x) > 0 and dir_right or dir_left)
                    self.phase = "run"
                end
            end
        end
    end,
}
clsinh(c_dog, c_enemy)
