pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
poke(24412,-1)e3=false eb=false em="last_spellcaster/logs/log"q=60E={}function e(n,e)local n,t=unpack(split(n,":"))E[n]=e e.__index=e setmetatable(e,E[t])e.new=function(...)local t=e.__new(n,...)t.__name=n setmetatable(t,e)return t end e.super=E[t]return e end ei={}function _(t,i,l)t,l=t or{},l or{}local function r(t)local e=1while e<=#t and(sub(t,e,e)==" "or sub(t,e,e)=="\n"or sub(t,e,e)=="	")do e+=1end local n=#t while n>=e and(sub(t,n,n)==" "or sub(t,n,n)=="\n"or sub(t,n,n)=="	")do n-=1end if(e>n)return""
return sub(t,e,n)end local n,e,f=1,#i,1while n<=e do while n<=e do local e=sub(i,n,n)if(e~=" "and e~="\n"and e~=";"and e~="	")break
n+=1end if(n>e)break
local a,d,o=n,0,nil while n<=e do local e=sub(i,n,n)if(e=="{")d+=1
if(e=="}")d-=1
if d==0do if(e=="="and not o)o=n
if(e==";"or e=="\n")break
end n+=1end local d,e if(o)d,e=r(sub(i,a,o-1)),r(sub(i,o+1,n-1))else e=r(sub(i,a,n-1))
local n local i=sub(e,1,1)if i=="{"and sub(e,-1)=="}"do n=_({},sub(e,2,#e-1),l)elseif i=="*"do local e=tonum(sub(e,2))n=l[e]elseif sub(e,1,3)=="_k_"do local e=sub(e,4)n=t[e]elseif sub(e,1,4)=="_fn_"do local e=split(sub(e,5),"_")n=ei[e[1]](#e>=2and e[2]or nil)elseif e=="true"do n=true elseif e=="false"do n=false elseif e=="nil"do n=nil else n=tonum(e)if(n==nil)n=e
end if d and d~=""do t[d]=n elseif e~=""do t[f]=n f+=1end end return t end function U(e,n)ei[e]=n end function r(n,t)local e={}_(e,n,t)return e end function s(e,n)return unpack(r(e,n))end T=e("c_timer",{__new=function(t,e,n)local e={maxtime=flr(q*e),t=flr(q*e),loop=n or false}return e end,adv=function(e)if(e.t<0)return false
e.t-=1local n=false if(e.t==0)n=true if(e.loop)e.t=e.maxtime else e.t=-1
return n end,restart=function(e)e.t=e.maxtime end,t_left=function(e)return flr(e.t/q)end,t_left_btw=function(e,n,t)local e=e:t_left()return e>=n and e<=t end})function ep(t,i,e,n)e,n=e or 8,n or 8local t,i=flr(t/e),flr(i/n)return{tile=mget(t,i),tx=t,ty=i,ox=t*e,oy=i*n}end function ey(e,n,t,i,o,l,d,r)rectfill(e-1,n-1,e+t+1,n+i+1,d)local t=mid(0,flr(o/l*t),t)rectfill(e,n,e+t,n+i,r)end function ew(e)if(not eb)return
printh(e,em or"mainlog")end function i(e,n,t,i)?e,n-#e*2,t,i
end function eo(t,n,i)local e={}for n=0,n-1do e[n]={}for t=0,t-1do e[n][t]=i end end return e end function P(e,n,t)local e=e+t*(n-e)return e end function e5(n,t,e,i,o)local e=e.t/e.maxtime if(i)e=1-e
return P(n,n+(o==d and-1or 1)*t,e)end function y(e,t)if(e==nil or e=="")return false
for n=1,#e do if(sub(e,n,n)==t)return true
end return false end ex={[[1R0#4!0$4!0$4!0$b!0%b!0#4#X"0%4!1$Z"1"0&X"0"g!0"X!0"g!0#X!0!b!001!C!0"1!Z!0!1"0!1"0!1:0)1"0"1!0#1!0"a!0!1=0'1!0!1"b!0"1!0"1"0!1%0"1)0%4#0#1!0'1!0"1!0#1!0" !0#1#0&4#0.1#0%1"0!1!0#1!0!1"0#X!1!X!091%0!j$0#1!a!0*5!0'5!p!0(1&x!Z"1!0!1(0"1"0&1%0!1!0!1$0+b!1!0!1,0! !0'1#0$1!0#1#0+1!0!t!v!0!1)0!1"0$X!1"0&1"0!1!0"1"0)a!1$0!1"0!a!0$1!0!2!3!0$1"0$Q!0#M!0!1!0#1"0"5!0!2!0%5!0#j"0&1$0!1$0#d!1(0$1'0!1)0&1!0%1#0-Y!0"1'0$b!0%g!0"1$0#1!0!1#0"1"0!1"0"1"0!1"0"1%0%b!0"1(0"1#0!1!0"4!1"0$b!0$b!0$1"0(b!0"1"0)1!0#1"0"4!1"0$b!1"b!0$1#0!1+0*1!0"1!0%4!1#0$x!0#1#0$1!0&1!0'1"0#1!0"1!0!5!0%Z!1$0"1$0$1!0!1!0"E!0#1!0,1!0!1.0"1#0'1!0"1"0"1!0,1!0(1(0!1#0'1"0"1!0"1!0'3!g"0"1"0)1$0$1"0#1#0"1!0"1"0!1!0%1(0+1$B!0!1#Z!0$1!R!0!N!0"1!2!0!N!2!0"R!1"0&1#0$c!0$1,0"1/0'1!0'c!0$1'0"h"0"h"0#1#0#b!0*1$0"1$0!1(0#1&0#1!0&b!0)1!0%h!0"y!0%1#05b!0(1'0)1"06b!0'1"0"Z!1"0)b!0/1%0)3!1#0"Z!0!U!0$5!0!X"0"g!0!e!0#X"0"5!0"1(0"5!0#f!0!1%0!1L]],[[1P0-4#0$1!0#X"0$1!0'4!0!4!0!4"081!0!1&0!b!0F1!0&1!0H1&0!1!0-X!0A1!0H1+0-2!0!3!0$2!0/1!X!0"4#0$X!1!0+1*0!p!0"f!0"5!0%1!X!0*1!0'2"0!1%0"1.0!1#X!0*1!0#1,0"1/0!h!0!1"X!0!g!0#g!0&1)Y!0$1"0&a!0%1$0"140!4"Y!0!1$0(e!0*1.0!4!0!4!0#1#0*1'0'b!0#b!0"X!b!001#0"1%0!y!0BX"4"1"0-1#0*X!0'X"0&1"071#0!1!0"1#0!1!0"1#0(1!0-y!00b!0&4!0+1#0D1#0$X!0#4!0$2!0"2!0#2!084"0%1#0%1*0?b!4!0%1!0(1!0;1!0!1"0$1$0"1!0!1!0!1!0!1"0;b!031!0"2!0!e!0!e!0!3!0-1#0,1!0!1!0!1!0#1!0!1(0!1#03b!0;1!0!3!0"e!X!0!3!0!3!0/1!0#a!0"1"0"1$0$1!0"1-0=1!0%4"b!0!b!0!b!0!b!0#1!0"g!0!3!0!3"0$2!011!001+0!1"0$1!0>4!0!4!0"4!0#1%0"1#0!g!0#5!0#5!0"g!2!0$2!b!0!b!0!b!0!b!0.170!18]],[[1P0"4"0!4!0!4!0,X!0%4!0%Y!0#1(0!1#01X"0+1$0"4!1(0!1"0*1"0!a!0"1$0!1!a!0!1#0!a!0(4!1&0!1#0HU!0!1$0!1!0*X!0$2!0#2!0#2!0$3!0$3!0$1#0!1&0"2!q!f!0#1=0!1#0!1"0"1D0$1#0!1"0"1"0#A!1!0.b!0&Z!1'0!1&0!1*091%0$1"0#1&0%1!0"X#0$X"0,1$0$1#0!1&0&1!0!1%0"1$0!1"0%a!0#1#0!1"0!1#0!1"0"1"0&1!0)4"0.1"0$1#0!1"0"1"0&1!001"0'1!4!0"1%0!1&0&1#0"a!Z!b!021!0%1"0"1#0"1!0(1"0.b!0!1"0!a!0#1"a!0"1!0#1#0"1!0#X"0$1!004!0&1!0$1#0"1,0"1!031%0#1$0#1$0"b!0"b!0#1!0-1"0!1"0"4!0!1!0%1#0!1&0)1"0*X!0"b!0'1#0!a!0!1#0!1&0#b!0&1!0)1"0*1!0%1#0!1&0&b!0#1"04Y!1!0"1%0!1$x!1!0+1!0&1"0-1!0$1#0!1!0$1!0"b!0(1#0#2!0$2!0#e!0!5!0#X!1!2!0#1#0!1!0"1!Z!1!0%b!0'1!0"13X"0!1#0!1!0!1"Z!1!0#b!0)1"0#4!0!4!0!1#4"1#4!0"1$0!1#0!1!0"1!Z!1!0.1"0'1#0!4!1!4!0$1"0"1#0!1"0!1!Z!1!0&b!014"0)1!0!1$0!1!0"1!Z!1!0"3!0"3!0"2!0"2!0#1&0.1!0"1#0#1"Z!1/0!1'0$1"0'1"0!1#0"1#Z!1!051"0!3!0%g!0!3!0'U!0"U!Z#130"1<]],[[1"0"1N0"j!b!0"b!0*d!0!d!0+S!1!S!0!3!0)1&0!b!0'v!0!t!0!u!0!b!0!b!0)1&0)1"0&b!0&1)0"2!0%b!0!O!0!O!0%r!0!3!0#1"0!3!0!2!0#130%1"0!1!0"1'0"1/0)1%3!0!2!0!1"0"1!0!1!0"a!0%1*021'0#1!0&2!0#1!051"0(1#0!1!0$1(02v!0,1"0"1$0'1"0)o!0(1"0&o!0$1"0"1!0&4!0#1#0?1"0"1!0#1(0/1"0/1#0"1!0"a!0%1"5!02u!0,1"0$1!0'1$001"0,1"R!0$1!0"1&0@1&0"1!0!c!0#1%021"0)N!0!j$0"1!0%1"0#1!0+t!0"1"0,1*0"4!0!1#0%m!0%4!0"1"0.1*0"1%0$1!0'1"021"Z"1%0%1"0>1#0%1#0!c!0#1"0!2!0!1!0!3!a!0#1"0+o!0&1"c!0&1#0$1)0!2!022!0"1"0"1!0$1$0#1/0%e!0(1%0!c!0%1#0$1"G!1!v!0!j!0#180$c!0!4!1"0%1"0!1!0"j!0%d!0"1)0#d!0#1#0"1!0#1"0"1&0!v!0"1!0'd!0.d!0#1!0$c!0!1"0#f!M!0"1!v!0"w!1!0#5!0$g!0$a!0"2!0"3!0"g!0%4!0"1$0!1!0!1*0!1B0!1!0#Q!1"Y!Z!1!0'1!0'a!0&1#0&1&0!1"0"1#0"1$041!0(1$0%1!0!1"0#h!0(e!0"t!u!v!0"e!0"v!u!t!0#e!0"5!0#t!0!v!0'1*0"1@0!1$]],[[170!19Y!0#1!0C1!0$Y!1"Z!0!3!0!1!01f!011!0"3!0!X!1%0!1!0/1%0/1!0!1&0N1(0B1"0$1!0$j"0!1!0*1"0'1"0-1"0#1'0"1!0(2!0%X"0$3!011"0&c!0(100&2!0"c!0#X"1.0$1.0$190&1-0%170"1"0#1,0#1"0"1,0+4!0*j"0#1"0&X"0)1"0"b!0&1$0)j"0#1"0$1$0&b!0"1"0#b!0)1!0(j"0"3!1"0/b!0!1"061"0"1#4!0&4!0)1#0'1#0#1!0%1"Z!1!0!1!Z!1$0$1#0'1%0$1!0-1!Z!0%Z!1!0.4!1'2!0(1$0$1"Z!0!D!0!Z!1"0"d!0*X!1)011'0.1,0%1!0*1%0-1(0&1!001#041"0,1!0A1"0!4!0%d!0%5!025!0%d!0%2!0!1&0"1#0#1#0#d"0+1#0"1#0#1%0$i!0"i!0H1*0$i!0"g!0)i!0"i!0"2!0$1#0!1(0%g!0#1*0!100!1!0#1!0!1!0!1"0#1'0&h"Q!1!0!M!S!N!0!1!R!h"0)1!0"1!0!1!0!1$0!1!0'1!0!1,0!1*0!1#0!1!0!1!0!1!0!1"0"2!0"1!X!1!0!g!0#1%0"j!P!O!h!0%i!0!i!0!T!1!0"3!0"Y!1!0!1!0!150"1;]],[[120"1=0!x!0#2!0!3!0!x!0!3!0!3!0!1"0"1#0'2!0"3!x!0"2!0!3"0!1'00N!0#N!0"R!0-r!0%1%0#1"0)1-0(1&0#1%0"1#X!0&110)1#0"3!1#0"b!1$0%1-0.1$0"1#0#1%0#1-0'a!0'2!0"1"0"1"0#1&0!1-0'1"0*1#0!1#0"1&0!1,3!0'o!0+1"2!0!1"2!0"1&b!1+2!041"0"1"0#1&b!1*3!0+1"0(1"0!1#0"1'0!1)Z!061"0!3!1"0"3!1&0!1)Z!0*1"0*1"0"1"0#1&0!1)Z!034!0"1#0!1#0"1&0"1(Z!0(4!0)1&2!0!1"2!0!1(0#1&Z!0(1"0#l!0(1"0"1"0#1"Z#1#0"X!1&0/1!0"d!1!0#1!0!1#0#1!Z!0#Z!1#0#1&0%1"0+1"0"1!0!3!1"0"1"w!0#1%0#1&0+1!0%1!0#1!0"1"0"3!1"0#w!1%0#1&0"1!0)1!0!1!0!1!0"1#0!1"0#1!2!0$1&0#1&0#5!0!v!0$t!0$1!0"1"2!0!1#0"1!0"1!0"3!1&X!0!X!140"1#0"1"2!0"1!0&1'0#1/K!V!k!t!0!1$0!1#0#1"4!0%1'X!0!X!160#1$0!1&0#1'0&3!0!3!0!d!2!0!2!0!3!0)1#0"f!0!M!0!Q!0"1#v!0"1&00v!0"u!0"t!0#1(0!1%t!0"1&X!0%d!0'1"0!1"0!1"0#1&0#1&t!0"1&04d!0#1%0#1(t!0"1&0%d!0#1"0,1$0$1)u!07d!0&1$0"1,0$4!0%d!0%4!0#5!0)1$0!1L]],[[1)0"1@0!1%0,x"0$1!x!0#x!0"1!0%1!4!0!1!0%1!0$1"w!0'1!0!1!0'1!4!0,1!w!0'1"0#1"2!0$3!0$1!x!0&1!0'1!0#X"1!4!0!1!0(1&0!1+0!1$4"0%1"0!1$0"1!0(f!0!1"0#1!0%x!0!x!X!1!0$1!0'1!2!0#4!1!0"1%0!1'0"1"0(X!1"0+1#0#1!0$1!0(1"0"2!0%3!0!x!0!X!1!0$1!0"x!0!3!0!x!1!0#3!0$3!0!1!0"2!0#3!0!1'0!1D0!1%0"x!0%1!0$d!0!1!0$1'0$1!0#d!0"Z"1!0%1"0%3!0"1!0%d!0%t!0!t!0!t!0!t!0$1!0$d!0#1!0%1"0$1#0!1!0&1!0#1)0#1!0%d!0"1!Y!0$1"0(1!0$5!0!1!0#1!0$M!0!F!1!0"u!0!v!0%d!0!1$0!1$4!0$1%0!1(0$110%1"o!0%2!0"1!06w!1!4!0"1!0"1!Y!0$1"0$1#0"1#0-b!0'1!0!4!0!1!0"1$0#1!0(w!1!0&1$0'1%0!1!0"4!1!0%1!x!0"1!0&1'0#1!0"1!Q!0&1!0!2!0,w!1"0"1!0$3!0%1!0$1"0"1#0$1(0#1!0!2!0'1"0#1#0#1!0#1#0&3!0!3!0'1!0#1&0$1!0)w!1!0!e!0#1!0"1,0"1!3!0"1!0$1!0"1!0!1!0&1(0"1!w!0/1#0!1!0$1&w!0*1!0#1"w!011!0!1!0(1#0#1#0$1!0$1!w!0#u!0#5!0!u!0#3!0#1!0$3!0%1"0'2!0!2!0!1#0"1(0!140!1"0&1'0#1!4!0(1!0)X!1!4!0'1"w!0$3!0&1!0"1"0"1!0&1!0$3!0!3!0"X!1!0$1&0$1'0!1!0#1!0)1#0!1%0!1"0#1(0*w!1"0"1"0(1!0%1!0.1!0,1!0#1!0)1!0"1$w!0#1#0'1!0"1#0!3!0#e!0#3!0!1!4"i!0"2!0!x!i!0!5!0$1!Z!0#1!0#2!0"2!0"1P]],[[130"1=0$x!0#x!0$4!0!1!0$1!x!0'g!0)1!0%1"4!0&x!0#x!0$1!0"f!0!1!0#5!0"1&0#3!0!Q!1!0$1#0"1,0"1!0$1!0"1$0&1'0!1!0#1"4!0"x!0!x!0!x!0%1"0!1!0$1!0"1#0"t!0!v!0+1!0"1"0$x!0!x!0!x!0#1!0#1!0$1!0!1#0"1%0"2!0'1!0!1-0!1!0$1!0$1!0%1!0%1+0"1"w!0*1!0#1!0&1!0#1!0"1!0(y!0%1!0!1"w!0!2!0"5!0"3!0"1!0"1!0(1!0"M!0!1!0!1!0#3!0$y!0&1"0!1+0"1!5!0!t!0#u!0"1#0!1!0!120!1,0!1%0!1"0"1!0#1!0#x!0!x!0+1"0+1!0!3!0#M!0"M"0"1!0!1$001$0)1+0"1!0%1"0$1!0!y!1!0"1"0"1%0"o!0/1!0#1$0!1!001*0-1!0!3!0!t!0"w!1!0#1%0#1!0%4!0(1!0"g!2!0)1'0"1"0%1!0+i!0"i!0#1&0!o!0#4"0!1!0&1!0$2!0#1#0%4!0"1%0'1%0#1"0$1"0"1%0"1!0,x!0!x!1!0,4!0!1!R!0!1!0"1!0"1!0'1!0#1!0%1"0%1!0#g!5!0$1&0#1!0"1!0(1!5!0(1!R!0%w!1(0"N!0!3!0'1!0&1)0!1)0"140&1!0(1#0"k!N!0"L!1!0"1#0*x!0%x!0%1!0$i!0%1"0"k!1%0!1#061!0#1$0$1"0!1"0!1!0"1!0"1!0%1!0!g!0&1#0$5!0!1"0&1!0"1#0'1"0!1!0"1*0"k!H!k!0"1*0"4!1!0"1"0%d!0!1!0"1!0,1'0-1!0"1"0&1!0#1"0!5!0"i!0)i!0*i!0"2!0!4!1"0!1!0"1!0#1!0#1,0!1*0!1*0#1!0#1!01w!1!w!0)1!w!0+1"0!3!0"3!0$2!0#t!0!3!0"u!0!2!0#3!0!t!0!u!0"2!0#3!0!t!0!u!0!v!0!2!0#1Q]],[[1#0!1O0$1#0!X"1#X"1#X!0%4!01x!0!1%0*1!0-4!0"1(0"2!0%1$0%1!0*1!o!0&4!0"1!0(1$0$1$2!0!3!0!1#0"v!0!t!0!2!0!1#0"3!0!i!0"4!1!0%5!0'1"0"1.0!100#1&0$1!0"1)Y"1$0!1+0"o!0*Z!1!0#1!0#1#Q!0&4!0"M!0!1)0/Z!1!0"2!1"0"1%0'1(0'1-0#1"0#1$0'1!0-1"0&X#0(1!0"1$0"1'w!0+1!031"0"1#Z!0*i!0#i!0%1!0&3!0!2!0#g!0!3!0"1"0$190"1/0&1#0!x!0"1'0"y!0&y!071"0&4!0"4!0/1!041"02t!v!091#021"0$1!0%2!1"0!i!0!X"0%1%0+5!0"3!0"1$0&g!0!1,0#1$0'1!0!1(0#150$1#0)1!0.1!0$1!0%1!0$1"0#w!1"0)1!014!0-1"w!0#1"0&1#0.4"0/1"w!0"1%0%4!1!0+ "0#1"0"1"0)1"0#w!1&0$1!0'1"0&4!0(2!0'1!0"1!0!1"0"4!0%1!0.4!0)1"0&1!w!0#1"0&1#0$1"0% !0"1"0,3!0"1#0"w!1"Z!0!4!0%1!0.4!0,1"0#1!w!0#1&0$1#0'1"051!0"1!0!1"0&1%0"1"0'4"0!1"0&1"0#1"0!1!0!k#1"4!0%1%0-4!001!2!k!I!k!1"Z!f!0"x!0#k!U!V!0!r!01p!0*1V]]}b=e("c_obj",{__new=function(i,e,n,t)local e=r([[parent_mgr=*3
hitbox={x=0;y=0;x2=7;y2=7}
speed=0.4
destroyed=false
phase=idle
x=*1
y=*2
spawn_x=*1
spawn_y=*2
bounce_map=true
tw=1
th=1
solid=false
]],{e or 0,n or 0,t or nil})e.spr=r[[idle={sprites={64;65};fps=2;loop=true}
flip_x=false
flip_y=false
time_start=0	
effect=none
last_frame=0
rot_speed=1
offview=false
]]if(e.parent_mgr)e.parent_mgr:add(e)
return e end,update=function(e)end,draw=function(e)e:draw_sprite()end,respawn=function(e,n,t)e.x,e.y,e.spawn_x,e.spawn_y=n,t,n,t end,del=function(e)e.destroyed=true if(e.parent_mgr)e.parent_mgr:del(e)
end,draw_sprite=function(t)if(o:offview(t))return
if(e3)local e=t:hitbox_pos(0,0)rect(e.x,e.y,e.x2,e.y2,8)
local e=t.spr if(e.effect=="blink_white")if(time()%.2<.1)for e=0,15do pal(e,7)end
local n,i=e[t.phase],nil if n.ss~=nil do i=n.ss else if n.loop~=nil and n.loop==false and n.sprites[#n.sprites]==e.last_frame do i=e.last_frame else if(e.time_start==nil or e.time_start==0)e.time_start=time()
i=n.sprites[1+flr((time()-e.time_start)/(1/n.fps))%#n.sprites]end end spr(i,t.x,t.y,t.tw,t.th,e.flip_x or false,e.flip_y or false,7)pal()e.last_frame=i end,collide=function(e,n,t,i)local e,n=e:hitbox_pos(0,0),n:hitbox_pos(0,0)if(t~=nil)e.x+=t e.x2-=t e.y+=i e.y2-=i
return not(e.x2<n.x or e.x>n.x2 or e.y2<n.y or e.y>n.y2)end,hitbox_pos=function(e,n,t)n,t=n or 0,t or 0return{x=e.x+n+e.hitbox.x,y=e.y+t+e.hitbox.y,x2=e.x+n+e.hitbox.x2,y2=e.y+t+e.hitbox.y2}end,out_of_map=function(e)return e.x<0or e.y<0or e.x>el or e.y>ed end,mdist=function(e,n)return abs(e.x-n.x)+abs(e.y-n.y)end,moveTo=function(e,n,t)local i=e:mdist(n)local t=t/i e.x,e.y=P(e.x,n.x,t),P(e.y,n.y,t)end})F=e("c_mgr",{__new=function(e)local e=r"objs={}"return e end,restart=function(e)e.objs={}end,add=function(e,n)add(e.objs,n)end,del=function(e,n)del(e.objs,n)end,update=function(e)for e in all(e.objs)do e:update()end end,draw=function(e)for e in all(e.objs)do e:draw()end end})function x(t,n,e)local i,e=e or t.speed,e or t.speed local i,o=n==d and-i or(n==a and i or 0),n==X and-e or(n==Q and e or 0)local e=t:hitbox_pos(i,o)if(t.bounce_map and(e.x<0or e.y<0or e.x2>el or e.y2>ed))return 0
if n==a or n==d do local n=n==d and e.x or e.x2 local o,e=g(n,e.y),g(n,e.y2)if(not o and not e)t.x=t.x+i return 1else return 0
elseif n==X or n==Q do local n=n==X and e.y or e.y2 local i,e=g(e.x,n),g(e.x2,n)if(not i and not e)t.y=t.y+o return 1else return 0
end end function eg(e)return e==nil or e.destroyed end function O(e)if(e~=nil and not e.destroyed)e:del()
end function G(e,n)return flr(e/8).."_"..flr(n/8)end function H(e)local n=G(e.x,e.y)if(v[n]==nil)v[n]={}
add(v[n],e)end function er(e)local n=G(e.x,e.y)del(v[n],e)end function R(e,n,t,i)local e=ep(e,n,t,i)return fget(e.tile,0)end function e8(t,i)local o=G(t,i)for e in all(v[o])do local n=e:hitbox_pos(0,0)if(t>=n.x and t<n.x2 and i>=n.y and i<n.y2)return e else local n=G(e.x,e.y)if(n~=o)del(v[o],e)H(e)
end return nil end function g(e,n,t,i)return R(e,n,t,i)or e8(e,n)~=nil end function j(e,n)K[m][flr(e.spawn_x/8)][flr(e.spawn_y/8)]=tostr(n)end function Z()return I[m]end function n(e,n)e.theme=ev[e.theme]e.npcdata=n return e end function e7(e,n)local n={[0]=2,[1]=1,[2]=2,[4]=5,[8]=4,[3]=1,[12]=3,[5]=1,[9]=1,[6]=5,[10]=4,[7]=1,[11]=1,[13]=1,[14]=3,[15]=1}return n[e]end function e6(t,l,o)local e,i=0,0for n=1,#t,2do local d,n=sub(t,n,n),sub(t,n+1,n+1)local n=ord(n)-32for n=1,n do o[e][i]=d e=e+1if(e>=l)e,i=0,i+1
end end return o end function J()local e,f=ex[m],Z()local d,i,n=f.theme,nil,nil if S[m]==nil do i,n=eo(w,p,""),eo(w,p,"")if ek and ef do for n=1,w do for t=1,p do local e=(n-1)*p*2+(t-1)*2+1local e=sub(eX,e,e)if(e==" ")e="0"
i[t-1][n-1]=e end end else e6(e,p,i)end else i,n=S[m],K[m]end local a,c,u,s=c.mgr.misc_mgr,r"Q={};R={};S={};T={}",r"M={};N={};O={};P={}",false for o=0,w-1do for l=0,p-1do local e,r=i[l][o],n[l][o]mset(l,o,0)if r~="d"do local n,t=l*8,o*8if e=="1"do local e=ej(i,l,o)local e=d.tile_maps[e7(e,d)]or 1mset(l,o,e)elseif y("2345",e)do local i=d.bg_item_off[tonum(e)-1]local n=b.new(n+i[1],t+i[2],a)n.spr.idle.sprites=d.bg_item_spr[tonum(e)-1]n.tw=i[1]==0and 1or 2n.th=i[2]==0and 1or 2a.add(n)elseif e=="f"do if(k~=nil)h:respawn(k[1]*8,k[2]*8)else h:respawn(n,t)
if(eZ)_(h,[[avail_el={true;true;true;true}
cur_el=1
lev_el={3;1;1;1}
lifereg_lev=2
max_life=35
keys={red=true;blue=true}
]])
s=true end if(y("abcdoy",e))V.new(n,t,C[e])
if(y("egi",e))e9.new(n,t,C[e])
if(y("lmn",e))z.new(n,t,C[e])
if(y("tuv",e))eY.new(e,n,t)
if(y("wx",e))ea.new(e,n,t)
if(y("hjk",e))W.new(e,n,t)
if(y("XYZ",e))ec.new(n,t,e=="X"and 1or e=="Y"and 3or 5,true)
if(y("ABCDEFGHIJKL",e))eN.new(n,t,e)
if(y("UV",e))e0.new(n,t,true,eM[e],r=="1")
if y("pqrs",e)do local e=f.npcdata[e]or{cname="c_npc_stage"..m,msg="undefined msg"}eu.new(n,t,e.cname,e.msg)elseif y("MNOP",e)do local n=e0.new(n,t,false,0,r=="1")add(u[e],n)elseif y("QRST",e)do local n=eT.new(n,t,r=="1")add(c[e],n)end end end end if(m>1and not s)h:respawn(k[1]*8,k[2]*8)
for n,e in pairs(c)do local t=sub(sub("MNOP",ord(n)-ord"Q"+1),1,1)for n in all(e)do for e in all(u[t])do n:link(e)end n.siblings=e end end S[m]=i K[m]=n end function ej(t,e,n)local i,o,l,n,e=n>0and t[e][n-1]=="1"or n==0,n<w and t[e][n+1]=="1"or n==w-1,e>0and t[e-1][n]=="1"or e==0,e<p-1and t[e+1][n]=="1"or e==p-1,0if(i)e+=1
if(o)e+=2
if(l)e+=4
if(n)e+=8
return e end function eQ()local e,i,n,t=Z().fix_jumps,5,nil,nil for o=1,#e do local e,o=e[o][1],e[o][2]local l=abs(e-flr(h.x/8))+abs(o-flr(h.y/8))if(l<i)i,n,t=l,e,o
end if(n~=nil and t~=nil)h:respawn(n*8,t*8)
end function es()h:reset_stage_props()for n,e in pairs(c.mgr)do if(e.restart)e:restart()
end v,B,e1=s"{};{};{}"end o={x=0,y=0,ox=56,oy=86,csfx=.05,csfy=.07,offvtol=90,update=function(e)e.x+=(h.x-e.x)*e.csfx e.y+=(h.y-e.y)*e.csfy e.x=mid(e.ox,e.x,p*8-e.ox-16)e.y=mid(e.oy,e.y,w*8-42)local e,n=e:calc_center()camera(e,n)end,place=function(e,n,t)e.x=n e.y=t end,calc_center=function(e)return flr(e.x)-e.ox,flr(e.y)-e.oy end,offview=function(e,n)return abs(flr(e.x-n.x))>e.offvtol or abs(flr(e.y-n.y))>e.offvtol end}eH=e("c_player:c_obj",{__new=function(t,e,n)local e=b.new(e,n)_(e.spr,[[idle={sprites={64;65};fps=2}
walk={sprites={80;81;82};fps=6}
jump={sprites={97;98;99;100;101;102};fps=8}
dead={sprites={68;69;70;71;72};fps=4;loop=false}
]])_(e,[[name=player
p.prev_btn={}
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
cur_el=nil
avail_el={false;false;false;false}
lev_el={1;1;1;1}
el_cooldown=_fn_t1_1
shine_star=0
interaction_fn=nil
hitbox={x=2;y=3;x2=5;y2=7}
t_respawn=nil
shards=0
bounce_map=false
last_btn_down_time=0
keys={red=false;blue=false}
]])return e end,reset_stage_props=function(e)e:reset_jump_vars()end,update=function(n)if(c.paused)return
local e,t=n,r("left=*1;right=*2;jump=*3;jump_start=*4;action=*5;down=*6;",{btn(0),btn(1),btn(4),btnp(4),btnp(5),btnp(3)})if e.phase=="dead"do if(e.prev_btn.left)x(e,d)
if(e.prev_btn.right)x(e,a)
e.speed*=.9e:apply_forces(t)if e.t_respawn:adv()do if(L~=nil)L.life=L.max_life
k=nil es()m=2J()music(I[2].music)o:place(h.x,h.y)e.life=e.max_life e.phase="idle"e.invulnerable=false end return end if(n.lifereg_ttl:adv())n:increase_life(n.lifereg_lev/5)
if not e.blocked do if(t.left)e:move_left()
if(t.right)e:move_right()
if(not t.left and not t.right)e.speed=e.speed*.7if(e.speed<.1)e.speed=0
e:apply_forces(t)end e.prev_btn=t if(t.left==false and t.right==false and e:on_ground())e.phase="idle"
if(e.nodmg_t~=nil)if(e.nodmg_t:adv())e.spr.effect="none"e.invulnerable=false
if(t.action)if(n.interaction_fn~=nil)n.interaction_fn=nil else n:attack()
if(n.el_cooldown:adv())n.shine_star=10
if(t.down)local e=time()-n.last_btn_down_time if(e<.4)n:switch_element()n.last_btn_down_time=0else n.last_btn_down_time=time()
n.interaction_fn=nil end,draw=function(e)local n=e if(n.invisible)return
n:draw_sprite()if(e.shine_star>0)spr(104,e.x,e.y)e.shine_star-=1
end,dmg=function(e,n)local e=e if(not e.invulnerable)e.life-=n if(e.life<=0)_(e,"phase=dead;invulnerable=true;t_respawn=_fn_t1_5")else e.nodmg_t=T.new(1)e.spr.effect="blink_white"sfx(5)e.invulnerable=true
end,increase_life=function(e,n)local e=e e.life=min(e.life+n,e.max_life)end,inc_speed=function(e,n)local e=e if(n)e.speed=e.init_speed else e.speed=min(e.speed+e.inc_speed_factor,e.max_speed)
end,move_left=function(n)local e=n n:inc_speed(not(e.prev_btn.left or false))x(e,d)if(e.phase=="idle")e.phase="walk"
e.spr.flip_x=true end,move_right=function(n)local e=n n:inc_speed(not(e.prev_btn.right or false))x(e,a)if(e.phase=="idle")e.phase="walk"
e.spr.flip_x=false end,apply_forces=function(e,n)if(not e.blocked and n.jump_start)e:set_start_jump()
if(not n.jump and e.jstack>0)e.jstack=0
if(e.jstack>0)e.speedy=-e.jforce e.jstack-=1
if(e.speedy<0and not n.jump)e.speedy*=e.speed_y_decay
e.speedy+=.25e.speedy=min(e.speedy,e.max_speedy)local n=x(e,e.speedy<0and X or Q,abs(e.speedy))if(n==0)e:reset_jump_vars()if(e.phase=="jump")e.phase="idle"
end,reset_jump_vars=function(e)_(e,"speedy=0;jstack=0")end,set_start_jump=function(e)if(e.phase=="dead")return
if(e:on_ground())e:reset_jump_vars()e.spr.time_start=nil _(e,"phase=jump;jstack=_k_max_jstack")sfx(0)
end,on_ground=function(e)local e=e local e=e:hitbox_pos(0,1)local n,e=g(e.x,e.y2),g(e.x2,e.y2)return n or e end,attack=function(e)if(e.cur_el==nil)return
if(e.el_cooldown.t<=0)eh[e.cur_el].new(e.spr.flip_x and d or a,u())e.el_cooldown:restart()
end,switch_element=function(n)if(n.cur_el==nil)return
local e=n.cur_el%4+1while true do if(n.avail_el[e])n.cur_el=e Y.new(30,eh[e].name)break
e=e%4+1end end})l=e("c_enemy:c_obj",{__new=function(l,n,e,t,i,o)local e=b.new(e,t,o)_(e,[[respawn_timer=_fn_t1_10
dmg_time=_fn_t1_1
frozen_t=_fn_t1_20
time_last_death=0
life=40
max_life=_k_life
dir=nil
wspeed=0
dir_bfr_blow=nil
fixed=false
hitbox={x=2;y=2;x2=5;y2=5}
hitbox_orig=_k_hitbox
speed=*1
etype=*2
boss=false
value=3
memdeath=false
        ]],{i or 1,n})e.frozen_t.t=0return e end,dmg=function(e,n)if(e:is_inv())return
e.life-=n e.dmg_time:restart()e.spr.effect="blink_white"if(e.life<=0)ec.new(e.x+4,e.y+4,e.value)e:del()
end,freeze=function(e)e.frozen_t:restart()if(e.fixed)return
H(e)e.hitbox=r"x=0;y=0;x2=7;y2=7"end,unfreeze=function(e)if(e.fixed)return
e.frozen_t.t=-1e.spr.effect="none"e.hitbox=e.hitbox_orig end,blow=function(e,n)if(e.fixed)return
if(e.wspeed<=0)e.dir_bfr_blow=e.dir
e.wspeed=2e.dir=n end,unblow=function(e)_(e,"wspeed=-1;dir=_k_dir_bfr_blow;")end,update=function(e)b.update(e)for n in all(B)do if(e:collide(n))n:hit(e)
end if(e.dmg_time:adv())e.spr.effect="none"
if(e.frozen_t:adv())e:unfreeze()else if(e.frozen_t:t_left_btw(.1,2))e.spr.effect="blink_white"
if(e.wspeed>0)local n=x(e,e.dir,e.wspeed)e.wspeed=n==0and 0or max(0,e.wspeed-.05)else if(e.wspeed~=-1)e:unblow()
end,draw=function(e)if(e.frozen_t.t>0)spr(139,e.x,e.y)
b.draw(e)end,del=function(e)e.time_last_death=time()er(e)if(e.memdeath)j(e,"d")
b.del(e)end,check_pl_coll=function(e,n)if(e:collide(h))h:dmg(n)return true else return false
end,is_inv=function(e)return false end})V=e("c_fly_en:c_enemy",{__new=function(i,e,t,n)local e=l.new(n,e,t,.3,A())e.spr.idle={sprites=ee[n].idle,fps=4,loop=true}e.horizontal=e2[n]==nil _(e,[[hitbox_orig={x=2;y=2;x2=5;y2=5}
horizontal=_k_horizontal
dir=*1
dir_bfr_blow=_k_dir
]],{e.horizontal and a or Q})if(eR[n]~=nil)_(e,"tshoot=_fn_t2_4")
if(e.tshoot~=nil)e.tshoot.t-=10*flr(rnd(20))
return e end,update=function(e)l.update(e)e.spr.flip_x=e.dir==a if(e.frozen_t.t>0)return
e:check_pl_coll(1)local n=x(e,e.dir)if(n==0)e.dir=(e.horizontal and 0or 2)+(e.dir+1)%2
if(e.tshoot~=nil and e.tshoot:adv()and e:mdist(h)<100)en.new(e.x+4,e.y+4,atan2(h.x-e.x,h.y-e.y),1)
end})e9=e("c_walk_en:c_fly_en",{__new=function(i,e,n,t)return V.new(e,n,t)end,update=function(e)V.update(e)local n=e.x+(e.dir==a and 7or 0)if(not R(n,e.y+8))e.dir=(e.dir+1)%2
end})W=e("c_vine:c_enemy",{types=r"h={pal=3;flev=0};j={pal=8;flev=1};k={pal=12;flev=2};",__new=function(i,n,e,t)local e=l.new("vine",e,t,0,A())e.spr.idle=r"ss=6"_(e,[[fixed=true
life=10
hitbox={x=0;y=0;x2=7;y2=7}
pal=*1
flev=*2
memdeath=true
        ]],{W.types[n].pal,W.types[n].flev})H(e)return e end,draw=function(e)pal(7,e.pal)l.draw(e)pal()end,is_inv=function(e)return not(h.cur_el==N and h.lev_el[N]>e.flev)end})eY=e("c_spike:c_enemy",{__new=function(i,t,e,n)local e=l.new("spike",e,n,0,A())e.spr.idle=r"ss=22"_(e,"fixed=true;life=10;dir=-1;hitbox={x=1;y=7;x2=6;y2=7};spf=0.15;")e.y=n+8-4*(ord(t)-ord"t")return e end,update=function(e)e:check_pl_coll(2)e.y+=e.dir*e.spf if(e.y<e.spawn_y or e.y>e.spawn_y+8)e.dir*=-1
end,draw=function(e)l.draw(e)spr(Z().theme.tile_maps[2],e.x,e.spawn_y+8)end,is_inv=function(e)return true end})ea=e("c_crater:c_enemy",{angles=r"0.5;0;0.25;0.75",__new=function(i,n,e,t)local e=l.new("crater",e,t,0,A())e.name=C[n]e.spr.idle={ss=ee[e.name].idle[1]}_(e,"fixed=true;life=10;dir=-1;spf=0.15;inited=false;tfire=_fn_t2_2;")e.horizontal=e2[e.name]==nil e.dir=e.horizontal and a or Q e.tfire.t-=flr(rnd(40))return e end,update=function(e)if not e.inited do if(e.horizontal and R(e.x+12,e.y))e.dir=d
if(not e.horizontal and R(e.x,e.y+12))e.dir=X
e.spr.flip_x=e.dir==d e.spr.flip_y=e.dir==X e.inited=true end if(e.tfire:adv())en.new(e.x,e.y,ea.angles[e.dir+1],1)
end,draw=function(e)l.draw(e)end,is_inv=function(e)return true end})z=e("c_boss:c_enemy",{angles=r"0;0.1;0.4;0.5;0.6;0.9",__new=function(i,e,t,n)local e=l.new(n,e,t,.3,A())e.spr.idle.sprites=ee[n].idle _(e,[[life=400
max_life=_k_life
tw=2
th=2
hitbox={x=0;y=0;x2=15;y2=15}
hitbox_orig=_k_hitbox
tcd=_fn_t2_1
tfire=_fn_t2_0.1
fire=false
tpos={x=nil;y=nil}
mvrngx=60
mvrngy=30
boss=true
value=50
memdeath=true
show_life_bar=true
]])L=e e.tcd.t-=flr(rnd(40))return e end,update=function(e)l.update(e)local n=e:mdist(h)e.show_life_bar=n<=120if(n>200)e.life=min(e.max_life,e.life+1)
if(n>80or e.frozen_t.t>0)return
if(e_==false)music(30)e_=true
e:check_pl_coll(5)if(e.tpos.x==nil or e:mdist(e.tpos)<3)e.tpos.x=e.spawn_x+rnd(e.mvrngx*2)-e.mvrngx e.tpos.y=e.spawn_y-rnd(e.mvrngy)
e:moveTo(e.tpos,e.speed)if(e.tcd:adv())e.fire=not e.fire
if(e.fire)if(e.tfire:adv())en.new(e.x+4,e.y+4,rnd(z.angles),1)
end,draw=function(e)l.draw(e)if(e.show_life_bar)local n,t=o:calc_center()rectfill(n,t+13,n+flr(125*(e.life/e.max_life)),t+14,8)
end,del=function(e)L=nil if(e.etype=="b2")h.keys.red=true
if(e.etype=="b1")h.keys.blue=true
if(e.etype=="b3")local e=Z().npcdata["q"]eu.new(272,240,e.cname,e.msg)
l.del(e)end})M=e("c_element:c_obj",{__new=function(e,n,t)local i,o=h.x+(t==d and-4or 6),h.y local e=b.new(i,o,u())e.spr.idle=eB[n]_(e,[[ttl=*5
max_dist=20
destroy_req_prev_frm=false
origx=*1
origy=*2
dir=*3
el=*4
]],{i,o,t,n,T.new(eL[n],false)})if(t==d)e.spr.flip_x=true
add(B,e)return e end,update=function(e)if(e.destroy_req_prev_frm)e:del()return
if(e.ttl:adv())e.destroy_req_prev_frm=true
e.x=e5(e.origx,e.max_dist,e.ttl,true,e.dir)if(R(e.x,e.y))e:del()
end,hit=function(e,n)e:effect(n)e:del()end,effect=function(e,n)n:dmg(eA[e.el][h.lev_el[e.el]])end,del=function(e)del(B,e)b.del(e)end})eD=e("c_fire:c_element",{name="fire",__new=function(n,e,t)return M.new(N,e)end,effect=function(n,e)e:unfreeze()M.effect(n,e)end})eq=e("c_ice:c_element",{name="ice",__new=function(n,e,t)return M.new(eF,e)end,update=function(e)M.update(e)end,effect=function(n,e)e:freeze()end})eG=e("c_thunder:c_element",{name="thunder",__new=function(n,e,t)return M.new(e4,e)end})eI=e("c_wind:c_element",{name="wind",__new=function(n,e,t)return M.new(eC,e)end,effect=function(e,n)n:blow(e.dir)end})f=e("c_int:c_obj",{__new=function(i,e,n,t)local e=b.new(e,n,t)_(e,[[show_int_btn=false
ttl_disable_int=nil
int_done=false
solid=true
hover_info=nil
hover_info_obj=nil
int=true
cost=0
]])return e end,update=function(e)if(not e.int)return
if e:collide(h,-2,-2)do e.show_int_btn=true if(e.hover_info~=nil and eg(e.hover_info_obj))e.hover_info_obj=et.new(100,nil,e.hover_info)e.hover_info_obj.ttl.t=q*20
h.interaction_fn=e.interact local n=e.ttl_disable_int if btnp(5,0)and not e.int_done do e:interact()elseif e.int_done and n==nil do e.ttl_disable_int=T.new(.5,false)elseif n and n:adv()do e.int_done=false e.ttl_disable_int=nil end else e.show_int_btn=false O(e.hover_info_obj)end end,draw=function(e)e:draw_sprite()if(e.show_int_btn)?"❎",e.x+2,e.y-6,12
end,interact=function(e)if(h.shards<e.cost)Y.new(30,"you need "..tostr(e.cost).." shards")return
e:action()e.int_done=true h.shards-=e.cost end,action=function(e)end,del=function(e)O(e.hover_info_obj)b.del(e)end})eT=e("c_switch:c_int",{__new=function(i,e,t,n)local e=f.new(e,t,u())e.spr.idle=r"sprites={27;28;29};fps=10;loop=true;siblings={}"_(e,"on=*1;int=*2;doors={}",{n,not n})return e end,action=function(e)if(not e.int)return
if(h.cur_el~=e4)Y.new(30,"you need thunder")return
for e in all(e.siblings)do _(e,"on=*1;int=*2;show_int_btn=*2",{not e.on,e.on})j(e,e.on and 1or 2)end for n in all(e.doors)do if(not e.on)n:close()else n:open()
end end,link=function(e,n)add(e.doors,n)end,draw=function(e)pal(7,e.on and 11or 8)pal(10,e.on and 3or 9)f.draw(e)pal()end})e0=e("c_door:c_int",{__new=function(l,e,t,n,i,o)local e=f.new(e,t,u())e.spr.open=n and r"ss=60"or r"sprites={43,44;45;46};fps=5;loop=false"e.spr.close=n and r"ss=59"or r"sprites={46;45;44;43};fps=5;loop=false"_(e,[[phase=close
hitbox={x=0;y=0;x2=7;y2=7}
int=*1
key=*2
]],{n,i})H(e)if(o)e0.open(e)
return e end,update=function(e)f.update(e)if e.phase=="close"do for n in all(B)do if(e:collide(n))n:del()
end end end,interact=function(e)if(not h.keys[e.key])Y.new(30,"you need the "..e.key.." key")return
e:action()e.int_done=true end,open=function(e)_(e,"phase=open;hover_info=nil;int=false;show_int_btn=false")O(e.hover_info_obj)er(e)j(e,1)end,close=function(e)e.phase="close"H(e)j(e,2)end,action=function(e)e:open()end,draw=function(e)if(e.int)pal(7,e.key=="red"and 8or 12)
f.draw(e)pal()end})eN=e("c_scroll:c_int",{__new=function(i,e,t,n)local e=f.new(e,t,u())e=_(e,[[el=*1
int_fn=*2
cost=*3
name=*4
col=*5
]],{ord(n)-ord"A"+1,eE[n],eU[n],eP[n],eO[n]})e.hover_info="learn "..e.name.." ("..tostr(e.cost).." shards)*"..tostr(eK[n])e.spr.idle={ss=12}return e end,update=function(e)f.update(e)e.y=e.spawn_y+sin(time())*2end,action=function(e)if(e.int_fn~=nil)e.int_fn(e)else h.cur_el=e.el h.avail_el[e.el]=true
Y.new(30,e.name.." acquired")j(e,"d")e:del()end,draw=function(e)if(e.el)pal(7,e.col)
f.draw(e)pal()end})ec=e("c_shard:c_obj",{__new=function(o,e,n,t,i)local e=b.new(e,n,u())_(e,[[speed=0.1
speed_inc=1.05
cnt=*1
static=*2
sbase=1.5
sx=_fn_rnd_15
sy=_fn_rnd_15
]],{t or 1,i or false})return e end,update=function(e)local n=e:mdist(h)if n<4do h.shards+=e.cnt sfx(1)if(e.static)j(e,"d")
e:del()elseif not e.static do e:moveTo(h,e.speed)e.speed*=e.speed_inc else end end,draw=function(e)circfill(e.x+4,e.y+4,mid(1,e.cnt/2,4),7)end})eu=e("c_npc:c_int",{__new=function(o,e,t,n,i)local e=f.new(e,t,u())e.spr.idle.sprites=eJ[n]or{154}e.name=eS[n]e.dialogs=split(i,"/")e.cur_diag=1e.diagcls=nil e.boss=n=="lea"and m==9return e end,update=function(e)f.update(e)if e.diagcls and(e:mdist(h)>40or e.diagcls.destroyed)do e.diagcls:del()if(e.boss)z.new(e.x-8,e.y-8,"b3")e:del()
e.cur_diag=1e.diagcls=nil end end,action=function(e)if(e.cur_diag>#e.dialogs)e.diagcls:del()e.cur_diag=1return
e.diagcls=e.diagcls or et.new(30,e.name,"")e.diagcls:update_msg(e.dialogs[e.cur_diag])e.diagcls.cont=e.cur_diag<#e.dialogs e.diagcls.ttl:restart()e.cur_diag=e.cur_diag+1end})en=e("c_bullet:c_obj",{__new=function(o,e,n,t,i)local e=b.new(e,n,u())_(e,[[dir=*1
speed=*2
ttl=_fn_t1_3
]],{t,i})e.spr.idle=r"ss = 185"add(e1,e)return e end,update=function(e)e.x+=cos(e.dir)*e.speed e.y+=sin(e.dir)*e.speed if(e:collide(h))h:dmg(1)e:del()else if(g(e.x,e.y)or e.ttl:adv())e:del()
end,del=function(e)del(e1,e)b.del(e)end})eV=e("c_misc_mgr:c_mgr",{__new=function(e)local e=F.new()return e end})D=e("c_hud_element:c_obj",{__new=function(i,e,n,t)local t=b.new(e,n,t)_(t,"fixedx=*1;fixedy=*2",{e,n})return t end,update=function(e)local n,t=o:calc_center()e.x=e.fixedx+n e.y=e.fixedy+t end})ez=e("c_val_printer:c_hud_element",{__new=function(o,e,n,t,i)local e=D.new(e,n)_(e,"draw_fn=*1;bgl=*2",{i,t})e.spr.idle=r"ss=137"return e end,draw=function(e)rectfill(e.x,e.y,e.x+e.bgl,e.y+6,1)e:draw_fn()end})eW=e("c_player_life_bar:c_hud_element",{__new=function(t,e,n)local e=D.new(e,n)e.spr.idle=r"ss=169"e.life_ref=h.init_max_life return e end,draw=function(e)local n=30*h.max_life/e.life_ref rectfill(e.x,e.y+1,e.x+8,e.y+7,1)e:draw_sprite()ey(e.x+10,e.y+2,n,4,h.life,h.max_life,1,8)end})Y=e("c_slide_text:c_hud_element",{__new=function(t,e,n)local e=D.new(0,e,c.mgr.hud_mgr)e.msg=n e.final_pos=122-#n*4e.fixedx=e.final_pos+250_(e,[[            ttl = _fn_t1_2
        ]])D.update(e)return e end,update=function(e)if(e.ttl:adv())e:del()return
