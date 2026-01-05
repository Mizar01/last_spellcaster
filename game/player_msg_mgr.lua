c_player_msg_mgr = {
    new = function()
        local m = c_mgr.new()
        m.dog_bites = 0
        m.msg = {
            { function() return player.coins > 0 end, "collect this coins*to buy something*at the shop later." },
        }
        return sm(m, c_player_msg_mgr)
    end,
    update = function(self)
        for v in all(self.msg) do
            local condition_fn = v[1]
            local msg_text = v[2]
            if (condition_fn()) then
                game.mgr.hud_mgr:add_popup(msg_text)
                del(self.msg, v)
            end
        end
    end,
}
clsinh(c_player_msg_mgr, c_mgr)