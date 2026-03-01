-- Base class for enemies
c_enemy = cstar("c_enemy:c_obj", {
    __new = function(n, etype, x, y, speed, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
respawn_timer = _fn_t1_10
dmg_time = _fn_t1_1
frozen_t = _fn_t1_20
time_last_death = 0
life = 40
max_life = _k_life
dir = nil
wspeed = 0
dir_before_blow = nil
fixed = false
hitbox = { x=2;y=2;x2=5;y2=5} 
hitbox_orig = _k_hitbox
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
        if (self.fixed) return
        self.frozen_t.t = -1
        self.spr.effect = "none"
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
    check_pl_coll = function(self, dmg)
        if (self:collide(player)) then player:dmg(dmg) return true else return false end
    end,
    is_inv = function(self) return false end,
})

c_fly_en = cstar("c_fly_en:c_enemy", {
    __new = function(n, x, y, name)
        local l = c_enemy.new(name, x, y, 0.3, emgr())
        l.spr.idle = {sprites = en_sprites[name].idle, fps = 4, loop = true}
        l.horizontal = (en_vertical[name] == nil)
        dstar(l, [[
hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
horizontal = _k_horizontal
dir = *1
dir_before_blow = _k_dir
        ]], {l.horizontal and dir_right or dir_down})
        return l
    end,
    update = function(self)
        c_enemy.update(self)
        self.spr.flip_x = self.dir == dir_right
        if (self.frozen_t.t > 0) return
        self:check_pl_coll(1)
        local m = obj_move(self, self.dir)
        if (m == 0) self.dir = (self.horizontal and 0 or 2) + ((self.dir + 1) % 2)
    end,
})

c_walk_en = cstar("c_walk_en:c_fly_en", {
    __new = function(n, x, y, name)
        local l = c_fly_en.new(x, y, name)
        -- l.spr.idle = { sprites = en_sprites[name].idle, fps = 2,  loop = true }
        return l
    end,
    update = function(self)
        c_fly_en.update(self)
        local xck = self.x + (self.dir == dir_right and 7 or 0)
        if (not mget2_by_px_solid(xck, self.y + 8)) then
            self.dir = (self.dir + 1) % 2
        end 
    end
})

c_vine = cstar("c_vine:c_enemy", {
    types = dstarc("h={pal=3;flev=0};j={pal=8;flev=1};k={pal=12;flev=2};"),
    __new = function(n, t, x, y)
        local l = c_enemy.new("vine", x, y, 0, emgr())
        l.spr.idle = dstarc("ss = 6")
        dstar(l,[[
fixed = true
life = 10
hitbox = { x=0;y=0;x2=7;y2=7}
pal = *1
flev = *2
        ]], {c_vine.types[t].pal, c_vine.types[t].flev})
        add(obj_solids, l)
        return l
    end,
    draw = function(self)
        pal(7, self.pal)
        c_enemy.draw(self)
        pal()
    end,
    is_inv = function(self) return not (player.cur_el == el_fire and player.lev_el[el_fire] > self.flev) end,

})

c_spike = cstar("c_spike:c_enemy", {
    __new = function(n, t, x, y)
        local l = c_enemy.new("spike", x, y, 0, emgr())
        l.spr.idle = dstarc("ss=22")
        -- collide only with the lower part
        dstar(l,"fixed=true;life=10;dir=-1;hitbox={x=1;y=7;x2=6;y2=7};spf=0.15;")
        l.y = y+8 - 4 * (ord(t) - ord('t'))
        return l
    end,
    update = function(self)
        -- c_enemy.update(self)
        self:check_pl_coll(2)
        self.y += self.dir * self.spf
        if (self.y < self.spawn_y or self.y > self.spawn_y + 8) self.dir *= -1
    end,
    draw = function(self)
        c_enemy.draw(self)
        spr(stage_config_get().theme.tile_maps[2], self.x, self.spawn_y + 8)
    end,
    is_inv = function(self) return true end,
})

c_crater = cstar("c_crater:c_enemy", {
    angles = dstarc("0.5;0;0.25;0.75"),
    __new = function(n, t, x, y)
        local l = c_enemy.new("crater", x, y, 0, emgr())
        l.name = en_map[t]
        l.spr.idle = {ss = en_sprites[l.name].idle[1]}
        dstar(l,"fixed=true;life=10;dir=-1;spf=0.15;inited=false;tfire=_fn_t2_2;")
        l.horizontal = (en_vertical[l.name] == nil)
        l.dir = l.horizontal and dir_right or dir_down
        l.tfire.t -= flr(rnd(40)) -- random start
        return l
    end,
    update = function(self)
        if (not self.inited) then
            -- fix direction (only once)
            if self.horizontal and mget2_by_px_solid(self.x+12, self.y) then self.dir = dir_left end
            if not self.horizontal and mget2_by_px_solid(self.x, self.y+12) then self.dir = dir_up end
            self.spr.flip_x = self.dir == dir_left
            self.spr.flip_y = self.dir == dir_up
            self.inited = true
        end
        if self.tfire:adv() then
            c_bullet.new(self.x, self.y, c_crater.angles[self.dir + 1], 1)
        end
    end,
    draw = function(self)
        c_enemy.draw(self)
    end,
    is_inv = function(self) return true end,
})

c_boss = cstar("c_boss:c_enemy", {
    angles = dstarc("0;0.1;0.4;0.5;0.6;0.9"),
    __new = function(n, x, y, name)
        local l = c_enemy.new("boss", x, y, 0.3, emgr())
        l.spr.idle.sprites = en_sprites[name].idle
        dstar(l, [[
life = 5000
max_life = _k_life
tw = 2
th = 2
hitbox={x=0;y=0;x2=15;y2=15}
hitbox_orig=_k_hitbox
tcd = _fn_t2_1
tfire = _fn_t2_0.1
fire = false
tpos = {x=nil;y=nil}
mvrngx = 104
mvrngy = 88
]])
        cur_boss = l
        l.tcd.t -= flr(rnd(40)) -- randomly initial shooting, this avoid multiple bosses to shoot in sync and make a cpu spike.
        return l
    end,
    update = function(self)

        c_enemy.update(self)

        if (self:distp2(player) > 1000) return
        if (self.frozen_t.t > 0) return
        self:check_pl_coll(5)

        -- moving
        if self.tpos.x == nil or self:distp2(self.tpos) < 9 then
            self.tpos.x =self.spawn_x + rnd(self.mvrngx * 2) - self.mvrngx
            self.tpos.y = self.spawn_y - rnd(self.mvrngy)
        end
        self:moveTo(self.tpos, self.speed)

        -- firing
        if (self.tcd:adv()) self.fire = not self.fire
        if self.fire then
            if self.tfire:adv() then
                c_bullet.new(self.x + 4, self.y + 4, rnd(c_boss.angles), 1)
            end
        end
    end,
    draw = function(self)
        c_enemy.draw(self)
        rectfill(self.x, self.y - 4, self.x + flr(15 * (self.life / self.max_life)), self.y - 2, 8)
    end,
})
