-- Base class for enemies
c_enemy = {
    new = function(etype, x, y, speed, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        -- override default properties and add new ones
        l.etype = etype
        l.hitbox = {x = 2, y = 2, x2 = 5, y2 = 5}
        l.speed = speed or 1
        setmetatable(l, c_enemy)
        return l
    end,
}
c_enemy.__index = c_enemy
setmetatable(c_enemy, c_obj)

--------------------------------
-- DRONE (extends c_enemy)
--------------------------------
c_drone = {
    new = function(x, y, horizontal, parent_mgr)
        local l = c_enemy.new("drone", x, y, 0.3, parent_mgr)
        l.spr = {
			move_left = {ss = 128},
			flip_x = false,
			flip_y = false,
			frame = 0,
		}
        l.horizontal = horizontal or true
        l.spr.move_right = l.spr.move_left  -- same sprite for both directions
        l.spr.move_up = l.spr.move_left  -- same sprite for both directions
        l.spr.move_down = l.spr.move_left  -- same sprite for both directions
        l.hitbox = {x = 2, y = 2, x2 = 5, y2 = 5}
        l.phase = horizontal and "move_right" or "move_down"
        setmetatable(l, c_drone)
        return l
    end,
    update = function(self)
        if (self:collide(player)) then
            player:take_damage(1)
        end
        -- getmetatable(c_drone).update(self)  -- Example of calling parent method
         if self.phase == "move_right" then
            local m = obj_move(self, dir_right)
            if (m == 0) then
                self.phase = "move_left"
            end
        elseif self.phase == "move_left" then
            local m = obj_move(self, dir_left)
            if (m == 0) then
                self.phase = "move_right"
            end
        end
        if self.phase == "move_up" then
            local m = obj_move(self, dir_up)
            if (m == 0) then
                self.phase = "move_down"
            end
        elseif self.phase == "move_down" then
            local m = obj_move(self, dir_down)
            if (m == 0) then
                self.phase = "move_up"
            end
        end
    end,
}
c_drone.__index = c_drone
setmetatable(c_drone, c_enemy)

---------------------------
-- LASER CANNON (extends c_enemy)
---------------------------
c_laser_cannon = {
 new = function(x, y, hv, parent_mgr)
        local l = c_enemy.new("cannon", x, y, 0, parent_mgr)
        l.hv = hv -- horizontal/vertical or diagonal
        l.spr.idle = { ss = hv and 130 or 129 }
        setmetatable(l, c_laser_cannon)
        l.cooldown = c_timer.new(2, true)
        l.angles = hv and {0, .25, .5, .75} or { .125, .375, .625, .875 }
        return l
    end,
    update = function(self)
        if (self.cooldown:adv()) then
            -- fire 4 lasers
            for a in all(self.angles) do
                game.mgr.enemy_mgr:add(c_laser.new(self.x + 4, self.y + 4, a))
            end
        end
    end,
}
c_laser_cannon.__index = c_laser_cannon
setmetatable(c_laser_cannon, c_enemy)

c_laser = {
    new = function(x, y, angle)
        local l = c_enemy.new("laser", x, y, 2)
        l.angle = angle
        l.speed = 1.5
        l.length = 1
        l.hitbox = {x = 0, y = 0, x2 = 1, y2 = 1} -- laser is small and the hitbox is in the same position
        setmetatable(l, c_laser)
        return l
    end,
    update = function(self)
        if (self:collide(player)) then
            player:take_damage(1)
            game.mgr.enemy_mgr:del(self) -- destroy laser on hit
        elseif (mget2_by_px_solid(self.x, self.y)) then
            c_explosion.new(self.x, self.y, 4, game.mgr.misc_mgr)
            game.mgr.enemy_mgr:del(self) -- destroy laser on wall hit
        else
            self.x += cos(self.angle) * self.speed
            self.y += sin(self.angle) * self.speed
        end
    end,
    draw = function(self)
        line(self.x, self.y, self.x + cos(self.angle) * self.length, self.y + sin(self.angle) * self.length, 8)
        if (debug) then
            -- draw hitbox for debugging
            local hb = self:hitbox_pos(0, 0)
            rect(hb.x, hb.y, hb.x2, hb.y2, 8)
        end
    end,
}
c_laser.__index = c_laser
setmetatable(c_laser, c_enemy)

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
        setmetatable(l, c_dog)
        return l
    end,
    update = function(self)
        self.phase = "idle"
        -- collide with player with a tolerance of 2 pixels
        if (self:collide(player, 2)) then
            player:take_damage(2)
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
c_dog.__index = c_dog
setmetatable(c_dog, c_enemy)
