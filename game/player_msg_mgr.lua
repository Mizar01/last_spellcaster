c_player_msg_mgr = {
    new = function()
        local m = c_mgr.new()
        m.dog_bites = 0
        m.msg = {
            { function() return player.coins > 0 end, "collect this coins*to buy something*at the shop later." },
            { function() return player.coins > 10 end,"yes, yes!*greed!*you understand how it works." },
            { function() return player.gems > 0 end, "can you collect*all these gems for me?*thank you." },
            { function() return player.hearts > 0 end, "as you may notice...*you are sick.*use these hearts to heal." },
            { function() return m.dog_bites > 1 end, "sorry, usually*those dogs*are friendly." },
            { function() return is_last_stage_with_last_gem() and player_tile_check(14, 4) end, "don't you dare!"},
            { function() return is_last_stage_with_last_gem() and player_tile_check(15, 4) end, "you don't know*what you're doing!*stay away from that hole!"},            

        }
        setmetatable(m, c_player_msg_mgr)
        return m
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
c_player_msg_mgr.__index = c_player_msg_mgr
setmetatable(c_player_msg_mgr, c_mgr)