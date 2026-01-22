pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
poke(24412,-1)ns=false nh=true n_="microvania/logs/log"Z=60C={}function ea(n)return C[n].super end function n(e,n)local n,e,t=n or{},unpack(split(e,":"))C[e]=n n.__index=n setmetatable(n,C[t])n.new=function(...)local t=n.__new and n.__new(e,...)or{}t.__name=e setmetatable(t,n)return t end n.super=C[t]return n end U={}function a(t,l,i)t,i=t or{},i or{}local function d(t)local n=1while n<=#t and(sub(t,n,n)==" "or sub(t,n,n)=="\n"or sub(t,n,n)=="	")do n+=1end local e=#t while e>=n and(sub(t,e,e)==" "or sub(t,e,e)=="\n"or sub(t,e,e)=="	")do e-=1end if(n>e)return""
return sub(t,n,e)end local e,n=1,#l while e<=n do while e<=n do local n=sub(l,e,e)if(n~=" "and n~="\n"and n~=";"and n~="	")break
e+=1end if(e>n)break
local f,r,o=e,0,nil while e<=n do local n=sub(l,e,e)if(n=="{")r+=1
if(n=="}")r-=1
if r==0do if(n=="="and not o)o=e
if(n==";"or n=="\n")break
end e+=1end local r,n if(o)r,n=d(sub(l,f,o-1)),d(sub(l,o+1,e-1))else n=d(sub(l,f,e-1))
local e local l=sub(n,1,1)if l=="{"and sub(n,-1)=="}"do e=a({},sub(n,2,#n-1),i)elseif l=="*"do local n=tonum(sub(n,2))e=i[n]elseif sub(n,1,3)=="_k_"do local n=sub(n,4)e=t[n]elseif sub(n,1,4)=="_fn_"do local n=split(sub(n,5),"_")e=U[n[1]](#n>=2and n[2]or nil)elseif n=="true"do e=true elseif n=="false"do e=false elseif n=="nil"do e=nil else e=tonum(n)if(e==nil)e=n
end if r and r~=""do t[r]=e elseif n~=""do add(t,e)end end return t end function I(n,e)U[n]=e end function i(e,t)local n={}a(n,e,t)return n end function e(n,e)return unpack(i(n,e))end h={new=function(n,e)local n={maxtime=flr(Z*n),t=flr(Z*n),loop=e or false}return g(n,h)end,adv=function(n)if(n.t<0)return false
n.t-=1local e=false if(n.t==0)e=true if(n.loop)n.t=n.maxtime else n.t=-1
return e end,restart=function(n)n.t=n.maxtime end,t_left=function(n)return flr(n.t/Z)end,t_left_btw=function(n,e,t)local n=n:t_left()return n>=e and n<=t end}h.__index=h function n2(t,l,n,e)n,e=n or 8,e or 8local t,l=flr(t/n),flr(l/e)return{tile=mget(t,l),tx=t,ty=l,ox=t*n,oy=l*e}end function nb(n,e,t,l,o,i,r,d)rectfill(n-1,e-1,n+t+1,e+l+1,r)local t=mid(0,flr(o/i*t),t)rectfill(n,e,n+t,e+l,d)end function G(n)if(not nh)return
printh(n,n_ or"mainlog")end function l(n,e,t,l)?n,e-#n*2,t,l
end function Y(n,e,t,l,o)rectfill(n-t/2,e-l/2,n+t/2,e+l/2,o)end function R(e,n)return n[flr(time()/e)%#n+1]end function n5(e,n)return sub(e,n,n)end function V(t,e,l)local n={}for e=0,e-1do n[e]={}for t=0,t-1do n[e][t]=l end end return n end function F(n,e,t)local n=n+t*(e-n)return n end function B(e,t,n,l,o)local n=n.t/n.maxtime if(l)n=1-n
return F(e,e+(o==f and-1or 1)*t,n)end function N(n,e)if(n==nil or n=="")return false
for t=1,#n do if(n5(n,t)==e)return true
end return false end function n4(n,e)n.__index=n return g(n,e)end function np(n)return flr(time()/n)%2==0end function g(n,e)return setmetatable(n,e)end nm={[[1P0!b!021!0#X"0$1!0E1!0!1&0H1!0&1!0H1&0!1!0O1!061!011+0D1!0*X!1!0+1*0!p!0"f!0(1!0+1!0*190+1!0#1-0!140"g!0#g!0&1*0,a!0*1501e!0*1.041'0@1#0"1%0!b!0Pb!0$1#0Ib!0)1#0!1!0"1#0!1!0"1#0Gb!021#0)b!0:1#0T1#0%1*0F1!0(1!0;1#0%1$0"1!0!1!0!1!0!1"0O1!0$e!0!e!0/1#0,1!0!1!0!1!0#1!0!1,0O1!0$e!041!0#a!0"1"0"1!0"1!0'1-0=1!0'b!0!b!0!b!0!b!0#1!0"g!0L1+0!1"0$1!0G1%0"1#0!g!0*g!0&b!0!b!0!b!0!b!0.1#0!1L]],[[1P04X!0+Y!0#1,0>1$0#1+0*1"0!a!0"1$0!1!a!0!1#0!a!0)1*0F1*0F1*0$f!0#1=0!1L0$1*03b!0&Z!1'0!1-0=1%0$1*0&1!0"X#0$X"0,1$0$1*0&1!0!1%0"1$0!1"0%a!0#1#0!1"0!1*0&1!091"0$1*0&1!001"0'1!0#1,0&1#0"a!Z!b!021!0%1*0(1"0.b!0!1"0!a!0#1"a!0"1*0)1!071!0$110"1!031%0#1+0)1!0-1"0!1"0$1!0%1*0)1"0-b!0'1#0!a!0!1*0*1!0)1"0*1!0%1*0*1"051!0"1,0+1!0&1"0-1!0$1*0+1#0,e!0%X!1!0$1*0-1!0"13X"0!1*0-1"0'1#0"1#0#1$0!1*0.1"0'1#0"1!0%1"0"1*0C1!0!1+0/1$001!0"180!1%0&1"0'1"0!1*031"0)g!0'1Z]],[[1R02b!0%b!0.1$Z"1"0*g!0%g!0%b!011$Z!0!1"0!1"0!1:0*1$0#1!0"a!0!1=0'1$0#1!0"1"0!1%0"1)0+1!0'1$0#1!0" !0#1#071#0%1$0#1!0!1"0$1!0:1!0%h$0#1!a!0<1&0%1(0"1"0&1%0!1!0!1$0+b!1%C!1(0! !0'1#0$1!0#1#001)0!1"0%1"0&1"0!1!0"1"0)a!0%1"0!a!0$1!0'1"0$Q!0#M!0!1!0#1"0-Z!h"0&1)0$1(0$110&1!0%1#0,X"0"1"A!0(b!0%g!0"1$0%1#6!0!1"0!1"0"1"0!1"0"1%0%b!0"1(0"1#0!1!0#1"0$b!0$b!0$1"0(b!0"1"0)1!0#1"0#1"0$b!1"b!0$1#0!1+0*1!0"1!0&1#0(1#0$1!0&1!0'1"0#1!0"1!0'Z!1$0"1$0$1!0!1!0&1!0,1!0!1.0"1#0'1!0"1"0"1!0,1!0(1(0!1#0'1"0"1!0"1!0(g"0"1"0)1$0$1"0$1"0"1!0"1!0(1(0+1$B!0!1#0%1!0%1!0'1"0&1#0)1,0"1/0'1!0,1'0"h"0"h"0#1#0#b!0*1$0"1$0!1(0#1&0#1!0&b!0)1!0(b!0%1#05b!0(1"0!1#0*1"06b!0'1#0-b!0/1!0.1%0)X"0"g!0!e!0#X"0%1#0+f!0!1R]],[[170!190$1!0C1!0%1"0$1!0C1!0%1%0!1!0/1%0/1!0!1&0N1"0#1"0,1"0'1"0-1"0#1"0N1"0/100/1.061908170"1"021"0"1,0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1"0N1,0;1,0!1!0!1!0!1!0!1!0!1!091!0!1!0!1!0!1!0!1!0!1"0!1!0!1!0!1!0!1!0!1!0!1!071!0!1!0!1!0!1!0!1!0!1$0!1!0!1!0!1!0!1!0!1!0!1!051!0!1!0!1!0!1!0!1!0!1!0!1"0!1!0!1!0!1!0!1!0!1!0!1!0!150!1!0!1!0!1!0!1!0!1!0!1R]]}d=n("c_obj",{__new=function(l,n,e,t)local n=i([[parent_mgr=*3
hitbox={x=0;y=0;x2=7;y2=7}
speed=0.4
destroyed=false
phase=idle
x=*1
y=*2
spawn_x=*1
spawn_y=*2
bounce_map=true
]],{n or 0,e or 0,t or nil})n.spr=i[[idle = { sprites = { 64; 65 }; fps = 2;  loop = true }
flip_x = false
flip_y = false
time_start = 0	
effect = none
last_frame = 0
rot_speed = 1
offview = false
]]if(n.parent_mgr)n.parent_mgr:add(n)
return n end,update=function(n)end,draw=function(n)n:draw_sprite()end,respawn=function(n,e,t)n.x,n.y,n.spawn_x,n.spawn_y=e,t,e,t end,del=function(n)n.destroyed=true if(n.parent_mgr)n.parent_mgr:del(n)
end,draw_sprite=function(t)if(y:offview(t))return
if(ns)local n=t:hitbox_pos(0,0)rect(n.x,n.y,n.x2,n.y2,8)
local n=t.spr if(n.effect=="blink_white")if(time()%.2<.1)for n=0,15do pal(n,7)end
local e,l=n[t.phase],nil if e.ss~=nil do l=e.ss else if e.loop~=nil and e.loop==false and e.sprites[#e.sprites]==n.last_frame do l=n.last_frame else if(n.time_start==nil or n.time_start==0)n.time_start=time()
l=e.sprites[1+flr((time()-n.time_start)/(1/e.fps))%#e.sprites]end end spr(l,t.x,t.y,1,1,n.flip_x or false,n.flip_y or false,7)pal()n.last_frame=l end,collide=function(n,e,t,l)local n,e=n:hitbox_pos(0,0),e:hitbox_pos(0,0)if(t~=nil)n.x+=t n.x2-=t n.y+=l n.y2-=l
return not(n.x2<e.x or n.x>e.x2 or n.y2<e.y or n.y>e.y2)end,hitbox_pos=function(n,e,t)e,t=e or 0,t or 0return{x=n.x+e+n.hitbox.x,y=n.y+t+n.hitbox.y,x2=n.x+e+n.hitbox.x2,y2=n.y+t+n.hitbox.y2}end,out_of_map=function(n)return n.x<0or n.y<0or n.x>W or n.y>nn end})Q=n("c_mgr",{__new=function(n)local n=i"objs={}"return n end,restart=function(n)n.objs={}end,add=function(n,e)add(n.objs,e)end,del=function(n,e)del(n.objs,e)end,update=function(n)for n in all(n.objs)do n:update()end end,draw=function(n)for n in all(n.objs)do n:draw()end end})function o(t,e,n)local l,n=n or t.speed,n or t.speed local l,o=e==f and-l or(e==u and l or 0),e==A and-n or(e==P and n or 0)local n=t:hitbox_pos(l,o)if(t.bounce_map and(n.x<0or n.y<0or n.x2>W or n.y2>nn))return 0
if e==u or e==f do local e=e==f and n.x or n.x2 local o,n=X(e,n.y),X(e,n.y2)if(not o and not n)t.x=t.x+l return 1else return 0
elseif e==A or e==P do local e=e==A and n.y or n.y2 local l,n=X(n.x,e),X(n.x2,e)if(not l and not n)t.y=t.y+o return 1else return 0
end end function n3(n)return n==nil or n.destroyed end function n1(n)if(n~=nil and not n.destroyed)n:del()
end function J(n,e,t,l)local n=n2(n,e,t,l)return fget(n.tile,ng)end function n6(e,t)for l in all(s)do local n=l:hitbox_pos(0,0)if(e>=n.x and e<n.x2 and t>=n.y and t<n.y2)return l
end return nil end function X(n,e,t,l)return J(n,e,t,l)or n6(n,e)~=nil end function H(n,e)K[b][flr(n.spawn_x/8)][flr(n.spawn_y/8)]=tostr(e)end function v()return O[b]end function D(n,e)n.theme=n8[n.theme]n.npcdata=e return n end function n7(n,e)local e={[ny]=2,[nx]=1,[nw]=2,[nX]=5,[n9]=4,[nk]=1,[nN]=3,[nv]=1,[nj]=1,[nL]=5,[nZ]=4,[nC]=1,[nG]=1,[nF]=1,[nA]=3,[nP]=1}return e[n]end function nH(t,i,o)local n,l=0,0for e=1,#t,2do local r,e=sub(t,e,e),sub(t,e+1,e+1)local e=ord(e)-32for e=1,e do o[n][l]=r n=n+1if(n>=i)n,l=0,l+1
end end return o end function ne()local n,f=nm[b],v()local a,l,e=f.theme,nil,nil if q[b]==nil do l,e=V(m,p,""),V(m,p,"")if nO and b==1do for e=1,m do for t=1,p do local n=(e-1)*p*2+(t-1)*2+1local n=sub(nD,n,n)if(n==" ")n="0"
l[t-1][e-1]=n end end else nH(n,p,l)end else l,e=q[b],K[b]end local c,d,u,s,h=r.mgr.enemy_mgr,r.mgr.misc_mgr,{},i"M={};N={};O={};P={}",false for o=0,m-1do for i=0,p-1do local n,r=l[i][o],e[i][o]mset(i,o,0)local e,t=i*8,o*8if n=="1"do local n=nT(l,i,o)local n=a.tile_maps[n7(n,a)]or 1mset(i,o,n)elseif n=="f"do if(x~=nil)_:respawn(x[1]*8,x[2]*8)else _:respawn(e,t)
if(n0~=nil and b==1)_.avail_el=n0
if(nt~=nil and b==1)_.cur_el=nt
h=true elseif n=="a"or n=="b"do nM.new(e,t,n=="a",c)elseif n=="6"do nE.new(e,t,d)elseif n=="8"do elseif n=="e"do T.new(e,t,"dog")elseif n=="g"do T.new(e,t,"spider")elseif n=="h"do if(r=="")nI.new(e,t,c)
elseif N("XYZ",n)do if(r=="")nl.new(e,t,n=="X"and 1or n=="Y"and 3or 5,true)
elseif N("pqrstuvwxyz",n)do local n=f.npcdata[n]or{cname="c_npc_stage"..b,msg="undefined msg"}nY.new(e,t,n.cname,n.msg)elseif N("ABCDEFGHIJKL",n)do if(r=="")nR.new(e,t,n)
elseif N("MNOP",n)do local e=nB.new(e,t,d)if(r=="1")e:open()
add(s[n],e)elseif N("QRST",n)do local e=nQ.new(e,t,d)if(r=="1")e.on=true
G("Door is initially "..tostr(e.on).." at "..i..","..o)u[n]=e end end end if(b>1and not h)_:respawn(x[1]*8,x[2]*8)
for n,t in pairs(u)do local e=sub(sub("MNOP",ord(n)-ord"Q"+1),1,1)G("Linking switch "..n.." to door of type "..e)for n in all(s[e])do t:link_switch(n)end end q[b]=l K[b]=e end function nT(t,n,e)local l,o,i,e,n=e>0and t[n][e-1]=="1"or e==0,e<m and t[n][e+1]=="1"or e==m-1,n>0and t[n-1][e]=="1"or n==0,n<p-1and t[n+1][e]=="1"or n==p-1,0if(l)n+=1
if(o)n+=2
if(i)n+=4
if(e)n+=8
return n end y={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,offvtol=90,update=function(n)n.x+=(_.x-n.x)*n.csfx n.y+=(_.y-n.y)*n.csfy n.x=mid(n.ox,n.x,p*8-n.ox-16)n.y=mid(n.oy,n.y,m*8-40)local n,e=n:calc_center()camera(n,e)end,place=function(n,e,t)n.x=e n.y=t end,calc_center=function(n)return flr(n.x)-n.ox,flr(n.y)-n.oy end,offview=function(n,e)return abs(flr(n.x-e.x))>n.offvtol or abs(flr(n.y-e.y))>n.offvtol end}z={new=function(n,e)local n=d.new(n,e)a(n.spr,[[			idle = { sprites = { 64; 65 }; fps = 2 }
			walk = { sprites = { 80; 81; 82 }; fps = 6 }
			jump = { sprites = { 97; 98; 99; 100; 101; 102 }; fps = 8 }
			dead = { sprites = { 68; 69; 70; 71; 72 }; fps = 4; loop = false }
		]])a(n,[[			name=player
			p.prev_btn = {}
			invisible=false
			blocked=false
			invulnerable=false
			nodmg_t=nil
			jforce=1.7
			jstack=0
			max_jstack=15
			speed_y_decay=0.95
			speedy=0
			max_speedy=2
			phase=idle
			max_speed=1
			speed=0
			init_speed=0.1
			inc_speed_factor=0.2
			life=20
			max_life=20
			init_max_life=20
			coins=0
			stinky_socks=false
			cur_el=nil
			avail_el = {false;false;false;false}
			lev_el = {1;1;1;1}
			el_cooldown = _fn_t1_1
			shine_star=0
			interaction_fn=nil
			hitbox = { x = 2; y = 3; x2 = 5; y2 = 7 }
			t_respawn=nil
			shards = 100
			bounce_map=false
		]])return g(n,z)end,reset_stage_props=function(n)n:reset_jump_vars()end,update=function(t)if(r.paused)return
local n,e=t,{left=btn(0),right=btn(1),jump=btn(4),jump_start=btnp(4),action=btnp(5)}if n.phase=="dead"do if(n.prev_btn.left)o(n,f)
if(n.prev_btn.right)o(n,u)
n.speed=n.speed*.9n:apply_forces(e)if(n.t_respawn:adv())n:respawn(n.spawn_x,n.spawn_y)n.life=n.max_life n.phase="idle"n.invulnerable=false
return end if not n.blocked do if(e.left)n:move_left()
if(e.right)n:move_right()
if(not e.left and not e.right)n.speed=n.speed*.7if(n.speed<.1)n.speed=0
n:apply_forces(e)end n.prev_btn=e if(e.left==false and e.right==false and n:on_ground())n.phase="idle"
if(n.nodmg_t~=nil)if(n.nodmg_t:adv())n.spr.effect="none"n.invulnerable=false
if(e.action)if(t.interaction_fn~=nil)t.interaction_fn=nil else t:attack()
if(t.el_cooldown:adv())t.shine_star=10
t.interaction_fn=nil end,draw=function(n)local e=n if(e.invisible)return
e:draw_sprite()if(n.shine_star>0)line(n.x+3,n.y-1,n.x+5,n.y-1,10)line(n.x+4,n.y-2,n.x+4,n.y,10)n.shine_star-=1
end,dmg=function(n,e)local n=n if(not n.invulnerable)n.life-=e if(n.life<=0)n.phase="dead"n.invulnerable=true n.t_respawn=h.new(5)else n.nodmg_t=h.new(1)n.spr.effect="blink_white"sfx(nJ)n.invulnerable=true
end,increase_life=function(n,e)local n=n n.life=min(n.life+e,n.max_life)end,inc_speed=function(n,e)local n=n if(e)n.speed=n.init_speed else n.speed=min(n.speed+n.inc_speed_factor,n.max_speed)
end,move_left=function(e)local n=e e:inc_speed(not(n.prev_btn.left or false))o(n,f)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=true end,move_right=function(e)local n=e e:inc_speed(not(n.prev_btn.right or false))o(n,u)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=false end,apply_forces=function(n,e)if(not n.blocked and e.jump_start)n:set_start_jump()
if(not e.jump and n.jstack>0)n.jstack=0
if(n.jstack>0)n.speedy=-n.jforce n.jstack-=1
if(n.speedy<0and not e.jump)n.speedy*=n.speed_y_decay
n.speedy+=nK n.speedy=min(n.speedy,n.max_speedy)local e=o(n,n.speedy<0and A or P,abs(n.speedy))if(e==0)n:reset_jump_vars()if(n.phase=="jump")n.phase="idle"
end,reset_jump_vars=function(n)n.speedy=0n.jstack=0end,set_start_jump=function(n)if(n.phase=="dead")return
if(n:on_ground())n:reset_jump_vars()n.phase="jump"n.spr.time_start=nil n.jstack=n.max_jstack if(nq)sfx(nz)
end,on_ground=function(n)local n=n local n=n:hitbox_pos(0,1)local e,n=X(n.x,n.y2),X(n.x2,n.y2)return e or n end,apply_end_stage_upgrades=function(n)end,attack=function(n)if(n.cur_el==nil)return
if(n.el_cooldown.t<=0)no[n.cur_el].new(n.spr.flip_x and f or u,r.mgr.misc_mgr)n.el_cooldown:restart()
end,switch_element=function(e)if(e.cur_el==nil)return
local n=e.cur_el%4+1while true do if(e.avail_el[n])e.cur_el=n j.new(30,no[n].name)break
n=n%4+1end end}n4(z,d)L=n("c_enemy:c_obj",{__new=function(i,e,n,t,l,o)local n=d.new(n,t,o)a(n,[[respawn_timer = _fn_t1_10
dmg_time = _fn_t1_1
frozen_t = _fn_t1_20
time_last_death = 0
life = 100
dir = nil
wspeed = 0
dir_before_blow = nil
fixed = false
hitbox = { x=2;y=2;x2=5;y2=5} 
hitbox_orig = {x=2;y=2;x2=5;y2=5}
speed = *1
etype = *2
        ]],{l or 1,e})n.frozen_t.t=0return n end,dmg=function(n,e)if(n:is_inv())return
n.life-=e n.dmg_time:restart()n.spr.effect="blink_white"if(n.life<=0)for e=1,3do local e,n=n.x+rnd(6),n.y+rnd(6)nl.new(e,n)end n:del()
end,freeze=function(n)n.frozen_t:restart()add(s,n)n.hitbox={x=0,y=0,x2=7,y2=7}end,unfreeze=function(n)n.frozen_t.t=-1n.spr.effect="none"del(s,n)n.hitbox=n.hitbox_orig end,blow=function(n,e)if(n.fixed)return
if(n.wspeed<=0)n.dir_before_blow=n.dir
n.wspeed=2n.dir=e end,unblow=function(n)n.wspeed=-1n.dir=n.dir_before_blow end,update=function(n)d.update(n)for e in all(M)do if(n:collide(e))e:hit(n)
end if(n.dmg_time:adv())n.spr.effect="none"
if(n.frozen_t:adv())n:unfreeze()else if(n.frozen_t:t_left_btw(.1,2))n.spr.effect="blink_white"
if(n.wspeed>0)local e=o(n,n.dir,n.wspeed)n.wspeed=e==0and 0or max(0,n.wspeed-.05)else if(n.wspeed~=-1)n:unblow()
end,draw=function(n)if(n.frozen_t.t>0)spr(139,n.x,n.y)
d.draw(n)end,del=function(n)n.time_last_death=time()del(s,n)d.del(n)end,is_inv=function(n)return false end})nM=n("c_bat:c_enemy",{__new=function(o,n,t,e,l)local n=L.new("bat",n,t,.3,l)a(n.spr,"idle = { sprites = {128;129}; fps = 4; loop = true }")a(n,[[hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
horizontal = *1
dir = *2
dir_before_blow = _k_dir
        ]],{e,e and u or P})return n end,update=function(n)L.update(n)if(n:collide(_))_:dmg(1)
if(n.frozen_t.t>0)return
local e=o(n,n.dir)if(e==0)n.dir=(n.horizontal and 0or 2)+(n.dir+1)%2
end})T=n("c_walk_en:c_enemy",{spmap=i[[dog = {idle = {144;145}; run = {146;147}}
spider = {idle = {160;161}; run = {162;163}}
    ]],__new=function(n,t,l,e)local n=L.new(e,t,l,1.5,r.mgr.enemy_mgr)n.spr.idle={sprites=T.spmap[e].idle,fps=2,loop=true}n.spr.run={sprites=T.spmap[e].run,fps=4,loop=true}a(n,[[speed = 0.2
hitbox = {x=0;y=3;x2=7;y2=7}
hitbox_orig = {x=0;y=3;x2=7;y2=7}
basex = *1
basey = *2
        ]],{t,l})return n end,update=function(n)L.update(n)n.phase="idle"if(n.frozen_t.t>0)return
if n:collide(_,2,2)do _:dmg(2)else if abs(_.x-n.x)<50and abs(_.y-n.y)<4do n.spr.flip_x=_.x-n.x>0local e=_.x-n.x>0and u or f local t,l=e==u and n.x+n.speed+7or n.x-n.speed,n.y+8if(J(t,l))if(not J(t,n.y))o(n,e)n.phase="run"
else if(abs(n.basex-n.x)>3)n.spr.flip_x=n.basex-n.x>0o(n,n.basex-n.x>0and u or f)n.phase="run"
end end end})nI=n("c_vine:c_enemy",{__new=function(l,n,e,t)local n=L.new("vine",n,e,0,t)n.spr.idle=i"ss = 6"a(n,[[fixed = true
life = 10
hitbox = { x=0;y=0;x2=7;y2=7}
        ]])add(s,n)return n end,is_inv=function(n)return not(_.cur_el==ni)end})nS=n("c_explosion:c_obj",{__new=function(o,n,e,t,l)local n=d.new(n,e,l)a(n,[[            ttl = _fn_t1_0.2
            solid = false
            max_radius = *1
        ]],{t or 4})n.spr.idle=i"sprites = { 185; 186; 187 }, fps = 4"return n end,update=function(n)if(n.ttl:adv())n.parent_mgr:del(n)
end,draw=function(n)if(n.ttl.t<=0)return
local e=F(0,n.max_radius,1-n.ttl.t/n.ttl.maxtime)circfill(n.x,n.y,e,10)end})w=n("c_element:c_obj",{__new=function(n,o,e)local t,l=_.x+(e==f and-2or 10),_.y+4local n=d.new(t,l,r.mgr.misc_mgr)a(n,[[            ttl = _fn_t1_0.3
            max_dist = 20
            destroy_req_prev_frame = false
            origx = *1
            origy = *2
            dir = *3
            el = *4
        ]],{t,l,e,o})add(M,n)return n end,update=function(n)if(n.destroy_req_prev_frame)n:del()return
if(n.ttl:adv())n.destroy_req_prev_frame=true
n.x=B(n.origx,n.max_dist,n.ttl,true,n.dir)end,dirmult=function(n)return n.dir==f and-1or 1end,hit=function(n,e)nS.new(n.x,n.y,4,r.mgr.misc_mgr)n:effect(e)n:del()end,effect=function(n,e)e:dmg(nU[n.el][_.lev_el[n.el]])end,del=function(n)del(M,n)d.del(n)end})nV=n("c_fire:c_element",{name="fire",__new=function(e,n,t)local n=w.new(ni,n)n.radius=1n.max_radius=2return n end,update=function(n)w.update(n)if(n.ttl.t>0)n.radius=B(1,n.max_radius,n.ttl,true)
end,draw=function(n)local t,l={1,2,9,8},n:dirmult()for e=0,2do local o,l=e/3*n.radius,l*e*2circfill(n.x+l,n.y,1.5*o,t[e+1])end end,effect=function(e,n)n:unfreeze()w.effect(e,n)end})nW=n("c_ice:c_element",{name="ice",__new=function(e,n,t)local n=w.new(en,n)n.radius=1n.max_radius=1.5return n end,update=function(n)w.update(n)if(n.ttl.t>0)n.radius=B(1,n.max_radius,n.ttl,true)
end,draw=function(n)local t,e={12,6},n:dirmult()rectfill(n.x+e*0-n.radius,n.y-n.radius,n.x+e*0+n.radius,n.y+n.radius,rnd(t))end,effect=function(e,n)n:freeze()end})e1=n("c_thunder:c_element",{name="thunder",__new=function(e,n,t)local n=w.new(nr,n)n.spr.idle=i"ss = 59"a(n,[[            ttl = _fn_t1_0.2
            max_dist = 25
        ]])return n end,draw=function(n)local e,t,l=n.origx,n.origy,n:dirmult()while true do local o,i=e+4*l,t+(rnd(4)-2)line(e,t,o,i,7)e,t=o,i if(l==1and e>n.x+1)break
if(l==-1and e<n.x-1)break
end end})ee=n("c_wind:c_element",{name="wind",__new=function(e,n,t)local n=w.new(nd,n)n.spr.idle=i"ss = 60"a(n,[[            ttl = _fn_t1_0.7
            max_dist = 25
            power = 20
        ]])return n end,draw=function(n)local o,e,l=n:dirmult(),nil,nil for t=0,12do local o=.5+n.x+t*.8*o local i,r=o*.25,1+t*.25local o,n=o+cos(i)*r,n.y+sin(i)*r if(e~=nil)local t=t%2==0and 12or 6line(e,l,o,n,t)
e,l=o,n end end,effect=function(n,e)e:blow(n.dir)end})c=n("c_int:c_obj",{__new=function(l,n,e,t)local n=d.new(n,e,t)a(n,[[            show_int_button = false
            ttl_disable_int = nil
            int_done = false
            solid = true
            hover_info = nil
            hover_info_obj = nil
        ]])return n end,update=function(n)if n:collide(_)do n.show_int_button=true if(n.hover_info~=nil and n3(n.hover_info_obj))n.hover_info_obj=S.new(100,nil,n.hover_info)n.hover_info_obj.ttl.t=Z*20
_.interaction_fn=n.interact local e=n.ttl_disable_int if btnp(5,0)and not n.int_done do n:interact()elseif n.int_done and e==nil do n.ttl_disable_int=h.new(.5,false)elseif e and e:adv()do n.int_done=false n.ttl_disable_int=nil end else n.show_int_button=false n1(n.hover_info_obj)end end,draw=function(n)n:draw_sprite()if(n.show_int_button)?"❎",n.x+2,n.y-6,12
end,interact=function(n)n.int_done=true end,del=function(n)n1(n.hover_info_obj)d.del(n)end})nE=n("c_focuslith:c_int",{__new=function(l,n,e,t)local n=c.new(n,e,t)n.spr.idle={ss=11}return n end,interact=function(n)_:switch_element()end,draw=function(n)pal(7,np(.5)and nf[_.cur_el]or 7)c.draw(n)pal()end})nQ=n("c_switchlith:c_int",{__new=function(l,n,e,t)local n=c.new(n,e,t)n.spr.idle=i"sprites={27;28;29}; fps=10; loop=true"n.on=false n.doors={}return n end,interact=function(n)if(_.cur_el~=nr)j.new(30,"You need thunder")return
for e in all(n.doors)do if(n.on)e:close()else e:open()
end n.on=not n.on H(n,n.on and 1or 2)end,link_switch=function(n,e)add(n.doors,e)end,draw=function(n)pal(7,n.on and 11or 8)pal(10,n.on and 3or 9)c.draw(n)pal()end})nB=n("c_door:c_obj",{__new=function(t,n,e)local n=c.new(n,e,r.mgr.misc_mgr)n.spr.open=i"sprites={43,44;45;46}; fps=5; loop=false"n.spr.close=i"sprites={46;45;44;43}; fps=5; loop=false"a(n,[[phase = close
hitbox = {x=0;y=0;x2=7;y2=7}
]])add(s,n)return n end,open=function(n)n.phase="open"del(s,n)H(n,1)end,close=function(n)n.phase="close"add(s,n)H(n,2)end})nR=n("c_scroll:c_int",{__new=function(l,n,t,e)local n=c.new(n,t,r.mgr.misc_mgr)n=a(n,[[            el = *1
            int_fn = *2
            cost = *3
            name = *4
        ]],{ord(e)-ord"A"+1,nil,e0[e],et[e]})n.hover_info="learn "..n.name.." ("..tostr(n.cost).." shards)*"..tostr(el[e])n.spr.idle={ss=12}return n end,update=function(n)c.update(n)n.y=n.spawn_y+sin(time())*2end,interact=function(n)local e=n.name if(_.shards<n.cost)j.new(30,"("..e..") You need "..tostr(n.cost).." shards")return
if(n.int_fn~=nil)n.int_fn(n)else _.cur_el=n.el _.avail_el[n.el]=true _.shards-=n.cost
j.new(30,e.." acquired")n:del()end,draw=function(n)if(n.el)pal(7,nf[n.el])
c.draw(n)pal()end})nl=n("c_shard:c_obj",{__new=function(o,n,e,t,l)local n=d.new(n,e,r.mgr.misc_mgr)a(n,[[            speed = 0.1
            speed_inc = 1.05
            cnt = *1
            static = *2
            sbase = 1.5
            sx = _fn_rnd_15
            sy = _fn_rnd_15
        ]],{t or 1,l or false})return n end,update=function(n)local e,t=_.x-n.x,_.y-n.y local e=sqrt(e/100*e/100+t/100*t/100)*100if e<4do _.shards+=n.cnt if(n.static)H(n,"d")
n:del()elseif not n.static do local e=n.speed/e n.x=F(n.x,_.x,e)n.y=F(n.y,_.y,e)n.speed*=n.speed_inc else n.x=n.spawn_x+sin(time()*(n.sbase+n.sx/10))n.y=n.spawn_y+sin(time()*(n.sbase+n.sy/10))end end,draw=function(n)circfill(n.x+4,n.y+4,max(1,n.cnt/2),7)end})nY=n("c_npc:c_int",{__new=function(o,n,t,e,l)local n=c.new(n,t,r.mgr.misc_mgr)n.spr.idle.sprites=eo[e]or{154}n.name=ei[e]n.dialogs=split(l,"/")n.cur_diag=1n.diagcls=nil return n end,update=function(n)c.update(n)if(n.diagcls and(abs(n.x-_.x)>40or abs(n.y-_.y)>40or n.diagcls.destroyed))n.diagcls:del()n.cur_diag=1n.diagcls=nil
end,interact=function(n)n.diagcls=n.diagcls or S.new(30,n.name,"")n.diagcls:update_msg(n.dialogs[n.cur_diag])n.diagcls.cont=n.cur_diag<#n.dialogs n.diagcls.ttl:restart()n.cur_diag=min(n.cur_diag+1,#n.dialogs)end})er=n("c_misc_mgr:c_mgr",{__new=function(n)local n=Q.new()return n end})k=n("c_hud_element:c_obj",{__new=function(l,e,t,n)local n=d.new(e,t,n)n.fixedx,n.fixedy=e,t return g(n,k)end,update=function(n)local e,t=y:calc_center()n.x=n.fixedx+e n.y=n.fixedy+t end})na=n("c_val_printer:c_hud_element",{__new=function(o,n,e,t,l)local n=k.new(n,e)n.draw_fn=l n.bgl=t n.spr.idle={ss=137}return g(n,na)end,draw=function(n)rectfill(n.x,n.y,n.x+n.bgl,n.y+6,1)n:draw_fn()end})nc=n("c_player_life_bar:c_hud_element",{__new=function(t,n,e)local n=k.new(n,e)n.spr.idle={ss=169}n.life_ref=_.init_max_life return g(n,nc)end,draw=function(n)local e=30*_.max_life/n.life_ref rectfill(n.x,n.y+1,n.x+e+10,n.y+6,1)n:draw_sprite()nb(n.x+10,n.y+2,e,3,_.life,_.max_life,1,8)end})j=n("c_slide_text:c_hud_element",{__new=function(t,n,e)local n=k.new(0,n,r.mgr.hud_mgr)n.msg=e n.final_pos=122-#e*4n.fixedx=n.final_pos+250a(n,[[            ttl = _fn_t1_2
        ]])k.update(n)return n end,update=function(n)if(n.ttl:adv())n:del()return
local e=abs(n.fixedx-n.final_pos)n.fixedx=e<2and n.final_pos or n.fixedx-e*.1k.update(n)end,draw=function(n)rectfill(n.x-2,n.y-2,n.x+126,n.y+7,1)rect(n.x-2,n.y-2,n.x+126,n.y+7,14)?n.msg,n.x,n.y,8
end})S=n("c_dialog:c_slide_text",{__new=function(l,n,t,e)local n=j.new(n,e)a(n,[[            final_pos = 10
            fixedx = 260
            ttl = _fn_t1_6
            cont = false
            author = *1
            msgs = nil
        ]],{t})S.update_msg(n,e)return n end,update_msg=function(n,e)n.msg=e n.msgs=split((n.author~=nil and n.author..":*"or"")..e,"*")end,draw=function(n)local e=#n.msgs rectfill(n.x-10,n.y-10,n.x+124,n.y+e*7+10,1)rect(n.x-2,n.y-2,n.x+124,n.y+e*7,14)for e=1,#n.msgs do?n.msgs[e],n.x,n.y+(e-1)*7,8
end if(n.cont)?"❎>>",n.x+100,n.y+e*7+2,8
end})nu=n("c_hud_mgr:c_mgr",{__new=function(n)local n=Q.new()n.update_in_pause=true return g(n,nu)end,restart=function(n)n.objs={na.new(94,1,25,function(n)circfill(n.x+4,n.y+3,2,7)?tostr(_.shards),n.x+10,n.y+1,8
end),nc.new(10,0)}end})nq=true ed=true nK=.25f,u,A,P=e"0;1;2;3"ni,nr,en,nd=e"1;2;3;4"nf=i"8;10;12;13"no={nV,e1,nW,ee}nU=i[[{110;20;30};{10;15;25};{0;0;0};{0;0;0}]]et=i"A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=XXXXXXXX;G=lifereg;H=lifereg+1;I=thunder+2;J=fire+3;K=lifereg+2;L=fire+4;"el=i[[A=burning hearts, forever
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
]]e0=i"A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;"ei=i[[lea=aunt lea
lady=lady
]]eo=i[[lea = {192;193}
lady = {208;209}
]]ng=0r=nil _=nil nz,ec,eu,es,eh,nJ=e"0;1;2;3;4;5"q,K,s,M,ef=e"{};{};{};{};{}"p,m=48,32W,nn=p*8,m*8b=1x=nil nO=true n0=i"true;true;true;true"nt=nd nD=[[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
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
]]ny,nx,nw,nX,n9,nk,nv,nj,nL,nZ,nN,nC,nG,nF,nA,nP=e"0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15"n8=i[[metal = {
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
]]O={D(i"name=The green forest 1;music=13;theme=grass;wtx=0;wty=0",i[[p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
u = {cname=lady;msg=welcome to the forest*be careful out there!}
]]),D(i"name=The green forest 2;music=13;theme=grass;wtx=48;wty=0",i""),D(i"name=The green forest 3;music=13;theme=grass;wtx=-48;wty=0",i""),D(i"name=The underground;music=13;theme=grass;wtx=-20;wty=32",i"")}I("t1",function(n)return h.new(n,false)end)I("t2",function(n)return h.new(n,true)end)I("rnd",function(n)return flr(rnd(n))end)function _init()G"\n\n\n\n----------- Game started -----------"r=E.new()end function _update60()r:update()end function _draw()r:draw()end E={new=function()local n={paused=false,win_stage=false,win_game=false,menu=true,play=false,stage_title_phase=false,require_player_rebuild=true,mgr={enemy_mgr=Q.new(),misc_mgr=er.new(),hud_mgr=nu.new()}}n.game_over_msgs={}n.game_over_msg=""menuitem(1,"restart game",function()r:start_menu()end)return g(n,E)end,start_play=function(n)n.win_stage=false n.menu=false n.play=true if(n.require_player_rebuild)_=z.new(0,0)n.require_player_rebuild=false
n.game_over=false _:reset_stage_props()for e,n in pairs(n.mgr)do if(n.restart)n:restart()
end ne()y:place(_.x,_.y)if(ed)music(v().music)
end,setup_win_lose_stage=function(n)if _.gems==v().gems do n.win_stage=true n.win_game=b==#O if(n.win_game)music(11)
_:apply_end_stage_upgrades()else n.game_over_msg="you didn't collect all gems!"n:set_game_over()end end,start_menu=function(n)n.menu=true n.play=false n.game_over=false n.win_stage=false n.win_game=false b=1end,set_game_over=function(n)n.play=false n.win_stage=false n.game_over=true end,stage_check=function(o)local l,n=flr(_.x/8),flr(_.y/8)if l<0or l>=p-1and _.x>p*8-4or n<=0and _.y<3or n>=m-1do local e=v()local e,t=l+e.wtx or 0,n+e.wty or 0if n<=0do t-=2e+=1elseif n>=m-1do t+=2end if(l>=p-1)e+=1
local n=nil for l=1,#O do n=O[l]if(e>=n.wtx and e<n.wtx+p and t>=n.wty and t<n.wty+m)b=l break
end _:reset_stage_props()for e,n in pairs(o.mgr)do if(n.restart)n:restart()
end s={}M={}ef={}local n,e=e-n.wtx,t-n.wty x=i(""..n..";"..e.."")G("stage changed to "..b.." with ovd_respawn "..x[1]..","..x[2].."")ne()y:place(_.x,_.y)end end,update=function(n)if n.menu do if(btnp(5,0))n.require_player_rebuild=true n:start_play()
return end n:stage_check()y:update()for e,n in pairs(n.mgr)do if(n.update)n:update()
end _:update()end,draw=function(n)if(n.menu)cls(8)rectfill(0,40,127,80,0)local n=t()line(134-flr(n/.05%130),62,140-flr(n/.05%130),62,9)line(140-flr(n/.03%130),60,145-flr(n/.03%130),60,9)line(130-flr(n/.02%130),64,135-flr(n/.02%130),64,9)spr(80+flr(n/.1%3),60,58)line(0,40,127,40,7)line(0,80,127,80,7)l("* new title here! *",64,50,7)l("press (❎) to start",64,70,R(1,{7,0}))return
cls(v().theme.bg_col)map(0,0,0,0,128,32,false)n.mgr.misc_mgr:draw()n.mgr.enemy_mgr:draw()_:draw()n.mgr.hud_mgr:draw()if(_.phase=="dead")local n,e=y:calc_center()l("you died!",64+n,55+e,8)l("respawning in ".._.t_respawn:t_left(),64+n,65+e,7)return
?""..tostr(flr(_.x/8))..","..tostr(flr(_.y/8)),y.x-50,y.y-60,7
if n.win_game do Y(64,64,120,55,1)l("congratulations!",64,55,10)l("you survived!",64,65,10)l("press (❎) to restart",64,75,R(1,{10,0}))elseif n.win_stage and not n.game_over do Y(64,64,107,25,1)l("stage cleared!",64,55,10)l("press (❎) for the shop",64,65,10)elseif n.game_over do Y(64,64,120,55,1)l("game over",64,55,8)l(n.game_over_msg,64,65,8)l("press (❎) to restart",64,75,R(1,{8,0}))end end}E.__index=E
__gfx__
00000000dddddddd6ffffff6ffffffffffffffffffffffff30030003000000000000000000000000000000000006d00007777770000000000000000000000000
00000000d7ddd66df5dddd5fddddddddfddddddddddddddf06003033000000000000000000000000000000000006660077666670000000000000000000000000
00700700dddddd6ddddddddddddddddddddddddddddddddd03006030000000000000000000000000000000000066d60079999970000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd03303063000000000000000000000000000000000d67766076666670000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd0b333b03000000000000000000000000000000000677776007999977000000000000000000000000
00700700d7ddddddd7ddddddddddddddddddddddddddddddb63b3bb3000000000000000000000000000000000677776d07666667000000000000000000000000
00000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d33bbb3b60000000000000000000000000000000066677d6607999977000000000000000000000000
00000000dddddddddddddddddddddddddddddddddddddddd33333333000000000000000000000000000000006d66666d07777770000000000000000000000000
00000000999999990ffffff0f00ff00f0ff000ffff000ff000000000000000000000000000000000000000000666666006666660066666600000000000000000
0000000099999999ffffffffffffffffffffffffffffffff000000000000000000000000000000000000000066aaa7666677aa6666aa77660000000000000000
000000009999a999f999a99f9ff99ff9f99fff9999fff99f000000000000000000000000000000000000000067aaa7766777aaa66aaa7aa60000000000000000
0000000099999a9999999a9999999a9999999a9999999a99000000000000000000000000000000000000000067700aa66aa007766aa00aa60000000000000000
000000009499999994999999949999999499999994999999000000000000000000000000000000000000000067700aa66aa0077667700aa60000000000000000
00000000994999999949999999499999994999999949999900000000000000000000000000000000000000006aaa7aa66aa7aaa667aaa7760000000000000000
000000009999949999999499999994999999949999999499000000000000000000000000000000000000000066aa77666677aa6666aaa7660000000000000000
00000000999999999999999999999999999999999999999900000000000000000000000000000000000000006666666666666666666666660000000000000000
00000000644494440b0b0b000b0b0b0b000b0b0b0b0b0b0000000000000000000000000000000000000000005d55555d55555d55555555550505050000000000
00000000449446940bbbbbb0bbbbbbbb0bbbbbbbbbbbbbb0000000000000000000000000000000000000000055555d5555555555050505000000000000000000
0000000094443464333333333333333333333333333333bb00000000000000000000000000000000000000005555555505050500050505000000000000000000
00000000434944443439343434393434343934343439343b00000000000000000000000000000000000000000565656005050500000000000000000000000000
00000000444494394444944944449449446494494444944300000000000000000000000000000000000000000565656000606060000000000000000000000000
000000009944444449444344494344444944434449644344000000000000000000000000000000000000000066d6666600606060006060600000000000000000
00000000464344994434649444643494643464943444649400000000000000000000000000000000000000006d666d6666d66666006060600000000000000000
0000000044449443444344464344444644444443449444460000000000000000000000000000000000000000666666666d666d6666d666660060606000000000
00000000666666660777777077777777007777777777770000000000000000000000000000000000000000001111111111111111111111111111111100000000
0000000066c6766677777777777777770777777777777770000000000000000000000000000000000000000017711ff117711ff1177711111111111100000000
00000000666666c6777777c7777777c7777777c7777777c7000000000000000000000000000000000000000017711ff117711ff1177711111177771100000000
000000006c6666666c6666666c6666666c6666666c66666600000000000000000000000000000000000000001111111111111111177711111177771100000000
0000000066667c6666667c6666667c6666667c6666667c66000000000000000000000000000000000000000011111111111111111111fff11177771100000000
00000000676666666766666667666666676666666766666600000000000000000000000000000000000000001dd11ee1111dd1111111fff11177771100000000
0000000066c6667666c6667666c6667666c6667666c6667600000000000000000000000000000000000000001dd11ee1111dd1111111fff11111111100000000
00000000666666666666666666666666666666666666666600000000000000000000000000000000000000001111111111111111111111111111111100000000
0000000000000000000000000000000000000000000000c000000000000800000000000000000000000000000000000000000000000000000000000000000000
000cccc0000000000000000000000000000cccc0000cccc000cc0080c00000800000000000000000000000000000000000000000000000000000000000000000
00ccc90c000ccccc000000000000000000ccc90c00cc90000c9500000c00b0000000000000000000000000000000000000000000000000000000000000000000
00cc550000ccc900000000000000000000cc550000c550000c5508080c95b0800000000000000000000000000000000000000000000000000000000000000000
00cb990000cc5500000000000000000000cb990000cb9800c0bb8000c05bb0000000000000000000000000000000000000000000000000000000000000000000
00cbb00000cb9900000000000000000000cbb80000cb8000c0333080c00333802000000000000000000000000000000000000000000000000000000000000000
00c3c30000cbb300000000000000000000c3c30000c3c8000c0338080cc03308290bb08000000000000000000000000000000000000000000000000000000000
0008080000c80800000000000000000000080800000808000008000000cc0880288cc8c800000000000000000000000000000000000000000000000000000000
00000000000cccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000cccc000ccc90c000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc90c00cc550000ccc90c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc55000ccb990000cc550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ccb99b00ccb1b000ccb990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ccbb3000c0333000cb1100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c033080000800800c03300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00080000000000000080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cccc0000cccc0000cccc0000cccc0c00cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000ccc90000ccc90000ccc90000cbc900c0ccc90000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ccccc00cc550000cc55000ccc550000cb5500cccc5500000ccccc000000000000000000000000000000000000000000000000000000000000000000000000
00ccc90000cb990000cb99000cbb99000ccb9900000b990000ccc900000000000000000000000000000000000000000000000000000000000000000000000000
00cc550000cbb30000cb33000bc33000cc0333000003330000cc5500000000000000000000000000000000000000000000000000000000000000000000000000
00cb990000c3c80000c8c080ccc33c800008c0800003c8000ccb9900000000000000000000000000000000000000000000000000000000000000000000000000
00cbb3000008000000000000008000000000000000080000cc0b3300000000000000000000000000000000000000000000000000000000000000000000000000
00c80800000000000000000000000000000000000000000000080800000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000aaaa00000000000cc66c7700000000000000000000000000000000
0200002000200200000000000000000000000000000000000000000000000000000000000a9999a0000000006000000700000000000000000000000000000000
242002422240042200000000000000000000000000000000000000000000000000000000a965569a000aa0006060000c00000000000000000000000000000000
244884422448844200000000000000000000000000000000000000000000000000000000a956669a00a55a00c000060600000000000000000000000000000000
242442422004400200000000000000000000000000000000000000000000000000000000a956669a00a56a006000000600000000000000000000000000000000
020000200000000000000000000000000000000000000000000000000000000000000000a965569a000aa000c006000600000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000a9999a0000000007000006c00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000aaaa000000000077cc66cc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000700000070000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000a00a0000a0000000000000000000000000
0000000000000000015000000000000000000000000000000000000000000000000000000000000000a00a0000a00a0000000000000000000000000000000000
015000000150000028500000015000000000000000000000000000000000000000000000000aa000000aa0000000000000000000000000000000000000000000
285000052850000055544455285000050000000000000000000000000000000000000000000aa000000aa0000000000000000000000000000000000000000000
5554445055544455005555005554445000000000000000000000000000000000000000000000000000a00a0000a00a0000000000000000000000000000000000
00555550005555500500005000555500000000000000000000000000000000000000000000000000000000000a0000a00a0000a0000000000000000000000000
00150150001501505000000500500050000000000000000000000000000000000000000000000000000000000000000000000000700000070000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003930000000000000393000003930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00093393000000000009339300093393000000000000000000000000000000000000000000800800000000000000000000000000000000000000000000000000
08539339000933900853933908539339000000000000000000000000000000000000000008788880000000000000000000000000000000000000000000000000
05533939085393390553393905533939000000000000000000000000000000000000000000888800000000000000000000000000000000000000000000000000
04043930055339390404393004043930000000000000000000000000000000000000000000088000000000000000000000000000000000000000000000000000
40404000040439304040400040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40400400404040004040400004040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cccc0000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cc55cc00cc55cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ee000003ee3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003bb300030bb0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
030bb030030bb0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
033ff330003ff3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb0000bbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd00dd00dd00dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900009990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00911190099119000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
091c5c1995c5c5900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00911190091119000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00911900009119000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00955900009559000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09dddd9009dddd900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09dd0dd909dd0dd90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010101010100000000000000000000010101010100000000000000000000000101010101000000000000000000000001010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0102000000020020200402009020120201b0202202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
330300001f70021720237202a720357203f7200070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
21080000151201f120241202612003100021000210002100021000210002100001000010000100001000010000100001000010000100001000010000100000000000000000000000000000000000000000000000
010600000013101131031310413106131091310c13110131141311a131211312a1310010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000000
010500001a131191311713114131121310d1310b13108130041300213001130001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000000
050100000e1300f1300f1300f1300f1300f1300e1300a130041300013005130081300b1300d1300e1300f1300f1300f1300e1300c1300a13008130051300213001130041300613008130091300b1300d1300e130
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400001051512515150151a5151051512515150151a5151051512515150151a5151051512515150151a5151051512515170151c5151051512515170151c5151051512515160151c5151051512515160151c515
011400000c0730257502575020750e6450257502075025750c0730257502575020750e6450257502075025750c0730257502075025750e6450207502575025750c0730257502575020750e645025750207502575
011400002c7552c0552c7552a0552a7552a0552a7552f0552c7552c0552c7552805525755250552a7552a0552075520755207551e7551e7551e7551e755217552075520755207551e7551e7551e7551e7551e755
011400000c0530655506555060550e6450655506055065550c0530655506555060550e6450655506055065550c0530955509055095550e6450905509555095550c0530955509555090550e645095550905509555
0114000020745200452074520045217452104521745210452c7452c0452c7452c0452a7452a0452a7452a045257452504525745250452674526045267453404532745310452d745280452674525045217451c045
050e00000034500305003450030500345003050034500305003450030000345003050034500305003450030500345003050034500305003450030500345003000034500305003450030500345003050034500300
490e00000045500400004000040000400004000040000400074550040000400004000040000400004000040003455004000040000400004000040000400004000245500400004000040000400004000040000400
010e000018455000000c45500000000000000000000000001a455000000e45500000000000000000000000001b455000000f45500000000000000000000000001a455000000e4550000000000000000000000000
010e00000c65500605006050060500605006050c655006050060500605006050060500605006050c655006050060500605006050060500605006050c655006050c65500605006050060500605006050c65500605
090e00000b3300c3300c33000330033300c330073300a3300c330053300a3300c3300c3300c330133300c3300a33011330113300c330133300c33013330133300f3300c330113301333011330113301333011330
010e00000332000320003200732007320033200f3200f3200c320133201d3201f3201d32018320223201d320183201f32027320243201d320243201f320243201b320243201d3202732027320243202732022320
011000000c552000020c5520c55213552000020c552000020c552000020c5520c55213552000020c552000020c552000020c5520c55215552000020c552000020c552000020c5520c55215552000020c55200002
011000000c552000020c5520c55217552000020c552000020c552000020c5520c55217552000020c552000020c552000020c5520c55218552000020c552000020c552000020c5520c55218552000020c55200002
011000000c7600c76000700007000c7600c76000700007000c7600c76000700007000c7600c76000700007000c7600c76000700007000c7600c76000700007000c7600c76000700007000c7600c7600070000700
010f00000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c150001000c15000100
010f00000c1500010013150001000c1500010013150001000c1500010013150001000c1500010013150001000c1500010013150001000c1500010013150001000c1500010013150001000c150001001315000100
010f00000a1500000011150001000a1500010011150001000a1500010011150001000a1500010011150001000a1500010011150001000a1500010011150001000a1500010011150001000a150001001115000100
010f000008150000000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f15000100
010f00000a150000000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f1500010008150001000f15000100
610f0000185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545185451a5451b5451a545
010f00001864500605006050060500175001751817500605186450060500605006050017500175181750060518645006050060500605001750017518175006051864500000000000000000175001751817500000
190f000024535005052b5350050527535005050050500505245350050529535005052653500505005050050526535005052753500505295350050500505005052753527535265352450524535005050050500505
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
330300001f70021720237202a720357203f7200070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
__music__
00 10424344
01 100f4344
00 100f4344
00 10114344
00 12114344
02 12134344
00 14554344
00 14155644
01 14161758
00 14181744
02 14191744
01 1a1c4344
02 1b1c4344
00 1d424344
00 1e424344
00 1f424344
00 20424344
00 1f424344
01 1e224344
00 1f224344
00 20224344
00 1f224344
00 1e222344
00 1f222344
00 20222344
00 1f222344
00 1e222324
00 1f222324
00 20222324
02 1f222324
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
d7ddd66d0000000000000000000000000000000dd7ddd66dd00000000000000000000000000000000000066dd7ddd600000000000000000000000000d7ddd66d
dddddd6d0005500000888000808800888000000ddddddd6dd008808880888008808880000088000000000d6ddddddd000aa000008880000000000000dddddd6d
dddddddd0057850000808008000800808000000dddddddddd080000800808080008000000008000000000ddddddddd00a55a00008080000000000000dddddddd
dddddddd0058850000808008000800808000000dddddddddd088800800888080008800000008000000000ddddddddd00a56a00008080000000000000dddddddd
d7dddddd0058850000808008000800808000000dd7ddddddd000800800808080808000000008000000000dddd7dddd000aa000008080000000000000d7dddddd
d77ddd6d0005500000888080008880888000000dd77ddd6dd088000800808088808880000088800000000d6dd77ddd00000000008880000000000000d77ddd6d
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddd00aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0a99900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6da9556a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddda9665a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddda9665a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddda9556a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0a99900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd00aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd000000000000000000000000000000000000000000000000ffffffffffffffff000000000000000000000000000000000000000000000000dddddddd
d7ddd66d000000000000000000000000000000000000000000000000fddddddddddddddf000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d000000000000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000dddddd6d
dddddddd000000000000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000dddddddd
dddddddd000000000000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000dddddddd
d7dddddd200000000000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d290880000000000000000000000000000000000000000000d77ddd6dd77ddd6d000000000000000000000000000000000000000000000000d77ddd6d
dddddddd228838380000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000dddddddd
ddddddddffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffdddddddd
d7ddd66ddddddddddddddddddddddddf0000000000000000000000000000000000000000000000000000000000000000fdddddddddddddddddddddddd7ddd66d
dddddd6ddddddddddddddddddddddddd0000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddd6d
dddddddddddddddddddddddddddddddd0000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddd0000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd
d7dddddddddddddddddddddddddddddd0000000000000000000000000000000000000000000000000000000000000000ddddddddddddddddddddddddd7dddddd
d77ddd6dd77ddd6dd77ddd6dd77ddd6d0000000000000000000000000000000000000000000000000000000000000000d77ddd6dd77ddd6dd77ddd6dd77ddd6d
dddddddddddddddddddddddddddddddd0000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd000000000000000000000000000000000000000000000000ffffffffffffffff000000000000000000000000000000000000000000000000dddddddd
d7ddd66d000000000000000000000000000000000000000000000000fddddddddddddddf000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d000000000000000000000000000000000000000020020000dddddddddddddddd000000000000000000000000000000002002000000000000dddddd6d
dddddddd000000000000000000000000000000000000000008800000dddddddddddddddd000000000000000000000000000000000880000000000000dddddddd
dddddddd000000000000000000000000000000000000000006600000dddddddddddddddd000000000000000000000000000000000660000000000000dddddddd
d7dddddd000000000000000000000000000000000000000020020000dddddddddddddddd000000000000000000000000000000002002000000000000d7dddddd
d77ddd6d000000000000000000000000000000000000000000000000d77ddd6dd77ddd6d000000000000000000000000000000000000000000000000d77ddd6d
dddddddd000000000000000000000000000000000000000000000000dddddddddddddddd000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
ddddddddffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffdddddddd
d7ddd66ddddddddddddddddddddddddddddddddf000000000000000000000000000000000000000000000000fdddddddddddddddddddddddddddddddd7ddd66d
dddddd6ddddddddddddddddddddddddddddddddd000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddd6d
dddddddddddddddddddddddddddddddddddddddd000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddd000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddd
d7dddddddddddddddddddddddddddddddddddddd000000000000000000000000000000000000000000000000ddddddddddddddddddddddddddddddddd7dddddd
d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d000000000000000000000000000000000000000000000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d
dddddddddddddddddddddddddddddddddddddddd000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000550000000000d7ddd66d
dddddd6d8888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005555000000000dddddd6d
dddddddd8888870000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055785500000000dddddddd
dddddddd8888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058888500000000dddddddd
d7dddddd0888700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058888500000000d7dddddd
d77ddd6d0087800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055885500000000d77ddd6d
dddddddd0088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005555000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000550000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000dddddddd
d7ddd66d00000000006ff600000000000000000000000000fddddddddddddddddddddddddddddddf000000000000000000000000006ff60000000000d7ddd66d
dddddd6d00000000068bb860000000000000000000000000dddddddddddddddddddddddddddddddd000000000000000000000000068bb86000000000dddddd6d
dddddddd000000000fb55bf0000000000000000000000000dddddddddddddddddddddddddddddddd0000000000000000000000000fb55bf000000000dddddddd
dddddddd000000000fb55bf0000000000000000000000000dddddddddddddddddddddddddddddddd0000000000000000000000000fb55bf000000000dddddddd
d7dddddd00000000068bb860000000000000000000000000dddddddddddddddddddddddddddddddd000000000000000000000000068bb86000000000d7dddddd
d77ddd6d00000000006ff600000000000000000000000000d77ddd6dd77ddd6dd77ddd6dd77ddd6d000000000000000000000000006ff60000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd0000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7ddd66d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7ddd66d
dddddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
d7dddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d7dddddd
d77ddd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d77ddd6d
dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddd
ddddddddffffffffffffffffffffffff00000022200000000000000000aaa00000000000000000000000000000000000ffffffffffffffffffffffffdddddddd
d7ddd66ddddddddddddddddddddddddf0000002900000000000000000a99900000000000000000000000000000000000fdddddddddddddddddddddddd7ddd66d
dddddd6ddddddddddddddddddddddddd000008880000000000000000a9556a0000000000000000000000000000000000dddddddddddddddddddddddddddddd6d
dddddddddddddddddddddddddddddddd000003830000000000000000a9665a0000000000000000000000000000000000dddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddd000080808000000000000000a9665a0000000000000000000000000000000000dddddddddddddddddddddddddddddddd
d7dddddddddddddddddddddddddddddd000008880000000000000000a9556a0000000000000000000000000000000000ddddddddddddddddddddddddd7dddddd
d77ddd6dd77ddd6dd77ddd6dd77ddd6d0000030300000000000000000a99900000000000000000000000000000000000d77ddd6dd77ddd6dd77ddd6dd77ddd6d
dddddddddddddddddddddddddddddddd00000808000000000000000000aaa00000000000000000000000000000000000dddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddddddddddd
d7ddd66dd7ddd66dd7ddd66dd7ddd66000000000000000000000000000000000ddddddddddddddddddddddddddddddddd7ddd66dd7ddd66dd7ddd66dd7ddd66d
7000000000000d6d888d888d888ddd6088888888888800000000000000000000dddddddddddddddddddddddddddddddddddddd6ddddddd6ddddddd6ddddddd6d
0700000000000dddd8dd8ddd8dddd8d088888888888800000000000000000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
0070000000000dddd8dd88dd88ddddd088888888888800000000000000000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
0700000000000dddd8dd8ddd87ddd8d088888888888800000000000000000000ddddddddddddddddddddddddddddddddd7ddddddd7ddddddd7ddddddd7dddddd
700000000000088d888d8d6d888ddd6000000000000000000000000000000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d
0000000000000ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
