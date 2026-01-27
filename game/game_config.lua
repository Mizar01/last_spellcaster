sfx_on = true
music_on = true

gravity = 0.25
dir_left, dir_right, dir_up, dir_down = dstaru("0;1;2;3")
el_fire, el_thunder, el_ice, el_wind = dstaru("1;2;3;4")
el_colors = dstarc("8;10;12;13")
el_cls = {c_fire, c_thunder, c_ice, c_wind} -- element class for each element type
el_dmg = dstarc([[{110;20;30};{10;15;25};{0;0;0};{0;0;0}]])
scr_name = dstarc("A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=XXXXXXXX;G=lifereg;H=lifereg+1;I=thunder+2;J=fire+3;K=lifereg+2;L=fire+4;")
scr_desc = dstarc([[
A=burning hearts forever
B=strike or power switches
C=icy things are useful!
D=all they need is a little push
E=can burn vines
F=XXXXXXXXX
G=life regenerates
H=life regen increased
I=more powerful thunder attacks
J=greatly enhanced fire attacks
K=life regen greatly increased
L=ultimate fire power
]])
scr_cost = dstarc("A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;")
door_cost_map=dstarc("U=100;V=200;W=400;")
npc_names = dstarc([[
lea=aunt lea
lady=lady
]])
npc_sprites = dstarc([[
lea = {192;193}
lady = {208;209}
]])
en_map=dstarc("a=bath;b=batv;c=witchh;d=witchv;e=dog;g=spider;i=sk;")
en_sprites=dstarc([[
dog={idle={144;145};run={146;147}}
spider={idle={160;161};run={162;163}}
sk={idle={148;149};run={150;151}}
bath={idle={128;129}}
batv=_k_bath
witchh={idle={130;131}}
witchv=_k_witchh
]])
en_mv=dstarc([[bath=horizontal;batv=vertical;witchh=horizontal;witchv=vertical;]])
fsolid_idx = 0 -- flag index used for solid
game = nil
player = nil
sfx_jump, sfx_coin, sfx_heart, sfx_portal_send, sfx_portal_recv, sfx_player_hit = dstaru("0;1;2;3;4;5")

stage_mem, stage_changes_mem, obj_solids, player_bullets, enemy_bullets = dstaru("{};{};{};{};{}")

map_w, map_h = 48, 32
map_wpx, map_hpx = map_w * 8, map_h * 8

stage = 5
spawn1 = true
-- ovd_respawn = dstarc("43;30")
ovd_respawn=nil -- intial player spawn override in tile coords. It must be used for every stage load.

-- TEST VARS
use_sample_map = true
ovd_avail_els = dstarc("true;true;true;false")
ovd_cur_el = el_fire
sample_map = [[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1                                   1 1                                                       1
1                                 1                                                           1
1                 1 1 1 1 1 1 1 1                                                             1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1                                                                           1
1                 1 1 1                                                                       1
1                 1 1 1                                                                       1
1                 1 1 1                                                                       1
1     f                               p                                                       1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]


-- neighbor config nodes
ncn_none, ncn_up, ncn_down, ncn_left, ncn_right, ncn_up_down, ncn_up_left, ncn_up_right, ncn_down_left, ncn_down_right, ncn_left_right, ncn_up_down_left, ncn_up_down_right, ncn_up_left_right, ncn_down_left_right, ncn_all = dstaru("0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15")

themes = dstarc([[
metal={tile_maps={1;2;3;4;5};bg_col=-15};
sand={tile_maps={17;18;19;20;21};bg_col=0};
grass={tile_maps={33;34;35;36;37};bg_col=0};
water={tile_maps={65;66;67;68;69};bg_col=12};
ice={tile_maps={49;50;51;52;53};bg_col=-15};
]])

stage_config = {
    build_stage_config_item(
        dstarc("name=The green forest 1;music=13;theme=grass;wtx=0;wty=0"),
        dstarc([[
p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
u = {cname=lady;msg=welcome to the forest*be careful out there!}
]]
        )
    ),
    build_stage_config_item(
        dstarc("name=The green forest 2;music=13;theme=grass;wtx=48;wty=0"),
        dstarc("")
    ),
    build_stage_config_item(
        dstarc("name=The green forest 3;music=13;theme=grass;wtx=-48;wty=0"),
        dstarc("")
    ),
    build_stage_config_item(
        dstarc("name=The underground;music=13;theme=sand;wtx=-20;wty=32"),
        dstarc("")
    ),
    -- Final stage
    build_stage_config_item(
        dstarc("name=The core;music=13;theme=metal;wtx=-20;wty=64"),
        dstarc("p={cname=lea;msg=you have done well*my dear nephew*now die}")
    ),
}

-- adding to dstar other functions
dstar_add("t1", function(t) return c_timer.new(t,false) end)
dstar_add("t2", function(t) return c_timer.new(t,true) end)
dstar_add("rnd", function(max) return flr(rnd(max)) end)


