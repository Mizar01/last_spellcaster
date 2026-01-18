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

c_game = {
    new = function()
        local g = {
            paused = false,
            win_stage = false,
            win_game = false,
            menu = true,
            play = false,
            stage_title_phase = false,
            require_player_rebuild = true,
            mgr = {
                enemy_mgr = c_mgr.new(),
                misc_mgr = c_misc_mgr.new(),
                hud_mgr = c_hud_mgr.new(),
                player_msg_mgr = c_player_msg_mgr.new(),
            },
        }
        g.game_over_msgs = {}
        g.game_over_msg = ""
        menuitem(1, "restart game", function() game:start_menu() end)
        return sm(g, c_game)
    end,
    start_play = function(self)
        self.win_stage = false
        self.menu = false
        self.play = true
        if (self.require_player_rebuild) then
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
    setup_final_event = function(self)
    end,
    setup_win_lose_stage = function(self)
        -- the time has run out. if all the gems have been collected, win the stage, else game over
        if (player.gems == stage_config_get().gems) then
            self.win_stage = true
            self.win_game = (stage == #stage_config)
            if (self.win_game) music(11)
            player:apply_end_stage_upgrades()
        else
            self.game_over_msg = "you didn't collect all gems!"
            self:set_game_over()
        end
    end,
    start_menu = function(self)
        self.menu = true
        self.play = false
        self.game_over = false
        self.win_stage = false
        self.win_game = false
        stage = 1
    end,
    set_game_over = function(self)
        self.play = false
        self.win_stage = false
        self.game_over = true
    end,
    stage_check = function(self)
        local ptx, pty = flr(player.x / 8), flr(player.y / 8)
        if (ptx < 0 or ptx >= map_w or pty < 0 or pty >= map_h) then
            local pwtx, pwty = ptx + stage_config_get().wtx or 0, pty + stage_config_get().wty or 0
            for i = 1,#stage_config do
                local cs = stage_config[i]
                if (pwtx >= cs.wtx and pwtx < cs.wtx + map_w and pwty >= cs.wty and pwty < cs.wty + map_h) then
                    stage = i
                    break
                end
            end
            player:reset_stage_props()
            for _, v in pairs(self.mgr) do
                if (v.restart) v:restart()
            end
            ovd_respawn = dstarc(""..(pwtx - stage_config_get().wtx)..";"..(pwty - stage_config_get().wty).."")
            flog("stage changed to "..stage.." with ovd_respawn "..ovd_respawn[1]..","..ovd_respawn[2].."")
            setup_stage_from_string()
            cam:place(player.x, player.y)
        end
    end,
    update = function(self)

        if self.menu then
            if (btnp(5,0)) then
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
            
    end,
    draw = function(self)

        if self.menu then
            cls(8)
            rectfill(0, 40, 127, 80, 0)
            local t = t()
            line(70 + 64 - flr((t / 0.05) % 130), 62, 70 + 70 - flr((t / 0.05) % 130), 62, 9)
            line(70 + 70 - flr((t / 0.030) % 130), 60, 70 + 75 - flr((t / 0.030) % 130), 60, 9)
            line(70 + 60 - flr((t / 0.020) % 130), 64, 70 + 65 - flr((t / 0.020) % 130), 64, 9)
            spr(
                80 + flr((t / 0.10) % 3),
                60,
                58
            )
            line(0, 40, 127, 40, 7)
            line(0, 80, 127, 80, 7)
            cprint("* new title here! *", 64, 50, 7)
            cprint("press (❎) to start", 64, 70, adv_timed_arr(1, {7,0}))
            return
        end

        -- Draw play
        cls(stage_config_get().theme.bg_col)
        map(0, 0, 0, 0, 128, 32, false)

        self.mgr.misc_mgr:draw()
        self.mgr.enemy_mgr:draw()
        player:draw()
        self.mgr.hud_mgr:draw()  -- Always on top

        if (player.phase == "dead") then
            local cx, cy = cam:calc_center()
            cprint("you died!", 64 + cx, 55 + cy, 8)
            cprint("respawning in "..player.t_respawn:t_left(), 64 + cx, 65 + cy, 7)
            return
        end
        print(""..tostr(flr(player.x/8))..","..tostr(flr(player.y/8)), cam.x - 50, cam.y - 60, 7)
        -- print(""..tostr(abs(416 - cam.x))..","..tostr(abs(64 - cam.y)))
        
        if (self.win_game) then
            crectfill(64, 64, 120, 55, 1)
            cprint("congratulations!", 64,  55, 10)
            cprint("you survived!", 64,  65, 10)
            cprint("press (❎) to restart", 64, 75, adv_timed_arr(1, {10,0}))
        elseif (self.win_stage and not self.game_over) then
            crectfill(64, 64, 107, 25, 1)
            cprint("stage cleared!", 64, 55, 10)
            cprint("press (❎) for the shop", 64, 65, 10)
        elseif (self.game_over) then
            crectfill(64, 64, 120, 55, 1)
            cprint("game over", 64,  55, 8)
            cprint(self.game_over_msg, 64,  65, 8)
            cprint("press (❎) to restart", 64, 75, adv_timed_arr(1, {8,0}))
        end
    end,
}
c_game.__index = c_game