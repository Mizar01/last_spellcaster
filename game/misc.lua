
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

c_misc_mgr = {
    new = function()
        local m = c_mgr.new()
        setmetatable(m, c_misc_mgr)
        return m
    end,
    update = function(self)
    end,
}
class_inherit(c_misc_mgr, c_mgr)

