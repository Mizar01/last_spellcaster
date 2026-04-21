music_on = true

gravity = 0.25
dir_left, dir_right, dir_up, dir_down = dstaru("0;1;2;3")
el_fire, el_thunder, el_ice, el_wind = dstaru("1;2;3;4")
el_colors = dstarc("8;10;12;13")
el_idle_setup = dstarc([[
{sprites={112;113;114;115};fps=10;loop=false};
{sprites={116;117;118;119};fps=30;loop=true};
{sprites={120;121;122;123};fps=10;loop=false};
{sprites={124};fps=1;loop=false};
]])
el_ttl = dstarc("0.3;1;0.4;0.5")
el_cls = {c_fire, c_thunder, c_ice, c_wind} -- element class for each element type
el_dmg = dstarc([[{10;20;30;40};{10;15;25};{0;0;0};{0;0;0}]])
scr_name = dstarc("A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=fire+2;G=lifereg;H=lifereg+1;I=max life+1;J=fire+3;K=lifereg+2;L=max life+2;")
scr_fn=dstarc("E=*1;F=*2;G=*3;H=*4;I=*5;J=*6;K=*7;L=*8;", {
    function() player.lev_el[el_fire] = 2 end, -- E = fire+1
    function() player.lev_el[el_fire] = 3 end, -- F = fire+2
    function() player.lifereg_lev = max(1, player.lifereg_lev) end, -- G = lifereg
    function() player.lifereg_lev = max(2, player.lifereg_lev) end, -- H = lifereg+1
    function() player.max_life += 5 player.life = player.max_life end, -- I = max_life+1
    function() player.lev_el[el_fire] = 4 end, -- J = fire+3
    function() player.lifereg_lev = 3 end, -- K = lifereg+2
    function() player.max_life += 10 player.life = player.max_life end, -- L = max_life+2
})
scr_colors = dstarc("A=8;B=10;C=12;D=13;E=8;F=8;G=8;H=8;I=7;J=18;K=8;L=7;")
scr_desc = dstarc([[
A=can also burn green vines
B=strike/power switches
C=icy things are useful!
D=all they need is a little push
E=can also burn red vines
F=more fire power
G=life regenerates
H=life regen increased
I=tired of losing?
J=can also burn blue vines
K=life regen greatly increased
L=max life to maximum
]])
scr_cost = dstarc("A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;")
door_key_map=dstarc("U=red;V=blue;")
npc_names = dstarc([[
lea=aunt lea
lady=lady
titus=old titus
]])
npc_sprites = dstarc([[
lea = {192;193}
lady = {208;209}
titus = {224;225}
]])
en_map=dstarc("a=bath;b=batv;c=witchh;d=witchv;e=dog;g=spider;i=sk;l=boss1;m=boss2;n=boss3;w=craterh;x=craterv;")
en_sprites=dstarc([[
dog={idle={146;147}}
spider={idle={162;163}}
sk={idle={150;151}}
bath={idle={128;129}}
batv=_k_bath
witchh={idle={130;131}}
witchv=_k_witchh
boss1={idle={203;205}}
boss2={idle={231;233}}
boss3={idle={199;201}}
craterh={idle={38}}
craterv={idle={54}}
]])
-- this should be an array, but it's more convenient to use a map for lookup
en_vertical=dstarc("batv=1;witchv=1;craterv=1;")
fsolid_idx = 0 -- flag index used for solid
game = nil
player = nil
sfx_heart, sfx_portal_send, sfx_portal_recv, sfx_player_hit = dstaru("2;3;4;5")

stage_mem, stage_changes_mem, obj_solids, player_bullets, enemy_bullets = dstaru("{};{};{};{};{};{}")

map_w, map_h = 48, 32
map_wpx, map_hpx = map_w * 8, map_h * 8

cur_boss = nil

stage = 2  -- intitial stage is 2
spawn1 = true
-- ovd_respawn = dstarc("20;30")
ovd_respawn=nil -- intial player spawn override in tile coords. It must be used for every stage load.

-- TEST VARS
use_sample_map = false
ovd_avail_els = dstarc("false;false;false;false") -- Real production game setup
ovd_cur_el = nil
player_enable_all = false
-- ovd_avail_els = dstarc("true;true;true;true")
-- ovd_cur_el = el_thunder

