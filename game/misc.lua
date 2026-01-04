
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

c_element = {
    new = function(x, y, el, dir)
        local l = c_obj.new(x, y, game.mgr.misc_mgr)
        l.solid = false
        l.damage = 10
        l.ttl = c_timer.new(0.3, false)
        l.radius = 1
        l.max_radius = 2
        l.origx, l.origy = x, y
        l.max_dist = 20
        l.dir = dir
        l.el = el
        setmetatable(l, c_element)
        return l
    end,
    update = function(self)
        self.x = timer_lerp(self.origx, self.max_dist, self.ttl, true, self.dir)
        self.radius = timer_lerp(1, self.max_radius, self.ttl, true)
        if (self.ttl:adv()) then
            self:del()
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
        local cols = {1, 2, 9, el_colors[self.el + 1]}
        local dm = self:dirmult()
        for i = 0, 3 do
            local radf = (i / 3) * self.radius
            local offset_x =  dm * i * 2
            circfill(self.x + offset_x, self.y + 4, 1.5 * radf, cols[i+1])
        end
    end,
    dirmult = function(self)
        return (self.dir == dir_left) and -1 or 1
    end,
}
class_inherit(c_element, c_obj)

c_interactive = {
    new = function(x, y, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        l.show_int_button = false
        l.ttl_disable_int = nil
        l.int_done = false
        l.solid = true
        setmetatable(l, c_interactive)
        return l
    end,
    update = function(self)
        if (self:collide(player)) then
            self.show_int_button = true
            local ttl_disable_int = self.ttl_disable_int
            if (btnp(5,0) and not self.int_done) then
                self:interact()
            elseif (self.int_done and ttl_disable_int == nil) then
                self.ttl_disable_int = c_timer.new(0.5, true)
            elseif (ttl_disable_int and ttl_disable_int:adv()) then
                -- reenable interaction after some time
                self.int_done = false
                self.ttl_disable_int = nil
            end
        else
            self.show_int_button = false
        end
    end,
    draw = function(self)
        self:draw_sprite()
        if (self.show_int_button) then
            -- draw interaction button above the object
            print("❎", self.x + 2, self.y - 6, 12)
        end
    end,
    interact = function(self)
        -- to be overridden
        self.int_done = true
    end,
}
class_inherit(c_interactive, c_obj)

c_switchlith = {
    new = function(x, y, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = { ss = 11 }
        setmetatable(l, c_switchlith)
        return l
    end,
    interact = function(self)
        player:switch_element()
        -- no need to call parent method
    end,
    draw = function(self)
        pal(7, altern_time(0.5) and el_colors[player.current_element + 1] or 7)
        c_interactive.draw(self)
        pal()
    end,
}
class_inherit(c_switchlith, c_interactive)


c_misc_mgr = {
    new = function()
        local m = c_mgr.new()
        setmetatable(m, c_misc_mgr)
        return m
    end,
}
class_inherit(c_misc_mgr, c_mgr)

