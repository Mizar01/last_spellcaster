c_hud_element = cstar("c_hud_element:c_obj", {
    __new = function(n, x, y , parent_mgr)
        local h = c_obj.new(x, y, parent_mgr)
        dstar(h, "fixedx=*1;fixedy=*2", {x, y})
        return h
    end,
    update = function(self)
        -- follow camera offset
        local cx, cy = cam:calc_center()
        self.x = self.fixedx + cx
        self.y = self.fixedy + cy
    end,
})

c_val_printer = cstar("c_val_printer:c_hud_element", {
    __new = function(n, x, y, bg_length, draw_fn)
        local l = c_hud_element.new(x, y)
        dstar(l, "draw_fn=*1;bgl=*2", {draw_fn, bg_length}) 
        l.spr.idle = dstarc("ss=137")
        return l
    end,
    draw = function(self)
        rectfill(self.x, self.y, self.x + self.bgl, self.y + 6, 1)
        self:draw_fn()
    end,
})

c_player_life_bar = cstar("c_player_life_bar:c_hud_element", {
    __new = function(n, x, y)
        local l = c_hud_element.new(x, y)
        l.spr.idle = { ss = 169 }
        l.life_ref = player.init_max_life
        return l
    end,
    draw = function(self)
        -- print("life:", self.x, self.y, 8)
        local w = 30 * player.max_life / self.life_ref
        -- rectfill(self.x, self.y + 1, self.x + w + 10, self.y + 6, 1)
        self:draw_sprite()
        progress_bar_draw(self.x + 10, self.y + 2, w, 3, player.life, player.max_life, 1, 8)
    end,
})

c_slide_text = cstar("c_slide_text:c_hud_element", {
    __new = function(n, y, msg)
        local l = c_hud_element.new(0, y, game.mgr.hud_mgr)
        l.msg = msg
        l.final_pos = 122 - #msg * 4
        l.fixedx = l.final_pos + 250
        dstar(l, [[
            ttl = _fn_t1_2
        ]])
        c_hud_element.update(l)  -- initial update to set x,y
        return l
    end,
    update = function(self)
        if (self.ttl:adv()) then
            self:del()
            return
        end
        local d = abs(self.fixedx - self.final_pos)
        self.fixedx = (d < 2) and self.final_pos or (self.fixedx - d * 0.1)
        c_hud_element.update(self)
    end,
    draw = function(self)
        rectfill(self.x - 2, self.y - 2, self.x + 126, self.y + 7, 1)
        rect( self.x - 2, self.y - 2, self.x + 126, self.y + 7, 14)
        print(self.msg, self.x, self.y, 8) -- x,y are already right for the camera position

    end,
})

c_dialog = cstar("c_dialog:c_slide_text", {
    __new = function(n, y, author, msg)
        local l = c_slide_text.new(y, msg)
        dstar(l, [[
final_pos = 10
fixedx = 260
ttl = _fn_t1_6
cont = false
author = *1
msgs = nil
        ]], {author})
        c_dialog.update_msg(l, msg)
        
        return l
    end,
    update_msg = function(self, msg)
        self.msg = msg
        self.msgs = split((self.author != nil and self.author..":*" or "")..msg, "*")
    end,
    draw = function(self)
        local rows = #self.msgs
        rectfill(self.x - 10, self.y - 10, self.x + 124, self.y + rows * 7 + 10, 1)
        rect( self.x - 2, self.y - 2, self.x + 124, self.y + rows * 7, 14)
        -- if (self.author != nil) print(self.author..":", self.x, self.y, 8)
        for i = 1, #self.msgs do
            print(self.msgs[i], self.x, self.y + (i - 1) * 7, 8)
        end
        if (self.cont) print("❎>>", self.x + 100, self.y + rows * 7 + 2, 8)
    end,
})

c_hud_mgr = cstar("c_hud_mgr:c_mgr", {
    __new = function(n)
        local l = c_mgr.new()
        l.update_in_pause = true
        return l
    end,
    restart = function(self)
        self.objs = {
            c_val_printer.new(94, 1, 25, function(self)
                circfill(self.x + 4, self.y + 3, 2, 7)
                print(tostr(player.shards), self.x + 10, self.y + 1, 8)
            end),
            c_player_life_bar.new(10, 0),
        }
    end,
})