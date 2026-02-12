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
        add(player_bullets, l)
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
        if (mget2_by_px_solid(self.x, self.y)) then --only tile collisions, obj solids are checked by solids themselves.
            self:del()
        end
    end,
    dirmult = function(self)
        return (self.dir == dir_left) and -1 or 1
    end,
    hit = function(self, trg)
        c_explosion.new(self.x, self.y, 4, game.mgr.misc_mgr)
        self:effect(trg)
        self:del()
    end;
    effect = function(self, trg)
        trg:dmg(el_dmg[self.el][player.lev_el[self.el]])
    end,
    del = function(self)
        del(player_bullets, self)
        c_obj.del(self)
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
        for i = 0, 2 do
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

c_int = cstar("c_int:c_obj", {
    __new = function(n, x, y, parent_mgr)
        local l = c_obj.new(x, y, parent_mgr)
        dstar(l, [[
show_int_button = false
ttl_disable_int = nil
int_done = false
solid = true
hover_info = nil
hover_info_obj = nil
int = true
cost = 0
        ]])
        return l
    end,
    update = function(self)
        if not self.int then return end
        if self:collide(player, -2, -2) then
            self.show_int_button = true
            if (self.hover_info != nil and obj_destroyed(self.hover_info_obj)) then 
                self.hover_info_obj = c_dialog.new(100, nil, self.hover_info)
                self.hover_info_obj.ttl.t = fps * 20
            end
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
            obj_del(self.hover_info_obj)
        end
    end,
    draw = function(self)
        self:draw_sprite()
        if self.show_int_button then
            print("❎", self.x + 2, self.y - 6, 12)
        end
    end,
    interact = function(self)
        if (player.shards < self.cost) then
            c_slide_text.new(30, "You need "..tostr(self.cost).." shards")
            return
        end
        self:action()
        self.int_done = true
        player.shards -= self.cost
    end,
    action = function(self)
    end,
    del = function(self)
        obj_del(self.hover_info_obj)
        c_obj.del(self)
    end
})

c_focuslith = cstar("c_focuslith:c_int", {
    __new = function(n, x, y, parent_mgr)
        local l = c_int.new(x, y, parent_mgr)
        l.spr.idle = { ss = 11 }
        return l
    end,
    action = function(self)
        player:switch_element()
    end,
    draw = function(self)
        pal(7, (flr(time() / 0.5) % 2 == 0) and el_colors[player.cur_el] or 7)
        c_int.draw(self)
        pal()
    end
})

c_switchlith = cstar("c_switchlith:c_int", {
    __new = function(n, x, y, parent_mgr)
        local l = c_int.new(x, y, parent_mgr)
        l.spr.idle = dstarc("sprites={27;28;29}; fps=10; loop=true")
        l.on = false
        l.doors = {}
        return l
    end,
    action = function(self)
        if (player.cur_el != el_thunder) then
            c_slide_text.new(30, "You need thunder")
            return
        end
        for door in all(self.doors) do
            if self.on then door:close() else door:open() end
        end
        self.on = not self.on
        obj_mem_ch(self, self.on and 1 or 2)
    end,
    link_switch = function(self, door)
        add(self.doors, door)
    end,
    draw = function(self)
        pal(7, self.on and 11 or 8) pal(10, self.on and 3 or 9)
        c_int.draw(self)
        pal()
    end
})

c_door = cstar("c_door:c_int", {
    __new = function(n, x, y, int, cost, open)
        local l = c_int.new(x, y, game.mgr.misc_mgr)
        l.spr.open = int and dstarc("ss=60") or dstarc("sprites={43,44;45;46}; fps=5; loop=false")
        l.spr.close = int and dstarc("ss=59") or dstarc("sprites={46;45;44;43}; fps=5; loop=false")
        dstar(l, [[
phase = close
hitbox = {x=0;y=0;x2=7;y2=7}
cost = *2
int=*1
]], {int, cost})
        add(obj_solids, l)
        if (open) then c_door.open(l) end
        if (not open and int) l.hover_info = "open door ("..tostr(l.cost).." shards)"
        return l
    end,
    update = function(self)
        c_int.update(self)
        if (self.phase == "close") then
            for b in all(player_bullets) do
                if (self:collide(b)) b:del()
            end
        end
    end,
    open = function(self)
        self.phase = "open"
        self.hover_info = nil
        del(obj_solids, self)
        obj_mem_ch(self, 1)
    end,
    close = function(self)
        self.phase = "close"
        add(obj_solids, self)
        obj_mem_ch(self, 2)
    end,
    action = function(self)
        self:open()
    end
})

