c_hud_element = {
    new = function(x, y , parent_mgr)
        local h = c_obj.new(x, y, parent_mgr)
        h.fixedx, h.fixedy = x, y -- fixed position relative to camera
        setmetatable(h, c_hud_element)
        return h
    end,
    update = function(self)
        -- follow camera offset
        local cx, cy = cam:calc_center()
        self.x = self.fixedx + cx
        self.y = self.fixedy + cy
    end,
}
class_inherit(c_hud_element, c_obj)

c_val_printer = {
    new = function(x, y, bg_length, draw_fn)
        local l = c_hud_element.new(x, y) 
        l.draw_fn = draw_fn
        l.bgl = bg_length
        l.spr.idle = { ss = 137 },
        setmetatable(l, c_val_printer)
        return l
    end,
    draw = function(self)
        rectfill(self.x, self.y, self.x + self.bgl, self.y + 5, 1)
        self.draw_fn(self)
    end,
}
class_inherit(c_val_printer, c_hud_element)

c_player_life_bar = {
    new = function(x, y)
        local l = c_hud_element.new(x, y)
        l.spr.idle = { ss = 170 }
        l.life_ref = player.init_max_life
        setmetatable(l, c_player_life_bar)
        return l
    end,
    draw = function(self)
        -- print("life:", self.x, self.y, 8)
        local w = 30 * player.max_life / self.life_ref
        rectfill(self.x, self.y + 1, self.x + w + 10, self.y + 6, 1)
        self:draw_sprite()
        progress_bar_draw(self.x + 10, self.y + 2, w, 3, player.life, player.max_life, 1, 8)
    end,
}
class_inherit(c_player_life_bar, c_hud_element)

c_slide_text = {
    new = function(y, msg, parent_mgr)
        local calc_x = 122 - #msg * 5
        local l = c_hud_element.new(calc_x, y, parent_mgr)
        l.msg = msg
        l.final_pos = calc_x
        l.ttl_slide = c_timer.new(0.5, false)
        l.ttl_live = c_timer.new(2, false)
        l.offset = 0
        setmetatable(l, c_slide_text)
        return l
    end,
    update = function(self)
        if (self.ttl_live:adv()) then
            self:del()
            return
        end
        self.fixedx = timer_lerp(self.final_pos, 250, self.ttl_slide, false, -1)
        self.ttl_slide:adv()
        c_hud_element.update(self)
    end,
    draw = function(self)
        rectfill(self.x - 2, self.y - 2, self.x + 126, self.y + 7, 1)
        rect( self.x - 2, self.y - 2, self.x + 126, self.y + 7, 8)
        print(self.msg, self.x, self.y, 8) -- x,y are already right for the camera position

    end,
}
class_inherit(c_slide_text, c_hud_element)

c_hud_mgr = {
    new = function()
        local l = c_mgr.new()
        l.update_in_pause = true
        setmetatable(l, c_hud_mgr)
        return l
    end,
    restart = function(self)
        self.objs = {
            -- gem counter
            c_val_printer.new(8, 1, 30, function(self)
                spr(150, self.x, self.y - 1)
                print(tostr(player.gems).."/"..tostr(stage_config_get().gems), self.x + 10, self.y + 1, 8)
            end),
            -- coin counter
            c_val_printer.new(94, 1, 25, function(self)
                spr(138, self.x, self.y - 1)
                print(tostr(player.coins), self.x + 10, self.y + 1, 8)
            end),
            c_val_printer.new(49, 1, 35, function(self)
                print("stage "..tostr(stage), self.x + 1, self.y + 1, 8)
            end),
            c_player_life_bar.new(10, 120),
            -- c_popup.new(64, 64, "stage "..tostr(stage).."*"..stage_config_get().name)
        }
        flog("HUD mgr restarted")
    end,
    -- add_popup = function(self, msg)
    --     -- local p = c_popup.new(64, 64, msg)
    --     -- self:add(p)
    -- end,
}
class_inherit(c_hud_mgr, c_mgr)