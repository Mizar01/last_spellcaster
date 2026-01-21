sfx_on = true
music_on = true

gravity = 0.25
dir_left, dir_right, dir_up, dir_down = dstaru("0;1;2;3")
el_fire, el_thunder, el_ice, el_wind = dstaru("1;2;3;4")
el_colors = dstarc("8;10;12;13")
el_cls = {c_fire, c_thunder, c_ice, c_wind} -- element class for each element type
el_dmg = dstarc([[{110;20;30};{10;15;25};{0;0;0};{0;0;0}]])
el_name = dstarc("A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=thunder+1;G=ice+1;H=wind+1;I=fire+2;J=thunder+2;K=ice+2;L=wind+2;") 
el_cost = dstarc("A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;")
npc_names = dstarc([[
lea=aunt lea
lady=lady
]])
npc_sprites = dstarc([[
lea = {192;193}
lady = {208;209}
]])
fsolid_idx = 0 -- flag index used for solid
game = nil
player = nil
sfx_jump, sfx_coin, sfx_heart, sfx_portal_send, sfx_portal_recv, sfx_player_hit = dstaru("0;1;2;3;4;5")

stage_mem, stage_changes_mem, obj_solids, player_bullets, enemy_bullets = dstaru("{};{};{};{};{}")

map_w, map_h = 48, 32
map_wpx, map_hpx = map_w * 8, map_h * 8

stage = 1
-- ovd_respawn = dstarc("43;30")
ovd_respawn=nil -- intial player spawn override in tile coords. It must be used for every stage load.

-- TEST VARS
use_sample_map = true
ovd_avail_els = dstarc("true;true;true;true")
ovd_cur_el = el_wind
sample_map = [[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
  b                                     1       X X         1                                  
                                      a 1   1 1 1 1 1 1                                        
                                        1             1                               M M N    
                                        1 1 1 1 1 1   1                               1 1 1    
                                                      1                                        
    1                                   1 1 1 1 1 1 1 1 1 1 1                         Q   R    
                                    A 1                     X 1                       1 1 1 1 1
1 1 1 1 1   p     f             6   1                       1                     1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                       1       1 1 1 1 1 1 1 1 1 1 1 1 1   1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1     g       g             1 1 1 1 1 1 1 1 1 1            
            a                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                    
              e                     1 1 1 1 1 1 1 1 1 1 1 1 1 1                                
        1 1 1 1 1 1 1                                                                 1 1 1    
1 1 1 1 1   b                                                                                  
              b         1 1 1                                                                  
                b                   1 1 1   1     1 1 1   1     1 1 1                          
                                                    b                                     1 1 1
                  b                                                     1 1 1                  
                                                                                      1 1 1    
      1 1 1 1 1 1 1 1 1 1                                                                      
      1                 1                                                       1 1 1          
1 1 1 1     1   1   1   1 1                                                                    
                          1         e   e                               1 1 1                  
      1   1   1       1   1 1 1 1 1 1 1 1 1 1 1 1                                              
                                                1         e                                    
    1       a     1 1     1     1               1 1 1 1 1 1 1 1 1 1 1 1 1                      
                                    1               b   b   b   b       1     g                
                                                                        1 1 1 1 1 1 1 1 1 1 1  
1 1         1                                                                               1 1
1 1 1     1 1 1   g                     g             b   b   b   b                            
1 1 1   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]


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
        dstarc("name=The underground;music=13;theme=grass;wtx=-20;wty=32"),
        dstarc("")
    ),
}

-- adding to dstar other functions
dstar_add("t1", function(t) return c_timer.new(t,false) end)
dstar_add("t2", function(t) return c_timer.new(t,true) end)
dstar_add("rnd", function(max) return flr(rnd(max)) end)


