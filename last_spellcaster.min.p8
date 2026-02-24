pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
poke(24412,-1)na=false nc=true nu="last_spellcaster/logs/log"Q=60O={}function n(e,n)local e,t=unpack(split(e,":"))O[e]=n n.__index=n setmetatable(n,O[t])n.new=function(...)local t=n.__new(e,...)t.__name=e setmetatable(t,n)return t end n.super=O[t]return n end n0={}function a(t,i,l)t,l=t or{},l or{}local function d(t)local n=1while n<=#t and(sub(t,n,n)==" "or sub(t,n,n)=="\n"or sub(t,n,n)=="	")do n+=1end local e=#t while e>=n and(sub(t,e,e)==" "or sub(t,e,e)=="\n"or sub(t,e,e)=="	")do e-=1end if(n>e)return""
return sub(t,n,e)end local e,n=1,#i while e<=n do while e<=n do local n=sub(i,e,e)if(n~=" "and n~="\n"and n~=";"and n~="	")break
e+=1end if(e>n)break
local r,f,o=e,0,nil while e<=n do local n=sub(i,e,e)if(n=="{")f+=1
if(n=="}")f-=1
if f==0do if(n=="="and not o)o=e
if(n==";"or n=="\n")break
end e+=1end local f,n if(o)f,n=d(sub(i,r,o-1)),d(sub(i,o+1,e-1))else n=d(sub(i,r,e-1))
local e local i=sub(n,1,1)if i=="{"and sub(n,-1)=="}"do e=a({},sub(n,2,#n-1),l)elseif i=="*"do local n=tonum(sub(n,2))e=l[n]elseif sub(n,1,3)=="_k_"do local n=sub(n,4)e=t[n]elseif sub(n,1,4)=="_fn_"do local n=split(sub(n,5),"_")e=n0[n[1]](#n>=2and n[2]or nil)elseif n=="true"do e=true elseif n=="false"do e=false elseif n=="nil"do e=nil else e=tonum(n)if(e==nil)e=n
end if f and f~=""do t[f]=e elseif n~=""do add(t,e)end end return t end function G(n,e)n0[n]=e end function f(e,t)local n={}a(n,e,t)return n end function X(n,e)return unpack(f(n,e))end k=n("c_timer",{__new=function(t,n,e)local n={maxtime=flr(Q*n),t=flr(Q*n),loop=e or false}return n end,adv=function(n)if(n.t<0)return false
n.t-=1local e=false if(n.t==0)e=true if(n.loop)n.t=n.maxtime else n.t=-1
return e end,restart=function(n)n.t=n.maxtime end,t_left=function(n)return flr(n.t/Q)end,t_left_btw=function(n,e,t)local n=n:t_left()return n>=e and n<=t end})function ns(t,i,n,e)n,e=n or 8,e or 8local t,i=flr(t/n),flr(i/e)return{tile=mget(t,i),tx=t,ty=i,ox=t*n,oy=i*e}end function nh(n,e,t,i,o,l,f,d)rectfill(n-1,e-1,n+t+1,e+i+1,f)local t=mid(0,flr(o/l*t),t)rectfill(n,e,n+t,e+i,d)end function P(n)if(not nc)return
printh(n,nu or"mainlog")end function E(n,e,t,i)?n,e-#n*2,t,i
end function n1(t,e,i)local n={}for e=0,e-1do n[e]={}for t=0,t-1do n[e][t]=i end end return n end function A(n,e,t)local n=n+t*(e-n)return n end function n2(e,t,n,i,o)local n=n.t/n.maxtime if(i)n=1-n
return A(e,e+(o==l and-1or 1)*t,n)end function p(n,t)if(n==nil or n=="")return false
for e=1,#n do if(sub(n,e,e)==t)return true
end return false end n_={[[1R0#4!0$4!0$4!0$b!0%b!0#4#0'4!1$Z"1"0*g!0%g!0%b!011$Z!0!1"0!1"0!1:0*1$0#1!0"a!0!1=0'1$b!0"1!0"1"0!1%0"1)0%4#0#1!0'1$0#1!0" !0#1#0&4#0.1#0%1$0#1!0!1"0$1!0:1!Y"0#h$0#1!a!0*5!0'5!0)1&Y"0#1(0"1"0&1%0!1!0!1$0+b!1%C!1(0! !0'1#0$1!0#1#001)0!1"0%1"0&1"0!1!0"1"0)a!0%1"0!a!0$1!0!2!3!2!3!0"1"0$Q!0#M!0!1!0#1"0"5!0!2!0!2!0#5!0"Z!h"0&1)0#d!1(0$110&1!0%1#0,X"0"1"A!0(b!0%g!0"1$0%1#6!0!1"0!1"0"1"0!1"0"1%0%b!0"1(0"1#0!1!0"4!1"0$b!0$b!0$1"0(b!0"1"0)1!0#1"0"4!1"0$b!1"b!0$1#0!1+0*1!0"1!0%4!1#0(1#0$1!0&1!0'1"0#1!0"1!0!5!0%Z!1$0"1$0$1!0!1!0&1!0,1!0!1.0"1#X!0&1!0"1"0"1!0,1!0(1(0!1#X!0&1"0"1!0"1!0'3!g"0"1"0)1$0$1"X!0#1"0"1!0"1!0(1(0+1$B!0!1#X!0$1!0%1!2!0"2!0#1"0&1#0$c!0$1,0"1/0'1!0'c!0$1'0"h"0"h"0#1#0#b!0*1$0"1$0!1(0#1&0#1!0&b!0)1!0(b!0%1#05b!0(1'0)1"06b!0'1"0"Z!1"0)b!0/1%0)3!1#0"Z!W"0$5!0!X"0"g!0!e!0#X"0"5!0"1(0"5!0#f!0!1$0!1M]],[[1P0!b!0+4#0$1!0#X"0$1!0'4!0!4!0!4"081!0!1&0!b!0F1!0&1!0H1&0!1!0O1!0H1+0-2!0!3!0$2!0/1!X!0"4#0$X!1!0+1*0!p!0"f!0"5!0#6!0!1!X!0*1!0'2"0!19X!0*1!0#1-0!14X!0!g!0#g!0&1*0,a!0*150!4"0.e!0*1.0!4!0!4!001'0'b!0#b!0#b!001#0"1%0!b!0D4"0*b!0$1#0Ib!0)1#0!1!0"1#0!1!0"1#0Gb!0&4!0+1#0)b!0:1#0(4!0$2!0"2!0#2!084"0%1#0%1*0?b!4!0%1!0(1!0C1$0"1!0!1!0!1!0!1"0;b!031!0"2!0!e!0!e!0!3!0-1#0,1!0!1!0!1!0#1!0!1,03b!0;1!0!3!0"e!0"3!0!3!0/1!0#a!0"1"0"1!0"1!0'1-0=1!0%4"b!0!b!0!b!0!b!0#1!0"g!0!3!0!3"0$2!0B1+0!1"0$1!0>4!0!4!0"4!0#1%0"1#0!g!0#5!0#5!0"g!2!0$2!b!0!b!0!b!0!b!0.170!18]],[[1P0"4"0!4!0!4!0,X!0%4!0%Y!0#1,0>1$0"4!1+0*1"0!a!0"1$0!1!a!0!1#0!a!0(4!1*0F1*0/2!0#2!0#2!0$3!0$3!0$1*0"2!0!f!0#1=0!1L0$1*03b!0&Z!1'0!1-0=1%0$1*0&1!0"X#0$X"0,1$0$1*0&1!0!1%0"1$0!1"0%a!0#1#0!1"0!1*0&1!0)4"0.1"0$1*0&1!001"0'1!4!0"1,0&1#0"a!Z!b!021!0%1*0(1"0.b!0!1"0!a!0#1"a!0"1*0)1!004!0&1!0$110"1!031%0#1+0"b!0"b!0#1!0-1"0!1"0"4!0!1!0%1*0)1"0-b!0'1#0!a!0!1*0#b!0&1!0)1"0*1!0%1*0&b!0#1"051!0"1,0+1!0&1"0-1!0$1*0"b!0(1#0#2!0$2!0#e!0!5!0#X!1!2!0#1*0%b!0'1!0"13X"0!1*0#b!0)1"0#4!0!4!0!1#4"1#4!0"1$0!1*0.1"0'1#0!4!1!4!0$1"0"1*0&b!014"0)1!0!1+0"3!0"3!0"2!0"2!0#1&0.1!0"180!1'0$1"0'1"0!1*051"0!3!0%g!0!3!0%1<0"1<]],[[1"0!1O0#b!0"b!0*d!0!d!091$0#b!0-b!0!b!0,a!0+1"0&b!0&1)081"0'130+1'0"1/0)1)0&1!0"a!0%1*021'0#1!0&a!0"1"051"0(1#0!1!0$1(0?1"0"1$0'1"0)a!0(1"0&a!0$1"0"1!0*1#0?1"0"1!0#1(0/1"0/1#0"1!0"a!0%1"0@1"0$1!0'1"021"0,1"Q!0$1!0"1&0@1&0"1!0!c!0#1"051"0)M!0!h$0!6!1!0%1"021"0,1*0$1#0%m!0(1"0.1*0"1%0,1"016!1"0"1%0%1"0>1#0%1#0!c!0#1"0&a!0#1"0+a!0&1"c!0&1#0$1)071"0"1!0$1$0#1/0%e!0(1%0!c!0%1#0$1"0"h!0%180$c!0"1"0%1"0"h!0'd!0"1)0#d!0#1#0"1!0#1"0"1&0"h!0)d!0.d!0#1!0$c!0!1"0#f!M!0"1!0"h!0*g!0$a!0(g!0(1$0!1!0!1(0#1B0!1!6!0"Q!1"0"1!0'1!0'a!0&1#0&1&0!1"0"1#0"1"061!0(1$0"1!0"1!0!1"0#h!0(e!0'e!0(e!0+1!0$1L0!1$]],[[170!19Y"0"1!0C1!0#Y"1"X"0"1!01f!011!0#X"1%0!1!0/1%0/1!0!1&0N1"0$1"0B1"0$1"0#1"0,1"0'1"0-1"0#1"06X"061"0&c!0(100)c!0%1.0$1.0$190&1-0%170"1"0#1,0#1"0"1,06h"0#1"011"0"b!0&1$0)h"0#1"0$1$0&b!0"1"0#b!02h"0#1"0/b!0!1"0)6!0,1!h!0"1#011#0'1#0)1"Z!1!0!1!Z!1$0$1#0'1%0$1!0-1!Z!0%Z!1!0/1'0)1#0%1"Z!0!E!0!Z!1"0"d!0+1)011'0.1,001%0-1(0&1!001#041"0N1"0'd!0>d!0'1&0"1#0#1#0#d"0+1#0"1#0#1%0$i!0"i!0H1*0$i!0"g!0%6!0#i!0"i!0'1#0!1(0%g!0#1*0!100!1!0#1!0!1!0!1"0#1'0#6!0"h"Q!1!0!M!S!N!0!1!R!h"0$6!0$1!0"1!0!1!0!1$0!1!0'1!0!1,0!1*0!1#0!1!0!1!0!1!0!1"0%1!X!1!0!g!0#1%0#P!O!h!0%i!0!i!0!T!1!0%Y!1!0!1!0!150"1;]],[[120"1=0/1"0"1#031'00N!0#N!0"R!0!6!011&0"1"0)1-0(1&0#1$0#1#0'110)1#0#1#0"1%0%1-0.1$0"1#0#1%0#1-0'a!0*1"0"1"0#1&0!1-0'1"0*1#0!1#0"1&0!1,0(a!0+1"0"1"0#1&b!1+051"0"1"0#1&b!1*0,1"0(1"0!1#0"1'0!1)071"0"1"0#1&0!1)0+1"0*1"0"1"0#1&0!1)071#0!1#0"1&0"1(071"0"1"0"1(0#1&0)1"0%n!0&1"0"1"0#1"0#1#0#1&0/1!0&1"0!1#0#1!0%1#0#1&0%1"0.1"0"1"0"1"0%1$0#1&0+1!0#1!0$1"0"1"0#1!0%1%0#1&0"1!0)1!0&1#0!1"0#1!0%1&0#1&021"0"1#0"1!0&1&0#190"1"0#1!0&1'0#180!1#0#1"0&1'0#160#1$0!1&0#1'0'd!0"d!0.1#0"f!0!M!0!Q!0!6!1#0#1&0:1(0!1%0#1&0&d"0&1"0!1"0!1"0#1&0#1&0#1&00d!0#d!0#1%0#1(0#1&0$d"0#1"0,1$0$1)08d!0!d!0$1$0"1,0*d!0"d!001$0!1L]],[[1K0!1%021!0'1!0%1!0"1!0%1!0$1"0*1!0'1!0-1!0(1"0#1"0*1!0'1!0'1!0%1!0"1!0(1&0!1+0!1$0'1"0!1$0"1!0(f!0!1"0#1!0)1!0$1!0'1!0%1!0"1%0!1'0"1"0)1"0+1#0#1!0$1!0(1"0-1!0$1!0'1!0*1!0(1'0!1D0!1%0(1!0&1!0$1'0$1!0(1!0%1"0(1!061!0(1!0%1"0$1#0!1!0&1!0#1)0#1!0(1!0%1"0(1!0&1!0#1!0'1!0,1$0!1$0%1%0!1(0#1!0#1.0%1"0)1!071!0#1!0"1!0%1"0$1#0"1#0)1!0#1!0'1!0#1!0"1$0#1!0)1!0&1$0'1%0!1!0#1!0%1!0#1!0&1'0#1!0"1!0'1!0/1"0"1!0*1!0$1"0"1#0$1(0#1!0)1"0#1#0#1!0#1#001!0#1&0$1!0*1!0%1!0"1,0"1!0#1!0$1!0"1!0!1!0&1(0"1!001#0!1!0$1&0+1!0#1"021!0!1!0(1#0#1#0$1!0$1!021!0*1"0+1#0"1(0!140!1"0&1'0#1!0)1!0*1!0(1"0,1!0"1"0)1!0*1!0$1&0$1'0!1!0#1!0)1#0!1%0!1"0#1(0+1"0"1!0)1!0%1!0.1!0,1!0#1!0)1!0"1$0$1#0'1!0"1#0+1!0/1!0$1!0)1P]],[[130"1=0/1!0$1!021!0%1"001!0"f!0!1!0&1&6!0$Q!1!0$1#0"1,0"1!0$1!0"1$0&1'0!1!0#1"0-1"0!1!0$1!0"1#001!0"1"0,1!0#1!0$1!0!1#0"1%0*1!0!1-0!1!0$1!0$1!0%1!0%1+0"1"0+1!0#1!0&1!0#1!0"1!0.1!0!1"0+1!0"1!0(1!0"M!0!1!0!1!0/1"0!1+0"1!0)1#0!1!0!120!1,0!1%0!1"0"1!0#1!011"0+1!0%M!0"M"0"1!0!1$001$0)1+0"1!0%1"0$1!0"1!0"1"0"1%021!0#1$0!1!001*0-1!0'1!0#1%0#1!0.1!0-1'0"1"0%1!021&0(1!0&1!0(1#041%0$1!0$1"0"1%0"1!0(1(0.1!R!0!1!0"1!0"1!0'1!0#1!0,1!0)1&0#1!0"1!0(1!011(0"N!0%6!0#1!0&1)0!1)0"140&1!0(1#0'1!0"1#061!0*1"0!1!0#1#0!1#061!0#1$0$1"0$1!0"1!0"1!0%1!011"0&1!0"1#0'1"0!1!0"1;0#1!0"1"0!1!0%1!0"1!0@1!0"1"0&1!0#1"0?1"0!1!0&1!0#1,0!1*0!1*0#1!0#1!021!0*1!0,1"0O1Q]],[[1#0!1O0$1#0#1#0"1#0:1%0*1!001(0(1$0$6!1!0*1!0*1!0(1$0$1$0$1#0(1#0(1!0-1"0"1.0!100#1&0$1!0"1)0"1$0!1+0.1!0#1!0#1#Q!0)M!0!1)001!0#1"0"1%0'1(0'1-0#1"0#1$0$6!0"1!0-1"011!0"1$0"1'0,1!031"0"1#051!011"0$190"1/0&1#0$1'0A1"091!041"0M1#021"0$1!0&1"0*1%011$0(130'1!0!1(0#1<0)1!0.1!0$1!0%1!0(1!0"1!0)1!0E1"0&1#0E1$0&1!0+ "0#1"0"1"0/1&0$1!0'1"0<1"0(1!081"0+1"0&1#0$1"0% !0"1"0/1#0#1"0(1!0;1"0'1'0$1#0'1"091#0&1%0"1"0*1"0&1"0#1"0$1$0(1#0@1%0!f!0&W#03p!0+1U]]}_=n("c_obj",{__new=function(i,n,e,t)local n=f([[parent_mgr=*3
hitbox={x=0;y=0;x2=7;y2=7}
speed=0.4
destroyed=false
phase=idle
x=*1
y=*2
spawn_x=*1
spawn_y=*2
bounce_map=true
tw = 1
th = 1
solid = false
]],{n or 0,e or 0,t or nil})n.spr=f[[idle = { sprites = { 64; 65 }; fps = 2;  loop = true }
flip_x = false
flip_y = false
time_start = 0	
effect = none
last_frame = 0
rot_speed = 1
offview = false
]]if(n.parent_mgr)n.parent_mgr:add(n)
return n end,update=function(n)end,draw=function(n)n:draw_sprite()end,respawn=function(n,e,t)n.x,n.y,n.spawn_x,n.spawn_y=e,t,e,t end,del=function(n)n.destroyed=true if(n.parent_mgr)n.parent_mgr:del(n)
end,draw_sprite=function(t)if(o:offview(t))return
if(na)local n=t:hitbox_pos(0,0)rect(n.x,n.y,n.x2,n.y2,8)
local n=t.spr if(n.effect=="blink_white")if(time()%.2<.1)for n=0,15do pal(n,7)end
local e,i=n[t.phase],nil if e.ss~=nil do i=e.ss else if e.loop~=nil and e.loop==false and e.sprites[#e.sprites]==n.last_frame do i=n.last_frame else if(n.time_start==nil or n.time_start==0)n.time_start=time()
i=e.sprites[1+flr((time()-n.time_start)/(1/e.fps))%#e.sprites]end end spr(i,t.x,t.y,t.tw,t.th,n.flip_x or false,n.flip_y or false,7)pal()n.last_frame=i end,collide=function(n,e,t,i)local n,e=n:hitbox_pos(0,0),e:hitbox_pos(0,0)if(t~=nil)n.x+=t n.x2-=t n.y+=i n.y2-=i
return not(n.x2<e.x or n.x>e.x2 or n.y2<e.y or n.y>e.y2)end,hitbox_pos=function(n,e,t)e,t=e or 0,t or 0return{x=n.x+e+n.hitbox.x,y=n.y+t+n.hitbox.y,x2=n.x+e+n.hitbox.x2,y2=n.y+t+n.hitbox.y2}end,out_of_map=function(n)return n.x<0or n.y<0or n.x>nn or n.y>ne end,distp2=function(n,e)local n,e=e.x-n.x,e.y-n.y return(n/10*(n/10)+e/10*(e/10))*50end,moveTo=function(n,e,t)local i=sqrt(n:distp2(e))local t=t/i n.x=A(n.x,e.x,t)n.y=A(n.y,e.y,t)end})D=n("c_mgr",{__new=function(n)local n=f"objs={}"return n end,restart=function(n)n.objs={}end,add=function(n,e)add(n.objs,e)end,del=function(n,e)del(n.objs,e)end,update=function(n)for n in all(n.objs)do n:update()end end,draw=function(n)for n in all(n.objs)do n:draw()end end})function c(t,e,n)local i,n=n or t.speed,n or t.speed local i,o=e==l and-i or(e==u and i or 0),e==B and-n or(e==H and n or 0)local n=t:hitbox_pos(i,o)if(t.bounce_map and(n.x<0or n.y<0or n.x2>nn or n.y2>ne))return 0
if e==u or e==l do local e=e==l and n.x or n.x2 local o,n=w(e,n.y),w(e,n.y2)if(not o and not n)t.x=t.x+i return 1else return 0
elseif e==B or e==H do local e=e==B and n.y or n.y2 local i,n=w(n.x,e),w(n.x2,e)if(not i and not n)t.y=t.y+o return 1else return 0
end end function nb(n)return n==nil or n.destroyed end function nt(n)if(n~=nil and not n.destroyed)n:del()
end function Z(n,e,t,i)local n=ns(n,e,t,i)return fget(n.tile,n4)end function n3(e,t)for i in all(s)do local n=i:hitbox_pos(0,0)if(e>=n.x and e<n.x2 and t>=n.y and t<n.y2)return i
end return nil end function w(n,e,t,i)return Z(n,e,t,i)or n3(n,e)~=nil end function i(n,e)I[b][flr(n.spawn_x/8)][flr(n.spawn_y/8)]=tostr(e)end function L()return K[b]end function e(n,e)n.theme=nm[n.theme]n.npcdata=e return n end function np(n,e)local e={[n5]=2,[n8]=1,[ng]=2,[nx]=5,[n6]=4,[ny]=1,[nw]=3,[n7]=1,[n9]=1,[nk]=5,[nv]=4,[nj]=1,[nX]=1,[nZ]=1,[nM]=3,[nT]=1}return e[n]end function nY(t,l,o)local n,i=0,0for e=1,#t,2do local f,e=sub(t,e,e),sub(t,e+1,e+1)local e=ord(e)-32for e=1,e do o[n][i]=f n=n+1if(n>=l)n,i=0,i+1
end end return o end function J()local n,a=n_[b],L()local d,i,e=a.theme,nil,nil if z[b]==nil do i,e=n1(g,m,""),n1(g,m,"")if nQ and N do for e=1,g do for t=1,m do local n=(e-1)*m*2+(t-1)*2+1local n=sub(nE,n,n)if(n==" ")n="0"
i[t-1][e-1]=n end end else nY(n,m,i)end else i,e=z[b],I[b]end local r,c,u,s=r.mgr.misc_mgr,{},f"M={};N={};O={};P={}",false for o=0,g-1do for l=0,m-1do local n,f=i[l][o],e[l][o]mset(l,o,0)local e,t=l*8,o*8if n=="1"do local n=nA(i,l,o)local n=d.tile_maps[np(n,d)]or 1mset(l,o,n)elseif p("2345",n)do local i=d.bg_item_off[tonum(n)-1]local e=_.new(e+i[1],t+i[2],r)e.spr.idle.sprites=d.bg_item_spr[tonum(n)-1]e.tw=i[1]==0and 1or 2e.th=i[2]==0and 1or 2add(r,e)elseif n=="f"do if(x~=nil)h:respawn(x[1]*8,x[2]*8)else h:respawn(e,t)
if(ni~=nil and N)h.avail_el=ni
if(no~=nil and N)h.cur_el=no
s=true elseif p("abcd",n)do nB.new(e,t,R[n])elseif n=="6"do nH.new(e,t,r)elseif n=="8"do elseif p("egi",n)do nL.new(e,t,R[n])elseif p("lmn",n)do W.new(e,t,R[n])elseif p("hjk",n)do if(f=="")U.new(n,e,t)
elseif p("XYZ",n)do if(f=="")nl.new(e,t,n=="X"and 1or n=="Y"and 3or 5,true)
elseif p("pqrstuvwxyz",n)do local n=a.npcdata[n]or{cname="c_npc_stage"..b,msg="undefined msg"}nN.new(e,t,n.cname,n.msg)elseif p("ABCDEFGHIJKL",n)do if(f=="")nC.new(e,t,n)
elseif p("MNOP",n)do local e=q.new(e,t,false,0,f=="1")add(u[n],e)elseif p("UVW",n)do q.new(e,t,true,nF[n],f=="1")elseif p("QRST",n)do local e=nO.new(e,t,r)if(f=="1")e.on=true
c[n]=e end end end if(b>1and not s)h:respawn(x[1]*8,x[2]*8)
for n,e in pairs(c)do local n=sub(sub("MNOP",ord(n)-ord"Q"+1),1,1)for n in all(u[n])do e:link_switch(n)end end z[b]=i I[b]=e end function nA(t,n,e)local i,o,l,e,n=e>0and t[n][e-1]=="1"or e==0,e<g and t[n][e+1]=="1"or e==g-1,n>0and t[n-1][e]=="1"or n==0,n<m-1and t[n+1][e]=="1"or n==m-1,0if(i)n+=1
if(o)n+=2
if(l)n+=4
if(e)n+=8
return n end function nG()if(Z(h.x,h.y))h.y+=8
end function nf()h:reset_stage_props()for e,n in pairs(r.mgr)do if(n.restart)n:restart()
end s={}M={}S={}end o={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,offvtol=90,update=function(n)n.x+=(h.x-n.x)*n.csfx n.y+=(h.y-n.y)*n.csfy n.x=mid(n.ox,n.x,m*8-n.ox-16)n.y=mid(n.oy,n.y,g*8-42)local n,e=n:calc_center()camera(n,e)end,place=function(n,e,t)n.x=e n.y=t end,calc_center=function(n)return flr(n.x)-n.ox,flr(n.y)-n.oy end,offview=function(n,e)return abs(flr(n.x-e.x))>n.offvtol or abs(flr(n.y-e.y))>n.offvtol end}nP=n("c_player:c_obj",{__new=function(t,n,e)local n=_.new(n,e)a(n.spr,[[idle = { sprites = { 64; 65 }; fps = 2 }
walk = { sprites = { 80; 81; 82 }; fps = 6 }
jump = { sprites = { 97; 98; 99; 100; 101; 102 }; fps = 8 }
dead = { sprites = { 68; 69; 70; 71; 72 }; fps = 4; loop = false }
		]])a(n,[[name=player
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
life=2
max_life=20
init_max_life=20
lifereg_lev=0
lifereg_ttl=_fn_t2_4
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
shards = 3000
bounce_map=false
		]])return n end,reset_stage_props=function(n)n:reset_jump_vars()end,update=function(e)if(r.paused)return
local n,t=e,f("left=*1;right=*2;jump=*3;jump_start=*4;action=*5",{btn(0),btn(1),btn(4),btnp(4),btnp(5)})if n.phase=="dead"do if(n.prev_btn.left)c(n,l)
if(n.prev_btn.right)c(n,u)
n.speed*=.9n:apply_forces(t)if n.t_respawn:adv()do if(C~=nil)C.life=C.max_life
x=nil nf()b=2J()o:place(h.x,h.y)n.life=n.max_life n.phase="idle"n.invulnerable=false end return end if(e.lifereg_ttl:adv())e:increase_life(e.lifereg_lev/5)
if not n.blocked do if(t.left)n:move_left()
if(t.right)n:move_right()
if(not t.left and not t.right)n.speed=n.speed*.7if(n.speed<.1)n.speed=0
n:apply_forces(t)end n.prev_btn=t if(t.left==false and t.right==false and n:on_ground())n.phase="idle"
if(n.nodmg_t~=nil)if(n.nodmg_t:adv())n.spr.effect="none"n.invulnerable=false
if(t.action)if(e.interaction_fn~=nil)e.interaction_fn=nil else e:attack()
if(e.el_cooldown:adv())e.shine_star=10
e.interaction_fn=nil end,draw=function(n)local e=n if(e.invisible)return
e:draw_sprite()if(n.shine_star>0)line(n.x+3,n.y-1,n.x+5,n.y-1,10)line(n.x+4,n.y-2,n.x+4,n.y,10)n.shine_star-=1
end,dmg=function(n,e)local n=n if(not n.invulnerable)n.life-=e if(n.life<=0)n.phase="dead"n.invulnerable=true n.t_respawn=k.new(5)else n.nodmg_t=k.new(1)n.spr.effect="blink_white"sfx(nD)n.invulnerable=true
end,increase_life=function(n,e)local n=n n.life=min(n.life+e,n.max_life)end,inc_speed=function(n,e)local n=n if(e)n.speed=n.init_speed else n.speed=min(n.speed+n.inc_speed_factor,n.max_speed)
end,move_left=function(e)local n=e e:inc_speed(not(n.prev_btn.left or false))c(n,l)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=true end,move_right=function(e)local n=e e:inc_speed(not(n.prev_btn.right or false))c(n,u)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=false end,apply_forces=function(n,e)if(not n.blocked and e.jump_start)n:set_start_jump()
if(not e.jump and n.jstack>0)n.jstack=0
if(n.jstack>0)n.speedy=-n.jforce n.jstack-=1
if(n.speedy<0and not e.jump)n.speedy*=n.speed_y_decay
n.speedy+=nI n.speedy=min(n.speedy,n.max_speedy)local e=c(n,n.speedy<0and B or H,abs(n.speedy))if(e==0)n:reset_jump_vars()if(n.phase=="jump")n.phase="idle"
end,reset_jump_vars=function(n)n.speedy=0n.jstack=0end,set_start_jump=function(n)if(n.phase=="dead")return
if(n:on_ground())n:reset_jump_vars()n.phase="jump"n.spr.time_start=nil n.jstack=n.max_jstack if(nK)sfx(nJ)
end,on_ground=function(n)local n=n local n=n:hitbox_pos(0,1)local e,n=w(n.x,n.y2),w(n.x2,n.y2)return e or n end,apply_end_stage_upgrades=function(n)end,attack=function(n)if(n.cur_el==nil)return
if(n.el_cooldown.t<=0)nd[n.cur_el].new(n.spr.flip_x and l or u,r.mgr.misc_mgr)n.el_cooldown:restart()
end,switch_element=function(e)if(e.cur_el==nil)return
local n=e.cur_el%4+1while true do if(e.avail_el[n])e.cur_el=n T.new(30,nd[n].name)break
n=n%4+1end end})y=n("c_enemy:c_obj",{__new=function(l,e,n,t,i,o)local n=_.new(n,t,o)a(n,[[respawn_timer = _fn_t1_10
dmg_time = _fn_t1_1
frozen_t = _fn_t1_20
time_last_death = 0
life = 100
max_life = _k_life
dir = nil
wspeed = 0
dir_before_blow = nil
fixed = false
hitbox = { x=2;y=2;x2=5;y2=5} 
hitbox_orig = {x=2;y=2;x2=5;y2=5}
speed = *1
etype = *2
        ]],{i or 1,e})n.frozen_t.t=0return n end,dmg=function(n,e)if(n:is_inv())return
n.life-=e n.dmg_time:restart()n.spr.effect="blink_white"if(n.life<=0)for e=1,3do local e,n=n.x+rnd(6),n.y+rnd(6)nl.new(e,n)end n:del()
end,freeze=function(n)n.frozen_t:restart()add(s,n)n.hitbox={x=0,y=0,x2=7,y2=7}end,unfreeze=function(n)n.frozen_t.t=-1n.spr.effect="none"del(s,n)n.hitbox=n.hitbox_orig end,blow=function(n,e)if(n.fixed)return
if(n.wspeed<=0)n.dir_before_blow=n.dir
n.wspeed=2n.dir=e end,unblow=function(n)n.wspeed=-1n.dir=n.dir_before_blow end,update=function(n)_.update(n)for e in all(M)do if(n:collide(e))e:hit(n)
end if(n.dmg_time:adv())n.spr.effect="none"
if(n.frozen_t:adv())n:unfreeze()else if(n.frozen_t:t_left_btw(.1,2))n.spr.effect="blink_white"
if(n.wspeed>0)local e=c(n,n.dir,n.wspeed)n.wspeed=e==0and 0or max(0,n.wspeed-.05)else if(n.wspeed~=-1)n:unblow()
end,draw=function(n)if(n.frozen_t.t>0)spr(139,n.x,n.y)
_.draw(n)end,del=function(n)n.time_last_death=time()del(s,n)_.del(n)end,is_inv=function(n)return false end})nB=n("c_fly_en:c_enemy",{__new=function(i,n,t,e)local n=y.new(e,n,t,.3,r.mgr.enemy_mgr)n.spr.idle={sprites=F[e].idle,fps=4,loop=true}n.horizontal=nz[e]=="horizontal"a(n,[[hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
horizontal = *1
dir = *2
dir_before_blow = _k_dir
        ]],{n.horizontal,n.horizontal and u or H})return n end,update=function(n)y.update(n)if(n.frozen_t.t>0)return
if(n:collide(h))h:dmg(1)
local e=c(n,n.dir)if(e==0)n.dir=(n.horizontal and 0or 2)+(n.dir+1)%2
end})nL=n("c_walk_en:c_enemy",{__new=function(n,t,i,e)local n=y.new(e,t,i,1.5,r.mgr.enemy_mgr)n.spr.idle={sprites=F[e].idle,fps=2,loop=true}n.spr.run={sprites=F[e].run,fps=4,loop=true}a(n,[[speed = 0.2
hitbox = {x=0;y=3;x2=7;y2=7}
hitbox_orig = {x=0;y=3;x2=7;y2=7}
basex = *1
basey = *2
        ]],{t,i})return n end,update=function(n)y.update(n)n.phase="idle"if(n.frozen_t.t>0)return
if n:collide(h,2,2)do h:dmg(2)else if abs(h.x-n.x)<50and abs(h.y-n.y)<4do n.spr.flip_x=h.x-n.x>0local e=h.x-n.x>0and u or l local t,i=e==u and n.x+n.speed+7or n.x-n.speed,n.y+8if(Z(t,i))if(not Z(t,n.y))c(n,e)n.phase="run"
else if(abs(n.basex-n.x)>3)n.spr.flip_x=n.basex-n.x>0c(n,n.basex-n.x>0and u or l)n.phase="run"
end end end})U=n("c_vine:c_enemy",{types=f"h={pal=3;flev=0};j={pal=8;flev=1};k={pal=12;flev=2};",__new=function(i,e,n,t)local n=y.new("vine",n,t,0,r.mgr.enemy_mgr)n.spr.idle=f"ss = 6"a(n,[[fixed = true
life = 10
hitbox = { x=0;y=0;x2=7;y2=7}
        ]])n.pal=U.types[e].pal n.flev=U.types[e].flev add(s,n)return n end,draw=function(n)pal(7,n.pal)y.draw(n)pal()end,is_inv=function(n)return not(h.cur_el==v and h.lev_el[v]>n.flev)end})W=n("c_boss:c_enemy",{angles=f"0;0.1;0.4;0.5;0.6;0.9",__new=function(i,n,e,t)local n=y.new("boss",n,e,.3,r.mgr.enemy_mgr)n.spr.idle.sprites=F[t].idle a(n,[[life = 5000
max_life = _k_life
tw = 2
th = 2
hitbox={x=0;y=0;x2=15;y2=15}
hitbox_orig=_k_hitbox
tcd = _fn_t2_1
tfire = _fn_t2_0.1
fire = false
tpos = {x=nil;y=nil}
mvrngx = 104
mvrngy = 88
]])C=n n.tcd.t-=flr(rnd(40))return n end,update=function(n)y.update(n)if(n.frozen_t.t>0)return
if(n:collide(h))h:dmg(5)
if(n.tpos.x==nil or n:distp2(n.tpos)<9)n.tpos.x=n.spawn_x+rnd(n.mvrngx*2)-n.mvrngx n.tpos.y=n.spawn_y-rnd(n.mvrngy)
n:moveTo(n.tpos,n.speed)if(n.tcd:adv())n.fire=not n.fire
if(n.fire)if(n.tfire:adv())nR.new(n.x+8,n.y+8,rnd(W.angles),1)
end,draw=function(n)y.draw(n)rectfill(n.x,n.y-4,n.x+flr(15*(n.life/n.max_life)),n.y-2,8)end})nW=n("c_explosion:c_obj",{__new=function(o,n,e,t,i)local n=_.new(n,e,i)a(n,[[ttl = _fn_t1_0.2
solid = false
max_radius = *1
        ]],{t or 4})n.spr.idle=f"sprites = { 185; 186; 187 }, fps = 4"return n end,update=function(n)if(n.ttl:adv())n.parent_mgr:del(n)
end,draw=function(n)if(n.ttl.t<=0)return
local e=A(0,n.max_radius,1-n.ttl.t/n.ttl.maxtime)circfill(n.x,n.y,e,10)end})j=n("c_element:c_obj",{__new=function(n,e,t)local i,o=h.x+(t==l and-2or 10),h.y local n=_.new(i,o,r.mgr.misc_mgr)n.spr.idle=nU[e]a(n,[[ttl = *5
max_dist = 20
destroy_req_prev_frame = false
origx = *1
origy = *2
dir = *3
el = *4
        ]],{i,o,t,e,k.new(nq[e],false)})if(t==l)n.spr.flip_x=true
add(M,n)return n end,update=function(n)if(n.destroy_req_prev_frame)n:del()return
if(n.ttl:adv())n.destroy_req_prev_frame=true
n.x=n2(n.origx,n.max_dist,n.ttl,true,n.dir)if(Z(n.x,n.y))n:del()
end,hit=function(n,e)nW.new(n.x,n.y,4,r.mgr.misc_mgr)n:effect(e)n:del()end,effect=function(n,e)e:dmg(nS[n.el][h.lev_el[n.el]])end,del=function(n)del(M,n)_.del(n)end})nV=n("c_fire:c_element",{name="fire",__new=function(e,n,t)return j.new(v,n)end,effect=function(e,n)n:unfreeze()j.effect(e,n)end})e0=n("c_ice:c_element",{name="ice",__new=function(e,n,t)return j.new(e1,n)end,update=function(n)j.update(n)end,effect=function(e,n)n:freeze()end})en=n("c_thunder:c_element",{name="thunder",__new=function(e,n,t)return j.new(nr,n)end})ee=n("c_wind:c_element",{name="wind",__new=function(e,n,t)return j.new(et,n)end,effect=function(n,e)e:blow(n.dir)end})d=n("c_int:c_obj",{__new=function(i,n,e,t)local n=_.new(n,e,t)a(n,[[show_int_button = false
ttl_disable_int = nil
int_done = false
solid = true
hover_info = nil
hover_info_obj = nil
int = true
cost = 0
        ]])return n end,update=function(n)if(not n.int)return
if n:collide(h,-2,-2)do n.show_int_button=true if(n.hover_info~=nil and nb(n.hover_info_obj))n.hover_info_obj=V.new(100,nil,n.hover_info)n.hover_info_obj.ttl.t=Q*20
h.interaction_fn=n.interact local e=n.ttl_disable_int if btnp(5,0)and not n.int_done do n:interact()elseif n.int_done and e==nil do n.ttl_disable_int=k.new(.5,false)elseif e and e:adv()do n.int_done=false n.ttl_disable_int=nil end else n.show_int_button=false nt(n.hover_info_obj)end end,draw=function(n)n:draw_sprite()if(n.show_int_button)?"❎",n.x+2,n.y-6,12
end,interact=function(n)if(h.shards<n.cost)T.new(30,"You need "..tostr(n.cost).." shards")return
n:action()n.int_done=true h.shards-=n.cost end,action=function(n)end,del=function(n)nt(n.hover_info_obj)_.del(n)end})nH=n("c_focuslith:c_int",{__new=function(i,n,e,t)local n=d.new(n,e,t)n.spr.idle={ss=11}return n end,action=function(n)h:switch_element()end,draw=function(n)pal(7,flr(time()/.5)%2==0and ei[h.cur_el]or 7)d.draw(n)pal()end})nO=n("c_switchlith:c_int",{__new=function(i,n,e,t)local n=d.new(n,e,t)n.spr.idle=f"sprites={27;28;29}; fps=10; loop=true"n.on=false n.doors={}return n end,action=function(n)if(h.cur_el~=nr)T.new(30,"You need thunder")return
for e in all(n.doors)do if(n.on)e:close()else e:open()
end n.on=not n.on i(n,n.on and 1or 2)end,link_switch=function(n,e)add(n.doors,e)end,draw=function(n)pal(7,n.on and 11or 8)pal(10,n.on and 3or 9)d.draw(n)pal()end})q=n("c_door:c_int",{__new=function(l,n,i,e,o,t)local n=d.new(n,i,r.mgr.misc_mgr)n.spr.open=e and f"ss=60"or f"sprites={43,44;45;46}; fps=5; loop=false"n.spr.close=e and f"ss=59"or f"sprites={46;45;44;43}; fps=5; loop=false"a(n,[[phase = close
hitbox = {x=0;y=0;x2=7;y2=7}
cost = *2
int=*1
]],{e,o})add(s,n)if(t)q.open(n)
if(not t and e)n.hover_info="open door ("..tostr(n.cost).." shards)"
return n end,update=function(n)d.update(n)if n.phase=="close"do for e in all(M)do if(n:collide(e))e:del()
end end end,open=function(n)n.phase="open"n.hover_info=nil del(s,n)i(n,1)end,close=function(n)n.phase="close"add(s,n)i(n,2)end,action=function(n)n:open()end})nC=n("c_scroll:c_int",{__new=function(i,n,t,e)local n=d.new(n,t,r.mgr.misc_mgr)n=a(n,[[el = *1
int_fn = *2
cost = *3
name = *4
col = *5
        ]],{ord(e)-ord"A"+1,eo[e],el[e],ef[e],ed[e]})n.hover_info="learn "..n.name.." ("..tostr(n.cost).." shards)*"..tostr(er[e])n.spr.idle={ss=12}return n end,update=function(n)d.update(n)n.y=n.spawn_y+sin(time())*2end,action=function(n)if(n.int_fn~=nil)n.int_fn(n)P("executed int_fn for scroll "..n.name)else h.cur_el=n.el h.avail_el[n.el]=true
T.new(30,n.name.." acquired")i(n,"d")n:del()end,draw=function(n)if(n.el)pal(7,n.col)
d.draw(n)pal()end})nl=n("c_shard:c_obj",{__new=function(o,n,e,t,i)local n=_.new(n,e,r.mgr.misc_mgr)a(n,[[            speed = 0.1
            speed_inc = 1.05
            cnt = *1
            static = *2
            sbase = 1.5
            sx = _fn_rnd_15
            sy = _fn_rnd_15
        ]],{t or 1,i or false})return n end,update=function(n)local e=n:distp2(h)if e<16do h.shards+=n.cnt if(n.static)i(n,"d")
n:del()elseif not n.static do n:moveTo(h,n.speed)n.speed*=n.speed_inc else n.x=n.spawn_x+sin(time()*(n.sbase+n.sx/10))n.y=n.spawn_y+sin(time()*(n.sbase+n.sy/10))end end,draw=function(n)circfill(n.x+4,n.y+4,max(1,n.cnt/2),7)end})nN=n("c_npc:c_int",{__new=function(o,n,t,e,i)local n=d.new(n,t,r.mgr.misc_mgr)n.spr.idle.sprites=ea[e]or{154}n.name=ec[e]n.dialogs=split(i,"/")n.cur_diag=1n.diagcls=nil n.boss=e=="lea"and b==9return n end,update=function(n)d.update(n)if n.diagcls and(abs(n.x-h.x)>40or abs(n.y-h.y)>40or n.diagcls.destroyed)do n.diagcls:del()if(n.boss)W.new(n.x-8,n.y-8,"boss3")i(n,"d")n:del()
n.cur_diag=1n.diagcls=nil end end,action=function(n)n.diagcls=n.diagcls or V.new(30,n.name,"")n.diagcls:update_msg(n.dialogs[n.cur_diag])n.diagcls.cont=n.cur_diag<#n.dialogs n.diagcls.ttl:restart()n.cur_diag=min(n.cur_diag+1,#n.dialogs)end})nR=n("c_bullet:c_obj",{__new=function(o,n,e,t,i)local n=_.new(n,e,r.mgr.misc_mgr)a(n,[[dir = *1
speed = *2
ttl = _fn_t1_3
        ]],{t,i})n.spr.idle=f"ss = 185"add(S,n)return n end,update=function(n)n.x+=cos(n.dir)*n.speed n.y+=sin(n.dir)*n.speed if(n:collide(h))h:dmg(1)n:del()else if(w(n.x,n.y)or n.ttl:adv())n:del()
end,del=function(n)del(S,n)_.del(n)end})eu=n("c_misc_mgr:c_mgr",{__new=function(n)local n=D.new()return n end})Y=n("c_hud_element:c_obj",{__new=function(i,n,e,t)local t=_.new(n,e,t)a(t,"fixedx=*1;fixedy=*2",{n,e})return t end,update=function(n)local e,t=o:calc_center()n.x=n.fixedx+e n.y=n.fixedy+t end})es=n("c_val_printer:c_hud_element",{__new=function(o,n,e,t,i)local n=Y.new(n,e)a(n,"draw_fn=*1;bgl=*2",{i,t})n.spr.idle=f"ss=137"return n end,draw=function(n)rectfill(n.x,n.y,n.x+n.bgl,n.y+6,1)n:draw_fn()end})eh=n("c_player_life_bar:c_hud_element",{__new=function(t,n,e)local n=Y.new(n,e)n.spr.idle={ss=169}n.life_ref=h.init_max_life return n end,draw=function(n)local e=30*h.max_life/n.life_ref n:draw_sprite()nh(n.x+10,n.y+2,e,3,h.life,h.max_life,1,8)end})T=n("c_slide_text:c_hud_element",{__new=function(t,n,e)local n=Y.new(0,n,r.mgr.hud_mgr)n.msg=e n.final_pos=122-#e*4n.fixedx=n.final_pos+250a(n,[[            ttl = _fn_t1_2
        ]])Y.update(n)return n end,update=function(n)if(n.ttl:adv())n:del()return
