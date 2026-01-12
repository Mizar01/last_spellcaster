sfx_on = true
music_on = true

gravity = 0.25
dir_left, dir_right, dir_up, dir_down = dstaru("0;1;2;3")
el_fire, el_thunder, el_ice, el_wind = dstaru("1;2;3;4")
el_colors = dstarc("8;10;12;13")
el_cls = {c_fire, c_thunder, c_ice, c_wind} -- element class for each element type
el_dmg = dstarc([[{110;20;30};{10;15;25};{0;0;0};{0;0;0}]])
el_cost = dstarc("0;25;40;35")
fsolid_idx = 0 --sprint flag index used for solid
game = nil
player = nil
sfx_jump, sfx_coin, sfx_heart, sfx_portal_send, sfx_portal_recv, sfx_player_hit = dstaru("0;1;2;3;4;5")

obj_solids = {} -- objects that temporarily become solid (like frozen enemies)

stage = 1

use_sample_map = false
sample_map = {}

-- neighbor config nodes
ncn_none, ncn_up, ncn_down, ncn_left, ncn_right, ncn_up_down, ncn_up_left, ncn_up_right, ncn_down_left, ncn_down_right, ncn_left_right, ncn_up_down_left, ncn_up_down_right, ncn_up_left_right, ncn_down_left_right, ncn_all = dstaru("0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15")

themes = dstarc([[
metal = {
    tile_maps = {1;2;3;4;5}
    bg_col = -15
};
sand = {
    tile_maps = {17;18;19;20;21}
    bg_col = 12
};
grass = {
    tile_maps = {33;34;35;36;37}
    bg_col = 0
};
ice = {
    tile_maps = {49;50;51;52;53}
    bg_col = -15
};
]])

-- 1 max dead per stage
dead_messages = {}