local n=abs(e.fixedx-e.final_pos)e.fixedx=n<2and e.final_pos or e.fixedx-n*.1D.update(e)end,draw=function(e)rectfill(e.x-2,e.y-2,e.x+126,e.y+7,1)?e.msg,e.x,e.y,8
end})et=e("c_dialog:c_slide_text",{__new=function(i,e,t,n)local e=Y.new(e,n)_(e,[[final_pos=10
fixedx=260
ttl=_fn_t1_6
cont=false
author=*1
msgs=nil
]],{t})et.update_msg(e,n)return e end,update_msg=function(e,n)e.msg=n e.msgs=split((e.author~=nil and e.author..":*"or"")..n,"*")end,draw=function(e)local n=#e.msgs rectfill(e.x-10,e.y-10,e.x+124,e.y+n*7+10,1)rect(e.x-2,e.y-2,e.x+124,e.y+n*7,14)for n=1,n do?e.msgs[n],e.x,e.y+(n-1)*7,8
end?"❎",e.x+100,e.y+n*7+2,8
end})n0=e("c_hud_mgr:c_mgr",{__new=function(e)local e=F.new()e.update_in_pause=true return e end,restart=function(e)e.objs={ez.new(70,1,25,function(e)circfill(e.x+4,e.y+3,2,7)?tostr(h.shards),e.x+10,e.y+1,8
end),eW.new(5,0)}end,draw=function(e)F.draw(e)local e,n=o:calc_center()if(h.keys.red)pal(7,8)spr(59,100+e,1+n)pal()
if(h.keys.blue)pal(7,12)spr(59,110+e,1+n)pal()
end})ne=true d,a,X,Q=s"0;1;2;3"N,e4,eF,eC=s"1;2;3;4"nn=r"8;10;12;13"eB=r[[{sprites={112;113;114;115};fps=10;loop=false};
{sprites={116;117;118;119};fps=30;loop=true};
{sprites={120;121;122;123};fps=10;loop=false};
{sprites={124};fps=1;loop=false};
]]eL=r"0.3;1;0.4;0.5"eh={eD,eG,eq,eI}eA=r[[{10;20;30;40};{10;15;25};{0;0;0};{0;0;0}]]eP=r"A=fire;B=thunder;C=ice;D=wind;E=fire+1;F=fire+2;G=lifereg;H=lifereg+1;I=max life+1;J=fire+3;K=lifereg+2;L=max life+2;"eE=r("E=*1;F=*2;G=*3;H=*4;I=*5;J=*6;K=*7;L=*8;",{function()h.lev_el[N]=2end,function()h.lev_el[N]=3end,function()h.lifereg_lev=max(1,h.lifereg_lev)end,function()h.lifereg_lev=max(2,h.lifereg_lev)end,function()h.max_life+=5h.life=h.max_life end,function()h.lev_el[N]=4end,function()h.lifereg_lev=3end,function()h.max_life+=10h.life=h.max_life end})eO=r"A=8;B=10;C=12;D=13;E=8;F=8;G=8;H=8;I=7;J=18;K=8;L=7;"eK=r"A=burn green vines;B=strike/power switches;C=icy things are useful!;D=all they need is a little push;E=burn red vines;F=more fire power;G=life regen;H=life regen increased;I=tired of losing?;J=burn blue vines;K=life regen greatly increased;L=max life to maximum;"eU=r"A=20;B=25;C=40;D=35;E=50;F=60;G=70;H=80;I=90;J=100;K=110;L=120;"eM=r"U=red;V=blue;"eS=r"lea=aunt lea;lady=lady;titus=old titus;"eJ=r"lea={192;193};lady={208;209};titus={224;225};"C=r"a=bath;b=batv;c=witchh;d=witchv;e=dog;g=spider;i=sk;o=eyeh;y=eyev;l=b1;m=b2;n=b3;w=craterh;x=craterv;"ee=r[[dog={idle={146;147}}
spider={idle={162;163}}
sk={idle={150;151}}
bath={idle={128;129}}
batv=_k_bath
eyeh={idle={132;133}}
eyev=_k_eyeh
witchh={idle={130;131}}
witchv=_k_witchh
b1={idle={203;205}}
b2={idle={231;233}}
b3={idle={199;201}}
craterh={idle={38}}
craterv={idle={54}}
]]e2=r"batv=1;witchv=1;craterv=1;eyev=1"eR=r"eyeh=1;eyev=1;"c,h,L,p,w,e_=s"0;0;nil;48;32;false"el,ed=p*8,w*8S,K,v,B,e1=s"{};{};{};{};{};{}"m,ef,k=s"2;true;nil"ek,nt,ni,eZ=s"false;{false;false;false;false};nil;false"eX=[[moved outside to spare compresion space]]ev=r[[metal={tile_maps={1;2;3;4;5};bg_col=-15;bg_item_spr={{174};{190};{175};{172}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
sand={tile_maps={17;18;19;20;21};bg_col=0;bg_item_spr={{15};{31};{47};{41}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
grass={tile_maps={33;34;35;36;37};bg_col=0;bg_item_spr={{8};{24};{7};{39}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
ice={tile_maps={49;50;51;52;53};bg_col=-15;bg_item_spr={{142};{158};{143};{170}};bg_item_off={{0;0};{0;0};{0;-8};{-8;-8}}};
]]I={n(r"name=The green forest 2;music=1;theme=grass;wtx=-48;wty=0;fix_jumps={{2;30}}",r[[p={cname=titus;msg=i heard that you can*tap twice down arrow*to focus on another spell/tell me if it works*i'm happy to be useful}
]]),n(r"name=The green forest 1;music=1;theme=grass;wtx=0;wty=0;fix_jumps={{22;30}}",r[[p = {cname=lea;msg=my dear nephew*you are the only hope*your parents would be proud*of you/please help me find the*four elemental scrolls.}
]]),n(r"name=The green forest 3;music=1;theme=grass;wtx=48;wty=0;fix_jumps={{17;30}}",r[[q = {cname=titus;msg=hi son. i'm old titus*i lived in these lands*for many years/i tried to find those*mysterious scrolls/but i'm too lazy*and old, of course/i know there some scroll near*but i can't guess where}
]]),n(r"name=The underground;music=13;theme=sand;wtx=-48;wty=32;fix_jumps={{2;1};{11;30};{44;30}}",r[[r = {cname=lady;msg=hi there. i'm lady*nice to meet you/don't go down there*there's a big creature*and dangerous too/but if you insist*maybe this is the 'key'*to your quest*i shouldn't interfere/i thought it could be*orrible to see you*slaughtered by that monster/anyway*good luck}
]]),n(r"name=The intestines;music=13;theme=sand;wtx=0;wty=32;fix_jumps={{22;1};{20;30}}",r[[]]),n(r"name=The intestines;music=13;theme=ice;wtx=48;wty=32;fix_jumps={{18;1};{4;30}}",r[[r = {cname=lady;msg=hi again*you found the way here/but i guess...*why?/why risk your life*again and again/needless to say*there's an even bigger*and more evil monster*down there/i promise this time*i won't say anything/but it is very dangerous*please be careful}            
]]),n(r"name=The intestines;music=6;theme=metal;wtx=-48;wty=64;fix_jumps={{10;1};{43;1}}",r[[]]),n(r"name=The intestines;music=6;theme=metal;wtx=0;wty=64;fix_jumps={{19;2}}",r[[]]),n(r"name=The forgotten;music=6;theme=metal;wtx=48;wty=64;fix_jumps={{3;1}}",r[[p={cname=lea;msg=oh my beloved nephew*i'm so proud/you have done well*the scrool are again reunited/finally the search*is over/ah ah ah*ah ah ah ah/i can tell you now*i'm not your aunt*i never was/now please die*and all the scroll's power*will vanish with your death};
r={cname=lady;msg=well well well*go on then/i sense something*very dangerous here/but i can't stop you*you never listen to me/see you in the afterlife};
q={cname=titus;msg=congratulations son!*you have found all the scrolls/I see you also*defeated this evil monsters/sorry to hear you lost*your aunt in the process/though i think she*never was your aunt/anyway, you have done well/the world is safe again/you're free to explore*this world now*as you wish/thank you*thank you player!}
]])}U("t1",function(e)return T.new(e,false)end)U("t2",function(e)return T.new(e,true)end)U("rnd",function(e)return flr(rnd(e))end)function A()return c.mgr.enemy_mgr end function u()return c.mgr.misc_mgr end function _init()ew"\n\n\n\n----------- Game started -----------"c=n1.new()end function _update60()c:update()end function _draw()c:draw()end n1=e("c_game",{__new=function()local e=r[[paused=false
menu=true
play=false
stage_title_phase=false
require_player_rebuild=true
minimap={}  
bgpos={0;0}          
]]e.mgr={enemy_mgr=F.new(),misc_mgr=eV.new(),hud_mgr=n0.new()}return e end,start_play=function(e)e.menu=false e.play=true if(e.require_player_rebuild)h=eH.new(0,0)e.require_player_rebuild=false
h:reset_stage_props()for n,e in pairs(e.mgr)do if(e.restart)e:restart()
end J()o:place(h.x,h.y)music(1)end,start_menu=function(e)e.menu=true e.play=false m=2end,stage_check=function(e)local e,n=flr(h.x/8),flr(h.y/8)if e<0or e>=p-1and h.x>p*8-4or n<0or n>=w do ef=false local t=Z()local n,i=e+t.wtx or 0,n+t.wty or 0if(e>=p-1)n+=1
local e=nil for t=1,#I do e=I[t]if(n>=e.wtx and n<e.wtx+p and i>=e.wty and i<e.wty+w)m=t break
end es()local n,i=n-e.wtx,i-e.wty k=r(""..n..";"..i.."")J()eQ()o:place(h.x,h.y)if(t.music~=e.music)music(e.music)
end end,update=function(e)if e.menu do if(btnp(5,0))e.require_player_rebuild=true e:start_play()
return end e:stage_check()o:update()for n,e in pairs(e.mgr)do if(e.update)e:update()
end h:update()e.bgpos[1]=(o.x-o.ox)*.5e.bgpos[2]=(o.y-o.oy)*.5end,draw=function(e)if(e.menu)cls()local e=t()spr(80+flr(e/.1%3),60,30)i("* the last spellcaster *",64,20,7)i("⬅️➡️ to move",64,60,6)i("⬇️⬇️ (tap twice) change spell",64,70,6)i("🅾️ jump - ❎ spell attack",64,80,6)i("(once you have spells)",64,90,6)i("press ❎ to start",64,110,7)return
cls(Z().theme.bg_col)for n=0,23do for t=0,15do spr(9,n*16+e.bgpos[1],t*16+e.bgpos[2],2,2)end end map(0,0,0,0,no,nl,false)e.mgr.misc_mgr:draw()e.mgr.enemy_mgr:draw()h:draw()e.mgr.hud_mgr:draw()if(h.phase=="dead")local e,n=o:calc_center()i("you died!",64+e,55+n,8)i("respawning in "..h.t_respawn:t_left(),64+e,65+n,7)return
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
00000000000000000066660000666600001111000011110000000000000000000000000000aaaa00000000000cc66c7700000000000000006666666670007700
0200002000200200006880000068800001555510015555100000000000000000000000000a9999a0000000006000000700000000000000006677667027000770
2420024222400422006dd000506dd0051555555115222251000000000000000000000000a965569a000aa0006060000c00000000000000000667666002770020
24488442244884425555d55505555d502222222222222222000000000000000000000000a956669a00a55a00c000060600000000000000000667760000272227
24244242200440020065d5000065d5005555888558885555000000000000000000000000a956669a00a56a006000000600000000000000000066660000022002
02000020000000000065d5000605d5002222222222222222000000000000000000000000a965569a000aa000c006000600000000000000000006760000000002
0000000000000000005555500005555001555510015225100000000000000000000000000a9999a0000000007000006c00000000000000000000600000000020
00000000000000000500505000500505001111000011110000000000000000000000000000aaaa000000000077cc66cc00000000000000000000000077772270
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
011100000c052000020000200002000020000200002000020f052000020000200002000020000200002000020e052000020000200002000020000200002000020d05200002000020000200002000020000200002
01100000001320c132001320c132001320c132001320c132031320f132031320f132031320f132031320f132021320e132021320e132021320e132021320e132011320d132011320d132011320d132011320d132
311000001f5320050218532005021c532005021d5320050220532005022053220532005020050200502005021f532005021f53200502005020050200502005021c53200502005021c53200502185320050200502
31100000185501855000550005500055000550185501f55003550035500355003550035500355003550035501d550025501d5500255002550025501d5501c550015501b550015500155001550015500155001550
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
01 28424344
01 28294344
00 28292a44
02 28292b44
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
