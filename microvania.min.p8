pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
r={new=function(n,e)local n={maxtime=flr(C*n),t=flr(C*n),loop=e or false}return f(n,r)end,adv=function(n)if(n.t<0)return false
n.t-=1local e=false if(n.t==0)e=true if(n.loop)n.t=n.maxtime else n.t=-1
return e end,restart=function(n)n.t=n.maxtime end,t_left=function(n)return flr(n.t/C)end,t_left_btw=function(n,e,o)local n=n:t_left()return n>=e and n<=o end}r.__index=r function nO()na={"⬅️","➡️","⬆️","⬇️","🅾️","❎"}for n=0,8do?""..n..":",0,n*7,1
for e=0,6do if(btn(e,n))?na[e+1],e*8+10,n*7,n+1
end end end function nP(n,e)rect(n-1,e-1,n+1,e+1,rnd(15))end function H(o,l,n,e)n,e=n or 8,e or 8local o,l=flr(o/n),flr(l/e)return{tile=mget(o,l),tx=o,ty=l,ox=o*n,oy=l*e}end function nQ(n,e,o,l,t)local n=H(n,e,l,t)return fget(n.tile,o)end function nR(n,e,o,l,t,f,d)if(n==nil)return
local i,n=n.t,n.maxtime nl(e,o,l,t,i,n,f,d)end function nl(n,e,o,l,t,f,d,i)rectfill(n-1,e-1,n+o+1,e+l+1,d)local o=mid(0,flr(t/f*o),o)rectfill(n,e,n+o,e+l,i)end function nS()local n,e=stat(90).."-"..stat(91).."-"..stat(92),stat(93)..":"..stat(94)..":"..stat(95)return n.." "..e end function nt(n)local e=n1 or false if(not e)return
printh(n,nc or"mainlog")end function c(n,e,o,l)?n,e-#n*2,o,l
end function _(n,e,o,l,t)rectfill(n-o/2,e-l/2,n+o/2,e+l/2,t)end function U(e,n)return n[flr(time()/e)%#n+1]end function nu(n,e)local o=#n local e=e==1and o or e-1return e,n[e]end function ns(n,e)local o=#n local e=e%o+1return e,n[e]end function nT(e,o)local n=""for o in all(o)do n..=e..o end return n or""end function nV(e,n)return sub(e,n,n)end function nh(o,e,l)local n={}for e=0,e-1do n[e]={}for o=0,o-1do n[e][o]=l end end return n end function nf(n,e,o)local n=n+o*(e-n)return n end function E(e,o,n,l,t)local n=n.t/n.maxtime if(l)n=1-n
return nf(e,e+(t==s and-1or 1)*o,n)end function nd(n,e,o,l,f)local t=split(n,"*")for n=1,#t do local t=t[n]if(f)c(t,e,o/2+(n-1)*8+5,l)else?t,e,o+(n-1)*8,l
end end function nW(n,e)for n in all(n)do if(n==e)return true
end return false end function n(n,e)n.__index=n return f(n,e)end function nX(n)return flr(n+.5)end function n2(n)return flr(time()/n)%2==0end function nY(n)return sin(n%360/360)end function nZ(n)local e,n=n%16*8,flr(n/16)*8return e,n end function f(n,e)return setmetatable(n,e)end v={new=function(n,e)local e={x=n,y=e,w=100,h=110,item=1,cc=y.new(17,3,25,function(n)spr(138,n.x,n.y-1)?tostr(a.coins),n.x+10,n.y+1,8
end),lc=y.new(75,3,35,function(n)spr(170,n.x,n.y-1)?tostr(flr(a.life)).."/"..tostr(flr(a.max_life)),n.x+10,n.y+1,8
end)}e.items={}local o=true for n in all(n5)do if(n.reusable or l==2)n.used=false
if not n.used and l>n.enable_after_stage do if(o)n.selected=true
o=false add(e.items,n)end end add(e.items,{name="__exit__",desc1="exit shop",price=0,selected=false,used=false})return f(e,v)end,update=function(n)local e,o=btnp(2,0),btnp(3,0)if(e)n.items[n.item].selected=false n.item,F=nu(n.items,n.item)F.selected=true
if(o)n.items[n.item].selected=false n.item,F=ns(n.items,n.item)F.selected=true
if btnp(4,0)do local n=n.items[n.item]if(n.name=="__exit__")i:shop_to_play()return
if not n.used do local e=a.coins if(e>=n.price)a.coins-=n.price n.used=true if(n.fn)n.fn()
end end n.cc:update()end,draw=function(n)_(n.x,n.y,n.w,n.h,1)local e=n.y-n.h/2+5c("shop",n.x,e-1,7)if(n.item>=3)e-=(n.item-2)*10
local l=n.x-n.w/2for t,o in pairs(n.items)do e+=10local n=e<n.y-n.h/2+15if not n do local t=o.selected and">"or" "if o.name=="__exit__"do?t.." exit",l,e,7
break else local n=7if(o.used)n=3
if(not o.used and a.coins<o.price)n=8
?t.." "..o.name,l,e,n
end end end local o,e=n.items[n.item],69_(64,90,90,50,0)nd(o.desc1 or"",l+10,e,7,false)e+=20nd(o.desc2 or"",l+10,e,11)e+=20?tostr(o.price).." coins",l+10,e,10
n.cc:draw()n.lc:draw()end}v.__index=v n4={[[1z1G0z0D1"0z0D1"0z0D1"0:1,0x1"0z0D1"0z0D1"071$0,1"0u1"0z0D1"0D1"0x1"0z0D1"0z0D1"0,1"0"1"051"0u1"0*1"0&1"0z001"0*1"0"1"0"1"001"0x1"0*1"0&1"0z001"0,1"0"1"051"0u1"0.1"0z041"0D1"0x1"0z0D1"0G1"0u1"0z0D1"0D1"0x1"0z0D1"0G1"0u1"0"A!0!B!0"C!0"D!0z0;1.081"0x1"0"a!0(1!0"6!0z051"0&1$0!1"0!1$0z021"0$1$0)1#001"0x1"0"f!1%6!0(v#0!1!0's!0'1!0&e!0q1z1G]]}d={new=function(n,e,o)local n={name="obj",x=n or 0,y=e or 0,parent_mgr=o or nil,hitbox={x=0,y=0,x2=7,y2=7},speed=.4,destroyed=false,spr={idle={sprites={64,65},fps=2,loop=true},flip_x=false,flip_y=false,time_start=0,effect="none",last_frame=0,rot_speed=1},phase="idle"}if(n.parent_mgr)n.parent_mgr:add(n)
return f(n,d)end,update=function(n)end,draw=function(n)n:draw_sprite()end,del=function(n)n.destroyed=true if(n.parent_mgr)n.parent_mgr:del(n)
end,draw_sprite=function(o)if(n6)local n=o:hitbox_pos(0,0)rect(n.x,n.y,n.x2,n.y2,8)
local n=o.spr if(n.effect=="blink_white")local n=time()%.2<.1if(n)for n=0,15do pal(n,7)end
local e,l=n[o.phase],nil if e.ss~=nil do l=e.ss else if e.loop~=nil and e.loop==false and e.sprites[#e.sprites]==n.last_frame do l=n.last_frame else if(n.time_start==nil or n.time_start==0)n.time_start=time()
l=e.sprites[1+flr((time()-n.time_start)/(1/e.fps))%#e.sprites]end end if n.effect=="rotx"or n.effect=="roty"do local e,f,d=8,8,n.rot_speed or 1if(n.effect=="roty")e=cos(t()*d)*8else f=cos(t()*d)*8
sspr(l%16*8,flr(l/16)*8,8,8,o.x+4-e/2,o.y,e,f,false,false)else spr(l,o.x,o.y,1,1,n.flip_x or false,n.flip_y or false,7)end pal()n.last_frame=l end,collide=function(n,e,o,l)local n,e=n:hitbox_pos(0,0),e:hitbox_pos(0,0)if(o~=nil)n.x+=o n.x2-=o e.x+=o e.x2-=o
return not(n.x2<e.x or n.x>e.x2 or n.y2<e.y or n.y>e.y2)end,hitbox_pos=function(n,e,o)e,o=e or 0,o or 0return{x=n.x+e+n.hitbox.x,y=n.y+o+n.hitbox.y,x2=n.x+e+n.hitbox.x2,y2=n.y+o+n.hitbox.y2}end}d.__index=d o={new=function()local n={}n.objs={}n.update_in_pause=false return f(n,o)end,restart=function(n)n.objs={}end,add=function(n,e)add(n.objs,e)end,del=function(n,e)del(n.objs,e)end,update=function(n)if(i.paused and not n.update_in_pause)return
for n in all(n.objs)do n:update()end end,draw=function(n)for n in all(n.objs)do n:draw()end end}o.__index=o function m(o,n,e)local l,e=e or o.speed,e or o.speed local l,t=n==s and-l or(n==g and l or 0),n==j and-e or(n==G and e or 0)local e=o:hitbox_pos(l,t)if n==g or n==s do local n=n==s and e.x or e.x2 local t,n=x(n,e.y),x(n,e.y2)if(not t and not n)o.x=o.x+l return 1else return 0
elseif n==j or n==G do local n=n==j and e.y or e.y2 local l,n=x(e.x,n),x(e.x2,n)if(not l and not n)o.y=o.y+t return 1else return 0
end end function I(n,e,o,l)local n=H(n,e,o,l)return ni(n.tile)end function n3(e,o)for l in all(k)do local n=l:hitbox_pos(0,0)if(e>=n.x and e<n.x2 and o>=n.y and o<n.y2)return l
end return nil end function x(n,e,o,l)return I(n,e,o,l)or n3(n,e)~=nil end function ni(n)return fget(n,n8)end function en(n,e)local n=mget(n,e)return ni(n)end function ee(n,e,o,l)return{x=flr(rnd(n or 15))+(o or 0),y=flr(rnd(e or 15))+(l or 0)}end function b()return A[l]end function eo()local n=b().gems return l==#A and a.gems==n-1end function el(e,o)local n=H(a.x,a.y)return n.tx==e and n.ty==o end function e(n,e,o,l,t,f,d)return{name=n,desc1=e,desc2=o,price=l,used=false,reusable=f,enable_after_stage=t or 1,fn=d or nil}end function w(n,e,o,l)return{name=n,music=e,theme=n7[o],gems=l}end function n9(e,n)local n={[nm]=n.tile_maps[2],[ng]=n.tile_maps[1],[np]=n.tile_maps[2],[nz]=n.tile_maps[5],[ny]=n.tile_maps[4],[nx]=n.tile_maps[1],[nb]=n.tile_maps[3],[nD]=n.tile_maps[1],[n_]=n.tile_maps[1],[nk]=n.tile_maps[5],[nw]=n.tile_maps[4],[nv]=n.tile_maps[1],[nj]=n.tile_maps[1],[nG]=n.tile_maps[1],[nA]=n.tile_maps[3],[nq]=n.tile_maps[1]}return n[e]end function nB(o,f,t)local n,l=0,0for e=1,#o,2do local d,e=sub(o,e,e),sub(o,e+1,e+1)local e=ord(e)-32for e=1,e do t[l][n]=d n=n+1if(n>=f)n,l=0,l+1
end end return t end function nC()local o,n=n4[l],b()local r,n,e=n.theme if(n0)n,e=(#J[1]+1)/2,#J else n,e=128,32
local f=nh(e,n,"")if n0 do for e=0,e-1do for o=0,n-1do local n=(o+1)*2-1local n=sub(J[e+1],n,n)if(n==" ")n="0"
f[e][o]=n end end else nB(o,n,f)end local d,i=i.mgr.enemy_mgr,i.mgr.misc_mgr for l=0,e-1do for t=0,n-1do local n=f[l][t]mset(t,l,0)local e,o=t*8,l*8if n=="1"do local n=nH(f,t,l)local n=n9(n,r)or 1mset(t,l,n)elseif n=="f"do a.x,a.y=e,o elseif n=="a"or n=="b"do K.new(e,o,n=="a",d)elseif n=="6"do L.new(e,o,i)elseif n=="7"do elseif n=="8"do elseif n=="e"do M.new(e,o,d)elseif n=="s"do N.new(e,o,d)elseif n=="v"do O.new(e,o,d)elseif n=="A"or n=="B"or n=="C"or n=="D"do P.new(e,o,ord(n)-ord"A"+1,i)end end end end function nH(o,n,e)local l,t,f=#o-1,#o[0]-1,e>0and o[e-1][n]=="1"or e==0local l,d,e,n=e<l and o[e+1][n]=="1"or e==l,n>0and o[e][n-1]=="1"or n==0,n<t and o[e][n+1]=="1"or n==t,0if(f)n+=1
if(l)n+=2
if(d)n+=4
if(e)n+=8
return n end Q={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,update=function(n)n.x+=(a.x-n.x)*n.csfx n.y+=(a.y-n.y)*n.csfy local n,e=n:calc_center()camera(n,e)end,place=function(n,e,o)n.x=e n.y=o end,calc_center=function(n)return flr(n.x)-n.ox,flr(n.y)-n.oy end}R={new=function(n,e)local n=d.new(n,e)n.name="player"n.spr={idle={sprites={64,65},fps=2},walk={sprites={80,81,82},fps=6},jump={sprites={97,98,99,100,101,102},fps=8},dead={sprites={68,69,70,71,72},fps=4,loop=false},flip_x=false,flip_y=false,time_start=0,effect="none"}n.invisible=false n.blocked=false n.invulnerable=false n.nodmg_t=nil n.jforce=1.7n.jstack=0n.max_jstack=15n.speed_y_decay=.95n.speedy=0n.max_speedy=2n.phase="idle"n.hitbox={x=2,y=3,x2=5,y2=7}n.max_speed=1n.speed=0n.init_speed=.1n.inc_speed_factor=.2n.prev_btn={}n.life=20n.max_life=20n.init_max_life=20n.coins=0n.stinky_socks=false n.cur_el=nil n.avail_elements={false,false,false,false}n.el_cooldown=r.new(1,false)n.shine_star=0n.interaction_fn=nil return f(n,R)end,reset_stage_props=function(e)local n=e n.speed=0n.phase="idle"n.invisible=false n.blocked=false n.invulnerable=false e:reset_jump_vars()n.gems=0end,update=function(o)if(i.paused)return
local n=o if n.phase=="dead"do if(n.prev_btn.left)m(n,s)
if(n.prev_btn.right)m(n,g)
n.speed=n.speed*.9n:apply_forces()return end local e={left=btn(0,0),right=btn(1,0),jump=btn(4,0),jump_start=btnp(4,0),action=btnp(5,0)}if not n.blocked do if(e.left)n:move_left()
if(e.right)n:move_right()
if(not e.left and not e.right)n.speed=n.speed*.7if(n.speed<.1)n.speed=0
n:apply_forces(e)end n.prev_btn=e if(e.left==false and e.right==false and n:on_ground())n.phase="idle"
if(n.nodmg_t~=nil)if(n.nodmg_t:adv())n.spr.effect="none"n.invulnerable=false
if(e.action)if(o.interaction_fn~=nil)o.interaction_fn=nil else o:attack()
if(o.el_cooldown:adv())o.shine_star=10
o.interaction_fn=nil end,draw=function(n)local e=n if(e.invisible)return
e:draw_sprite()if(n.shine_star>0)line(n.x+3,n.y-1,n.x+5,n.y-1,10)line(n.x+4,n.y-2,n.x+4,n.y,10)n.shine_star-=1
end,dmg=function(n,e)local n=n if(not n.invulnerable)n.life-=e if(n.life<=0)n.phase="dead"n.invulnerable=true i.game_over_msg=rnd(i.game_over_msgs)i:set_game_over()else n.nodmg_t=r.new(1)n.spr.effect="blink_white"sfx(nU)n.invulnerable=true
end,increase_life=function(n,e)local n=n n.life=min(n.life+e,n.max_life)end,inc_speed=function(n,e)local n=n if(e)n.speed=n.init_speed else n.speed=min(n.speed+n.inc_speed_factor,n.max_speed)
end,move_left=function(e)local n=e e:inc_speed(not(n.prev_btn.left or false))m(n,s)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=true end,move_right=function(e)local n=e e:inc_speed(not(n.prev_btn.right or false))m(n,g)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=false end,apply_forces=function(n,e)if(not n.blocked and e.jump_start)n:set_start_jump()
if(not e.jump and n.jstack>0)n.jstack=0
if(n.jstack>0)n.speedy=-n.jforce n.jstack-=1
if(n.speedy<0and not e.jump)n.speedy*=n.speed_y_decay
n.speedy+=nE n.speedy=min(n.speedy,n.max_speedy)local e=m(n,n.speedy<0and j or G,abs(n.speedy))if(e==0)n:reset_jump_vars()if(n.phase=="jump")n.phase="idle"
end,reset_jump_vars=function(n)n.speedy=0n.jstack=0end,set_start_jump=function(n)if(n:on_ground())n:reset_jump_vars()n.phase="jump"n.spr.time_start=nil n.jstack=n.max_jstack if(nF)sfx(nI)
end,on_ground=function(n)local n=n local n=n:hitbox_pos(0,1)local e,n=x(n.x,n.y2),x(n.x2,n.y2)return e or n end,apply_end_stage_upgrades=function(n)end,attack=function(n)if(n.el_cooldown.t<=0)S[n.cur_el].new(n.spr.flip_x and s or g,i.mgr.misc_mgr)n.el_cooldown:restart()
end,switch_element=function(e)local n=e.cur_el%4+1while true do nt("s1: "..n)if(e.avail_elements[n])e.cur_el=n q.new(30,S[n].name,i.mgr.hud_mgr)break
n=n%4+1end end}n(R,d)h={new=function(e,n,o,l,t)local n=d.new(n,o,t)n.etype=e n.hitbox={x=2,y=2,x2=5,y2=5}n.hitbox_orig=n.hitbox n.speed=l or 1n.life=100n.time_last_death=0n.respawn_timer=r.new(10,false)n.dmg_time=r.new(1,false)n.frozen_t=r.new(20,false)n.frozen_t.t=0n.dir=nil n.wspeed=0n.dir_before_blow=nil n.fixed=false return f(n,h)end,dmg=function(n,e)if(n:is_inv())return
n.life-=e n.dmg_time:restart()n.spr.effect="blink_white"if(n.life<=0)n:del()
end,freeze=function(n)n.frozen_t:restart()add(k,n)n.hitbox={x=0,y=0,x2=7,y2=7}end,unfreeze=function(n)n.frozen_t.t=-1n.spr.effect="none"del(k,n)n.hitbox=n.hitbox_orig end,blow=function(n,e)if(n.fixed)return
if(n.wspeed<=0)n.dir_before_blow=n.dir
n.wspeed=2n.dir=e end,unblow=function(n)n.wspeed=-1n.dir=n.dir_before_blow end,update=function(n)d.update(n)if(n.dmg_time:adv())n.spr.effect="none"
if(n.frozen_t:adv())n:unfreeze()else if(n.frozen_t:t_left_btw(.1,2))n.spr.effect="blink_white"
if(n.wspeed>0)local e=m(n,n.dir,n.wspeed)n.wspeed=e==0and 0or max(0,n.wspeed-.05)else if(n.wspeed~=-1)n:unblow()
end,draw=function(n)if(n.frozen_t.t>0)spr(139,n.x,n.y)
d.draw(n)end,del=function(n)n.time_last_death=time()del(k,n)d.del(n)end,is_inv=function(n)return false end}n(h,d)K={new=function(n,e,o,l)local n=h.new("bat",n,e,.3,l)n.spr={idle={sprites={128,129},fps=4,loop=true},flip_x=false,flip_y=false,frame=0}n.horizontal=o n.hitbox={x=2,y=2,x2=5,y2=5}n.dir=n.horizontal and g or G n.dir_before_blow=n.dir return f(n,K)end,update=function(n)h.update(n)if(n:collide(a))a:dmg(1)
if(n.frozen_t.t>0)return
local e=m(n,n.dir)if(e==0)n.dir=(n.horizontal and 0or 2)+(n.dir+1)%2
end}n(K,h)D={new=function(e,o,l,t,n)local n=h.new("dog",e,o,1.5,n)n.spr={idle={sprites=l,fps=2,loop=true},run={sprites=t,fps=4,loop=true},flip_x=false,flip_y=false,frame=0}n.speed=a.stinky_socks and.2or.4n.hitbox={x=0,y=3,x2=7,y2=7}n.hitbox_orig=n.hitbox n.basex=e n.basey=o return f(n,D)end,update=function(n)h.update(n)n.phase="idle"if(n.frozen_t.t>0)return
if n:collide(a,2)do a:dmg(2)i.mgr.player_msg_mgr.dog_bites+=1else if abs(a.x-n.x)<50and abs(a.y-n.y)<4do n.spr.flip_x=a.x-n.x>0local e=a.x-n.x>0and g or s local o,l=e==g and n.x+n.speed+7or n.x-n.speed,n.y+8if(I(o,l))if(not I(o,n.y))m(n,e)n.phase="run"
else if(abs(n.basex-n.x)>3)n.spr.flip_x=n.basex-n.x>0m(n,n.basex-n.x>0and g or s)n.phase="run"
end end end}n(D,h)M={new=function(n,e,o)local n=D.new(n,e,{144,145},{146,147},o)return f(n,M)end}n(M,D)N={new=function(n,e,o)local n=D.new(n,e,{160,161},{162,163},o)return f(n,N)end}n(N,D)O={new=function(n,e,o)local n=h.new("vine",n,e,0,o)n.spr.idle={ss=6}n.fixed=true n.life=10add(k,n)return f(n,O)end,is_inv=function(n)return not(a.cur_el==nr)end}n(O,h)T={new=function(n,e,o,l)local n=d.new(n,e,l)n.spr.idle={sprites={185,186,187},fps=4}n.max_radius=o or 4n.ttl=r.new(.2,false)n.solid=false return f(n,T)end,update=function(n)if(n.ttl:adv())n.parent_mgr:del(n)
end,draw=function(n)if(n.ttl.t<=0)return
local e=nf(0,n.max_radius,1-n.ttl.t/n.ttl.maxtime)circfill(n.x,n.y,e,10)end}n(T,d)u={new=function(t,e)local o,l=a.x+(e==s and-2or 10),a.y+4local n=d.new(o,l,i.mgr.misc_mgr)n.damage=10n.ttl=r.new(.3,false)n.origx,n.origy=o,l n.max_dist=20n.dir=e n.el=t n.destroy_req_prev_frame=false return f(n,u)end,update=function(n)if(n.destroy_req_prev_frame)n:del()return
if(n.ttl:adv())n.destroy_req_prev_frame=true
n.x=E(n.origx,n.max_dist,n.ttl,true,n.dir)for e in all(i.mgr.enemy_mgr.objs)do if(n:collide(e))n:effect(e)n:del()T.new(n.x,n.y,4,i.mgr.misc_mgr)break
end end,dirmult=function(n)return n.dir==s and-1or 1end,effect=function(n,e)e:dmg(n.damage)end}n(u,d)V={name="fire",new=function(n,e)local n=u.new(nr,n)n.radius=1n.max_radius=2return f(n,V)end,update=function(n)u.update(n)if(n.ttl.t>0)n.radius=E(1,n.max_radius,n.ttl,true)
end,draw=function(n)local o,l={1,2,9,8},n:dirmult()for e=0,3do local t,l=e/3*n.radius,l*e*2circfill(n.x+l,n.y,1.5*t,o[e+1])end end,effect=function(e,n)n:unfreeze()n:dmg(e.damage)end}n(V,u)W={name="ice",new=function(n,e)local n=u.new(nJ,n)n.radius=1n.max_radius=1.5return f(n,W)end,update=function(n)u.update(n)if(n.ttl.t>0)n.radius=E(1,n.max_radius,n.ttl,true)
end,draw=function(n)local o,e={12,6},n:dirmult()rectfill(n.x+e*0-n.radius,n.y-n.radius,n.x+e*0+n.radius,n.y+n.radius,rnd(o))end,effect=function(e,n)n:freeze()end}n(W,u)X={name="thunder",new=function(n,e)local n=u.new(nK,n)n.spr.idle={ss=59}n.ttl=r.new(.2,false)n.max_dist=25return f(n,X)end,draw=function(n)local e,o,l=n.origx,n.origy,n:dirmult()while true do local t,f=e+4*l,o+(rnd(4)-2)line(e,o,t,f,7)e,o=t,f if(l==1and e>n.x+1)break
if(l==-1and e<n.x-1)break
end end}n(X,u)Y={name="wind",new=function(n,e)local n=u.new(nL,n)n.spr.idle={ss=60}n.ttl=r.new(.7,false)n.max_dist=25n.power=20return f(n,Y)end,draw=function(n)local t,e,l=n:dirmult(),nil,nil for o=0,12do local t=.5+n.x+o*.8*t local f,d=t*.25,1+o*.25local t,n=t+cos(f)*d,n.y+sin(f)*d if(e~=nil)local o=o%2==0and 12or 6line(e,l,t,n,o)
e,l=t,n end end,effect=function(n,e)e:blow(n.dir)end}n(Y,u)z={new=function(n,e,o)local n=d.new(n,e,o)n.show_int_button=false n.ttl_disable_int=nil n.int_done=false n.solid=true return f(n,z)end,update=function(n)if(n:collide(a))n.show_int_button=true a.interaction_fn=n.interact local e=n.ttl_disable_int if btnp(5,0)and not n.int_done do n:interact()elseif n.int_done and e==nil do n.ttl_disable_int=r.new(.5,false)elseif e and e:adv()do n.int_done=false n.ttl_disable_int=nil end else n.show_int_button=false
end,draw=function(n)n:draw_sprite()if(n.show_int_button)?"❎",n.x+2,n.y-6,12
end,interact=function(n)n.int_done=true end}n(z,d)L={new=function(n,e,o)local n=z.new(n,e,o)n.spr.idle={ss=11}return f(n,L)end,interact=function(n)a:switch_element()end,draw=function(n)pal(7,n2(.5)and nM[a.cur_el]or 7)z.draw(n)pal()end}n(L,z)P={new=function(n,e,o,l)local n=z.new(n,e,l)n.spr.idle={ss=12}n.el=o n.oy=e return f(n,P)end,update=function(n)z.update(n)n.y=n.oy+sin(time())*2end,interact=function(n)a.cur_el=n.el a.avail_elements[n.el]=true q.new(30,S[n.el].name.." acquired",i.mgr.hud_mgr)n:del()end}n(P,z)Z={new=function()local n=o.new()return f(n,Z)end}n(Z,o)p={new=function(e,o,n)local n=d.new(e,o,n)n.fixedx,n.fixedy=e,o return f(n,p)end,update=function(n)local e,o=Q:calc_center()n.x=n.fixedx+e n.y=n.fixedy+o end}n(p,d)y={new=function(n,e,o,l)local n=p.new(n,e)n.draw_fn=l n.bgl=o n.spr.idle={ss=137}return f(n,y)end,draw=function(n)rectfill(n.x,n.y,n.x+n.bgl,n.y+5,1)n.draw_fn(n)end}n(y,p)nn={new=function(n,e)local n=p.new(n,e)n.spr.idle={ss=169}n.life_ref=a.init_max_life return f(n,nn)end,draw=function(n)local e=30*a.max_life/n.life_ref rectfill(n.x,n.y+1,n.x+e+10,n.y+6,1)n:draw_sprite()nl(n.x+10,n.y+2,e,3,a.life,a.max_life,1,8)end}n(nn,p)q={new=function(n,e,l)local o=122-#e*5local n=p.new(o,n,l)n.msg=e n.final_pos=o n.fixedx=n.final_pos+250n.ttl_live=r.new(2,false)n.offset=0return f(n,q)end,update=function(n)if(n.ttl_live:adv())n:del()return
local e=abs(n.fixedx-n.final_pos)n.fixedx=e<2and n.final_pos or n.fixedx-e*.1p.update(n)end,draw=function(n)rectfill(n.x-2,n.y-2,n.x+126,n.y+7,1)rect(n.x-2,n.y-2,n.x+126,n.y+7,14)?n.msg,n.x,n.y,8
end}n(q,p)ne={new=function()local n=o.new()n.update_in_pause=true return f(n,ne)end,restart=function(n)n.objs={y.new(8,1,30,function(n)spr(150,n.x,n.y-1)?tostr(a.gems).."/"..tostr(b().gems),n.x+10,n.y+1,8
end),y.new(94,1,25,function(n)spr(138,n.x,n.y-1)?tostr(a.coins),n.x+10,n.y+1,8
end),y.new(49,1,35,function(n)?"stage "..tostr(l),n.x+1,n.y+1,8
end),nn.new(10,120)}nt"HUD mgr restarted"end}n(ne,o)no={new=function()local n=o.new()n.dog_bites=0n.msg={{function()return a.coins>0end,"collect this coins*to buy something*at the shop later."}}return f(n,no)end,update=function(e)for n in all(e.msg)do local o,l=n[1],n[2]if(o())i.mgr.hud_mgr:add_popup(l)del(e.msg,n)
end end}n(no,o)poke(24412,-1)n6=false n1=true C=60nF=true nN=true nE=.25s,g,j,G=0,1,2,3nr,nK,nJ,nL=1,2,3,4nM={8,10,12,13}S={V,X,W,Y}n8=0i=nil a=nil nc="microvania/logs/log"nI,et,ef,ed,ei,nU=0,1,2,3,4,5k={}l=1n0=false J={}nm,ng,np,nz,ny,nx,nD,n_,nk,nw,nb,nv,nj,nG,nA,nq=0,1,2,4,8,3,5,9,6,10,12,7,11,13,14,15n7={metal={tile_maps={1,2,3,4,5},bg_col=-15},sand={tile_maps={17,18,19,20,21},bg_col=12},grass={tile_maps={33,34,35,36,37},bg_col=0},ice={tile_maps={49,50,51,52,53},bg_col=-15}}A={w("hello pris... ehm subject n.6",13,"grass",0),w("we do this for you",6,"metal",15),w("time to breath fresh air",0,"grass",15),w("portals are funny, isn't it?",6,"grass",20),w("do not fear cutie dogs",0,"sand",20)}local n=function()a.max_life=flr(a.max_life*1.1+.5)end n5={e("tasty chicken","+5 health","",10,1,true,function()a:increase_life(5)end),e("pizza with salami","+7 health","",20,1,true,function()a:increase_life(7)end),e("dna mod #1","+10% max health","",55,1,false,n),e("dna mod #2","+10% max health","",75,5,false,n),e("dna mod #3","+10% max health","",95,8,false,n),e("dna mod #3","+10% max health","",115,10,false,n),e("haste","+25% speed","",60,3,false,function()a.max_speed*=1.25end),e("super haste","+25% speed","",120,7,false,function()a.max_speed*=1.25end),e("greed chip #1","+1 coin*every gem taken","i can understand*your needs",100,3,false,function()a.coin_inc+=1end),e("greed chip #2","+2 coin*every gem taken","maybe you can buy*a house someday",150,7,false,function()a.coin_inc+=1end),e("stinky socks","dogs are reluctant*to hunt you","slows down dogs*hunting you",110,5,false,function()a.stinky_socks=true end)}e0={}function _init()i=B.new()end function _update60()i:update()end function _draw()i:draw()end B={new=function()local n={paused=false,win_stage=false,win_game=false,menu=true,play=false,stage_title_phase=false,require_player_rebuild=true,mgr={enemy_mgr=o.new(),misc_mgr=Z.new(),hud_mgr=ne.new(),player_msg_mgr=no.new()},shop=nil}n.game_over_msgs={"the experiment failed!","another subject please!","sorry, you are not qualified!"}n.game_over_msg=""menuitem(1,"restart game",function()i:start_menu()end)return f(n,B)end,start_play=function(n)n.win_stage=false n.menu=false n.play=true if(n.require_player_rebuild)a=R.new(0,0)n.require_player_rebuild=false
n.game_over=false a:reset_stage_props()for e,n in pairs(n.mgr)do if(n.restart)n:restart()
end nC()Q:place(a.x,a.y)if(nN)music(b().music)
end,setup_final_event=function(n)end,setup_win_lose_stage=function(n)if a.gems==b().gems do n.win_stage=true n.win_game=l==#A if(n.win_game)music(11)
a:apply_end_stage_upgrades()else n.game_over_msg="you didn't collect all gems!"n:set_game_over()end end,start_menu=function(n)n.menu=true n.play=false n.game_over=false n.win_stage=false n.win_game=false l=1end,start_shop=function(n)n.menu=false n.play=false n.shop=v.new(64,64)end,shop_to_play=function(n)n.shop=nil n:start_play()end,set_game_over=function(n)n.play=false n.win_stage=false n.game_over=true end,update=function(n)if n.menu do if(btnp(5,0))n.require_player_rebuild=true n:start_play()
return end if(n.shop)n.shop:update()return
if n.win_game or n.game_over do if(btnp(5,0))n:start_menu()
return end if n.win_stage do if(not a.prev_btn.up and btnp(5,0))l=l%#A+1n:start_shop()
return end if(i.stage_title_phase)n.mgr.hud_mgr:update()return
Q:update()for e,n in pairs(n.mgr)do if(n.update)n:update()
end a:update()end,draw=function(n)if(n.menu)cls(8)rectfill(0,40,127,80,0)local n=t()line(134-flr(n/.05%130),62,140-flr(n/.05%130),62,9)line(140-flr(n/.03%130),60,145-flr(n/.03%130),60,9)line(130-flr(n/.02%130),64,135-flr(n/.02%130),64,9)spr(80+flr(n/.1%3),60,58)line(0,40,127,40,7)line(0,80,127,80,7)c("* new title here! *",64,50,7)c("press (❎) to start",64,70,U(1,{7,0}))return
if(n.shop)cls(8)n.shop:draw()return
cls(b().theme.bg_col)map(0,0,0,0,128,32,false)n.mgr.misc_mgr:draw()n.mgr.enemy_mgr:draw()a:draw()n.mgr.hud_mgr:draw()if n.win_game do _(64,64,120,55,1)c("congratulations!",64,55,10)c("you survived!",64,65,10)c("press (❎) to restart",64,75,U(1,{10,0}))elseif n.win_stage and not n.game_over do _(64,64,107,25,1)c("stage cleared!",64,55,10)c("press (❎) for the shop",64,65,10)elseif n.game_over do _(64,64,120,55,1)c("game over",64,55,8)c(n.game_over_msg,64,65,8)c("press (❎) to restart",64,75,U(1,{8,0}))end end}B.__index=B
__gfx__
00000000dddddddd6ffffff6ffffffffffffffffffffffff30030003000000000000000000000000000000000006d00009999990000000000000000000000000
00000000d7ddd66df5dddd5fddddddddfddddddddddddddf06003033000000000000000000000000000000000006660099777790000000000000000000000000
00700700dddddd6ddddddddddddddddddddddddddddddddd03006030000000000000000000000000000000000066d60099999990000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd03303063000000000000000000000000000000000d67766097777790000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd0b333b03000000000000000000000000000000000677776009666699000000000000000000000000
00700700d7ddddddd7ddddddddddddddddddddddddddddddb63b3bb3000000000000000000000000000000000677776d09777779000000000000000000000000
00000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d33bbb3b60000000000000000000000000000000066677d6609999999000000000000000000000000
00000000dddddddddddddddddddddddddddddddddddddddd33333333000000000000000000000000000000006d66666d09666690000000000000000000000000
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
