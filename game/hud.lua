c_hud_element = {
    new = function(x, y)
        local h = c_obj.new(x, y)
        h.fixedx, h.fixedy = x, y
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

c_popup = {
    new = function(x, y, msg)
        local l = c_hud_element.new(x, y)
        l.spr = {}
        l.ttl = c_timer.new(10, false)
        l.fade_seq = {8,8,8,8,8,8,9,9,9,9,9,9,10,10,10,10,10,10,9,9,9,9,9,9}
        l.fade_seq_idx = 1
        l.parent_mgr = game.mgr.hud_mgr
        l.msg = msg
        l.max_height = #(split(msg, "*")) * 10 + 20
        l.frames_before_int = 10 -- to avoid instant close
        game.paused = true
        setmetatable(l, c_popup)
        return l
    end,
    update = function(self)
        c_hud_element.update(self)
        if (btnp(5,0) and self.frames_before_int <= 0) then
            self.parent_mgr:del(self)
            game.paused = false
        end
        if (self.frames_before_int > 0) then
            self.frames_before_int -= 1
        end
    end,
    draw = function(self)
        self.fade_seq_idx = (self.fade_seq_idx + 1) % #self.fade_seq
        local c = self.fade_seq[self.fade_seq_idx + 1]
        crectfill(self.x, self.y, 128, self.max_height, 1)
        mlprint(self.msg, self.x, self.y - (self.max_height / 2) + 40, c, true)
        cprint("press (❎) to continue", self.x, (self.y + self.max_height / 2) - 10, c)
    end,
}
class_inherit(c_popup, c_hud_element)

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
        rectfill(self.x, self.y, self.x + self.bgl, self.y + 5, 0)
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
        rectfill(self.x, self.y + 1, self.x + w + 10, self.y + 6, 0)
        self:draw_sprite()
        progress_bar_draw(self.x + 10, self.y + 2, w, 3, player.life, player.max_life, 0, 8)
    end,
}
class_inherit(c_player_life_bar, c_hud_element)



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
    add_popup = function(self, msg)
        local p = c_popup.new(64, 64, msg)
        self:add(p)
    end,
}
class_inherit(c_hud_mgr, c_mgr)