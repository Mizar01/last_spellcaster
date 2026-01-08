c_explosion = {
    new = function(x, y, max_radius, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
            ttl = _fn_t1_0.2
            solid = false
            max_radius = *1
        ]], {max_radius or 4})
        l.spr.idle = dstarc("sprites = { 185; 186; 187 }, fps = 4")
        return sm(l, c_explosion)
    end,
    update = function(self)
        if self.ttl:adv() then
            self.parent_mgr:del(self)
        end
    end,
    draw = function(self)
        if (self.ttl.t <= 0) return
        local r = lerp(0, self.max_radius, 1 - (self.ttl.t / self.ttl.maxtime))
        circfill(self.x, self.y, r, 10)
    end
}
clsinh(c_explosion, c_obj)

c_element = {
    new = function(el, dir)
        local origx, origy = player.x + (dir == dir_left and -2 or 10), player.y + 4
        local l = c_obj.new(origx, origy, game.mgr.misc_mgr)
        dstar(l, [[
            damage = 10
            ttl = _fn_t1_0.3
            max_dist = 20
            destroy_req_prev_frame = false
            origx = *1
            origy = *2
            dir = *3
            el = *4
        ]], {origx, origy, dir, el})

        return sm(l, c_element)
    end,
    update = function(self)
        if self.destroy_req_prev_frame then
            self:del()
            return
        end
        if self.ttl:adv() then
            self.destroy_req_prev_frame = true -- mark for deletion next frame, because i need also to use the time at 0.
        end
        self.x = timer_lerp(self.origx, self.max_dist, self.ttl, true, self.dir)
        for e in all(game.mgr.enemy_mgr.objs) do
            if self:collide(e) then
                self:effect(e)
                self:del()
                c_explosion.new(self.x, self.y, 4, game.mgr.misc_mgr)
                break
            end
        end
    end,
    dirmult = function(self)
        return (self.dir == dir_left) and -1 or 1
    end,
    effect = function(self, trg)
        trg:dmg(self.damage)
    end
}
clsinh(c_element, c_obj)

c_fire = {
    name = "fire",
    new = function(dir, parent_mgr)
        local l = c_element.new(el_fire, dir)
        l.radius = 1
        l.max_radius = 2
        return sm(l, c_fire)
    end,
    update = function(self)
        c_element.update(self)
        if (self.ttl.t > 0) self.radius = timer_lerp(1, self.max_radius, self.ttl, true)
    end,
    draw = function(self)
        local cols = { 1, 2, 9, 8 }
        local dm = self:dirmult()
        for i = 0, 3 do
            local radf = (i / 3) * self.radius
            local offset_x = dm * i * 2
            circfill(self.x + offset_x, self.y, 1.5 * radf, cols[i + 1])
        end
    end,
    effect = function(self, trg)
        trg:unfreeze()
        trg:dmg(self.damage)
    end
}
clsinh(c_fire, c_element)

c_ice = {
    name = "ice",
    new = function(dir, parent_mgr)
        local l = c_element.new(el_ice, dir)
        l.radius = 1
        l.max_radius = 1.5
        return sm(l, c_ice)
    end,
    update = function(self)
        c_element.update(self)
        if (self.ttl.t > 0) self.radius = timer_lerp(1, self.max_radius, self.ttl, true)
    end,
    draw = function(self)
        local cols = { 12, 6 }
        local dm = self:dirmult()
        rectfill(self.x + dm * 0 - self.radius, self.y - self.radius, self.x + dm * 0 + self.radius, self.y + self.radius, rnd(cols))
    end,
    effect = function(self, trg)
        trg:freeze()
    end
}
clsinh(c_ice, c_element)

