-- Base class for enemies
c_enemy = cstar("c_enemy:c_obj", {
    __new = function(n, etype, x, y, speed, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
respawn_timer = _fn_t1_10
dmg_time = _fn_t1_1
frozen_t = _fn_t1_20
time_last_death = 0
life = 100
dir = nil
wspeed = 0
dir_before_blow = nil
fixed = false
hitbox = { x=2;y=2;x2=5;y2=5} 
hitbox_orig = {x=2;y=2;x2=5;y2=5}
speed = *1
etype = *2
        ]], {speed or 1, etype})
        l.frozen_t.t = 0
        return l
    end,
    dmg = function(self, dmg)
        if (self:is_inv()) return
        self.life -= dmg
        self.dmg_time:restart()
        self.spr.effect = "blink_white"
        if (self.life <= 0) then
            for i=1,3 do
                local px = self.x + rnd(6)
                local py = self.y + rnd(6)
                c_shard.new(px, py)
            end
            self:del()
        end
    end,
    freeze = function(self)
        self.frozen_t:restart()
        add(obj_solids, self)
        self.hitbox = {x = 0, y = 0, x2 = 7, y2 = 7}
    end,
    unfreeze = function(self)
        self.frozen_t.t = -1
        self.spr.effect = "none"
        del(obj_solids, self)
        self.hitbox = self.hitbox_orig
    end,
    blow = function(self, dir)
        if (self.fixed) return
        if (self.wspeed <= 0) self.dir_before_blow = self.dir
        self.wspeed = 2
        self.dir = dir
        -- self.wind_t:restart()
    end,
    unblow = function(self)
        self.wspeed = -1
        self.dir = self.dir_before_blow
    end,
    update = function(self)
        c_obj.update(self)
        for b in all(player_bullets) do
            if (self:collide(b)) b:hit(self)
        end

        if (self.dmg_time:adv()) self.spr.effect = "none"
        if (self.frozen_t:adv()) then 
            self:unfreeze()
        else
            if (self.frozen_t:t_left_btw(0.1, 2)) self.spr.effect = "blink_white"
        end
        -- if (self.wind_t:adv()) self:unblow()
        if (self.wspeed > 0) then
            local m = obj_move(self, self.dir, self.wspeed)
            self.wspeed = m == 0 and 0 or max(0, self.wspeed - 0.05)
        else
            if (self.wspeed != -1) self:unblow()
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
    is_inv = function(self) return false end,
})

c_fly_en = cstar("c_fly_en:c_enemy", {
    __new = function(n, x, y, name)
        local l = c_enemy.new(name, x, y, 0.3, game.mgr.enemy_mgr)
        l.spr.idle = {sprites = en_sprites[name].idle, fps = 4, loop = true}
        l.horizontal = en_mv[name] == "horizontal"
        dstar(l, [[
hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
horizontal = *1
dir = *2
dir_before_blow = _k_dir
        ]], {l.horizontal, l.horizontal and dir_right or dir_down})
        return l
    end,
    update = function(self)
        c_enemy.update(self)
        if (self.frozen_t.t > 0) return
        if (self:collide(player)) player:dmg(1)
        local m = obj_move(self, self.dir)
        if (m == 0) self.dir = (self.horizontal and 0 or 2) + ((self.dir + 1) % 2)
    end,
})

c_walk_en = cstar("c_walk_en:c_enemy", {
    __new = function(n, x, y, name)
        local l = c_enemy.new(name, x, y, 1.5, game.mgr.enemy_mgr)
        l.spr.idle = { sprites = en_sprites[name].idle, fps = 2,  loop = true }
        l.spr.run = { sprites = en_sprites[name].run, fps = 4, loop = true }
        dstar(l, [[
speed = 0.2
hitbox = {x=0;y=3;x2=7;y2=7}
hitbox_orig = {x=0;y=3;x2=7;y2=7}
basex = *1
basey = *2
        ]], {x, y})
        return l
    end,
    update = function(self)
        c_enemy.update(self)
        self.phase = "idle"
        if (self.frozen_t.t > 0) return
        -- collide with player with a tolerance of 2 pixels
        if (self:collide(player, 2, 2)) then
            player:dmg(2)
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
})

c_vine = cstar("c_vine:c_enemy", {
    __new = function(n, x, y)
        local l = c_enemy.new("vine", x, y, 0, game.mgr.enemy_mgr)
        l.spr.idle = dstarc("ss = 6")
        dstar(l,[[
fixed = true
life = 10
hitbox = { x=0;y=0;x2=7;y2=7}
        ]])
        add(obj_solids, l)
        return l
    end,
    is_inv = function(self) return not (player.cur_el == el_fire)end,
})

c_boss = cstar("c_boss:c_enemy", {
    __new = function(n, x, y)
        local l = c_enemy.new("boss", x, y, 0, game.mgr.enemy_mgr)
        l.spr.idle = dstarc("sprites={199;201};fps=2;loop=true")
        dstar(l, [[
life = 5000
tw = 2
th = 2
hitbox={x=0;y=0;x2=15;y2=15}
hitbox_orig=_k_hitbox
tcd = _fn_t2_1
tfire = _fn_t2_0.1
fire = false
tpos = {x=nil;y=nil}
]])
        return l
    end,
    update = function(self)

        c_enemy.update(self)
        if (self.frozen_t.t > 0) return

        if (self:collide(player)) player:dmg(5)

        -- moving
        if (self.tpos.x == nil or self:dist(self.tpos) < 3) then
            self.tpos.x = mid(self.x + rnd(64), self.spawn_x - 32, self.spawn_x + 32)
            self.tpos.y = mid(self.y + rnd(16), self.spawn_y, self.spawn_y + 16) 
            flog("target changed to "..self.tpos.x..","..self.tpos.y.."")
        end
        self:moveTo(self.tpos, self.speed)

        -- firing
        if (self.tcd:adv()) self.fire = not self.fire
        if (self.fire) then
            if (self.tfire:adv()) then
                c_bullet.new(self.x + 8, self.y + 8, rnd(dstarc("0;0.1;0.4;0.5")), 1)
            end
        end
    end,
})
