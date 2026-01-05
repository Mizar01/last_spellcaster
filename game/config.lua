poke(0x5f5c,-1) -- disable auto repeat of buttons (this is useful to prevent keyboard from repeating keys and for using btnp() correctly)

debug = false
log_enabled = true -- Disable in production!!!
fps = 60

-- memory of button consuming
-- btnc = 0b000000
-- btnpc = 0b000000

sfx_on = true
music_on = true

gravity = 0.25
dir_left, dir_right, dir_up, dir_down = 0, 1, 2, 3
el_fire, el_thunder, el_ice, el_wind = 1, 2, 3, 4
el_colors = {8, 10, 12, 13}
el_cls = {c_fire, c_thunder, c_ice, nil} -- element class for each element type
fsolid_idx = 0 --sprint flag index used for solid
game = nil
player = nil
log_filename = "microvania/logs/log"
sfx_jump, sfx_coin, sfx_heart, sfx_portal_send, sfx_portal_recv, sfx_player_hit = 0,1,2,3,4,5

stage = 1

use_sample_map = false
sample_map = {}

-- neighbor config nodes
ncn_none, ncn_up, ncn_down, ncn_left, ncn_right, ncn_up_down, ncn_up_left, ncn_up_right, ncn_down_left, ncn_down_right, ncn_left_right, ncn_up_down_left, ncn_up_down_right, ncn_up_left_right, ncn_down_left_right, ncn_all = 0,1,2,4,8,3,5,9,6,10,12,7,11,13,14,15

themes = {
    metal = {
        tile_maps = {1, 2, 3, 4, 5 },
        bg_col = -15,
    },
    sand = {
        tile_maps = {17, 18, 19, 20, 21},
        bg_col = 12,
    },
    grass = {
        tile_maps = {33, 34, 35, 36, 37},
        bg_col = 0,
    },
    ice = {
        tile_maps = {49, 50, 51, 52, 53},
        bg_col = -15,
    },
}


stage_config = {
    build_stage_config_item("hello pris... ehm subject n.6", 13, "grass", 0),
    build_stage_config_item("we do this for you", 6, "metal", 15),
    build_stage_config_item("time to breath fresh air", 0, "grass", 15),
    build_stage_config_item("portals are funny, isn't it?", 6, "grass", 20),
    build_stage_config_item("do not fear cutie dogs", 0, "sand", 20),
}

local fn_inc_healt = function() player.max_life = flr(player.max_life * 1.10 + 0.5) end
shop_items = {
    -- build_shop_item(name, desc1, desc2, price, enable_after_stage, reusable, fn)
    build_shop_item("tasty chicken", "+5 health", "", 10, 1, true, function() player:increase_life(5) end),
    build_shop_item("pizza with salami", "+7 health", "", 20, 1, true, function() player:increase_life(7) end),
    build_shop_item("dna mod #1", "+10% max health", "", 55, 1, false, fn_inc_healt),
    build_shop_item("dna mod #2", "+10% max health", "", 75, 5, false, fn_inc_healt),
    build_shop_item("dna mod #3", "+10% max health", "", 95, 8, false, fn_inc_healt),
    build_shop_item("dna mod #3", "+10% max health", "", 115, 10, false, fn_inc_healt),
    build_shop_item("haste", "+25% speed", "", 60, 3, false, function() player.max_speed *= 1.25 end),
    build_shop_item("super haste", "+25% speed", "", 120, 7, false, function() player.max_speed *= 1.25 end),
    build_shop_item("greed chip #1", "+1 coin*every gem taken", "i can understand*your needs", 100, 3, false, function() player.coin_inc += 1 end),
    build_shop_item("greed chip #2", "+2 coin*every gem taken", "maybe you can buy*a house someday", 150, 7, false, function() player.coin_inc += 1 end),
    build_shop_item("stinky socks", "dogs are reluctant*to hunt you", "slows down dogs*hunting you", 110, 5, false, function() player.stinky_socks = true end),
    -- build_shop_item("interests", "+20% coins after*every stage end", "", 50, 1, false, function()
    --     add(player.permanent_upgrades.after_stage, function()
    --         local inc = flr(player.coins * 0.02)
    --         player.coins += inc
    --     end)
    -- end),
}

-- 1 max dead per stage
dead_messages = {}