sample_map = [[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1                                                                                             1
1                                                                                             1
1       1 1 1                                                                                 1
1           1                                                                                 1
1 1 1                                                                                         1
1           1                                                                                 1
1         1 1                                                                                 1
1           1                                                                                 1
1 1 1       1                                                                                 1
1           1                                                                                 1
1           1                                                                                 1
1       1 1 1                                                                                 1
1                                                                                             1
1           1                                                                                 1
1 1 1       1                                                                                 1
1                                                                                             1
1                                                                                             1
1       1 1 1                                                                                 1
1           1                                                                                 1
1 1 1                                                                                         1
1           1                                                                                 1
1                                                                                             1
1       1 1 1                                                                                 1
1                                                                                             1
1                                                                                             1
1 1 1       1                                                                                 1
1                                                                                             1
1       1 1                                                                                   1
1                                 Q       M                                                   1
1 1 1                 f   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                             1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]


-- neighbor config nodes
ncn_none, ncn_up, ncn_down, ncn_left, ncn_right, ncn_up_down, ncn_up_left, ncn_up_right, ncn_down_left, ncn_down_right, ncn_left_right, ncn_up_down_left, ncn_up_down_right, ncn_up_left_right, ncn_down_left_right, ncn_all = dstaru("0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15")

themes = dstarc([[
metal={tile_maps={1;2;3;4;5};bg_col=-15;bg_item_spr={{174};{190};{175};{172}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
sand={tile_maps={17;18;19;20;21};bg_col=0;bg_item_spr={{15};{31};{47};{41}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
grass={tile_maps={33;34;35;36;37};bg_col=0;bg_item_spr={{8};{24};{7};{39}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
ice={tile_maps={49;50;51;52;53};bg_col=-15;bg_item_spr={{142};{158};{143};{170}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
]])

stage_config = {
    build_stage_config_item(
        dstarc("name=The green forest 2;music=13;theme=grass;wtx=-48;wty=0;fix_jumps={{2;30}}"),
        dstarc([[
p={cname=titus;msg=i heard that you can*tap twice down arrow*to focus on another spell/tell me if it works*i'm happy to be useful}
]])
    ),
    -- initial stage (2)
    build_stage_config_item(
        dstarc("name=The green forest 1;music=13;theme=grass;wtx=0;wty=0;fix_jumps={{22;30}}"),
        dstarc([[
p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
]])
    ),
    build_stage_config_item(
        dstarc("name=The green forest 3;music=13;theme=grass;wtx=48;wty=0;fix_jumps={{17;30}}"),
        dstarc([[
q = {cname=titus;msg=hi son. i'm old titus*i lived in these lands*for many years/i tried to find those*mysterious scrolls/but i'm too lazy*and old, of course/i know there some scroll near*but i can't guess where}
]])
    ),

    build_stage_config_item(
        dstarc("name=The underground;music=13;theme=sand;wtx=-48;wty=32;fix_jumps={{2;1};{11;30};{44;30}}"),
        dstarc([[

]])
    ),
    build_stage_config_item(
        dstarc("name=The intestines;music=13;theme=sand;wtx=0;wty=32;fix_jumps={{22;1};{20;30}}"),
        dstarc([[
            
]])
    ),
    build_stage_config_item(
        dstarc("name=The intestines;music=13;theme=ice;wtx=48;wty=32;fix_jumps={{18;1};{4;30}}"),
        dstarc([[
            
]])
    ),

    build_stage_config_item(
        dstarc("name=The intestines;music=13;theme=metal;wtx=-48;wty=64;fix_jumps={{10;1};{43;1}}"),
        dstarc([[

]])
    ),
    build_stage_config_item(
        dstarc("name=The intestines;music=13;theme=metal;wtx=0;wty=64;fix_jumps={{19;2}}"),
        dstarc([[

]])
    ),
    build_stage_config_item(
        dstarc("name=The forgotten;music=13;theme=metal;wtx=48;wty=64;fix_jumps={{3;1}}"),
        dstarc([[
p={cname=lea;msg=oh my beloved nephew*i'm so proud/you have done well*the scrool are again reunited/finally the search*is over/ah ah ah*ah ah ah ah/i can tell you now*i'm not your aunt*i never was/now please die*and all the scroll's power*will vanish with your death};
q={cname=titus;msg=congratulations son!*you have found all the scrolls/I see you also*defeated this evil monsters/sorry to hear you lost*your aunt in the process/though i think she*never was your aunt/anyway, you have done well/the world is safe again/you're free to explore*this world now*as you wish/thank you*thank you player!}
]])
    ),
}

-- adding to dstar other functions
dstar_add("t1", function(t) return c_timer.new(t,false) end)
dstar_add("t2", function(t) return c_timer.new(t,true) end)
dstar_add("rnd", function(max) return flr(rnd(max)) end)

-- optimization functions 
function emgr() return game.mgr.enemy_mgr end
function mmgr() return game.mgr.misc_mgr end 