c_thunder = {
    name = "thunder",
    new = function(dir, parent_mgr)
        local l = c_element.new(el_thunder, dir)
        l.spr.idle = dstarc("ss = 59")
        dstar(l, [[
            ttl = _fn_t1_0.2
            max_dist = 25
        ]])
        -- takes three sprites space + a tolerance
        return sm(l, c_thunder)
    end,
    draw = function(self)
        -- local sx, sy = spr_to_px(self.spr.idle.ss)
        -- sspr(sx, sy, self.x - self.origx, 8, self.origx, self.origy)
        local step = 4
        local x = self.origx
        local y = self.origy
        local dm = self:dirmult()
        local cnt = true
        while true do
            local next_x = x + step * dm
            local next_y = y + (rnd(4) - 2)
            line(x, y, next_x, next_y, 7)
            x = next_x
            y = next_y
            if (dm == 1 and x > self.x + 1) break 
            if (dm == -1 and x < self.x - 1) break
        end
    end
}
clsinh(c_thunder, c_element)

c_wind = {
    name = "wind",
    new = function(dir, parent_mgr)
        local l = c_element.new(el_wind, dir)
        l.spr.idle = dstarc("ss = 60")
        dstar(l, [[
            damage = 0
            ttl = _fn_t1_0.7
            max_dist = 25
            power = 20
        ]])
        return sm(l, c_wind)
    end,
    draw = function(self)
        local dm = self:dirmult()
        local last_vx, last_vy = nil, nil
        for i = 0, 12 do
            local xi = 0.5 + self.x + (i * 0.8) * dm
            local angle = xi * 0.25
            local rad = 1 + i * 0.25
            local vx = xi + cos(angle) * rad
            local vy = self.y + sin(angle) * rad
            if last_vx != nil then
                local col = (i % 2 == 0) and 12 or 6
                line(last_vx, last_vy, vx, vy, col)
            end
            last_vx, last_vy = vx, vy
        end
    end,
    effect = function(self, trg)
        trg:blow(self.dir)
    end
}
clsinh(c_wind, c_element)

c_interactive = {
    new = function(x, y, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
            show_int_button = false
            ttl_disable_int = nil
            int_done = false
            solid = true
        ]])
        return sm(l, c_interactive)
    end,
    update = function(self)
        if self:collide(player) then
            self.show_int_button = true
            player.interaction_fn = self.interact
            local ttl_disable_int = self.ttl_disable_int
            if (btnp(5, 0) and not self.int_done) then
                self:interact()
            elseif (self.int_done and ttl_disable_int == nil) then
                self.ttl_disable_int = c_timer.new(0.5, false)
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
        if self.show_int_button then
            print("❎", self.x + 2, self.y - 6, 12)
        end
    end,
    interact = function(self)
        -- to be overridden
        self.int_done = true
    end
}
clsinh(c_interactive, c_obj)

c_focuslith = {
    new = function(x, y, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = { ss = 11 }
        return sm(l, c_focuslith)
    end,
    interact = function(self)
        player:switch_element()
    end,
    draw = function(self)
        pal(7, altern_time(0.5) and el_colors[player.cur_el] or 7)
        c_interactive.draw(self)
        pal()
    end
}
clsinh(c_focuslith, c_interactive)

c_switchlith = {
    new = function(x, y, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = dstarc("sprites={27;28;29}; fps=10; loop=true")
        l.on = false
        return sm(l, c_switchlith)
    end,
    interact = function(self)
        if (player.cur_el != el_thunder) then
            c_slide_text.new(30, "You need thunder")
            return
        end
        -- TODO: activate / deactivate
        self.on = not self.on
    end,
    draw = function(self)
        pal(7, self.on and 11 or 8) pal(10, self.on and 3 or 9)
        c_interactive.draw(self)
        pal()
    end
}
clsinh(c_switchlith, c_interactive)

c_scroll = {
    new = function(x, y, el, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = { ss = 12 }
        l.el = el
        l.oy = y
        return sm(l, c_scroll)
    end,
    update = function(self)
        c_interactive.update(self)
        self.y = self.oy + sin(time()) * 2
    end,
    interact = function(self)
        player.cur_el = self.el
        player.avail_elements[self.el] = true
        c_slide_text.new(30, el_cls[self.el].name.." acquired")
        self:del()
    end,
    draw = function(self)
        pal(7, el_colors[self.el])
        c_interactive.draw(self)
        pal()
    end
}
clsinh(c_scroll, c_interactive)

c_misc_mgr = {
    new = function()
        local m = c_mgr.new()
        return sm(m, c_misc_mgr)
    end
}
clsinh(c_misc_mgr, c_mgr)