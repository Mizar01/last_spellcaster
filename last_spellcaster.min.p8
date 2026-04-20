pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
poke(24412,-1)n_=false n4=false n3="last_spellcaster/logs/log"G=60O={}function n(e,n)local e,t=unpack(split(e,":"))O[e]=n n.__index=n setmetatable(n,O[t])n.new=function(...)local t=n.__new(e,...)t.__name=e setmetatable(t,n)return t end n.super=O[t]return n end nt={}function _(t,i,l)t,l=t or{},l or{}local function f(t)local n=1while n<=#t and(sub(t,n,n)==" "or sub(t,n,n)=="\n"or sub(t,n,n)=="	")do n+=1end local e=#t while e>=n and(sub(t,e,e)==" "or sub(t,e,e)=="\n"or sub(t,e,e)=="	")do e-=1end if(n>e)return""
return sub(t,n,e)end local e,n=1,#i while e<=n do while e<=n do local n=sub(i,e,e)if(n~=" "and n~="\n"and n~=";"and n~="	")break
e+=1end if(e>n)break
local r,d,o=e,0,nil while e<=n do local n=sub(i,e,e)if(n=="{")d+=1
if(n=="}")d-=1
if d==0do if(n=="="and not o)o=e
if(n==";"or n=="\n")break
end e+=1end local d,n if(o)d,n=f(sub(i,r,o-1)),f(sub(i,o+1,e-1))else n=f(sub(i,r,e-1))
local e local i=sub(n,1,1)if i=="{"and sub(n,-1)=="}"do e=_({},sub(n,2,#n-1),l)elseif i=="*"do local n=tonum(sub(n,2))e=l[n]elseif sub(n,1,3)=="_k_"do local n=sub(n,4)e=t[n]elseif sub(n,1,4)=="_fn_"do local n=split(sub(n,5),"_")e=nt[n[1]](#n>=2and n[2]or nil)elseif n=="true"do e=true elseif n=="false"do e=false elseif n=="nil"do e=nil else e=tonum(n)if(e==nil)e=n
end if d and d~=""do t[d]=e elseif n~=""do add(t,e)end end return t end function D(n,e)nt[n]=e end function f(e,t)local n={}_(n,e,t)return n end function k(n,e)return unpack(f(n,e))end Q=n("c_timer",{__new=function(t,n,e)local n={maxtime=flr(G*n),t=flr(G*n),loop=e or false}return n end,adv=function(n)if(n.t<0)return false
n.t-=1local e=false if(n.t==0)e=true if(n.loop)n.t=n.maxtime else n.t=-1
return e end,restart=function(n)n.t=n.maxtime end,t_left=function(n)return flr(n.t/G)end,t_left_btw=function(n,e,t)local n=n:t_left()return n>=e and n<=t end})function nb(t,i,n,e)n,e=n or 8,e or 8local t,i=flr(t/n),flr(i/e)return{tile=mget(t,i),tx=t,ty=i,ox=t*n,oy=i*e}end function nm(n,e,t,i,o,l,d,f)rectfill(n-1,e-1,n+t+1,e+i+1,d)local t=mid(0,flr(o/l*t),t)rectfill(n,e,n+t,e+i,f)end function np(n)if(not n4)return
printh(n,n3 or"mainlog")end function c(n,e,t,i)?n,e-#n*2,t,i
end function ni(t,e,i)local n={}for e=0,e-1do n[e]={}for t=0,t-1do n[e][t]=i end end return n end function K(n,e,t)local n=n+t*(e-n)return n end function n5(e,t,n,i,o)local n=n.t/n.maxtime if(i)n=1-n
return K(e,e+(o==l and-1or 1)*t,n)end function w(n,t)if(n==nil or n=="")return false
for e=1,#n do if(sub(n,e,e)==t)return true
end return false end nw={[[1R0#4!0$4!0$4!0$b!0%b!0#4#X"0%4!1$Z"1"0&X"0"g!0"X!0"g!0#X!0!b!001!C!0"1!Z!0!1"0!1"0!1:0)1"0"1!0#1!0"a!0!1=0'1!0!1"b!0"1!0"1"0!1%0"1)0%4#0#1!0'1!0"1!0#1!0" !0#1#0&4#0.1#0%1"0!1!0#1!0!1"0#X!1!X!091%0!j$0#1!a!0*5!0'5!p!0(1&x!Z"1!0!1(0"1"0&1%0!1!0!1$0+b!1!0!1,0! !0'1#0$1!0#1#0+1!0!t!v!0!1)0!1"0$X!1"0&1"0!1!0"1"0)a!1$0!1"0!a!0$1!0!2!3!0$1"0$Q!0#M!0!1!0#1"0"5!0!2!0%5!0#j"0&1$0!1$0#d!1(0$1'0!1)0&1!0%1#0-Y!0"1'0$b!0%g!0"1$0#1!0!1#0"1"0!1"0"1"0!1"0"1%0%b!0"1(0"1#0!1!0"4!1"0$b!0$b!0$1"0(b!0"1"0)1!0#1"0"4!1"0$b!1"b!0$1#0!1+0*1!0"1!0%4!1#0$x!0#1#0$1!0&1!0'1"0#1!0"1!0!5!0%Z!1$0"1$0$1!0!1!0"E!0#1!0,1!0!1.0"1#0'1!0"1"0"1!0,1!0(1(0!1#0'1"0"1!0"1!0'3!g"0"1"0)1$0$1"0#1#0"1!0"1"0!1!0%1(0+1$B!0!1#Z!0$1!R!0!N!0"1!2!0!N!2!0"R!1"0&1#0$c!0$1,0"1/0'1!0'c!0$1'0"h"0"h"0#1#0#b!0*1$0"1$0!1(0#1&0#1!0&b!0)1!0%h!0"b!0%1#05b!0(1'0)1"06b!0'1"0"Z!1"0)b!0/1%0)3!1#0"Z!0!U!0$5!0!X"0"g!0!e!0#X"0"5!0"1(0"5!0#f!0!1%0!1L]],[[1P0-4#0$1!0#X"0$1!0'4!0!4!0!4"081!0!1&0!b!0F1!0&1!0H1&0!1!0-X!0A1!0H1+0-2!0!3!0$2!0/1!X!0"4#0$X!1!0+1*0!p!0"f!0"5!0%1!X!0*1!0'2"0!1%0"1.0!1#X!0*1!0#1,0"1/0!h!0!1"X!0!g!0#g!0&1)Y!0$1"0&a!0%1$0"140!4"Y!0!1$0(e!0*1.0!4!0!4!0#1#0*1'0'b!0#b!0"X!b!001#0"1%0!b!0BX"4"1"0(b!0$1#0*X!0'X"0&1"0-b!0)1#0!1!0"1#0!1!0"1#0(1!0>b!0&4!0+1#0)b!0:1#0$X!0#4!0$2!0"2!0#2!084"0%1#0%1*0?b!4!0%1!0(1!0;1!0!1"0$1$0"1!0!1!0!1!0!1"0;b!031!0"2!0!e!0!e!0!3!0-1#0,1!0!1!0!1!0#1!0!1(0!1#03b!0;1!0!3!0"e!X!0!3!0!3!0/1!0#a!0"1"0"1$0$1!0"1-0=1!0%4"b!0!b!0!b!0!b!0#1!0"g!0!3!0!3"0$2!011!001+0!1"0$1!0>4!0!4!0"4!0#1%0"1#0!g!0#5!0#5!0"g!2!0$2!b!0!b!0!b!0!b!0.170!18]],[[1P0"4"0!4!0!4!0,X!0%4!0%Y!0#1,01X"0+1$0"4!1+0*1"0!a!0"1$0!1!a!0!1#0!a!0(4!1*0F1*0*X!0$2!0#2!0#2!0$3!0$3!0$1*0"2!q!f!0#1=0!1L0$1*0#A!1!0.b!0&Z!1'0!11091%0$1+0%1!0"X#0$X"0,1$0$1*0&1!0!1%0"1$0!1"0%a!0#1#0!1"0!1*0&1!0)4"0.1"0$1*0&1!001"0'1!4!0"1,0&1#0"a!Z!b!021!0%1*0(1"0.b!0!1"0!a!0#1"a!0"1*0#X"0$1!004!0&1!0$110"1!031%0#1+0"b!0"b!0#1!0-1"0!1"0"4!0!1!0%1*0)1"0*X!0"b!0'1#0!a!0!1*0#b!0&1!0)1"0*1!0%1*0&b!0#1"04Y!1!0"1,0+1!0&1"0-1!0$1*0"b!0(1#0#2!0$2!0#e!0!5!0#X!1!2!0#1*0%b!0'1!0"13X"0!1*0#b!0)1"0#4!0!4!0!1#4"1#4!0"1$0!1*0.1"0'1#0!4!1!4!0$1"0"1*0&b!014"0)1!0!1+0"3!0"3!0"2!0"2!0#1&0.1!0"180!1'0$1"0'1"0!1*051"0!3!0%g!0!3!0%1<0"1<]],[[1"0"1N0"j!b!0"b!0*d!0!d!0+S!1!S!0!3!0)1&0!b!0'v!0!t!0!u!0!b!0!b!0)1&0)1"0&b!0&1)0"2!0%b!0!O!0!O!0'3!0#1"0!3!0!2!0#130%1"0!1!0"1'0"1/0)1%3!0!2!0!1"0"1!0!1!0"a!0%1*021'0#1!0&2!0#1!051"0(1#0!1!0$1(02v!0,1"0"1$0'1"0)a!0(1"0&a!0$1"0"1!0&4!0#1#0?1"0"1!0#1(0/1"0/1#0"1!0"a!0%1"5!02u!0,1"0$1!0'1$001"0,1"R!0$1!0"1&0@1&0"1!0!c!0#1%021"0)N!0!j$0"1!0%1"0#1!0+t!0"1"0,1*0"4!0!1#0%m!0%4!0"1"0.1*0"1%0$1!0'1"021"Z"1%0%1"0>1#0%1#0!c!0#1"0!2!0!1!0!3!a!0#1"0+a!0&1"c!0&1#0$1)0!2!022!0"1"0"1!0$1$0#1/0%e!0(1%0!c!0%1#0$1"G!1!v!0!j!0#180$c!0!4!1"0%1"0!1!0"j!0%d!0"1)0#d!0#1#0"1!0#1"0"1&0!v!0"1!0'd!0.d!0#1!0$c!0!1"0#f!M!0"1!v!0"w!1!0#5!0$g!0$a!0"2!0"3!0"g!0%4!0"1$0!1!0!1*0!1B0!1!0#Q!1"Y!Z!1!0'1!0'a!0&1#0&1&0!1"0"1#0"1$041!0(1$0%1!0!1"0#h!0(e!0"t!u!v!0"e!0"v!u!t!0#e!0"5!0#t!0!v!0'1*0"1@0!1$]],[[170!19Y!0#1!0C1!0$Y!1"Z!0!3!0!1!01f!011!0"3!0!X!1%0!1!0/1%0/1!0!1&0N1(0B1"0$1!0$j"0!1!0*1"0'1"0-1"0#1'0"1!0(2!0%X"0$3!011"0&c!0(100&2!0"c!0#X"1.0$1.0$190&1-0%170"1"0#1,0#1"0"1,0+4!0*j"0#1"0&X"0)1"0"b!0&1$0)j"0#1"0$1$0&b!0"1"0#b!0)1!0(j"0"3!1"0/b!0!1"061"0"1#4!0&4!0)1#0'1#0#1!0%1"Z!1!0!1!Z!1$0$1#0'1%0$1!0-1!Z!0%Z!1!0.4!1'2!0(1$0$1"Z!0!D!0!Z!1"0"d!0*X!1)011'0.1,0%1!0*1%0-1(0&1!001#041"0,1!0A1"0!4!0%d!0%5!025!0%d!0%2!0!1&0"1#0#1#0#d"0+1#0"1#0#1%0$i!0"i!0H1*0$i!0"g!0)i!0"i!0"2!0$1#0!1(0%g!0#1*0!100!1!0#1!0!1!0!1"0#1'0&h"Q!1!0!M!S!N!0!1!R!h"0)1!0"1!0!1!0!1$0!1!0'1!0!1,0!1*0!1#0!1!0!1!0!1!0!1"0"2!0"1!X!1!0!g!0#1%0"j!P!O!h!0%i!0!i!0!T!1!0"3!0"Y!1!0!1!0!150"1;]],[[120"1=0!x!0#2!0!3!0!x!0!3!0!3!0!1"0"1#0'2!0"3!x!0"2!0!3"0!1'00N!0#N!0"R!031%0#1"0)1-0(1&0#1%0"1#X!0&110)1#0"3!1#0"b!1$0%1-0.1$0"1#0#1%0#1-0'a!0'2!0"1"0"1"0#1&0!1-0'1"0*1#0!1#0"1&0!1,3!0'a!0+1"2!0!1"2!0"1&b!1+2!041"0"1"0#1&b!1*3!0+1"0(1"0!1#0"1'0!1)Z!061"0!3!1"0"3!1&0!1)Z!0*1"0*1"0"1"0#1&0!1)Z!034!0"1#0!1#0"1&0"1(Z!0(4!0)1&2!0!1"2!0!1(0#1&Z!0(1"0#l!0(1"0"1"0#1"Z#1#0"X!1&0/1!0"d!1!0#1!0!1#0#1!Z!0#Z!1#0#1&0%1"0+1"0"1!0!3!1"0"1"w!0#1%0#1&0+1!0%1!0#1!0"1"0"3!1"0#w!1%0#1&0"1!0)1!0!1!0!1!0"1#0!1"0#1!2!0$1&0#1&0#5!0!v!0$t!0$1!0"1"2!0!1#0"1!0"1!0"3!1&X!0!X!140"1#0"1"2!0"1!0&1'0#1/K!V!k!t!0!1$0!1#0#1"4!0%1'X!0!X!160#1$0!1&0#1'0&3!0!3!0!d!2!0!2!0!3!0)1#0"f!0!M!0!Q!0"1#v!0"1&00v!0"u!0"t!0#1(0!1%t!0"1&X!0%d!0'1"0!1"0!1"0#1&0#1&t!0"1&04d!0#1%0#1(t!0"1&0%d!0#1"0,1$0$1)u!07d!0&1$0"1,0$4!0%d!0%4!0#5!0)1$0!1L]],[[1)0"1@0!1%0,x"0$1!x!0#x!0"1!0%1!4!0!1!0%1!0$1"w!0'1!0!1!0'1!4!0,1!w!0'1"0#1"2!0$3!0$1!x!0&1!0'1!0#X"1!4!0!1!0(1&0!1+0!1$4"0%1"0!1$0"1!0(f!0!1"0#1!0%x!0!x!X!1!0$1!0'1!2!0#4!1!0"1%0!1'0"1"0(X!1"0+1#0#1!0$1!0(1"0"2!0%3!0!x!0!X!1!0$1!0"x!0!3!0!x!1!0#3!0$3!0!1!0"2!0#3!0!1'0!1D0!1%0"x!0%1!0$d!0!1!0$1'0$1!0#d!0"Z"1!0%1"0%3!0"1!0%d!0%t!0!t!0!t!0!t!0$1!0$d!0#1!0%1"0$1#0!1!0&1!0#1)0#1!0%d!0"1!Y!0$1"0(1!0$5!0!1!0#1!0$M!0!F!1!0"u!0!v!0%d!0!1$0!1$4!0$1%0!1(0$110%1"a!0%2!0"1!06w!1!4!0"1!0"1!Y!0$1"0$1#0"1#0-b!0'1!0!4!0!1!0"1$0#1!0(w!1!0&1$0'1%0!1!0"4!1!0%1!x!0"1!0&1'0#1!0"1!Q!0&1!0!2!0,w!1"0"1!0$3!0%1!0$1"0"1#0$1(0#1!0!2!0'1"0#1#0#1!0#1#0&3!0!3!0'1!0#1&0$1!0)w!1!0!e!0#1!0"1,0"1!3!0"1!0$1!0"1!0!1!0&1(0"1!w!0/1#0!1!0$1&w!0*1!0#1"w!011!0!1!0(1#0#1#0$1!0$1!w!0#u!0#5!0!u!0#3!0#1!0$3!0%1"0'2!0!2!0!1#0"1(0!140!1"0&1'0#1!4!0(1!0)X!1!4!0'1"w!0$3!0&1!0"1"0"1!0&1!0$3!0!3!0"X!1!0$1&0$1'0!1!0#1!0)1#0!1%0!1"0#1(0*w!1"0"1"0(1!0%1!0.1!0,1!0#1!0)1!0"1$w!0#1#0'1!0"1#0!3!0#e!0#3!0!1!4"i!0"2!0!x!i!0!5!0$1!Z!0#1!0#2!0"2!0"1P]],[[130"1=0$x!0#x!0$4!0!1!0$1!x!0'g!0)1!0%1"4!0&x!0#x!0$1!0"f!0!1!0#5!0"1&0#3!0!Q!1!0$1#0"1,0"1!0$1!0"1$0&1'0!1!0#1"4!0"x!0!x!0!x!0%1"0!1!0$1!0"1#0"t!0!v!0+1!0"1"0$x!0!x!0!x!0#1!0#1!0$1!0!1#0"1%0"2!0'1!0!1-0!1!0$1!0$1!0%1!0%1+0"1"w!0*1!0#1!0&1!0#1!0"1!0(b!0%1!0!1"w!0!2!0"5!0"3!0"1!0"1!0(1!0"M!0!1!0!1!0#3!0$b!0&1"0!1+0"1!5!0!t!0#u!0"1#0!1!0!120!1,0!1%0!1"0"1!0#1!0#x!0!x!0+1"0+1!0!3!0#M!0"M"0"1!0!1$001$0)1+0"1!0%1"0$1!0!b!1!0"1"0"1%0"g!0/1!0#1$0!1!001*0-1!0!3!0!t!0"w!1!0#1%0#1!0%4!0(1!0"g!2!0)1'0"1"0%1!0+i!0"i!0#1&0!g!0#4"0!1!0&1!0$2!0#1#0%4!0"1%0'1%0#1"0$1"0"1%0"1!0,x!0!x!1!0,4!0!1!R!0!1!0"1!0"1!0'1!0#1!0%1"0%1!0#g!5!0$1&0#1!0"1!0(1!5!0(1!R!0%w!1(0"N!0!3!0'1!0&1)0!1)0"140&1!0(1#0"k!N!0"L!1!0"1#0*x!0%x!0%1!0$i!0%1"0"k!1%0!1#061!0#1$0$1"0!1"0!1!0"1!0"1!0%1!0!g!0&1#0$5!0!1"0&1!0"1#0'1"0!1!0"1*0"k!H!k!0"1*0"4!1!0"1"0%d!0!1!0"1!0,1'0-1!0"1"0&1!0#1"0!5!0"i!0)i!0*i!0"2!0!4!1"0!1!0"1!0#1!0#1,0!1*0!1*0#1!0#1!01w!1!w!0)1!w!0+1"0!3!0"3!0$2!0#t!0!3!0"u!0!2!0#3!0!t!0!u!0"2!0#3!0!t!0!u!0!v!0!2!0#1Q]],[[1#0!1O0$1#0!X"1#X"1#X!0%4!01x!0!1%0*1!0-4!0"1(0"2!0%1$0%1!0*1!a!0&4!0"1!0(1$0$1$2!0!3!0!1#0"v!0!t!0!2!0!1#0"3!0!i!0"4!1!0%5!0'1"0"1.0!100#1&0$1!0"1)Y"1$0!1+0-Z!1!0#1!0#1#Q!0&4!0"M!0!1)0/Z!1!0"2!1"0"1%0'1(0'1-0#1"0#1$0'1!0-1"0&X#0(1!0"1$0"1'w!0+1!031"0"1#Z!0*i!0#i!0%1!0&3!0!2!0#g!0!3!0"1"0$190"1/0&1#0!x!0"1'0"b!0>1"0&4!0"4!0/1!041"02t!v!091#021"0$1!0%2!1"0!i!0!X"0%1%0+5!0"3!0"1$0$g!0!g!0!1,0#1$0'1!0!1(0#150$1#0)1!0.1!0$1!0%1!0$1"0#w!1"0)1!014!0-1"w!0#1"0&1#0.4"0/1"w!0"1%0%4!1!0+ "0#1"0"1"0)1"0#w!1&0$1!0'1"0&4!0(2!0'1!0"1!0!1"0"4!0%1!0.4!0)1"0&1!w!0#1"0&1#0$1"0% !0"1"0,3!0"1#0"w!1"Z!0!4!0%1!0.4!0,1"0#1!w!0#1&0$1#0'1"051!0"1!0!1"0&1%0"1"0'4"0!1"0&1"0#1"0!1!0!k#1"4!0%1%0-4!001!2!k!I!k!1"Z!f!0"x!0#k!U!V!03p!0*1V]]}b=n("c_obj",{__new=function(i,n,e,t)local n=f([[parent_mgr=*3
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
end,draw_sprite=function(t)if(i:offview(t))return
if(n_)local n=t:hitbox_pos(0,0)rect(n.x,n.y,n.x2,n.y2,8)
local n=t.spr if(n.effect=="blink_white")if(time()%.2<.1)for n=0,15do pal(n,7)end
local e,i=n[t.phase],nil if e.ss~=nil do i=e.ss else if e.loop~=nil and e.loop==false and e.sprites[#e.sprites]==n.last_frame do i=n.last_frame else if(n.time_start==nil or n.time_start==0)n.time_start=time()
i=e.sprites[1+flr((time()-n.time_start)/(1/e.fps))%#e.sprites]end end spr(i,t.x,t.y,t.tw,t.th,n.flip_x or false,n.flip_y or false,7)pal()n.last_frame=i end,collide=function(n,e,t,i)local n,e=n:hitbox_pos(0,0),e:hitbox_pos(0,0)if(t~=nil)n.x+=t n.x2-=t n.y+=i n.y2-=i
return not(n.x2<e.x or n.x>e.x2 or n.y2<e.y or n.y>e.y2)end,hitbox_pos=function(n,e,t)e,t=e or 0,t or 0return{x=n.x+e+n.hitbox.x,y=n.y+t+n.hitbox.y,x2=n.x+e+n.hitbox.x2,y2=n.y+t+n.hitbox.y2}end,out_of_map=function(n)return n.x<0or n.y<0or n.x>no or n.y>nl end,mdist=function(n,e)return abs(n.x-e.x)+abs(n.y-e.y)end,moveTo=function(n,e,t)local i=n:mdist(e)local t=t/i n.x=K(n.x,e.x,t)n.y=K(n.y,e.y,t)end})C=n("c_mgr",{__new=function(n)local n=f"objs={}"return n end,restart=function(n)n.objs={}end,add=function(n,e)add(n.objs,e)end,del=function(n,e)del(n.objs,e)end,update=function(n)for n in all(n.objs)do n:update()end end,draw=function(n)for n in all(n.objs)do n:draw()end end})function s(t,e,n)local i,n=n or t.speed,n or t.speed local i,o=e==l and-i or(e==r and i or 0),e==j and-n or(e==T and n or 0)local n=t:hitbox_pos(i,o)if(t.bounce_map and(n.x<0or n.y<0or n.x2>no or n.y2>nl))return 0
if e==r or e==l do local e=e==l and n.x or n.x2 local o,n=g(e,n.y),g(e,n.y2)if(not o and not n)t.x=t.x+i return 1else return 0
elseif e==j or e==T do local e=e==j and n.y or n.y2 local i,n=g(n.x,e),g(n.x2,e)if(not i and not n)t.y=t.y+o return 1else return 0
end end function nx(n)return n==nil or n.destroyed end function I(n)if(n~=nil and not n.destroyed)n:del()
end function E(n,e)return flr(n/8).."_"..flr(e/8)end function R(n)local e=E(n.x,n.y)if(y[e]==nil)y[e]={}
add(y[e],n)end function nd(n)local e=E(n.x,n.y)del(y[e],n)end function L(n,e,t,i)local n=nb(n,e,t,i)return fget(n.tile,ng)end function n8(t,i)local o=E(t,i)for n in all(y[o])do local e=n:hitbox_pos(0,0)if(t>=e.x and t<e.x2 and i>=e.y and i<e.y2)return n else local e=E(n.x,n.y)if(e~=o)del(y[o],n)R(n)
end return nil end function g(n,e,t,i)return L(n,e,t,i)or n8(n,e)~=nil end function v(n,e)q[m][flr(n.spawn_x/8)][flr(n.spawn_y/8)]=tostr(e)end function Z()return J[m]end function e(n,e)n.theme=ny[n.theme]n.npcdata=e return n end function nv(n,e)local e={[n7]=2,[n6]=1,[nX]=2,[nk]=5,[nj]=4,[n9]=1,[nZ]=3,[nY]=1,[nM]=1,[nN]=5,[nQ]=4,[nT]=1,[nR]=1,[nL]=1,[nH]=3,[nB]=1}return e[n]end function nF(t,l,o)local n,i=0,0for e=1,#t,2do local d,e=sub(t,e,e),sub(t,e+1,e+1)local e=ord(e)-32for e=1,e do o[n][i]=d n=n+1if(n>=l)n,i=0,i+1
end end return o end function S()local n,r=nw[m],Z()local d,i,e=r.theme,nil,nil if V[m]==nil do i,e=ni(x,p,""),ni(x,p,"")if nA and nf do for e=1,x do for t=1,p do local n=(e-1)*p*2+(t-1)*2+1local n=sub(nG,n,n)if(n==" ")n="0"
i[t-1][e-1]=n end end else nF(n,p,i)end else i,e=V[m],q[m]end local a,c,u,s=a.mgr.misc_mgr,f"Q={};R={};S={};T={}",f"M={};N={};O={};P={}",false for o=0,x-1do for l=0,p-1do local n,f=i[l][o],e[l][o]mset(l,o,0)if f~="d"do local e,t=l*8,o*8if n=="1"do local n=nC(i,l,o)local n=d.tile_maps[nv(n,d)]or 1mset(l,o,n)elseif w("2345",n)do local i=d.bg_item_off[tonum(n)-1]local e=b.new(e+i[1],t+i[2],a)e.spr.idle.sprites=d.bg_item_spr[tonum(n)-1]e.tw=i[1]==0and 1or 2e.th=i[2]==0and 1or 2add(a,e)elseif n=="f"do if(X~=nil)h:respawn(X[1]*8,X[2]*8)else h:respawn(e,t)
if(nE)_(h,[[avail_el={true;true;true;true}
cur_el=1
lev_el={3;1;1;1}
lifereg_lev=2
keys={red=true;blue=true}
                        ]])
s=true end if(w("abcd",n))U.new(e,t,P[n])
if(w("egi",n))nP.new(e,t,P[n])
if(w("lmn",n))z.new(e,t,P[n])
if(w("tuv",n))nO.new(n,e,t)
if(w("wx",n))nr.new(n,e,t)
if(w("hjk",n))W.new(n,e,t)
if(w("XYZ",n))na.new(e,t,n=="X"and 1or n=="Y"and 3or 5,true)
if(w("ABCDEFGHIJKL",n))nD.new(e,t,n)
if(w("UV",n))n0.new(e,t,true,nK[n],f=="1")
if w("pqrs",n)do local n=r.npcdata[n]or{cname="c_npc_stage"..m,msg="undefined msg"}nI.new(e,t,n.cname,n.msg)elseif w("MNOP",n)do local e=n0.new(e,t,false,0,f=="1")add(u[n],e)elseif w("QRST",n)do local e=nq.new(e,t,f=="1")add(c[n],e)end end end end if(m>1and not s)h:respawn(X[1]*8,X[2]*8)
for e,n in pairs(c)do local t=sub(sub("MNOP",ord(e)-ord"Q"+1),1,1)for e in all(n)do for n in all(u[t])do e:link(n)end e.siblings=n end end V[m]=i q[m]=e end function nC(t,n,e)local i,o,l,e,n=e>0and t[n][e-1]=="1"or e==0,e<x and t[n][e+1]=="1"or e==x-1,n>0and t[n-1][e]=="1"or n==0,n<p-1and t[n+1][e]=="1"or n==p-1,0if(i)n+=1
if(o)n+=2
if(l)n+=4
if(e)n+=8
return n end function nJ()local n,i,e,t=Z().fix_jumps,5,nil,nil for o=1,#n do local n,o=n[o][1],n[o][2]local l=abs(n-flr(h.x/8))+abs(o-flr(h.y/8))if(l<i)i,e,t=l,n,o
end if(e~=nil and t~=nil)h:respawn(e*8,t*8)
end function nc()h:reset_stage_props()for e,n in pairs(a.mgr)do if(n.restart)n:restart()
end y,H,n1=k"{};{};{}"end i={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,offvtol=90,update=function(n)n.x+=(h.x-n.x)*n.csfx n.y+=(h.y-n.y)*n.csfy n.x=mid(n.ox,n.x,p*8-n.ox-16)n.y=mid(n.oy,n.y,x*8-42)local n,e=n:calc_center()camera(n,e)end,place=function(n,e,t)n.x=e n.y=t end,calc_center=function(n)return flr(n.x)-n.ox,flr(n.y)-n.oy end,offview=function(n,e)return abs(flr(n.x-e.x))>n.offvtol or abs(flr(n.y-e.y))>n.offvtol end}nS=n("c_player:c_obj",{__new=function(t,n,e)local n=b.new(n,e)_(n.spr,[[idle = { sprites = { 64; 65 }; fps = 2 }
walk = { sprites = { 80; 81; 82 }; fps = 6 }
jump = { sprites = { 97; 98; 99; 100; 101; 102 }; fps = 8 }
dead = { sprites = { 68; 69; 70; 71; 72 }; fps = 4; loop = false }
		]])_(n,[[name=player
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
lifereg_lev=0
lifereg_ttl=_fn_t2_4
stinky_socks=false
cur_el=nil
avail_el={false;false;false;false}
lev_el={1;1;1;1}
el_cooldown=_fn_t1_1
shine_star=0
interaction_fn=nil
hitbox={x=2;y=3;x2=5;y2=7}
t_respawn=nil
shards=3000
bounce_map=false
last_btn_down_time=0
keys={red=false;blue=false}
		]])return n end,reset_stage_props=function(n)n:reset_jump_vars()end,update=function(e)if(a.paused)return
local n,t=e,f("left=*1;right=*2;jump=*3;jump_start=*4;action=*5;down=*6;",{btn(0),btn(1),btn(4),btnp(4),btnp(5),btnp(3)})if n.phase=="dead"do if(n.prev_btn.left)s(n,l)
if(n.prev_btn.right)s(n,r)
n.speed*=.9n:apply_forces(t)if n.t_respawn:adv()do if(B~=nil)B.life=B.max_life
X=nil nc()m=2S()i:place(h.x,h.y)n.life=n.max_life n.phase="idle"n.invulnerable=false end return end if(e.lifereg_ttl:adv())e:increase_life(e.lifereg_lev/5)
if not n.blocked do if(t.left)n:move_left()
if(t.right)n:move_right()
if(not t.left and not t.right)n.speed=n.speed*.7if(n.speed<.1)n.speed=0
n:apply_forces(t)end n.prev_btn=t if(t.left==false and t.right==false and n:on_ground())n.phase="idle"
if(n.nodmg_t~=nil)if(n.nodmg_t:adv())n.spr.effect="none"n.invulnerable=false
if(t.action)if(e.interaction_fn~=nil)e.interaction_fn=nil else e:attack()
if(e.el_cooldown:adv())e.shine_star=10
if(t.down)local n=time()-e.last_btn_down_time if(n<.4)e:switch_element()e.last_btn_down_time=0else e.last_btn_down_time=time()
e.interaction_fn=nil end,draw=function(n)local e=n if(e.invisible)return
e:draw_sprite()if(n.shine_star>0)spr(104,n.x,n.y)n.shine_star-=1
end,dmg=function(n,e)local n=n if(not n.invulnerable)n.life-=e if(n.life<=0)_(n,"phase=dead;invulnerable=true;t_respawn=_fn_t1_5")else n.nodmg_t=Q.new(1)n.spr.effect="blink_white"sfx(nV)n.invulnerable=true
end,increase_life=function(n,e)local n=n n.life=min(n.life+e,n.max_life)end,inc_speed=function(n,e)local n=n if(e)n.speed=n.init_speed else n.speed=min(n.speed+n.inc_speed_factor,n.max_speed)
end,move_left=function(e)local n=e e:inc_speed(not(n.prev_btn.left or false))s(n,l)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=true end,move_right=function(e)local n=e e:inc_speed(not(n.prev_btn.right or false))s(n,r)if(n.phase=="idle")n.phase="walk"
n.spr.flip_x=false end,apply_forces=function(n,e)if(not n.blocked and e.jump_start)n:set_start_jump()
if(not e.jump and n.jstack>0)n.jstack=0
if(n.jstack>0)n.speedy=-n.jforce n.jstack-=1
if(n.speedy<0and not e.jump)n.speedy*=n.speed_y_decay
n.speedy+=nU n.speedy=min(n.speedy,n.max_speedy)local e=s(n,n.speedy<0and j or T,abs(n.speedy))if(e==0)n:reset_jump_vars()if(n.phase=="jump")n.phase="idle"
end,reset_jump_vars=function(n)n.speedy=0n.jstack=0end,set_start_jump=function(n)if(n.phase=="dead")return
if(n:on_ground())n:reset_jump_vars()n.phase="jump"n.spr.time_start=nil n.jstack=n.max_jstack sfx(0)
end,on_ground=function(n)local n=n local n=n:hitbox_pos(0,1)local e,n=g(n.x,n.y2),g(n.x2,n.y2)return e or n end,apply_end_stage_upgrades=function(n)end,attack=function(n)if(n.cur_el==nil)return
if(n.el_cooldown.t<=0)nu[n.cur_el].new(n.spr.flip_x and l or r,u())n.el_cooldown:restart()
end,switch_element=function(e)if(e.cur_el==nil)return
local n=e.cur_el%4+1while true do if(e.avail_el[n])e.cur_el=n Y.new(30,nu[n].name)break
n=n%4+1end end})o=n("c_enemy:c_obj",{__new=function(l,e,n,t,i,o)local n=b.new(n,t,o)_(n,[[respawn_timer = _fn_t1_10
dmg_time = _fn_t1_1
frozen_t = _fn_t1_20
time_last_death = 0
life = 40
max_life = _k_life
dir = nil
wspeed = 0
dir_before_blow = nil
fixed = false
hitbox = { x=2;y=2;x2=5;y2=5} 
hitbox_orig = _k_hitbox
speed = *1
etype = *2
boss = false
value = 3
memdeath = false
        ]],{i or 1,e})n.frozen_t.t=0return n end,dmg=function(n,e)if(n:is_inv())return
n.life-=e n.dmg_time:restart()n.spr.effect="blink_white"if(n.life<=0)na.new(n.x+4,n.y+4,n.value)n:del()
end,freeze=function(n)n.frozen_t:restart()if(n.fixed)return
R(n)n.hitbox={x=0,y=0,x2=7,y2=7}end,unfreeze=function(n)if(n.fixed)return
n.frozen_t.t=-1n.spr.effect="none"n.hitbox=n.hitbox_orig end,blow=function(n,e)if(n.fixed)return
if(n.wspeed<=0)n.dir_before_blow=n.dir
n.wspeed=2n.dir=e end,unblow=function(n)_(n,"wspeed=-1;dir=_k_dir_before_blow;")end,update=function(n)b.update(n)for e in all(H)do if(n:collide(e))e:hit(n)
end if(n.dmg_time:adv())n.spr.effect="none"
if(n.frozen_t:adv())n:unfreeze()else if(n.frozen_t:t_left_btw(.1,2))n.spr.effect="blink_white"
if(n.wspeed>0)local e=s(n,n.dir,n.wspeed)n.wspeed=e==0and 0or max(0,n.wspeed-.05)else if(n.wspeed~=-1)n:unblow()
end,draw=function(n)if(n.frozen_t.t>0)spr(139,n.x,n.y)
b.draw(n)end,del=function(n)n.time_last_death=time()nd(n)if(n.memdeath)v(n,"d")
b.del(n)end,check_pl_coll=function(n,e)if(n:collide(h))h:dmg(e)return true else return false
end,is_inv=function(n)return false end})U=n("c_fly_en:c_enemy",{__new=function(i,n,t,e)local n=o.new(e,n,t,.3,F())n.spr.idle={sprites=nn[e].idle,fps=4,loop=true}n.horizontal=ns[e]==nil _(n,[[hitbox_orig = {x = 2; y = 2; x2 = 5; y2 = 5}
horizontal = _k_horizontal
dir = *1
dir_before_blow = _k_dir
        ]],{n.horizontal and r or T})return n end,update=function(n)o.update(n)n.spr.flip_x=n.dir==r if(n.frozen_t.t>0)return
n:check_pl_coll(1)local e=s(n,n.dir)if(e==0)n.dir=(n.horizontal and 0or 2)+(n.dir+1)%2
end})nP=n("c_walk_en:c_fly_en",{__new=function(i,n,e,t)return U.new(n,e,t)end,update=function(n)U.update(n)local e=n.x+(n.dir==r and 7or 0)if(not L(e,n.y+8))n.dir=(n.dir+1)%2
end})W=n("c_vine:c_enemy",{types=f"h={pal=3;flev=0};j={pal=8;flev=1};k={pal=12;flev=2};",__new=function(i,e,n,t)local n=o.new("vine",n,t,0,F())n.spr.idle=f"ss = 6"_(n,[[fixed = true
life = 10
hitbox = { x=0;y=0;x2=7;y2=7}
pal = *1
flev = *2
memdeath = true
        ]],{W.types[e].pal,W.types[e].flev})R(n)return n end,draw=function(n)pal(7,n.pal)o.draw(n)pal()end,is_inv=function(n)return not(h.cur_el==M and h.lev_el[M]>n.flev)end})nO=n("c_spike:c_enemy",{__new=function(i,t,n,e)local n=o.new("spike",n,e,0,F())n.spr.idle=f"ss=22"_(n,"fixed=true;life=10;dir=-1;hitbox={x=1;y=7;x2=6;y2=7};spf=0.15;")n.y=e+8-4*(ord(t)-ord"t")return n end,update=function(n)n:check_pl_coll(2)n.y+=n.dir*n.spf if(n.y<n.spawn_y or n.y>n.spawn_y+8)n.dir*=-1
end,draw=function(n)o.draw(n)spr(Z().theme.tile_maps[2],n.x,n.spawn_y+8)end,is_inv=function(n)return true end})nr=n("c_crater:c_enemy",{angles=f"0.5;0;0.25;0.75",__new=function(i,e,n,t)local n=o.new("crater",n,t,0,F())n.name=P[e]n.spr.idle={ss=nn[n.name].idle[1]}_(n,"fixed=true;life=10;dir=-1;spf=0.15;inited=false;tfire=_fn_t2_2;")n.horizontal=ns[n.name]==nil n.dir=n.horizontal and r or T n.tfire.t-=flr(rnd(40))return n end,update=function(n)if not n.inited do if(n.horizontal and L(n.x+12,n.y))n.dir=l
if(not n.horizontal and L(n.x,n.y+12))n.dir=j
n.spr.flip_x=n.dir==l n.spr.flip_y=n.dir==j n.inited=true end if(n.tfire:adv())n2.new(n.x,n.y,nr.angles[n.dir+1],1)
end,draw=function(n)o.draw(n)end,is_inv=function(n)return true end})z=n("c_boss:c_enemy",{angles=f"0;0.1;0.4;0.5;0.6;0.9",__new=function(i,n,t,e)local n=o.new(e,n,t,.3,F())n.spr.idle.sprites=nn[e].idle _(n,[[life = 400
max_life = _k_life
tw = 2
th = 2
hitbox={x=0;y=0;x2=15;y2=15}
hitbox_orig=_k_hitbox
tcd = _fn_t2_1
tfire = _fn_t2_0.1
fire = false
tpos = {x=nil;y=nil}
mvrngx = 60
mvrngy = 30
boss = true
value = 50
memdeath = true
show_life_bar = true
]])B=n n.tcd.t-=flr(rnd(40))return n end,update=function(n)o.update(n)local e=n:mdist(h)n.show_life_bar=e<=120if(e>200)n.life=min(n.max_life,n.life+1)
if(e>80or n.frozen_t.t>0)return
n:check_pl_coll(5)if(n.tpos.x==nil or n:mdist(n.tpos)<3)n.tpos.x=n.spawn_x+rnd(n.mvrngx*2)-n.mvrngx n.tpos.y=n.spawn_y-rnd(n.mvrngy)
n:moveTo(n.tpos,n.speed)if(n.tcd:adv())n.fire=not n.fire
if(n.fire)if(n.tfire:adv())n2.new(n.x+4,n.y+4,rnd(z.angles),1)
end,draw=function(n)o.draw(n)if(n.show_life_bar)local e,t=i:calc_center()rectfill(e,t+13,e+flr(125*(n.life/n.max_life)),t+14,8)
end,del=function(n)B=nil if(n.etype=="boss2")h.keys.red=true
if(n.etype=="boss1")h.keys.blue=true
o.del(n)end})N=n("c_element:c_obj",{__new=function(n,e,t)local i,o=h.x+(t==l and-4or 6),h.y local n=b.new(i,o,u())n.spr.idle=nz[e]_(n,[[ttl = *5
max_dist = 20
destroy_req_prev_frame = false
origx = *1
origy = *2
dir = *3
el = *4
        ]],{i,o,t,e,Q.new(nW[e],false)})if(t==l)n.spr.flip_x=true
add(H,n)return n end,update=function(n)if(n.destroy_req_prev_frame)n:del()return
if(n.ttl:adv())n.destroy_req_prev_frame=true
n.x=n5(n.origx,n.max_dist,n.ttl,true,n.dir)if(L(n.x,n.y))n:del()
end,hit=function(n,e)n:effect(e)n:del()end,effect=function(n,e)e:dmg(e0[n.el][h.lev_el[n.el]])end,del=function(n)del(H,n)b.del(n)end})e1=n("c_fire:c_element",{name="fire",__new=function(e,n,t)return N.new(M,n)end,effect=function(e,n)n:unfreeze()N.effect(e,n)end})en=n("c_ice:c_element",{name="ice",__new=function(e,n,t)return N.new(ee,n)end,update=function(n)N.update(n)end,effect=function(e,n)n:freeze()end})et=n("c_thunder:c_element",{name="thunder",__new=function(e,n,t)return N.new(nh,n)end})ei=n("c_wind:c_element",{name="wind",__new=function(e,n,t)return N.new(eo,n)end,effect=function(n,e)e:blow(n.dir)end})d=n("c_int:c_obj",{__new=function(i,n,e,t)local n=b.new(n,e,t)_(n,[[show_int_button = false
ttl_disable_int = nil
int_done = false
solid = true
hover_info = nil
hover_info_obj = nil
int = true
cost = 0
        ]])return n end,update=function(n)if(not n.int)return
if n:collide(h,-2,-2)do n.show_int_button=true if(n.hover_info~=nil and nx(n.hover_info_obj))n.hover_info_obj=ne.new(100,nil,n.hover_info)n.hover_info_obj.ttl.t=G*20
h.interaction_fn=n.interact local e=n.ttl_disable_int if btnp(5,0)and not n.int_done do n:interact()elseif n.int_done and e==nil do n.ttl_disable_int=Q.new(.5,false)elseif e and e:adv()do n.int_done=false n.ttl_disable_int=nil end else n.show_int_button=false I(n.hover_info_obj)end end,draw=function(n)n:draw_sprite()if(n.show_int_button)?"❎",n.x+2,n.y-6,12
end,interact=function(n)if(h.shards<n.cost)Y.new(30,"you need "..tostr(n.cost).." shards")return
n:action()n.int_done=true h.shards-=n.cost end,action=function(n)end,del=function(n)I(n.hover_info_obj)b.del(n)end})nq=n("c_switch:c_int",{__new=function(i,n,t,e)local n=d.new(n,t,u())n.spr.idle=f"sprites={27;28;29}; fps=10; loop=true;siblings={}"_(n,"on=*1;int=*2;doors={}",{e,not e})return n end,action=function(n)if(not n.int)return
if(h.cur_el~=nh)Y.new(30,"you need thunder")return
for n in all(n.siblings)do _(n,"on=*1;int=*2;show_int_button=*2",{not n.on,n.on})v(n,n.on and 1or 2)end for e in all(n.doors)do if(not n.on)e:close()else e:open()
end end,link=function(n,e)add(n.doors,e)end,draw=function(n)pal(7,n.on and 11or 8)pal(10,n.on and 3or 9)d.draw(n)pal()end})n0=n("c_door:c_int",{__new=function(l,n,t,e,i,o)local n=d.new(n,t,u())n.spr.open=e and f"ss=60"or f"sprites={43,44;45;46}; fps=5; loop=false"n.spr.close=e and f"ss=59"or f"sprites={46;45;44;43}; fps=5; loop=false"_(n,[[phase = close
hitbox = {x=0;y=0;x2=7;y2=7}
int=*1
key=*2
]],{e,i})R(n)if(o)n0.open(n)
return n end,update=function(n)d.update(n)if n.phase=="close"do for e in all(H)do if(n:collide(e))e:del()
end end end,interact=function(n)if(not h.keys[n.key])Y.new(30,"you need the "..n.key.." key")return
n:action()n.int_done=true end,open=function(n)_(n,"phase=open;hover_info=nil;int=false;show_int_button=false")I(n.hover_info_obj)nd(n)v(n,1)end,close=function(n)n.phase="close"R(n)v(n,2)end,action=function(n)n:open()end,draw=function(n)if(n.int)pal(7,n.key=="red"and 8or 12)
d.draw(n)pal()end})nD=n("c_scroll:c_int",{__new=function(i,n,t,e)local n=d.new(n,t,u())n=_(n,[[el = *1
int_fn = *2
cost = *3
name = *4
col = *5
        ]],{ord(e)-ord"A"+1,el[e],ed[e],ef[e],er[e]})n.hover_info="learn "..n.name.." ("..tostr(n.cost).." shards)*"..tostr(ea[e])n.spr.idle={ss=12}return n end,update=function(n)d.update(n)n.y=n.spawn_y+sin(time())*2end,action=function(n)if(n.int_fn~=nil)n.int_fn(n)else h.cur_el=n.el h.avail_el[n.el]=true
Y.new(30,n.name.." acquired")v(n,"d")n:del()end,draw=function(n)if(n.el)pal(7,n.col)
d.draw(n)pal()end})na=n("c_shard:c_obj",{__new=function(o,n,e,t,i)local n=b.new(n,e,u())_(n,[[            speed = 0.1
            speed_inc = 1.05
            cnt = *1
            static = *2
            sbase = 1.5
            sx = _fn_rnd_15
            sy = _fn_rnd_15
        ]],{t or 1,i or false})return n end,update=function(n)local e=n:mdist(h)if e<4do h.shards+=n.cnt sfx(1)if(n.static)v(n,"d")
n:del()elseif not n.static do n:moveTo(h,n.speed)n.speed*=n.speed_inc else n.x=n.spawn_x+sin(time()*(n.sbase+n.sx/10))n.y=n.spawn_y+sin(time()*(n.sbase+n.sy/10))end end,draw=function(n)circfill(n.x+4,n.y+4,mid(1,n.cnt/2,4),7)end})nI=n("c_npc:c_int",{__new=function(o,n,t,e,i)local n=d.new(n,t,u())n.spr.idle.sprites=ec[e]or{154}n.name=eu[e]n.dialogs=split(i,"/")n.cur_diag=1n.diagcls=nil n.boss=e=="lea"and m==9return n end,update=function(n)d.update(n)if n.diagcls and(abs(n.x-h.x)>40or abs(n.y-h.y)>40or n.diagcls.destroyed)do n.diagcls:del()if(n.boss)z.new(n.x-8,n.y-8,"boss3")v(n,"d")n:del()
n.cur_diag=1n.diagcls=nil end end,action=function(n)if(n.cur_diag>#n.dialogs)n.diagcls:del()n.cur_diag=1n.diagcls=nil return
n.diagcls=n.diagcls or ne.new(30,n.name,"")n.diagcls:update_msg(n.dialogs[n.cur_diag])n.diagcls.cont=n.cur_diag<#n.dialogs n.diagcls.ttl:restart()n.cur_diag=n.cur_diag+1end})n2=n("c_bullet:c_obj",{__new=function(o,n,e,t,i)local n=b.new(n,e,u())_(n,[[dir = *1
speed = *2
ttl = _fn_t1_3
        ]],{t,i})n.spr.idle=f"ss = 185"add(n1,n)return n end,update=function(n)n.x+=cos(n.dir)*n.speed n.y+=sin(n.dir)*n.speed if(n:collide(h))h:dmg(1)n:del()else if(g(n.x,n.y)or n.ttl:adv())n:del()
end,del=function(n)del(n1,n)b.del(n)end})es=n("c_misc_mgr:c_mgr",{__new=function(n)local n=C.new()return n end})A=n("c_hud_element:c_obj",{__new=function(i,n,e,t)local t=b.new(n,e,t)_(t,"fixedx=*1;fixedy=*2",{n,e})return t end,update=function(n)local e,t=i:calc_center()n.x=n.fixedx+e n.y=n.fixedy+t end})e2=n("c_val_printer:c_hud_element",{__new=function(o,n,e,t,i)local n=A.new(n,e)_(n,"draw_fn=*1;bgl=*2",{i,t})n.spr.idle=f"ss=137"return n end,draw=function(n)rectfill(n.x,n.y,n.x+n.bgl,n.y+6,1)n:draw_fn()end})eh=n("c_player_life_bar:c_hud_element",{__new=function(t,n,e)local n=A.new(n,e)n.spr.idle={ss=169}n.life_ref=h.init_max_life return n end,draw=function(n)local e=30*h.max_life/n.life_ref rectfill(n.x,n.y+1,n.x+8,n.y+7,1)n:draw_sprite()nm(n.x+10,n.y+2,e,4,h.life,h.max_life,1,8)end})Y=n("c_slide_text:c_hud_element",{__new=function(t,n,e)local n=A.new(0,n,a.mgr.hud_mgr)n.msg=e n.final_pos=122-#e*4n.fixedx=n.final_pos+250_(n,[[            ttl = _fn_t1_2
        ]])A.update(n)return n end,update=function(n)if(n.ttl:adv())n:del()return
local e=abs(n.fixedx-n.final_pos)n.fixedx=e<2and n.final_pos or n.fixedx-e*.1A.update(n)end,draw=function(n)rectfill(n.x-2,n.y-2,n.x+126,n.y+7,1)?n.msg,n.x,n.y,8
end})ne=n("c_dialog:c_slide_text",{__new=function(i,n,t,e)local n=Y.new(n,e)_(n,[[final_pos = 10
fixedx = 260
ttl = _fn_t1_6
cont = false
author = *1
msgs = nil
]],{t})ne.update_msg(n,e)return n end,update_msg=function(n,e)n.msg=e n.msgs=split((n.author~=nil and n.author..":*"or"")..e,"*")end,draw=function(n)local e=#n.msgs rectfill(n.x-10,n.y-10,n.x+124,n.y+e*7+10,1)rect(n.x-2,n.y-2,n.x+124,n.y+e*7,14)for e=1,e do?n.msgs[e],n.x,n.y+(e-1)*7,8
end?"❎",n.x+100,n.y+e*7+2,8
end})e_=n("c_hud_mgr:c_mgr",{__new=function(n)local n=C.new()n.update_in_pause=true return n end,restart=function(n)n.objs={e2.new(54,1,25,function(n)circfill(n.x+4,n.y+3,2,7)?tostr(h.shards),n.x+10,n.y+1,8
end),eh.new(10,0)}end,draw=function(n)C.draw(n)local n,e=i:calc_center()if(h.keys.red)pal(7,8)spr(59,90+n,1+e)pal()
if(h.keys.blue)pal(7,12)spr(59,100+n,1+e)pal()
end})e4=true nU=.25l,r,j,T=k"0;1;2;3"M,nh,ee,eo=k"1;2;3;4"eb=f"8;10;12;13"nz=f[[{sprites={112;113;114;115};fps=10;loop=false};
{sprites={116;117;118;119};fps=30;loop=true};
{sprites={120;121;122;123};fps=10;loop=false};
{sprites={124};fps=1;loop=false};
]]nW=f"0.3;1;0.4;0.5"nu={e1,et,en,ei}e0=f[[{10;20;30;40};{10;15;25};{0;0;0};{0;0;0}]]ef=f"A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=fire+2;G=lifereg;H=lifereg+1;I=max life+1;J=fire+3;K=lifereg+2;L=max life+2;"el=f("E=*1;F=*2;G=*3;H=*4;I=*5;J=*6;K=*7;L=*8;",{function()h.lev_el[M]=2end,function()h.lev_el[M]=3end,function()h.lifereg_lev=max(1,h.lifereg_lev)end,function()h.lifereg_lev=max(2,h.lifereg_lev)end,function()h.max_life+=5h.life=h.max_life end,function()h.lev_el[M]=4end,function()h.lifereg_lev=3end,function()h.max_life+=10h.life=h.max_life end})er=f"A=8;B=10;C=12;D=13;E=8;F=8;G=8;H=8;I=7;J=18;K=8;L=7;"ea=f[[A=can also burn green vines
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
]]ed=f"A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;"nK=f"U=red;V=blue;"eu=f[[lea=aunt lea
lady=lady
titus=old titus
]]ec=f[[lea = {192;193}
lady = {208;209}
titus = {224;225}
]]P=f"a=bath;b=batv;c=witchh;d=witchv;e=dog;g=spider;i=sk;l=boss1;m=boss2;n=boss3;w=craterh;x=craterv;"nn=f[[dog={idle={146;147}}
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
]]ns=f"batv=1;witchv=1;craterv=1;"ng=0a=nil h=nil em,ep,e5,nV=k"2;3;4;5"V,q,y,H,n1=k"{};{};{};{};{};{}"p,x=48,32no,nl=p*8,x*8B=nil m=2nf=true X=nil nA=false ew=f"false;false;false;false"ex=nil nE=false nG=[[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
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
]]n7,n6,nX,nk,nj,n9,nY,nM,nN,nQ,nZ,nT,nR,nL,nH,nB=k"0;1;2;4;8;3;5;9;6;10;12;7;11;13;14;15"ny=f[[metal={tile_maps={1;2;3;4;5};bg_col=-15;bg_item_spr={{174};{190};{175};{172}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
sand={tile_maps={17;18;19;20;21};bg_col=0;bg_item_spr={{15};{31};{47};{41}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
grass={tile_maps={33;34;35;36;37};bg_col=0;bg_item_spr={{8};{24};{7};{39}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
ice={tile_maps={49;50;51;52;53};bg_col=-15;bg_item_spr={{142};{158};{143};{170}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
]]J={e(f"name=The green forest 2;music=13;theme=grass;wtx=-48;wty=0;fix_jumps={{2;30}}",f[[p={cname=titus;msg=i heard that you can*tap twice down arrow*to focus on another spell/tell me if it works*i'm happy to be useful}
]]),e(f"name=The green forest 1;music=13;theme=grass;wtx=0;wty=0;fix_jumps={{22;30}}",f[[p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
]]),e(f"name=The green forest 3;music=13;theme=grass;wtx=48;wty=0;fix_jumps={{17;30}}",f[[q = {cname=titus;msg=hi son. i'm old titus*i lived in these lands*for many years/i tried to find those*mysterious scrolls/but i'm too lazy*and old, of course/i know there some scroll near*but i can't guess where}
]]),e(f"name=The underground;music=13;theme=sand;wtx=-48;wty=32;fix_jumps={{2;1};{11;30};{44;30}}",f[[

]]),e(f"name=The intestines;music=13;theme=sand;wtx=0;wty=32;fix_jumps={{22;1};{20;30}}",f[[            
]]),e(f"name=The intestines;music=13;theme=ice;wtx=48;wty=32;fix_jumps={{18;1};{4;30}}",f[[            
]]),e(f"name=The intestines;music=13;theme=metal;wtx=-48;wty=64;fix_jumps={{10;1};{43;1}}",f[[

]]),e(f"name=The intestines;music=13;theme=metal;wtx=0;wty=64;fix_jumps={{19;2}}",f[[

]]),e(f"name=The forgotten;music=13;theme=metal;wtx=48;wty=64;fix_jumps={{3;1}}",f"p={cname=lea;msg=oh my beloved nephew*i'm so proud/you have done well*the scrool are again reunited/finally the search*is over/ah ah ah*ah ah ah ah/i can tell you now*i'm not your aunt*i never was/now please die*and all the scroll's power*will vanish with your death}")}D("t1",function(n)return Q.new(n,false)end)D("t2",function(n)return Q.new(n,true)end)D("rnd",function(n)return flr(rnd(n))end)function F()return a.mgr.enemy_mgr end function u()return a.mgr.misc_mgr end function _init()np"\n\n\n\n----------- Game started -----------"a=e3.new()end function _update60()a:update()end function _draw()a:draw()end e3=n("c_game",{__new=function()local n=f[[paused=false
menu=true
play=false
stage_title_phase=false
require_player_rebuild=true
minimap={}  
bgpos={0;0}          
]]n.mgr={enemy_mgr=C.new(),misc_mgr=es.new(),hud_mgr=e_.new()},menuitem(1,"new game",function()a:start_menu()end)return n end,start_play=function(n)n.menu=false n.play=true if(n.require_player_rebuild)h=nS.new(0,0)n.require_player_rebuild=false
h:reset_stage_props()for e,n in pairs(n.mgr)do if(n.restart)n:restart()
end S()i:place(h.x,h.y)if(e4)music(Z().music)
end,start_menu=function(n)n.menu=true n.play=false m=2end,stage_check=function(n)local n,e=flr(h.x/8),flr(h.y/8)if n<0or n>=p-1and h.x>p*8-4or e<0or e>=x do nf=false local t=Z()local e,t=n+t.wtx or 0,e+t.wty or 0if(n>=p-1)e+=1
local n=nil for i=1,#J do n=J[i]if(e>=n.wtx and e<n.wtx+p and t>=n.wty and t<n.wty+x)m=i break
end nc()local n,e=e-n.wtx,t-n.wty X=f(""..n..";"..e.."")S()nJ()i:place(h.x,h.y)end end,update=function(n)if n.menu do if(btnp(5,0))n.require_player_rebuild=true n:start_play()
return end n:stage_check()i:update()for e,n in pairs(n.mgr)do if(n.update)n:update()
end h:update()n.bgpos[1]=(i.x-i.ox)*.5n.bgpos[2]=(i.y-i.oy)*.5end,draw=function(n)if(n.menu)cls()local n=t()spr(80+flr(n/.1%3),60,30)c("* the last spellcaster *",64,20,7)c("⬅️➡️ to move",64,60,6)c("⬇️⬇️ (tap twice) change spell",64,70,6)c("🅾️ jump - ❎ spell attack",64,80,6)c("(once you have spells)",64,90,6)c("press ❎ to start",64,110,7)return
cls(Z().theme.bg_col)for e=0,23do for t=0,15do spr(9,e*16+n.bgpos[1],t*16+n.bgpos[2],2,2)end end map(0,0,0,0,eg,e8,false)n.mgr.misc_mgr:draw()n.mgr.enemy_mgr:draw()h:draw()n.mgr.hud_mgr:draw()if(h.phase=="dead")local n,e=i:calc_center()c("you died!",64+n,55+e,8)c("respawning in "..h.t_respawn:t_left(),64+n,65+e,7)return
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
00000000999999990ffffff0ffffffff0ffffffffffffff000d00d00033033000000000000000000000000000666666006666660066666600000000000000000
0000000099999999ffffffffffffffffffffffffffffffff00d00d003600030000000000000000000000000066aaa7666677aa6666aa77660000000000000000
000000009999a999f999a99f9ff99ff9f99fff9999fff99f06d00d603000063000000000000000000000000167aaa7766777aaa66aaa7aa60000000000000000
0000000099999a9999999a9999999a9999999a9999999a9906d00d600000330005000000000000000000000067700aa66aa007766aa00aa60000000000000010
0000000094999999949999999499999994999999949999990dd00dd0003330005a560050000000000000000067700aa66aa0077667700aa60000000000110101
0000000099499999994999999949999999499999994999990dd00dd000336300056a65a500000100000000006aaa7aa66aa7aaa667aaa7760000000001001100
0000000099999499999994999999949999999499999994990dd00dd00030003002062250000000000000000066aa77666677aa6666aaa7660000000000011000
0000000099999999999999999999999999999999999999996dd66dd60060000033333333000000000000000066666666666666666666666600000000fff1ffff
00000000644494440333333033333333003333333333330066000000000000000000000000000000000000005d55555d55555d55555555550505050000011000
000000004494469433333333333333330333333333333330d66000003222030000023300000000000000000055555d5555555555050505000000000000061110
000000009444346433333333333333333333333333333333d6960000003232002222003005f55500000000005555555505050500050505000000000000001107
000000004349444434393434343934343439343434393433d89700000002022220022200551115500555f5000565656005050500000000000000000000000100
000000004444943944449449444494494464944944449443d8970000002000230000020051111155551115500565656000606060000000000000000000000110
000000009944444449444344494344444944434449644344d69600000320002200000230f155f1155115115066d6666600606060006060600000000006100610
000000004643449944346494446434946434649434446494d6600000083000320000038051555515f151f1f56d666d6666d66666006060600000000066110110
00000000444494434443444643444446444444434494444666000000000002222000000001511515515151556666666666666d66666666660060606000011100
0000000066666666077777707777777700777777777777006dddddd60032322222232000515f151551511150e111111f7100001f000000000000000000011100
0000000066c67666777777777777777707777777777777706668866600020000220023005115151f51f555f01111111111000011000000000000000000160110
00000000666666c6777777c7777777c7777777c7777777c706999960003200002200000055111511510000007171177100000000000000000000000000160060
000000006c6666666c6666666c6666666c6666666c6666660067760000280000220000000f555501510000007171711700000000000000000000000000100000
0000000066667c6666667c6666667c6666667c6666667c6600000000000000002200000000000001f11000007777711700000000000000000000000000110000
00000000676666666766666667666666676666666766666600000000000000022000000000000115551111001111177100000000000000000000000000010000
0000000066c6667666c6667666c6667666c6667666c66676000000000000302222003300000555f55f5555001111111111000011000000000000000000f11ff0
000000006666666666666666666666666666666666666666000000003333322222233333005fffffff9fff50f111111ed100001e0000000000000000ffff11ff
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
00000000000cccc0000cccc0000cccc0000cccc0c00cccc000000000000000000a00000000000000000000000000000000000000000000000000000000000000
0000000000ccc90000ccc90000ccc90000cbc900c0ccc9000000000000000000a9a0000000000000000000000000000000000000000000000000000000000000
000ccccc00cc550000cc55000ccc550000cb5500cccc5500000ccccc000000000a00000000000000000000000000000000000000000000000000000000000000
00ccc90000cb990000cb99000cbb99000ccb9900000b990000ccc900000000000000000000000000000000000000000000000000000000000000000000000000
00cc550000cbb30000cb33000bc33000cc0333000003330000cc5500000000000000000000000000000000000000000000000000000000000000000000000000
00cb990000c3c80000c8c080ccc33c800008c0800003c8000ccb9900000000000000000000000000000000000000000000000000000000000000000000000000
00cbb3000008000000000000008000000000000000080000cc0b3300000000000000000000000000000000000000000000000000000000000000000000000000
00c80800000000000000000000000000000000000000000000080800000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066c0000000000000000000000000000
000000000000000000000000009990000000000700000000000000000000000000000000000000000cccccc00ccc6cc000766c00000000000000000000000000
00000000000a0000000a9000099899000007007070000077000000000070000000000000006666000c6666c00c6c66c0000766c0000000000000000000000000
000aa00000a770000aa979009aa789907070770007070700700007700707077000077000006776000c6776c006677cc00000766c000000000000000000000000
000aa00000a770000aa979009aa789900700000000707000070070077000700700077000006776000c6776c00c6776600000766c000000000000000000000000
00000000000a0000000a9000099899000000000000000000007700000000000000000000006666000c6666c00cc6c6c0000766c0000000000000000000000000
000000000000000000000000009990000000000000000000000000000000000000000000000000000cccccc00cc6ccc000766c00000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066c0000000000000000000000000000
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
00222200002222000000000000000000000000000000000000000000000000555500000000000055500000000000000000000000000000000000000000000000
02222120022221200000000000000000000000000000000000000000000005511550000000000551155000000000000000000000000000000000000000000000
22175712227575100000000000000000000000000000000000000000000055111150000000005511115000000000000000000000000000000000000000000000
00511150005111000000000000000000000000000000000000000000000051161655000000005161615500000000000000000000000000000000000000000000
00511500005115000000000000000000000000000000000000000000055551111115550005555111111555000000000000000000000000000000000000000000
05555500055555000000000000000000000000000000000000000000551555515555555055155551555555500000000000000000000000000000000000000000
05ddd5555ddddd500000000000000000000000000000000000000000511111555111115051111155511111500000000000000000000000000000000000000000
05dd0dd55ddd0d500000000000000000000000000000000000000000511111111111111551111111115111150000000000000000000000000000000000000000
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
