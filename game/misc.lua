c_explosion = cstar("c_explosion:c_obj", {
    __new = function(n, x, y, max_radius, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
            ttl = _fn_t1_0.2
            solid = false
            max_radius = *1
        ]], {max_radius or 4})
        l.spr.idle = dstarc("sprites = { 185; 186; 187 }, fps = 4")
        return l
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
})

c_element = cstar("c_element:c_obj", {
    __new = function(n, el, dir)
        local origx, origy = player.x + (dir == dir_left and -2 or 10), player.y + 4
        local l = c_obj.new(origx, origy, game.mgr.misc_mgr)
        dstar(l, [[
            ttl = _fn_t1_0.3
            max_dist = 20
            destroy_req_prev_frame = false
            origx = *1
            origy = *2
            dir = *3
            el = *4
        ]], {origx, origy, dir, el})
        return l
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
        trg:dmg(el_dmg[self.el][player.lev_el[self.el]])
    end
})

c_fire = cstar("c_fire:c_element", {
    name = "fire",
    __new = function(n, dir, parent_mgr)
        local l = c_element.new(el_fire, dir)
        l.radius = 1
        l.max_radius = 2
        return l
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
        c_element.effect(self, trg)
    end
})

c_ice = cstar("c_ice:c_element", {
    name = "ice",
    __new = function(n, dir, parent_mgr)
        local l = c_element.new(el_ice, dir)
        l.radius = 1
        l.max_radius = 1.5
        return l
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
})

c_thunder = cstar("c_thunder:c_element", {
    name = "thunder",
    __new = function(n, dir, parent_mgr)
        local l = c_element.new(el_thunder, dir)
        l.spr.idle = dstarc("ss = 59")
        dstar(l, [[
            ttl = _fn_t1_0.2
            max_dist = 25
        ]])
        -- takes three sprites space + a tolerance
        return l
    end,
    draw = function(self)
        local step = 4
        local x = self.origx
        local y = self.origy
        local dm = self:dirmult()
        local cnt = true
        while true do
            local next_x = x + step * dm
            local next_y = y + (rnd(4) - 2)
            line(x, y, next_x, next_y, 7)
            x, y = next_x, next_y
            if (dm == 1 and x > self.x + 1) break 
            if (dm == -1 and x < self.x - 1) break
        end
    end
})

c_wind = cstar("c_wind:c_element", {
    name = "wind",
    __new = function(n, dir, parent_mgr)
        local l = c_element.new(el_wind, dir)
        l.spr.idle = dstarc("ss = 60")
        dstar(l, [[
            ttl = _fn_t1_0.7
            max_dist = 25
            power = 20
        ]])
        return l
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
})

c_interactive = cstar("c_interactive:c_obj", {
    __new = function(n, x, y, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
            show_int_button = false
            ttl_disable_int = nil
            int_done = false
            solid = true
        ]])
        return l
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
})

c_focuslith = cstar("c_focuslith:c_interactive", {
    __new = function(n, x, y, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = { ss = 11 }
        return l
    end,
    interact = function(self)
        player:switch_element()
    end,
    draw = function(self)
        pal(7, altern_time(0.5) and el_colors[player.cur_el] or 7)
        c_interactive.draw(self)
        pal()
    end
})

c_switchlith = cstar("c_switchlith:c_interactive", {
    __new = function(n, x, y, parent_mgr)
        local l = c_interactive.new(x, y, parent_mgr)
        l.spr.idle = dstarc("sprites={27;28;29}; fps=10; loop=true")
        l.on = false
        l.doors = {}
        return l
    end,
    interact = function(self)
        if (player.cur_el != el_thunder) then
            c_slide_text.new(30, "You need thunder")
            return
        end
        for door in all(self.doors) do
            if self.on then door:close() else door:open() end
        end
        self.on = not self.on
    end,
    link_switch = function(self, door)
        flog("adding door to switch")
        add(self.doors, door)
    end,
    draw = function(self)
        pal(7, self.on and 11 or 8) pal(10, self.on and 3 or 9)
        c_interactive.draw(self)
        pal()
    end
})

c_door = cstar("c_door:c_interactive", {
    __new = function(n, x, y)
        local l = c_interactive.new(x, y, game.mgr.misc_mgr)
        l.spr.open = dstarc("sprites={43,44;45;46}; fps=5; loop=false")
        l.spr.close = dstarc("sprites={46;45;44;43}; fps=5; loop=false")
        dstar(l, [[
phase = close
hitbox = {x=0;y=0;x2=7;y2=7}
]])
        add(obj_solids, l)
        return l
    end,
    open = function(self)
        self.phase = "open"
        del(obj_solids, self)
    end,
    close = function(self)
        self.phase = "close"
        add(obj_solids, self)
    end,
})

c_scroll = cstar("c_scroll:c_interactive", {
    __new = function(n, x, y, el, cost, name, fn)
        local l = c_interactive.new(x, y, game.mgr.misc_mgr)
        l = dstar(l, [[
            el = *1
            oy = *2
            int_fn = *3
            cost = *4
            name = *5
        ]], {el, y, fn, cost and cost or el_cost[el], name})
        l.spr.idle = { ss = 12 }
        return l
    end,
    update = function(self)
        c_interactive.update(self)
        self.y = self.oy + sin(time()) * 2
    end,
    interact = function(self)
        local n = self.name or el_cls[self.el].name
        if (player.shards < self.cost) then
            c_slide_text.new(30, "("..n..") You need "..tostr(self.cost).." shards")
            return
        end
        if (self.int_fn != nil) then
            self.int_fn(self)
        else
            -- default is to give element to player
            player.cur_el = self.el
            player.avail_el[self.el] = true
        end
        c_slide_text.new(30, n.." acquired")
        self:del()
    end,
    draw = function(self)
        if (self.el) pal(7, el_colors[self.el])
        c_interactive.draw(self)
        pal()
    end
})

c_shard = cstar("c_shard:c_obj", {
    __new = function(n, x, y)
        local l = c_obj.new(x, y, game.mgr.misc_mgr)
        dstar(l, [[
            speed = 0.1
            speed_inc = 1.05
        ]])
        return l
    end,
    update = function(self)
        local dpx, dpy = player.x + 4 - self.x, player.y + 4 - self.y
        local dist = sqrt(dpx * dpx + dpy * dpy)
        if (dist < 4) then 
            player.shards +=1; 
            self:del()
        else
            local r = self.speed/dist
            self.x = lerp(self.x, player.x + 4, r)
            self.y = lerp(self.y, player.y + 4, r)
            self.speed *= self.speed_inc
        end      
    end,
    draw = function(self)
        circfill(self.x, self.y, 1, 7)
    end
})

c_misc_mgr = cstar("c_misc_mgr:c_mgr", {
    __new = function(n)
        local m = c_mgr.new()
        return m
    end
})