local e=abs(n.fixedx-n.final_pos)n.fixedx=e<2and n.final_pos or n.fixedx-e*.1Y.update(n)end,draw=function(n)rectfill(n.x-2,n.y-2,n.x+126,n.y+7,1)rect(n.x-2,n.y-2,n.x+126,n.y+7,14)?n.msg,n.x,n.y,8
end})V=n("c_dialog:c_slide_text",{__new=function(i,n,t,e)local n=T.new(n,e)a(n,[[final_pos = 10
fixedx = 260
ttl = _fn_t1_6
cont = false
author = *1
msgs = nil
        ]],{t})V.update_msg(n,e)return n end,update_msg=function(n,e)n.msg=e n.msgs=split((n.author~=nil and n.author..":*"or"")..e,"*")end,draw=function(n)local e=#n.msgs rectfill(n.x-10,n.y-10,n.x+124,n.y+e*7+10,1)rect(n.x-2,n.y-2,n.x+124,n.y+e*7,14)for e=1,#n.msgs do?n.msgs[e],n.x,n.y+(e-1)*7,8
end if(n.cont)?"❎>>",n.x+100,n.y+e*7+2,8
end})e2=n("c_hud_mgr:c_mgr",{__new=function(n)local n=D.new()n.update_in_pause=true return n end,restart=function(n)n.objs={es.new(94,1,25,function(n)circfill(n.x+4,n.y+3,2,7)?tostr(h.shards),n.x+10,n.y+1,8
end),eh.new(10,0)}end})nK=true e_=true nI=.25l,u,B,H=X"0;1;2;3"v,nr,e1,et=X"1;2;3;4"ei=f"8;10;12;13"nU=f[[{sprites={112;113;114;115};fps=10;loop=false};
{sprites={116;117;118;119};fps=30;loop=true};
{sprites={120;121;122;123};fps=10;loop=false};
{sprites={124};fps=1;loop=false};
]]nq=f"0.3;1;0.4;0.5"nd={nV,en,e0,ee}nS=f[[{10;20;30;40};{10;15;25};{0;0;0};{0;0;0}]]ef=f"A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=fire+2;G=lifereg;H=lifereg+1;I=max life+1;J=fire+3;K=lifereg+2;L=max life+2;"eo=f("E=*1;F=*2;G=*3;H=*4;I=*5;J=*6;K=*7;L=*8;",{function()h.lev_el[v]=2end,function()h.lev_el[v]=3end,function()h.lifereg_lev=max(1,h.lifereg_lev)end,function()h.lifereg_lev=max(2,h.lifereg_lev)end,function()h.max_life+=5h.life=h.max_life end,function()h.lev_el[v]=4end,function()h.lifereg_lev=3end,function()h.max_life+=10h.life=h.max_life end})ed=f"A=8;B=10;C=12;D=13;E=8;F=8;G=8;H=8;I=7;J=18;K=8;L=7;"er=f[[A=can also burn green vines
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
]]el=f"A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;"nF=f"U=100;V=200;W=400;"ec=f[[lea=aunt lea
lady=lady
]]ea=f[[lea = {192;193}
lady = {208;209}
]]R=f"a=bath;b=batv;c=witchh;d=witchv;e=dog;g=spider;i=sk;l=boss1;m=boss2;n=boss3"F=f[[dog={idle={144;145};run={146;147}}
spider={idle={160;161};run={162;163}}
sk={idle={148;149};run={150;151}}
bath={idle={128;129}}
batv=_k_bath
witchh={idle={130;131}}
witchv=_k_witchh
boss1={idle={203;205}}
boss2={idle={231;233}}
boss3={idle={199;201}}
]]nz=f[[bath=horizontal;batv=vertical;witchh=horizontal;witchv=vertical;]]n4=0r=nil h=nil nJ,e4,e3,em,ep,nD=X"0;1;2;3;4;5"z,I,s,M,S=X"{};{};{};{};{}"m,g=48,32nn,ne=m*8,g*8C=nil b=2N=true x=nil nQ=true ni=f"false;false;false;false"no=nil nE=[[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
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
1                                                                                             1
1     f                   A     E     J       h h h h     j j j j       k k k k               1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]n5,n8,ng,nx,n6,ny,n7,n9,nk,nv,nw,nj,nX,nZ,nM,nT=X"0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15"nm=f[[metal={tile_maps={1;2;3;4;5};bg_col=-15;bg_item_spr={{174};{190};{175};{172}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
sand={tile_maps={17;18;19;20;21};bg_col=0;bg_item_spr={{15};{31};{47};{41}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
grass={tile_maps={33;34;35;36;37};bg_col=0;bg_item_spr={{8};{24};{7};{39}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
ice={tile_maps={49;50;51;52;53};bg_col=-15;bg_item_spr={{170};{142};{158};{143}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
]]K={e(f"name=The green forest 2;music=13;theme=grass;wtx=-48;wty=0",f""),e(f"name=The green forest 1;music=13;theme=grass;wtx=0;wty=0;",f[[p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
u = {cname=lady;msg=welcome to the forest*be careful out there!}
]]),e(f"name=The green forest 3;music=13;theme=grass;wtx=48;wty=0",f""),e(f"name=The underground;music=13;theme=sand;wtx=-48;wty=32",f""),e(f"name=The intestines;music=13;theme=sand;wtx=0;wty=32;",f""),e(f"name=The intestines;music=13;theme=sand;wtx=48;wty=32",f""),e(f"name=The intestines;music=13;theme=sand;wtx=-48;wty=64",f""),e(f"name=The intestines;music=13;theme=sand;wtx=0;wty=64",f""),e(f"name=The forgotten;music=13;theme=metal;wtx=48;wty=64",f"p={cname=lea;msg=you have done well*my dear nephew*now die}")}G("t1",function(n)return k.new(n,false)end)G("t2",function(n)return k.new(n,true)end)G("rnd",function(n)return flr(rnd(n))end)function _init()P"\n\n\n\n----------- Game started -----------"r=eb.new()end function _update60()r:update()end function _draw()r:draw()end eb=n("c_game",{__new=function()local n={paused=false,menu=true,play=false,stage_title_phase=false,require_player_rebuild=true,minimap={},mgr={enemy_mgr=D.new(),misc_mgr=eu.new(),hud_mgr=e2.new()}}n.bgpos={0,0}menuitem(1,"new game",function()r:start_menu()end)return n end,start_play=function(n)n.win_stage=false n.menu=false n.play=true if(n.require_player_rebuild)h=nP.new(0,0)n.require_player_rebuild=false
n.game_over=false h:reset_stage_props()for e,n in pairs(n.mgr)do if(n.restart)n:restart()
end J()o:place(h.x,h.y)if(e_)music(L().music)
end,start_menu=function(n)n.menu=true n.play=false n.game_over=false n.win_stage=false n.win_game=false b=1end,stage_check=function(n)local i,n=flr(h.x/8),flr(h.y/8)if i<0or i>=m-1and h.x>m*8-4or n<=0and h.y<3or n>=g-1do N=false local e=L()local e,t=i+e.wtx or 0,n+e.wty or 0if n<=0do t-=2e=e+(h.spr.flip_x and-1or 1)elseif n>=g-1do t+=2end if(i>=m-1)e+=1
local n=nil for i=1,#K do n=K[i]if(e>=n.wtx and e<n.wtx+m and t>=n.wty and t<n.wty+g)b=i break
end nf()local n,e=e-n.wtx,t-n.wty x=f(""..n..";"..e.."")P("stage changed to "..b.." with ovd_respawn "..x[1]..","..x[2].."")J()nG()o:place(h.x,h.y)end end,update=function(n)if n.menu do if(btnp(5,0))n.require_player_rebuild=true n:start_play()
return end n:stage_check()o:update()for e,n in pairs(n.mgr)do if(n.update)n:update()
end h:update()n.bgpos[1]=(o.x-o.ox)*.5n.bgpos[2]=(o.y-o.oy)*.5end,draw=function(n)if(n.menu)cls()local n=t()spr(80+flr(n/.1%3),60,58)E("* the last spellcaster *",64,50,7)E("press ❎ to start",64,70,7)return
cls(L().theme.bg_col)for e=0,23do for t=0,15do spr(9,e*16+n.bgpos[1],t*16+n.bgpos[2],2,2)end end map(0,0,0,0,e5,e8,false)n.mgr.misc_mgr:draw()n.mgr.enemy_mgr:draw()h:draw()n.mgr.hud_mgr:draw()if(h.phase=="dead")local n,e=o:calc_center()E("you died!",64+n,55+e,8)E("respawning in "..h.t_respawn:t_left(),64+n,65+e,7)return
?""..tostr(flr(h.x/8))..","..tostr(flr(h.y/8)),o.x-50,o.y-60,7
end})
__gfx__
00000000dddddddd6666666666666666666666666666666670070007000000000000000000000000000000000006d00007777770000000000000000000000000
00000000d7ddd66d65dddd56dddddddd6dddddddddddddd606007077000300000000220000001000000001000006660077666670000000000000000000000000
00700700dddddd6ddddddddddddddddddddddddddddddddd07006070033000300022002000000000000000000066d60079999970000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd07707067030033300800200800000000000000000d67766076666670000000000000000000000000
00077000dddddddddddddddddddddddddddddddddddddddd0b777b07033036000000020000000000000000000677776007999977000000000000000000000000
00700700d7ddddddd7ddddddddddddddddddddddddddddddb67b7bb7003303000000020000000000010000000677776d07666667000000000000000000f0ff00
00000000d77ddd6dd77ddd6dd77ddd6dd77ddd6dd77ddd6d77bbb7b60036030001302030000100000000000066677d660799997700000000000000000ffffff0
00000000dddddddddddddddddddddddddddddddddddddddd77777777003333003323342300000000000000006d66666d077777700000000000000000ffffffff
00000000999999990ffffff0ffffffff0ffffffffffffff000000000033033000000000000000000000000000666666006666660066666600000000000000000
0000000099999999ffffffffffffffffffffffffffffffff000000003600030000000000000000000000000066aaa7666677aa6666aa77660000000000000000
000000009999a999f999a99f9ff99ff9f99fff9999fff99f000000003000063000000000000000000000000167aaa7766777aaa66aaa7aa60000000000000000
0000000099999a9999999a9999999a9999999a9999999a99000000000000330005000000000000000000000067700aa66aa007766aa00aa60000000000000010
00000000949999999499999994999999949999999499999900000000003330005a560050000000000000000067700aa66aa0077667700aa60000000000110101
0000000099499999994999999949999999499999994999990000000000336300056a65a500000100000000006aaa7aa66aa7aaa667aaa7760000000001001100
000000009999949999999499999994999999949999999499000000000030003002062250000000000000000066aa77666677aa6666aaa7660000000000011000
000000009999999999999999999999999999999999999999000000000060000033333333000000000000000066666666666666666666666600000000fff1ffff
00000000644494440333333033333333003333333333330000000000000000000000000000000000000000005d55555d55555d55555555550505050000011000
00000000449446943333333333333333033333333333333000000000322203000002330000000f000000ff0055555d5555555555050505000000000000061110
00000000944434643333333333333333333333333333333300000000003232002222003000ffffff000ffff05555555505050500050505000000000000001107
0000000043494444343934343439343434393434343934330000000000020222200222000099fffffffffff00565656005050500000000000000000000000100
00000000444494394444944944449449446494494444944300000000002000230000020000999fff9fff9ff00565656000606060000000000000000000000110
000000009944444449444344494344444944434449644344000000000320002200000230000999ff9fff9f0066d6666600606060006060600000000006100610
000000004643449944346494446434946434649434446494000000000830003200000380000999ff99f99f006d666d6666d66666006060600000000066110110
000000004444944344434446434444464444444344944446000000000000022220000000000999f9f999ff006666666666666d66666666660060606000011100
000000006666666607777770777777770077777777777700000000000032322222232000000f99f9ff999000111111117100001f000000000000000000011100
0000000066c6766677777777777777770777777777777770000000000002000022002300000f99f9ff9ff00017711ff111000011000000000000000000160110
00000000666666c6777777c7777777c7777777c7777777c7000000000032000022000000000ff999ff9fff0017711ff100000000000000000000000000160060
000000006c6666666c6666666c6666666c6666666c66666600000000002800002200000000ff9f999fff9f001111111100000000000000000000000000100000
0000000066667c6666667c6666667c6666667c6666667c6600000000000000002200000000f99f9f9fff99f01111111100000000000000000000000000110000
0000000067666666676666666766666667666666676666660000000000000002200000000ff9ff9f9f9ff9f01dd11ee100000000000000000000000000010000
0000000066c6667666c6667666c6667666c6667666c66676000000000000302222003300ff99ffffff9ff9ff1dd11ee111000011000000000000000000f11ff0
000000006666666666666666666666666666666666666666000000003333322222233333ff9fffffff9fffff11111111d100001e0000000000000000ffff11ff
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
000000000000000000000000000000000000000770000000000070000000000700000000000000000000000000000000066c0000000000000000000000000000
000000000000000000000000009990000000007007000000000007007000007000000000000000000cccccc00ccc6cc000766c00000000000000000000000000
00000000000a0000000a9000099899000000077000770007000007000770070000000000006666000c6666c00c6c66c0000766c0000000000000000000000000
000aa00000a770000aa979009aa789907000700000007070000070000007700000077000006776000c6776c006677cc00000766c000000000000000000000000
000aa00000a770000aa979009aa789900700700000000700000700000007070000077000006776000c6776c00c6776600000766c000000000000000000000000
00000000000a0000000a9000099899000077000000000700007070000070007000000000006666000c6666c00cc6c6c0000766c0000000000000000000000000
000000000000000000000000009990000000000000007000070007000007000700000000000000000cccccc00cc6ccc000766c00000000000000000000000000
000000000000000000000000000000000000000000070000070000000070000000000000000000000000000000000000066c0000000000000000000000000000
00000000000000000066660000666600000000000000000000000000000000000000000000aaaa00000000000cc66c7700000000000000006666666670007700
0200002000200200006880000068800000000000000000000000000000000000000000000a9999a0000000006000000700000000000000006677667027000770
2420024222400422006dd000506dd0050000000000000000000000000000000000000000a965569a000aa0006060000c00000000000000000667666002770020
24488442244884425555d55505555d500000000000000000000000000000000000000000a956669a00a55a00c000060600000000000000000667760000272227
24244242200440020065d5000065d5000000000000000000000000000000000000000000a956669a00a56a006000000600000000000000000066660000022002
02000020000000000065d5000605d5000000000000000000000000000000000000000000a965569a000aa000c006000600000000000000000006760000000002
0000000000000000005555500005555000000000000000000000000000000000000000000a9999a0000000007000006c00000000000000000000600000000020
00000000000000000500505000500505000000000000000000000000000000000000000000aaaa000000000077cc66cc00000000000000000000000077772270
00000000000000000000000000000000007777700000000000077700007770000000000000000000000000000000000000000000700000076766667672222007
00000000000000000000000000000000007070700077777000007700000770000000000000000000000000000a0000a00a0000a0000000006666666600002000
0000000000000000015000000000000000777770007070700007770000777000000000000000000000a00a0000a00a0000000000000000000660676000002700
015000000150000028500000015000000057075000777770755550007555500000000000000aa000000aa0000000000000000000000000000660076000022270
285000052850000055544455285000050055555000570750075555000755550000000000000aa000000aa0000000000000000000000000000070067000020270
55544450555444550055550055544450007555700055555000055d0000055d00000000000000000000a00a0000a00a0000000000000000000000060000020077
00555550005555500500005000555500000ddd0000755570000ddd00000ddd000000000000000000000000000a0000a00a0000a0000000000000000000070000
00150150001501505000000500500050000707000007070000770070000707000000000000000000000000000000000000000000700000070000000000777700
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000
00003930000000000000393000003930000000000000000000000000000000000000000000000000000000c66000000000000011111000000000000000011110
0009339300000000000933930009339300000000000000000000000000000000000000000080080000000667c000000000011112221000001111110011112211
08539339000933900853933908539339000000000000000000000000000000000000000008788880000006776000000000012222221000001555510000122210
05533939085393390553393905533939000000000000000000000000000000000000000000888800000066cc6600000000012112221000001551111100111111
0404393005533939040439300404393000000000000000000000000000000000000000000008800000006cc76600000000012161111111001551222100115551
40404000040439304040400040404000000000000000000000000000000000000000000000000000000067c67760000000012221555551001551222100155511
40400400404040004040400004040400000000000000000000000000000000000000000000000000000067666770000000012221555551001551222100111110
00000000000000000000000000000000000000000000000000000000000000000000000000000000000067666677000000016221565551000000000000000100
00000000000000000000000000000000000000000000000000000000000000000000000000000000000677667c66000000012221555551000111111000111100
000000000000000000000000000000000000000000000000000000000000000000000000000aa0000006c66677660000001111111111111001dddd1000121110
00000000000000000000000000000000000000000000000000000000000000000000000000a77a000006c676677c6600001ddddddddddd1001dddd1000122210
00000000000000000000000000000000000000000000000000000000000000000000000000a77a000076677666767600001ddd6dddd16d1011dd111100111110
000000000000000000000000000000000000000000000000000000000000000000000000000aa000077c666666666600001dddddddd11d101ddd155111101011
0000000000000000000000000000000000000000000000000000000000000000000000000000000077cc66666c66c666001ddddddddddd101d11115100001000
000000000000000000000000000000000000000000000000000000000000000000000000000000007cc66dddd66666d7001d6dddd6dddd101d12215100001000
00cccc0000cccc0000000000000000000000000000000000000000008880088888000008000000000000000000900dddddd0090000000aaaaaa0009000000000
0cc55cc00cc55cc0000000000000000000000000000000000000000080881855581008880000088888000888900ddaaaaaadd009090aaddddddaa00000000000
000ee000003ee30000000000000000000000000000000000000000000008811511888800088818555810880800daaddddddaad0000addaaaaaadda0900000000
003bb300030bb0300000000000000000000000000000000000000000000086868608000088088115118880000daadaaaaaadaad09addaddddddadda000000000
030bb030030bb0300000000000000000000000000000000000000000000885555588000000008686860800000dadaaaaaaaadad00adaddddddddada000000000
033ff330003ff300000000000000000000000000000000000000000000880511150888008008855555880888dadaaa1111aaadadadaddd1111dddada00000000
00bbbb0000bbbb00000000000000000000000000000000000000000008855355535558808888051115088808dada11188111adadadad11188111dada00000000
0dd00dd00dd00dd0000000000000000000000000000000000000000008500035330005880055535553555000dad1772882771dadada1779889771ada00000000
0099990000999000000000000000000000000000000000000000000005500335520005000555033552005500da177788887771adad177788887771da00000000
0091119009911900000000000000000000000000000000000000000005000223533005500500022353300550dad1772882771dadada1779889771ada00000000
091c5c1995c5c590000000000000000000000000000000000000000005000335533300550500033553330055dada11188111adadadad11188111dada00000000
009111900911190000000000000000000000000000000000000000000500333532300005050033353230000503adaa1111aadad00adadd1111ddada000000000
009119000091190000000000000000000000000000000000000000005500033552300005550003355230000503aadaaaaaadaad00addaddddddadda000000000
009559000095590000000000000000000000000000000000000000005550003553300555555000355330055500daaddddddaad0900addaaaaaadda0000000000
09dddd9009dddd900000000000000000000000000000000000000000555503d53d300555555503d53d300555900ddaaaaaadd000900aaddddddaa00900000000
09dd0dd909dd0dd9000000000000000000000000000000000000000055770d35d3d0077505770d35d3d0077000900dddddd0009000090aaaaaa0009000000000
00000000000000000000000000000000000000000000000000000000000000555500000000000055500000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000005511550000000000551155000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000055111150000000005511115000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000051161655000000005161615500000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000055551111115550005555111111555000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000551555515555555055155551555555500000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511111555111115051111155511111500000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511111111111111551111111115111150000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511111111111111551111111155111150000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511111111111111551115511551111150000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511111111111111551111151151511550000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000511151111115111555115151115115500000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000515151155115151505511515515555000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000555551155115555500555115511550000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000511155111500000051115511150000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000555555555500000055555555550000000000000000000000000000000000000000000
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
