function _init()
    flog("\n\n\n\n----------- Game started -----------")
    game = c_game.new()
end

function _update60()
    game:update()
end

function _draw()
    game:draw() 
end

c_game = cstar("c_game", {
    __new = function()
        local g = {
            paused = false,
            menu = true,
            play = false,
            stage_title_phase = false,
            require_player_rebuild = true,
            minimap = {},
            mgr = {
                enemy_mgr = c_mgr.new(),
                misc_mgr = c_misc_mgr.new(),
                hud_mgr = c_hud_mgr.new(),
            },
        }
        -- create parallax pixels in the background
        g.bgpos = {0, 0}
        menuitem(1, "new game", function() game:start_menu() end)
        -- c_game.prepare_minimap(g)
        return g
    end,
    -- prepare_minimap = function(self)
    --     flog("preparing minimap...")
    --     local mm = {}
    --     local i = 1
    --     for st in all(stage_compressed_maps) do
    --         local converted_type_map = matrix_map(map_h, map_w, "")
    --         load_rle_map(st, map_w, converted_type_map)
    --         for ty=0, map_h - 1 do
    --             for tx=0, map_w - 1 do
    --                 local mt_x = tx + (stage_config[i].wtx + 34)
    --                 local mt_y = ty + (stage_config[i].wty + 64)
    --                 if converted_type_map[tx][ty]=="1" then
    --                     local sx, sy = mt_x / 2, mt_y / 2
    --                     add(mm, {sx, sy})
    --                 end
    --             end
    --         end
    --         i += 1
    --     end
    --     self.minimap = mm
    -- end,
    start_play = function(self)
        self.win_stage = false
        self.menu = false
        self.play = true
        if self.require_player_rebuild then
            player = c_player.new(0, 0)
            self.require_player_rebuild = false
        end
        self.game_over = false
        player:reset_stage_props()
        for _, v in pairs(self.mgr) do
            if (v.restart) v:restart()
        end
        setup_stage_from_string()
        cam:place(player.x, player.y)

        if (music_on) music(stage_config_get().music)  -- play stage music
    end,
    start_menu = function(self)
        self.menu = true
        self.play = false
        self.game_over = false
        self.win_stage = false
        self.win_game = false
        stage = 1
    end,
    stage_check = function(self)
        local ptx, pty = flr(player.x / 8), flr(player.y / 8)
        if ptx < 0 or (ptx >= map_w - 1 and player.x > map_w * 8 - 4) or (pty <= 0 and player.y < 3) or pty >= map_h - 1 then
            -- LOAD A NEW STAGE (MAP PORTION)
            spawn1 = false
            local prev_stage = stage_config_get()
            local pwtx, pwty = ptx + prev_stage.wtx or 0, pty + prev_stage.wty or 0
            if pty <= 0 then 
                pwty-=2
                pwtx = pwtx + (player.spr.flip_x and -1 or 1)
            elseif pty >= map_h - 1 then pwty+=2 end
            if (ptx >= map_w - 1) pwtx+=1
            local cs = nil
            for i = 1,#stage_config do
                cs = stage_config[i]
                if pwtx >= cs.wtx and pwtx < cs.wtx + map_w and pwty >= cs.wty and pwty < cs.wty + map_h then
                    stage = i
                    break
                end
            end
            clean_stage()
            local nptx, npty = pwtx - cs.wtx, pwty - cs.wty
            ovd_respawn = dstarc(""..nptx..";"..npty.."")
            flog("stage changed to "..stage.." with ovd_respawn "..ovd_respawn[1]..","..ovd_respawn[2].."")
            setup_stage_from_string()
            fix_jump_transition()
            cam:place(player.x, player.y)
        end
    end,
    -- draw_minimap = function(self)
    --     rectfill(-25 + cam.x, - 32 + cam.y, 64 + cam.x, 22 + cam.y, 1)
    --     for p in all(self.minimap) do
    --         pset(p[1] -15 + cam.x, p[2] - 64 + cam.y, 7)
    --     end
    -- end,
    update = function(self)

        if self.menu then
            if btnp(5,0) then
                self.require_player_rebuild = true
                self:start_play()
            end
            return
        end

        self:stage_check()

        -- Update play
        cam:update()  -- always first, or the hud elements will have to follow the camera in the next frame with old center.
        for _, v in pairs(self.mgr) do
            if (v.update) v:update()
        end
        player:update()

        self.bgpos[1] = (cam.x - cam.ox) * 0.5
        self.bgpos[2] = (cam.y - cam.oy) * 0.5
            
    end,
    draw = function(self)

        if self.menu then
            cls()
            local t = t()
            spr(80 + flr((t / 0.10) % 3), 60, 58)
            cprint("* the last spellcaster *", 64, 50, 7)
            cprint("press ❎ to start", 64, 70, 7)
            return
        end

        -- Draw play
        cls(stage_config_get().theme.bg_col)
        -- background parallax
        for x = 0, 23 do
            for y = 0, 15 do
                spr(9, x * 16 + self.bgpos[1], y * 16 + self.bgpos[2], 2, 2)
            end
        end
        map(0, 0, 0, 0, tw, th, false)

        self.mgr.misc_mgr:draw()
        self.mgr.enemy_mgr:draw()
        player:draw()
        self.mgr.hud_mgr:draw()  -- Always on top

        -- self:draw_minimap()

        if player.phase == "dead" then
            local cx, cy = cam:calc_center()
            -- cprint("you died!", 64 + cx, 55 + cy, 8)
            -- cprint("respawning in "..player.t_respawn:t_left(), 64 + cx, 65 + cy, 7)
            return
        end
        print(""..tostr(flr(player.x/8))..","..tostr(flr(player.y/8)), cam.x - 50, cam.y - 60, 7)
        
        -- print(""..tostr(abs(416 - cam.x))..","..tostr(abs(64 - cam.y)))
    end,
})