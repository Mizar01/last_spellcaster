pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
poke(24412,-1)nu=false ns=true nh="microvania/logs/log"F=60nt={}function c(l,t,i)l,i=l or{},i or{}local function d(l)local n=1while n<=#l and(sub(l,n,n)==" "or sub(l,n,n)=="\n"or sub(l,n,n)=="	")do n+=1end local e=#l while e>=n and(sub(l,e,e)==" "or sub(l,e,e)=="\n"or sub(l,e,e)=="	")do e-=1end if(n>e)return""
return sub(l,n,e)end local e,n=1,#t while e<=n do while e<=n do local n=sub(t,e,e)if(n~=" "and n~="\n"and n~=";"and n~="	")break
e+=1end if(e>n)break
local r,f,o=e,0,nil while e<=n do local n=sub(t,e,e)if(n=="{")f+=1
if(n=="}")f-=1
if f==0do if(n=="="and not o)o=e
if(n==";"or n=="\n")break
end e+=1end local f,n if(o)f,n=d(sub(t,r,o-1)),d(sub(t,o+1,e-1))else n=d(sub(t,r,e-1))
local e local t=sub(n,1,1)if t=="{"and sub(n,-1)=="}"do e=c({},sub(n,2,#n-1),i)elseif t=="*"do local n=tonum(sub(n,2))e=i[n]elseif sub(n,1,3)=="_k_"do local n=sub(n,4)e=l[n]elseif sub(n,1,4)=="_fn_"do local n=split(sub(n,5),"_")e=nt[n[1]](#n>=2and n[2]or nil)elseif n=="true"do e=true elseif n=="false"do e=false elseif n=="nil"do e=nil else e=tonum(n)if(e==nil)e=n
end if f and f~=""do l[f]=e elseif n~=""do add(l,e)end end return l end function no(n,e)nt[n]=e end function o(e,l)local n={}c(n,e,l)return n end function j(n,e)return unpack(o(n,e))end l={new=function(n,e)local n={maxtime=flr(F*n),t=flr(F*n),loop=e or false}return i(n,l)end,adv=function(n)if(n.t<0)return false
n.t-=1local e=false if(n.t==0)e=true if(n.loop)n.t=n.maxtime else n.t=-1
return e end,restart=function(n)n.t=n.maxtime end,t_left=function(n)return flr(n.t/F)end,t_left_btw=function(n,e,l)local n=n:t_left()return n>=e and n<=l end}l.__index=l function nU()n2={"⬅️","➡️","⬆️","⬇️","🅾️","❎"}for n=0,8do?""..n..":",0,n*7,1
for e=0,6do if(btn(e,n))?n2[e+1],e*8+10,n*7,n+1
end end end function nV(n,e)rect(n-1,e-1,n+1,e+1,rnd(15))end function H(l,t,n,e)n,e=n or 8,e or 8local l,t=flr(l/n),flr(t/e)return{tile=mget(l,t),tx=l,ty=t,ox=l*n,oy=t*e}end function nW(n,e,l,t,o)local n=H(n,e,t,o)return fget(n.tile,l)end function nX(n,e,l,t,o,i,f)if(n==nil)return
local d,n=n.t,n.maxtime ni(e,l,t,o,d,n,i,f)end function ni(n,e,l,t,o,i,f,d)rectfill(n-1,e-1,n+l+1,e+t+1,f)local l=mid(0,flr(o/i*l),l)rectfill(n,e,n+l,e+t,d)end function n_()local n,e=stat(90).."-"..stat(91).."-"..stat(92),stat(93)..":"..stat(94)..":"..stat(95)return n.." "..e end function z(n)local e=ns or false if(not e)return
printh(n,nh or"mainlog")end function r(n,e,l,t)?n,e-#n*2,l,t
end function D(n,e,l,t,o)rectfill(n-l/2,e-t/2,n+l/2,e+t/2,o)end function I(e,n)return n[flr(time()/e)%#n+1]end function n5(n,e)local l=#n local e=e==1and l or e-1return e,n[e]end function n4(n,e)local l=#n local e=e%l+1return e,n[e]end function nY(e,l)local n=""for l in all(l)do n..=e..l end return n or""end function nf(e,n)return sub(e,n,n)end function n6(l,e,t)local n={}for e=0,e-1do n[e]={}for l=0,l-1do n[e][l]=t end end return n end function nd(n,e,l)local n=n+l*(e-n)return n end function J(e,l,n,t,o)local n=n.t/n.maxtime if(t)n=1-n
return nd(e,e+(o==s and-1or 1)*l,n)end function nr(n,e,l,t,i)local o=split(n,"*")for n=1,#o do local o=o[n]if(i)r(o,e,l/2+(n-1)*8+5,t)else?o,e,l+(n-1)*8,t
end end function nZ(n,e)for n in all(n)do if(n==e)return true
end return false end function n(n,e)n.__index=n return i(n,e)end function en(n)return flr(n+.5)end function n3(n)return flr(time()/n)%2==0end function ee(n)return sin(n%360/360)end function el(n)local e,n=n%16*8,flr(n/16)*8return e,n end function i(n,e)return setmetatable(n,e)end function o(n)return c({},n)end function et(e,t,o)local n=""for l=1,#e do local e=sub(e,l,l)if(e==t)e=o
n=n..e end return n end function eo(n,l)for e=1,#n do if(nf(n,e)=="*")n=sub(n,1,e-1)..tostr(l[tonum(nf(n,e+1))])..sub(n,e+2)
end return n end G={new=function(n,e)local e={x=n,y=e,w=100,h=110,item=1,cc=y.new(17,3,25,function(n)spr(138,n.x,n.y-1)?tostr(a.coins),n.x+10,n.y+1,8
end),lc=y.new(75,3,35,function(n)spr(170,n.x,n.y-1)?tostr(flr(a.life)).."/"..tostr(flr(a.max_life)),n.x+10,n.y+1,8
end)}e.items={}local l=true for n in all(n8)do if(n.reusable or _==2)n.used=false
if not n.used and _>n.enable_after_stage do if(l)n.selected=true
l=false add(e.items,n)end end add(e.items,{name="__exit__",desc1="exit shop",price=0,selected=false,used=false})return i(e,G)end,update=function(n)local e,l=btnp(2,0),btnp(3,0)if(e)n.items[n.item].selected=false n.item,K=n5(n.items,n.item)K.selected=true
if(l)n.items[n.item].selected=false n.item,K=n4(n.items,n.item)K.selected=true
if btnp(4,0)do local n=n.items[n.item]if(n.name=="__exit__")d:shop_to_play()return
if not n.used do local e=a.coins if(e>=n.price)a.coins-=n.price n.used=true if(n.fn)n.fn()
end end n.cc:update()end,draw=function(n)D(n.x,n.y,n.w,n.h,1)local e=n.y-n.h/2+5r("shop",n.x,e-1,7)if(n.item>=3)e-=(n.item-2)*10
local t=n.x-n.w/2for o,l in pairs(n.items)do e+=10local n=e<n.y-n.h/2+15if not n do local o=l.selected and">"or" "if l.name=="__exit__"do?o.." exit",t,e,7
break else local n=7if(l.used)n=3
if(not l.used and a.coins<l.price)n=8
?o.." "..l.name,t,e,n
end end end local l,e=n.items[n.item],69D(64,90,90,50,0)nr(l.desc1 or"",t+10,e,7,false)e+=20nr(l.desc2 or"",t+10,e,11)e+=20?tostr(l.price).." coins",t+10,e,10
n.cc:draw()n.lc:draw()end}G.__index=G n7={[[1z1G0z0D1"0z0D1"0z0D1"0:1,0x1"0z0D1"0z0D1"071$0,1"0u1"0z0D1"0D1"0x1"0z0D1"0z0D1"0,1"0"1"051"0u1"0*1"0&1"0z001"0*1"0"1"0"1"001"0x1"0*1"0&1"0z001"0,1"0"1"051"0u1"0.1"0z041"0D1"0x1"0z0D1"0G1"0u1"0z0D1"0D1"0x1"0z0D1"0$b!0B1"0u1"0"A!0!B!0"C!0"D!0z091.081"0x1"0"a!0(1!0"6!0z051"0&1$0!1"0!1$0z021"0$1$0)1#001"0x1"0"f!1%6!0(v#0!1!0's!0'1!0&e!0q1z1G]]}f={new=function(n,e,l)local n={name="obj",x=n or 0,y=e or 0,parent_mgr=l or nil,hitbox={x=0,y=0,x2=7,y2=7},speed=.4,destroyed=false,spr={idle={sprites={64,65},fps=2,loop=true},flip_x=false,flip_y=false,time_start=0,effect="none",last_frame=0,rot_speed=1},phase="idle"}if(n.parent_mgr)n.parent_mgr:add(n)
return i(n,f)end,update=function(n)end,draw=function(n)n:draw_sprite()end,del=function(n)n.destroyed=true if(n.parent_mgr)n.parent_mgr:del(n)
end,draw_sprite=function(l)if(nu)local n=l:hitbox_pos(0,0)rect(n.x,n.y,n.x2,n.y2,8)
local n=l.spr if(n.effect=="blink_white")local n=time()%.2<.1if(n)for n=0,15do pal(n,7)end
local e,o=n[l.phase],nil if e.ss~=nil do o=e.ss else if e.loop~=nil and e.loop==false and e.sprites[#e.sprites]==n.last_frame do o=n.last_frame else if(n.time_start==nil or n.time_start==0)n.time_start=time()
o=e.sprites[1+flr((time()-n.time_start)/(1/e.fps))%#e.sprites]end end if n.effect=="rotx"or n.effect=="roty"do local e,i,f=8,8,n.rot_speed or 1if(n.effect=="roty")e=cos(t()*f)*8else i=cos(t()*f)*8
sspr(o%16*8,flr(o/16)*8,8,8,l.x+4-e/2,l.y,e,i,false,false)else spr(o,l.x,l.y,1,1,n.flip_x or false,n.flip_y or false,7)end pal()n.last_frame=o end,collide=function(n,e,l,t)local n,e=n:hitbox_pos(0,0),e:hitbox_pos(0,0)if(l~=nil)n.x+=l n.x2-=l e.x+=l e.x2-=l
return not(n.x2<e.x or n.x>e.x2 or n.y2<e.y or n.y>e.y2)end,hitbox_pos=function(n,e,l)e,l=e or 0,l or 0return{x=n.x+e+n.hitbox.x,y=n.y+l+n.hitbox.y,x2=n.x+e+n.hitbox.x2,y2=n.y+l+n.hitbox.y2}end}f.__index=f e={new=function()local n={}n.objs={}n.update_in_pause=false return i(n,e)end,restart=function(n)n.objs={}end,add=function(n,e)add(n.objs,e)end,del=function(n,e)del(n.objs,e)end,update=function(n)if(d.paused and not n.update_in_pause)return
for n in all(n.objs)do n:update()end end,draw=function(n)for n in all(n.objs)do n:draw()end end}e.__index=e function p(l,n,e)local t,e=e or l.speed,e or l.speed local t,o=n==s and-t or(n==x and t or 0),n==B and-e or(n==A and e or 0)local e=l:hitbox_pos(t,o)if n==x or n==s do local n=n==s and e.x or e.x2 local o,n=g(n,e.y),g(n,e.y2)if(not o and not n)l.x=l.x+t return 1else return 0
elseif n==B or n==A do local n=n==B and e.y or e.y2 local t,n=g(e.x,n),g(e.x2,n)if(not t and not n)l.y=l.y+o return 1else return 0
end end function L(n,e,l,t)local n=H(n,e,l,t)return na(n.tile)end function np(e,l)for t in all(v)do local n=t:hitbox_pos(0,0)if(e>=n.x and e<n.x2 and l>=n.y and l<n.y2)return t
end return nil end function g(n,e,l,t)return L(n,e,l,t)or np(n,e)~=nil end function na(n)return fget(n,nx)end function ei(n,e)local n=mget(n,e)return na(n)end function ef(n,e,l,t)return{x=flr(rnd(n or 15))+(l or 0),y=flr(rnd(e or 15))+(t or 0)}end function w()return q[_]end function ed()local n=w().gems return _==#q and a.gems==n-1end function er(e,l)local n=H(a.x,a.y)return n.tx==e and n.ty==l end function nb(n,e,l,t,o,i,f)return{name=n,desc1=e,desc2=l,price=t,used=false,reusable=i,enable_after_stage=o or 1,fn=f or nil}end function nm(n,e,l,t)return{name=n,music=e,theme=n9[l],gems=t}end function ny(e,n)local n={[ng]=n.tile_maps[2],[nw]=n.tile_maps[1],[nk]=n.tile_maps[2],[nz]=n.tile_maps[5],[nD]=n.tile_maps[4],[nv]=n.tile_maps[1],[nj]=n.tile_maps[3],[nG]=n.tile_maps[1],[nB]=n.tile_maps[1],[nA]=n.tile_maps[5],[nq]=n.tile_maps[4],[nC]=n.tile_maps[1],[nE]=n.tile_maps[1],[nF]=n.tile_maps[1],[nH]=n.tile_maps[3],[nI]=n.tile_maps[1]}return n[e]end function nJ(l,i,o)local n,t=0,0for e=1,#l,2do local f,e=sub(l,e,e),sub(l,e+1,e+1)local e=ord(e)-32for e=1,e do o[t][n]=f n=n+1if(n>=i)n,t=0,t+1
end end return o end function nK()local l,n=n7[_],w()local r,n,e=n.theme if(n1)n,e=(#M[1]+1)/2,#M else n,e=128,32
local i=n6(e,n,"")if n1 do for e=0,e-1do for l=0,n-1do local n=(l+1)*2-1local n=sub(M[e+1],n,n)if(n==" ")n="0"
i[e][l]=n end end else nJ(l,n,i)end local f,d=d.mgr.enemy_mgr,d.mgr.misc_mgr for t=0,e-1do for o=0,n-1do local n=i[t][o]mset(o,t,0)local e,l=o*8,t*8if n=="1"do local n=nL(i,o,t)local n=ny(n,r)or 1mset(o,t,n)elseif n=="f"do a.x,a.y=e,l elseif n=="a"or n=="b"do N.new(e,l,n=="a",f)elseif n=="6"do O.new(e,l,d)elseif n=="7"do elseif n=="8"do elseif n=="e"do k.new(e,l,"dog")elseif n=="s"do k.new(e,l,"spider")elseif n=="v"do P.new(e,l,f)elseif n=="A"or n=="B"or n=="C"or n=="D"do Q.new(e,l,ord(n)-ord"A"+1,d)end end end end function nL(l,n,e)local t,o,i=#l-1,#l[0]-1,e>0and l[e-1][n]=="1"or e==0local t,f,e,n=e<t and l[e+1][n]=="1"or e==t,n>0and l[e][n-1]=="1"or n==0,n<o and l[e][n+1]=="1"or n==o,0if(i)n+=1
if(t)n+=2
if(f)n+=4
if(e)n+=8
return n end R={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,update=function(n)n.x+=(a.x-n.x)*n.csfx n.y+=(a.y-n.y)*n.csfy local n,e=n:calc_center()camera(n,e)end,place=function(n,e,l)n.x=e n.y=l end,calc_center=function(n)return flr(n.x)-n.ox,flr(n.y)-n.oy end}S={new=function(n,e)local n=f.new(n,e)c(n.spr,[[			idle = { sprites = { 64; 65 }; fps = 2 }
			walk = { sprites = { 80; 81; 82 }; fps = 6 }
			jump = { sprites = { 97; 98; 99; 100; 101; 102 }; fps = 8 }
			dead = { sprites = { 68; 69; 70; 71; 72 }; fps = 4; loop = false }
		]])c(n,[[			name=player
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
			avail_elements = { true, false, false, false }
			el_cooldown = _fn_t1_1
			shine_star=0
			interaction_fn=nil
			hitbox = { x = 2; y = 3; x2 = 5; y2 = 7 }
		]])return i(n,S)end,reset_stage_props=function(e)local n=e n.speed=0n.phase="idle"n.invisible=false n.blocked=false n.invulnerable=false e:reset_jump_vars()n.gems=0end,update=function(l)if(d.paused)return
local n=l if n.phase=="dead"do if(n.prev_btn.left)p(n,s)
if(n.prev_btn.right)p(n,x)
n.speed=n.speed*.9n:apply_forces()return end local e={left=btn(0,0),right=btn(1,0),jump=btn(4,0),jump_start=btnp(4,0),action=btnp(5,0)}if not n.blocked do if(e.left)n:move_left()
if(e.right)n:move_right()
if(not e.left and not e.right)n.speed=n.speed*.7if(n.speed<.1)n.speed=0
n:apply_forces(e)end n.prev_btn=e if(e.left==false and e.right==false and n:on_ground())n.phase="idle"
if(n.nodmg_t~=nil)if(n.nodmg_t:adv())n.spr.effect="none"n.invulnerable=false
if(e.action)if(l.interaction_fn~=nil)l.interaction_fn=nil else l:attack()
if(l.el_cooldown:adv())l.shine_star=10
l.interaction_fn=nil end,draw=function(n)local e=n if(e.invisible)return
e:draw_sprite()if(n.shine_star>0)line(n.x+3,n.y-1,n.x+5,n.y-1,10)line(n.x+4,n.y-2,n.x+4,n.y,10)n.shine_star-=1
end,dmg=function(n,e)local n=n if(not n.invulnerable)n.life-=e if(n.life<=0)n.phase="dead"n.invulnerable=true d.game_over_msg=rnd(d.game_over_msgs)d:set_game_over()else n.nodmg_t=l.new(1)n.spr.effect="blink_white"sfx(nM)n.invulnerable=true
end,increase_life=function(n,e)local n=n n.life=min(n.life+e,n.max_life)end,inc_speed=function(n,e)local n=n if(e)n.speed=n.init_speed else n.speed=min(n.speed+n.inc_speed_factor,n.max_speed)
end,move_left=function(e)local n=e e:inc_speed(not(n.prev_btn.left or false))p(n,s)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=true end,move_right=function(e)local n=e e:inc_speed(not(n.prev_btn.right or false))p(n,x)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=false end,apply_forces=function(n,e)if(not n.blocked and e.jump_start)n:set_start_jump()
if(not e.jump and n.jstack>0)n.jstack=0
if(n.jstack>0)n.speedy=-n.jforce n.jstack-=1
if(n.speedy<0and not e.jump)n.speedy*=n.speed_y_decay
n.speedy+=nN n.speedy=min(n.speedy,n.max_speedy)local e=p(n,n.speedy<0and B or A,abs(n.speedy))if(e==0)n:reset_jump_vars()if(n.phase=="jump")n.phase="idle"
end,reset_jump_vars=function(n)n.speedy=0n.jstack=0end,set_start_jump=function(n)if(n:on_ground())n:reset_jump_vars()n.phase="jump"n.spr.time_start=nil n.jstack=n.max_jstack if(nO)sfx(nP)
end,on_ground=function(n)local n=n local n=n:hitbox_pos(0,1)local e,n=g(n.x,n.y2),g(n.x2,n.y2)return e or n end,apply_end_stage_upgrades=function(n)end,attack=function(n)if(n.cur_el==nil)return
if(n.el_cooldown.t<=0)T[n.cur_el].new(n.spr.flip_x and s or x,d.mgr.misc_mgr)n.el_cooldown:restart()
end,switch_element=function(e)if(e.cur_el==nil)return
local n=e.cur_el%4+1while true do z("s1: "..n)if(e.avail_elements[n])e.cur_el=n C.new(30,"switched to "..T[n].name,d.mgr.hud_mgr)break
n=n%4+1end end}n(S,f)h={new=function(e,n,l,t,o)local n=f.new(n,l,o)c(n,[[            respawn_timer = _fn_t1_10
            dmg_time = _fn_t1_1
            frozen_t = _fn_t1_20
            time_last_death = 0
            life = 100
            dir = nil
            wspeed = 0
            dir_before_blow = nil
            fixed = false
            hitbox = { x = 2; y = 2; x2 = 5; y2 = 5 }
            hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
            speed = *1
            etype = *2
        ]],{t or 1,e})n.frozen_t.t=0return i(n,h)end,dmg=function(n,e)if(n:is_inv())return
n.life-=e n.dmg_time:restart()n.spr.effect="blink_white"if(n.life<=0)n:del()
end,freeze=function(n)n.frozen_t:restart()add(v,n)n.hitbox={x=0,y=0,x2=7,y2=7}end,unfreeze=function(n)n.frozen_t.t=-1n.spr.effect="none"del(v,n)n.hitbox=n.hitbox_orig end,blow=function(n,e)if(n.fixed)return
if(n.wspeed<=0)n.dir_before_blow=n.dir
n.wspeed=2n.dir=e end,unblow=function(n)n.wspeed=-1n.dir=n.dir_before_blow end,update=function(n)f.update(n)if(n.dmg_time:adv())n.spr.effect="none"
if(n.frozen_t:adv())n:unfreeze()else if(n.frozen_t:t_left_btw(.1,2))n.spr.effect="blink_white"
if(n.wspeed>0)local e=p(n,n.dir,n.wspeed)n.wspeed=e==0and 0or max(0,n.wspeed-.05)else if(n.wspeed~=-1)n:unblow()
end,draw=function(n)if(n.frozen_t.t>0)spr(139,n.x,n.y)
f.draw(n)end,del=function(n)n.time_last_death=time()del(v,n)f.del(n)end,is_inv=function(n)return false end}n(h,f)N={new=function(n,l,e,t)local n=h.new("bat",n,l,.3,t)c(n.spr,[[            idle = { sprites = {128;129}; fps = 4; loop = true }
		]])c(n,[[            hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
            horizontal = *1
            dir = *2
            dir_before_blow = _k_dir
        ]],{e,e and x or A})return i(n,N)end,update=function(n)h.update(n)if(n:collide(a))a:dmg(1)
if(n.frozen_t.t>0)return
local e=p(n,n.dir)if(e==0)n.dir=(n.horizontal and 0or 2)+(n.dir+1)%2
end}n(N,h)z"just before c_walk_en"k={spmap=o[[        dog = {idle = {144;145}; run = {146;147}}
        spider = {idle = {160;161}; run = {162;163}}
    ]],new=function(l,t,e)local n=h.new(e,l,t,1.5,d.mgr.enemy_mgr)n.spr.idle={sprites=k.spmap[e].idle,fps=2,loop=true}n.spr.run={sprites=k.spmap[e].run,fps=4,loop=true}c(n,[[            speed = 0.2
            hitbox = { x = 0; y = 3; x2 = 7; y2 = 7 }
            hitbox_orig = { x = 0; y = 3; x2 = 7; y2 = 7 }
            basex = *1
            basey = *2
        ]],{l,t})return i(n,k)end,update=function(n)h.update(n)n.phase="idle"if(n.frozen_t.t>0)return
if n:collide(a,2)do a:dmg(2)d.mgr.player_msg_mgr.dog_bites+=1else if abs(a.x-n.x)<50and abs(a.y-n.y)<4do n.spr.flip_x=a.x-n.x>0local e=a.x-n.x>0and x or s local l,t=e==x and n.x+n.speed+7or n.x-n.speed,n.y+8if(L(l,t))if(not L(l,n.y))p(n,e)n.phase="run"
else if(abs(n.basex-n.x)>3)n.spr.flip_x=n.basex-n.x>0p(n,n.basex-n.x>0and x or s)n.phase="run"
end end end}n(k,h)z"just after c_walk_en"P={new=function(n,e,l)local n=h.new("vine",n,e,0,l)n.spr.idle=o"ss = 6"c(n,[[            fixed = true
            life = 10
        ]])add(v,n)return i(n,P)end,is_inv=function(n)return not(a.cur_el==nc)end}n(P,h)U={new=function(n,e,l,t)local n=f.new(n,e,t)c(n,[[            ttl = _fn_t1_0.2
            solid = false
            max_radius = *1
        ]],{l or 4})n.spr.idle=o"sprites = { 185; 186; 187 }, fps = 4"return i(n,U)end,update=function(n)if(n.ttl:adv())n.parent_mgr:del(n)
end,draw=function(n)if(n.ttl.t<=0)return
local e=nd(0,n.max_radius,1-n.ttl.t/n.ttl.maxtime)circfill(n.x,n.y,e,10)end}n(U,f)u={new=function(o,n)local e,l=a.x+(n==s and-2or 10),a.y+4local t=f.new(e,l,d.mgr.misc_mgr)c(t,[[            damage = 10
            ttl = _fn_t1_0.3
            max_dist = 20
            destroy_req_prev_frame = false
            origx = *1
            origy = *2
            dir = *3
            el = *4
        ]],{e,l,n,o})return i(t,u)end,update=function(n)if(n.destroy_req_prev_frame)n:del()return
if(n.ttl:adv())n.destroy_req_prev_frame=true
n.x=J(n.origx,n.max_dist,n.ttl,true,n.dir)for e in all(d.mgr.enemy_mgr.objs)do if(n:collide(e))n:effect(e)n:del()U.new(n.x,n.y,4,d.mgr.misc_mgr)break
end end,dirmult=function(n)return n.dir==s and-1or 1end,effect=function(n,e)e:dmg(n.damage)end}n(u,f)V={name="fire",new=function(n,e)local n=u.new(nc,n)n.radius=1n.max_radius=2return i(n,V)end,update=function(n)u.update(n)if(n.ttl.t>0)n.radius=J(1,n.max_radius,n.ttl,true)
end,draw=function(n)local l,t={1,2,9,8},n:dirmult()for e=0,3do local o,t=e/3*n.radius,t*e*2circfill(n.x+t,n.y,1.5*o,l[e+1])end end,effect=function(e,n)n:unfreeze()n:dmg(e.damage)end}n(V,u)W={name="ice",new=function(n,e)local n=u.new(nQ,n)n.radius=1n.max_radius=1.5return i(n,W)end,update=function(n)u.update(n)if(n.ttl.t>0)n.radius=J(1,n.max_radius,n.ttl,true)
end,draw=function(n)local l,e={12,6},n:dirmult()rectfill(n.x+e*0-n.radius,n.y-n.radius,n.x+e*0+n.radius,n.y+n.radius,rnd(l))end,effect=function(e,n)n:freeze()end}n(W,u)X={name="thunder",new=function(n,e)local n=u.new(nR,n)n.spr.idle=o"ss = 59"c(n,[[            ttl = _fn_t1_0.2
            max_dist = 25
        ]])return i(n,X)end,draw=function(n)local e,l,t=n.origx,n.origy,n:dirmult()while true do local o,i=e+4*t,l+(rnd(4)-2)line(e,l,o,i,7)e,l=o,i if(t==1and e>n.x+1)break
if(t==-1and e<n.x-1)break
end end}n(X,u)Y={name="wind",new=function(n,e)local n=u.new(nS,n)n.spr.idle=o"ss = 60"c(n,[[            damage = 0
            ttl = _fn_t1_0.7
            max_dist = 25
            power = 20
        ]])return i(n,Y)end,draw=function(n)local o,e,t=n:dirmult(),nil,nil for l=0,12do local o=.5+n.x+l*.8*o local i,f=o*.25,1+l*.25local o,n=o+cos(i)*f,n.y+sin(i)*f if(e~=nil)local l=l%2==0and 12or 6line(e,t,o,n,l)
e,t=o,n end end,effect=function(n,e)e:blow(n.dir)end}n(Y,u)b={new=function(n,e,l)local n=f.new(n,e,l)c(n,[[            show_int_button = false
            ttl_disable_int = nil
            int_done = false
            solid = true
        ]])return i(n,b)end,update=function(n)if(n:collide(a))n.show_int_button=true a.interaction_fn=n.interact local e=n.ttl_disable_int if btnp(5,0)and not n.int_done do n:interact()elseif n.int_done and e==nil do n.ttl_disable_int=l.new(.5,false)elseif e and e:adv()do n.int_done=false n.ttl_disable_int=nil end else n.show_int_button=false
end,draw=function(n)n:draw_sprite()if(n.show_int_button)?"❎",n.x+2,n.y-6,12
end,interact=function(n)n.int_done=true end}n(b,f)O={new=function(n,e,l)local n=b.new(n,e,l)n.spr.idle={ss=11}return i(n,O)end,interact=function(n)a:switch_element()end,draw=function(n)pal(7,n3(.5)and n0[a.cur_el]or 7)b.draw(n)pal()end}n(O,b)Q={new=function(n,e,l,t)local n=b.new(n,e,t)n.spr.idle={ss=12}n.el=l n.oy=e return i(n,Q)end,update=function(n)b.update(n)n.y=n.oy+sin(time())*2end,interact=function(n)z("self.el="..n.el)a.cur_el=n.el a.avail_elements[n.el]=true C.new(30,T[n.el].name.." acquired",d.mgr.hud_mgr)n:del()end,draw=function(n)pal(7,n0[n.el])b.draw(n)pal()end}n(Q,b)Z={new=function()local n=e.new()return i(n,Z)end}n(Z,e)m={new=function(e,l,n)local n=f.new(e,l,n)n.fixedx,n.fixedy=e,l return i(n,m)end,update=function(n)local e,l=R:calc_center()n.x=n.fixedx+e n.y=n.fixedy+l end}n(m,f)y={new=function(n,e,l,t)local n=m.new(n,e)n.draw_fn=t n.bgl=l n.spr.idle={ss=137}return i(n,y)end,draw=function(n)rectfill(n.x,n.y,n.x+n.bgl,n.y+5,1)n.draw_fn(n)end}n(y,m)nn={new=function(n,e)local n=m.new(n,e)n.spr.idle={ss=169}n.life_ref=a.init_max_life return i(n,nn)end,draw=function(n)local e=30*a.max_life/n.life_ref rectfill(n.x,n.y+1,n.x+e+10,n.y+6,1)n:draw_sprite()ni(n.x+10,n.y+2,e,3,a.life,a.max_life,1,8)end}n(nn,m)C={new=function(n,e,t)local l=122-#e*5local n=m.new(l,n,t)n.msg=e n.final_pos=l n.fixedx=n.final_pos+250c(n,[[            ttl_live = _fn_t1_2
            offset = 0
        ]])return i(n,C)end,update=function(n)if(n.ttl_live:adv())n:del()return
local e=abs(n.fixedx-n.final_pos)n.fixedx=e<2and n.final_pos or n.fixedx-e*.1m.update(n)end,draw=function(n)rectfill(n.x-2,n.y-2,n.x+126,n.y+7,1)rect(n.x-2,n.y-2,n.x+126,n.y+7,14)?n.msg,n.x,n.y,8
end}n(C,m)ne={new=function()local n=e.new()n.update_in_pause=true return i(n,ne)end,restart=function(n)n.objs={y.new(8,1,30,function(n)spr(150,n.x,n.y-1)?tostr(a.gems).."/"..tostr(w().gems),n.x+10,n.y+1,8
end),y.new(94,1,25,function(n)spr(138,n.x,n.y-1)?tostr(a.coins),n.x+10,n.y+1,8
end),nn.new(10,120)}end}n(ne,e)nl={new=function()local n=e.new()n.dog_bites=0n.msg={{function()return a.coins>0end,"collect this coins*to buy something*at the shop later."}}return i(n,nl)end,update=function(e)for n in all(e.msg)do local l,t=n[1],n[2]if(l())d.mgr.hud_mgr:add_popup(t)del(e.msg,n)
end end}n(nl,e)nO=true nT=true nN=.25s,x,B,A=j"0;1;2;3"nc,nR,nQ,nS=j"1;2;3;4"n0=o"8;10;12;13"T={V,X,W,Y}nx=0d=nil a=nil nP,ea,e1,ec,e0,nM=j"0;1;2;3;4;5"v={}_=1n1=false M={}ng,nw,nk,nz,nD,nv,nG,nB,nA,nq,nj,nC,nE,nF,nH,nI=j"0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15"n9=o[[    metal = {
        tile_maps = {1; 2; 3; 4; 5 }
        bg_col = -15
    };
    sand = {
        tile_maps = {17; 18; 19; 20; 21}
        bg_col = 12
    };
    grass = {
        tile_maps = {33; 34; 35; 36; 37}
        bg_col = 0
    };
    ice = {
        tile_maps = {49; 50; 51; 52; 53}
        bg_col = -15
    };
]]eu={}q={nm("hello pris... ehm subject n.6",13,"grass",0)}n8={nb("tasty chicken","+5 health","",10,1,true,function()a:increase_life(5)end)}no("t1",function(n)return l.new(n,false)end)no("t2",function(n)return l.new(n,true)end)function _init()z("\n\n\n\n----------- Game started "..n_().." -----------")d=E.new()end function _update60()d:update()end function _draw()d:draw()end E={new=function()local n={paused=false,win_stage=false,win_game=false,menu=true,play=false,stage_title_phase=false,require_player_rebuild=true,mgr={enemy_mgr=e.new(),misc_mgr=Z.new(),hud_mgr=ne.new(),player_msg_mgr=nl.new()},shop=nil}n.game_over_msgs={}n.game_over_msg=""menuitem(1,"restart game",function()d:start_menu()end)return i(n,E)end,start_play=function(n)n.win_stage=false n.menu=false n.play=true if(n.require_player_rebuild)a=S.new(0,0)n.require_player_rebuild=false
n.game_over=false a:reset_stage_props()for e,n in pairs(n.mgr)do if(n.restart)n:restart()
end nK()R:place(a.x,a.y)if(nT)music(w().music)
end,setup_final_event=function(n)end,setup_win_lose_stage=function(n)if a.gems==w().gems do n.win_stage=true n.win_game=_==#q if(n.win_game)music(11)
a:apply_end_stage_upgrades()else n.game_over_msg="you didn't collect all gems!"n:set_game_over()end end,start_menu=function(n)n.menu=true n.play=false n.game_over=false n.win_stage=false n.win_game=false _=1end,start_shop=function(n)n.menu=false n.play=false n.shop=G.new(64,64)end,shop_to_play=function(n)n.shop=nil n:start_play()end,set_game_over=function(n)n.play=false n.win_stage=false n.game_over=true end,update=function(n)if n.menu do if(btnp(5,0))n.require_player_rebuild=true n:start_play()
return end if(n.shop)n.shop:update()return
if n.win_game or n.game_over do if(btnp(5,0))n:start_menu()
return end if n.win_stage do if(not a.prev_btn.up and btnp(5,0))_=_%#q+1n:start_shop()
return end if(d.stage_title_phase)n.mgr.hud_mgr:update()return
R:update()for e,n in pairs(n.mgr)do if(n.update)n:update()
end a:update()end,draw=function(n)if(n.menu)cls(8)rectfill(0,40,127,80,0)local n=t()line(134-flr(n/.05%130),62,140-flr(n/.05%130),62,9)line(140-flr(n/.03%130),60,145-flr(n/.03%130),60,9)line(130-flr(n/.02%130),64,135-flr(n/.02%130),64,9)spr(80+flr(n/.1%3),60,58)line(0,40,127,40,7)line(0,80,127,80,7)r("* new title here! *",64,50,7)r("press (❎) to start",64,70,I(1,{7,0}))return
if(n.shop)cls(8)n.shop:draw()return
cls(w().theme.bg_col)map(0,0,0,0,128,32,false)n.mgr.misc_mgr:draw()n.mgr.enemy_mgr:draw()a:draw()n.mgr.hud_mgr:draw()if n.win_game do D(64,64,120,55,1)r("congratulations!",64,55,10)r("you survived!",64,65,10)r("press (❎) to restart",64,75,I(1,{10,0}))elseif n.win_stage and not n.game_over do D(64,64,107,25,1)r("stage cleared!",64,55,10)r("press (❎) for the shop",64,65,10)elseif n.game_over do D(64,64,120,55,1)r("game over",64,55,8)r(n.game_over_msg,64,65,8)r("press (❎) to restart",64,75,I(1,{8,0}))end end}E.__index=E
__gfx__
00000000dddddddd6ffffff6ffffffffffffffffffffffff30030003000000000000000000000000000000000006d00007777770000000000000000000000000
00000000d7ddd66df5dddd5fddddddddfddddddddddddddf06003033000000000000000000000000000000000006660077666670000000000000000000000000
00700700dddddd6ddddddddddddddddddddddddddddddddd03006030000000000000000000000000000000000066d60079999970000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd03303063000000000000000000000000000000000d67766076666670000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd0b333b03000000000000000000000000000000000677776007999977000000000000000000000000
00700700d7ddddddd7ddddddddddddddddddddddddddddddb63b3bb3000000000000000000000000000000000677776d07666667000000000000000000000000
00000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d33bbb3b60000000000000000000000000000000066677d6607999977000000000000000000000000
00000000dddddddddddddddddddddddddddddddddddddddd33333333000000000000000000000000000000006d66666d07777770000000000000000000000000
00000000999999990ffffff0f00ff00f0ff000ffff000ff000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000099999999ffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009999a999f999a99f9ff99ff9f99fff9999fff99f00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000099999a9999999a9999999a9999999a9999999a9900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000949999999499999994999999949999999499999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000994999999949999999499999994999999949999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000999994999999949999999499999994999999949900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000999999999999999999999999999999999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444440b0b0b000b0b0b0b000b0b0b0b0b0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000449444940bbbbbb0bbbbbbbb0bbbbbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000944444443333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444944443439343434393434343934343439343400000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444494494444944944449449444494494444944900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000494444444944444449444444494444444944444400000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444944444449444444494444444944444449400000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660777777077777777007777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066c676667777777777777777077777777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666c6777777c7777777c7777777c7777777c700000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006c6666666c6666666c6666666c6666666c66666600000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066667c6666667c6666667c6666667c6666667c6600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000676666666766666667666666676666666766666600000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066c6667666c6667666c6667666c6667666c6667600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666666666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000222000022000080000008000000000000000000000000000000000000000000000000000000000000000000000000
000cccc0000000000000000000000000000290000829908002008000000008000000000000000000000000000000000000000000000000000000000000000000
00ccc90c000ccccc0000000000000000038883000029800002900000800000000000000000000000000000000000000000000000000000000000000000000000
00cc550000ccc9000000000000000000080808000088080002990038000000080000000000000000000000000000000000000000000000000000000000000000
00cb990000cc55000000000000000000000800000308808000888800000000000000000000000000000000000000000000000000000000000000000000000000
00cbb00000cb99000000000000000000008880008088080008088000200080002000000000000000000000000000000000000000000000000000000000000000
00c3c30000cbb3000000000000000000003030000003003030800830299880802908800000000000000000000000000000000000000000000000000000000000
0008080000c808000000000000000000008080000080008080080008228838382288383800000000000000000000000000000000000000000000000000000000
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
