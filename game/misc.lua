
c_explosion = {
    new = function(x, y, max_radius, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        l.spr.idle = { sprites = { 185, 186, 187 }, fps = 4 }
        l.max_radius = max_radius or 4
        l.ttl = c_timer.new(0.2, false)
        l.solid = false
        setmetatable(l, c_explosion)
        return l
    end,
    update = function(self)
        if self.ttl:adv() then
            self.parent_mgr:del(self)
        end
    end,
    draw = function(self)
        if (self.ttl.t <= 0) return
        local s = self
        local r = lerp(0, s.max_radius, 1 - (s.ttl.t / s.ttl.maxtime))
        circfill(s.x, s.y, r, 10)
    end,
}
class_inherit(c_explosion, c_obj)

c_fireball = {
    new = function(x, y, dir)
        local l = c_obj.new(x, y, game.mgr.misc_mgr)
        l.solid = false
        l.damage = 10
        l.ttl = c_timer.new(0.3, false)
        l.radius = 1
        l.max_radius = 2
        l.origx, l.origy = x, y
        l.max_dist = 20
        setmetatable(l, c_fireball)
        return l
    end,
    update = function(self)
        self.x = timer_lerp(self.origx, self.max_dist, self.ttl, true)
        self.radius = timer_lerp(1, self.max_radius, self.ttl, true)
        if (self.ttl:adv()) then
            self:del()
            -- c_explosion.new(self.x, self.y, 4, game.mgr.misc_mgr)
            return
        end
        for e in all(game.mgr.enemy_mgr.objs) do
            if (self:collide(e)) then
                e:take_damage(self.damage)
                self:del()
                c_explosion.new(self.x + 2, self.y + 4, 4, game.mgr.misc_mgr)
                break
            end
        end
    end,
    draw = function(self)
        local cols = {1, 2, 9, 7}
        for i = 0, 3 do
            local radf = (i / 3) * self.radius
            local offset_x =  i * 2
            circfill(self.x + offset_x, self.y + 4, 1.5 * radf, cols[i+1])
        end
    end,
}
class_inherit(c_fireball, c_obj)

c_misc_mgr = {
    new = function()
        local m = c_mgr.new()
        setmetatable(m, c_misc_mgr)
        return m
    end,
}
class_inherit(c_misc_mgr, c_mgr)

