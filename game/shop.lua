c_shop = {
    new = function(x, y)
        local s = {
            x = x,
            y = y,
            w = 100,
            h = 110,
            item = 1,
            cc = c_val_printer.new(17, 3, 25, function(self)
                spr(138, self.x, self.y - 1)
                print(tostr(player.coins), self.x + 10, self.y + 1, 8)
            end),
            lc = c_val_printer.new(75, 3, 35, function(self)
                spr(170, self.x, self.y - 1)
                print(tostr(flr(player.life)).."/"..tostr(flr(player.max_life)), self.x + 10, self.y + 1, 8)
            end),
        }
        -- filter out used non-reusable items and mark as not used the others
        --  and add only for current stage passed
        s.items = {}
        
        local first = true
        for item in all(shop_items) do
            -- if stage == 2 we are at the first shop, so reset all items to unused
            if (item.reusable or stage == 2) item.used = false
            if (not item.used and stage > item.enable_after_stage) then
                if (first) item.selected = true
                first = false
                add(s.items, item)
            end
        end

        -- add the exit item
        add(s.items, {
            name = "__exit__", 
            desc1 = "exit shop",
            price = 0, 
            selected = false,
            used = false 
        })
        setmetatable(s, c_shop)
        return s
    end,
    update = function(self)
        local btn_up = btnp(2,0)
        local btn_down = btnp(3,0)
        if (btn_up) then
            -- self.item = (cnts - self.item) % (cnts) + 1
            self.items[self.item].selected = false
            self.item, v = prev_item(self.items, self.item)
            v.selected = true
        end
        if (btn_down) then
            self.items[self.item].selected = false
            self.item, v = next_item(self.items, self.item)
            v.selected = true
        end
        if (btnp(4,0)) then
            local selected_item = self.items[self.item]
            if (selected_item.name == "__exit__") then
                game:shop_to_play()
                return
            end
            if (not selected_item.used) then
                local g = player.coins
                if (g >= selected_item.price) then
                    player.coins -= selected_item.price
                    selected_item.used = true
                    if (selected_item.fn) then 
                        selected_item.fn() 
                    end
                end
            end
        end
        self.cc:update()
    end,
    draw = function(self)

        crectfill(self.x, self.y, self.w, self.h, 1)
        local liney = self.y - self.h / 2 + 5
        cprint("shop", self.x, liney - 1, 7)
        if (self.item >= 3) then
            -- center the selected item on the screen
            liney -= (self.item - 2) * 10
        end
        
        local linex = self.x - self.w / 2
        for k, item in pairs(self.items) do
            liney += 10
            -- Skip items that are to above the visible area
            local line_too_high = liney < self.y - self.h / 2 + 15
            if (not line_too_high) then
                local sel = (item.selected) and ">" or " "
                if (item.name == "__exit__") then
                    print(sel.." ".."exit", linex, liney, 7)
                    break
                else
                    local txt_color = 7
                    if (item.used) then
                        txt_color = 3
                    end
                    if (not item.used and player.coins < item.price) then
                        txt_color = 8
                    end
                    print(sel.." "..item.name, linex, liney, txt_color)
                end
            end
        end
        -- Description box -- It must be drawn over the item list intentionally.
        local sel_item = self.items[self.item]
        local desc_liney = 69
        crectfill(64, 90, 90, 50, 0)
        mlprint(sel_item.desc1 or "", linex + 10, desc_liney, 7, false)
        desc_liney += 20
        mlprint(sel_item.desc2 or "", linex + 10, desc_liney, 11)
        desc_liney += 20
        print(tostr(sel_item.price).." coins", linex + 10, desc_liney, 10)

        self.cc:draw()
        self.lc:draw()

    end,
}
c_shop.__index = c_shop