c_scroll = cstar("c_scroll:c_int", {
    __new = function(n, x, y, t)
        local l = c_int.new(x, y, game.mgr.misc_mgr)
        l = dstar(l, [[
el = *1
int_fn = *2
cost = *3
name = *4
        ]], {ord(t) - ord("A") + 1, nil, scr_cost[t], scr_name[t]})
        l.hover_info = "learn "..l.name.." ("..tostr(l.cost).." shards)*"..tostr(scr_desc[t])
        l.spr.idle = { ss = 12 }
        return l
    end,
    update = function(self)
        c_int.update(self)
        self.y = self.spawn_y + sin(time()) * 2
    end,
    action = function(self)
        if (self.int_fn != nil) then
            self.int_fn(self)
        else
            -- default is to give element to player
            player.cur_el = self.el
            player.avail_el[self.el] = true
        end

        c_slide_text.new(30, self.name.." acquired")
        obj_mem_ch(self, "d")
        self:del()
    end,
    draw = function(self)
        if (self.el) pal(7, el_colors[self.el])
        c_int.draw(self)
        pal()
    end,
})

c_shard = cstar("c_shard:c_obj", {
    __new = function(n, x, y, cnt, static)
        local l = c_obj.new(x, y, game.mgr.misc_mgr)
        dstar(l, [[
            speed = 0.1
            speed_inc = 1.05
            cnt = *1
            static = *2
            sbase = 1.5
            sx = _fn_rnd_15
            sy = _fn_rnd_15
        ]], {cnt or 1, static or false})
        return l
    end,
    update = function(self)
        local dist = self:dist(player)
        if (dist < 4) then
            player.shards += self.cnt
            if (self.static) then obj_mem_ch(self, "d") end
            self:del()
        elseif (not self.static) then
            self:moveTo(player, self.speed)
            self.speed *= self.speed_inc
        else
            self.x = self.spawn_x + sin(time()*(self.sbase + self.sx/10))
            self.y = self.spawn_y + sin(time()*(self.sbase + self.sy/10))
        end     
    end,
    draw = function(self)
        circfill(self.x + 4, self.y + 4, max(1, self.cnt/2), 7)
    end
})

c_npc = cstar("c_npc:c_int", {
    __new = function(n, x, y, codename, dialogs)
        local l = c_int.new(x, y, game.mgr.misc_mgr)
        l.spr.idle.sprites = npc_sprites[codename] or { 154 }
        l.name = npc_names[codename]
        l.dialogs = split(dialogs, "/")
        l.cur_diag = 1
        l.diagcls = nil
        l.boss = codename == "lea" and stage != 2
        return l
    end,
    update = function(self)
        c_int.update(self)
        if (self.diagcls and ((abs(self.x - player.x) > 40 or abs(self.y - player.y) > 40) or self.diagcls.destroyed)) then
            self.diagcls:del()
            if (self.boss) then 
                c_boss.new(self.x - 8, self.y - 8)
                self:del()
            end
            self.cur_diag = 1 -- reset dialog
            self.diagcls = nil
        end
    end,
    action = function(self)
        self.diagcls = self.diagcls or c_dialog.new(30, self.name, "")
        self.diagcls:update_msg(self.dialogs[self.cur_diag])
        self.diagcls.cont = self.cur_diag < #self.dialogs
        self.diagcls.ttl:restart()
        self.cur_diag = min(self.cur_diag + 1, #self.dialogs) -- stay at last dialog during interaction
    end
})

c_bullet = cstar("c_bullet:c_obj", {
    __new = function(n, x, y, dir, speed)
        local l = c_obj.new(x, y, game.mgr.misc_mgr)
        dstar(l, [[
dir = *1
speed = *2
ttl = _fn_t1_3
        ]], {dir, speed})
        l.spr.idle = dstarc("ss = 185")
        add(enemy_bullets, l)
        return l
    end,
    update = function(self)
        self.x += cos(self.dir) * self.speed
        self.y += sin(self.dir) * self.speed
        if (self:collide(player)) then 
            player:dmg(1)
            self:del()
        else
            if (map_or_obj_solid_at_px(self.x, self.y) or self.ttl:adv()) self:del()
        end
    end,
    del = function(self)
        del(enemy_bullets, self)
        c_obj.del(self)
    end
})

c_misc_mgr = cstar("c_misc_mgr:c_mgr", {
    __new = function(n)
        local m = c_mgr.new()
        return m
    end
})