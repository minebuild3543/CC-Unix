
local function Q(_IQQ)local XpkjA={}setmetatable(XpkjA,{__index=getfenv()})
setfenv(_IQQ,XpkjA)local pVRj=_IQQ()for fuZ3z86,er in pairs(XpkjA)do pVRj[fuZ3z86]=er end
return pVRj end
bit=Q(function()local DFb100j=math.floor;local XL_=2^32;local WYdR=XL_-1
local function QKKks_zt(Ch)local urkh={}
local zhzpBSx=setmetatable({},urkh)
function urkh:__index(rHSjalVy)local TjhsnP=Ch(rHSjalVy)zhzpBSx[rHSjalVy]=TjhsnP;return TjhsnP end;return zhzpBSx end
local function Are7xU(t5jzEd9,JZAU2)
local function zPXTTg(seMLr,qX)local h_8,xL7OTb=0,1
while seMLr~=0 and qX~=0 do local w8T3f,K=seMLr%JZAU2,qX%JZAU2;h_8=h_8+
t5jzEd9[w8T3f][K]*xL7OTb
seMLr=(seMLr-w8T3f)/JZAU2;qX=(qX-K)/JZAU2;xL7OTb=xL7OTb*JZAU2 end;h_8=h_8+ (seMLr+qX)*xL7OTb;return h_8 end;return zPXTTg end
local function yxjl(qL)local vfIyB=Are7xU(qL,2^1)
local quNsijN=QKKks_zt(function(QUh2tc)return
QKKks_zt(function(qboV)return vfIyB(QUh2tc,qboV)end)end)return Are7xU(quNsijN,2^ (qL.n or 1))end;local ZG={}function ZG.tobit(nSBOx7)return nSBOx7%2^32 end
ZG.bxor=yxjl{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local Vu0cCAf=ZG.bxor;function ZG.bnot(u)return WYdR-u end;local q=ZG.bnot
function ZG.band(K,i1)return((K+i1)-
Vu0cCAf(K,i1))/2 end;local kP7O5=ZG.band;function ZG.bor(zz1QI,kFTAh)
return WYdR-kP7O5(WYdR-zz1QI,WYdR-kFTAh)end;local lqT=ZG.bor;local mP3mlD,PrPyxMK
function ZG.rshift(LBf,dijn4Ph)if dijn4Ph<0 then return mP3mlD(LBf,
-dijn4Ph)end;return DFb100j(LBf%2^32/
2^dijn4Ph)end;PrPyxMK=ZG.rshift
function ZG.lshift(CO1,RlZo)
if RlZo<0 then return PrPyxMK(CO1,-RlZo)end;return(CO1*2^RlZo)%2^32 end;mP3mlD=ZG.lshift
function ZG.tohex(SUn,Ib4)Ib4=Ib4 or 8;local fjV1G2;if Ib4 <=0 then if Ib4 ==0 then return''end
fjV1G2=true;Ib4=-Ib4 end
SUn=kP7O5(SUn,16^Ib4-1)return
('%0'..Ib4 .. (fjV1G2 and'X'or'x')):format(SUn)end;local tczrIB=ZG.tohex;function ZG.extract(Do,_,TqYJ4)TqYJ4=TqYJ4 or 1;return
kP7O5(PrPyxMK(Do,_),2^TqYJ4-1)end
local a=ZG.extract
function ZG.replace(DI,b,E,KMw7_i1s)KMw7_i1s=KMw7_i1s or 1;local CQi=2^KMw7_i1s-1
b=kP7O5(b,CQi)local nHlJ=q(mP3mlD(CQi,E))
return kP7O5(DI,nHlJ)+mP3mlD(b,E)end;local wqU76o=ZG.replace
function ZG.bswap(lw4Q7kbl)local IN=kP7O5(lw4Q7kbl,0xff)
lw4Q7kbl=PrPyxMK(lw4Q7kbl,8)local QYf1=kP7O5(lw4Q7kbl,0xff)lw4Q7kbl=PrPyxMK(lw4Q7kbl,8)
local RfsnisO=kP7O5(lw4Q7kbl,0xff)lw4Q7kbl=PrPyxMK(lw4Q7kbl,8)local lvW2ga=kP7O5(lw4Q7kbl,0xff)return
mP3mlD(mP3mlD(
mP3mlD(IN,8)+QYf1,8)+RfsnisO,8)+lvW2ga end;local LB1Z=ZG.bswap;function ZG.rrotate(T7RKP,_L6Bs)_L6Bs=_L6Bs%32
local SH=kP7O5(T7RKP,2^_L6Bs-1)
return PrPyxMK(T7RKP,_L6Bs)+mP3mlD(SH,32-_L6Bs)end
local N9L=ZG.rrotate
function ZG.lrotate(wU4wYbA9,fFeQcIM)return N9L(wU4wYbA9,-fFeQcIM)end;local hDc_M=ZG.lrotate;ZG.rol=ZG.lrotate;ZG.ror=ZG.rrotate
function ZG.arshift(JEHSHPh3,bb)
local o5e6fP=PrPyxMK(JEHSHPh3,bb)if JEHSHPh3 >=0x80000000 then
o5e6fP=o5e6fP+mP3mlD(2^bb-1,32-bb)end;return o5e6fP end;local qW0lRiD1=ZG.arshift
function ZG.btest(iq7ol,eMV)return kP7O5(iq7ol,eMV)~=0 end;ZG.bit32={}
local function iD1IUx(WDTNkTD)return(-1-WDTNkTD)%XL_ end;ZG.bit32.bnot=iD1IUx
local function JLCOx_ak(Oejsws,CkD73N0,PlwhaRKJ,...)local Caz4NM4Z
if CkD73N0 then Oejsws=Oejsws%XL_
CkD73N0=CkD73N0%XL_;Caz4NM4Z=Vu0cCAf(Oejsws,CkD73N0)if PlwhaRKJ then
Caz4NM4Z=JLCOx_ak(Caz4NM4Z,PlwhaRKJ,...)end;return Caz4NM4Z elseif Oejsws then return Oejsws%XL_ else return 0 end end;ZG.bit32.bxor=JLCOx_ak
local function hPQ(XVxxx,hD,G5BuU5,...)local AfwsY
if hD then XVxxx=XVxxx%XL_;hD=hD%XL_
AfwsY=(
(XVxxx+hD)-Vu0cCAf(XVxxx,hD))/2;if G5BuU5 then AfwsY=hPQ(AfwsY,G5BuU5,...)end;return AfwsY elseif XVxxx then return XVxxx%
XL_ else return WYdR end end;ZG.bit32.band=hPQ
local function R1FIoQI(T,WZs,ITdz,...)local AjfoUo
if WZs then T=T%XL_;WZs=WZs%XL_;AjfoUo=WYdR-
kP7O5(WYdR-T,WYdR-WZs)
if ITdz then AjfoUo=R1FIoQI(AjfoUo,ITdz,...)end;return AjfoUo elseif T then return T%XL_ else return 0 end end;ZG.bit32.bor=R1FIoQI
function ZG.bit32.btest(...)return hPQ(...)~=0 end
function ZG.bit32.lrotate(Er9zidsB,X)return hDc_M(Er9zidsB%XL_,X)end
function ZG.bit32.rrotate(dR,JFXtQwy)return N9L(dR%XL_,JFXtQwy)end;function ZG.bit32.lshift(uMV17h0,E2NZK)if E2NZK>31 or E2NZK<-31 then return 0 end;return
mP3mlD(uMV17h0%XL_,E2NZK)end
function ZG.bit32.rshift(WNWWe,zMzjn3lk)if
zMzjn3lk>31 or zMzjn3lk<-31 then return 0 end;return
PrPyxMK(WNWWe%XL_,zMzjn3lk)end
function ZG.bit32.arshift(Trkkpmd,L)Trkkpmd=Trkkpmd%XL_
if L>=0 then
if L>31 then return
(Trkkpmd>=0x80000000)and WYdR or 0 else local GGv=PrPyxMK(Trkkpmd,L)
if Trkkpmd>=
0x80000000 then GGv=GGv+mP3mlD(2^L-1,32-L)end;return GGv end else return mP3mlD(Trkkpmd,-L)end end
function ZG.bit32.extract(ZIzh4Si,c8D4n81,...)local cSjJHx=...or 1
if
c8D4n81 <0 or c8D4n81 >31 or cSjJHx<0 or c8D4n81+cSjJHx>32 then error'out of range'end;ZIzh4Si=ZIzh4Si%XL_;return a(ZIzh4Si,c8D4n81,...)end
function ZG.bit32.replace(fa,M,dIZlrvD,...)local jQgsATKd=...or 1;if
dIZlrvD<0 or dIZlrvD>31 or jQgsATKd<0 or dIZlrvD+jQgsATKd>32 then
error'out of range'end;fa=fa%XL_;M=M%XL_;return
wqU76o(fa,M,dIZlrvD,...)end;ZG.bit={}function ZG.bit.tobit(aBbGg)aBbGg=aBbGg%XL_
if aBbGg>=0x80000000 then aBbGg=aBbGg-XL_ end;return aBbGg end
local NsoTwDs=ZG.bit.tobit;function ZG.bit.tohex(D9,...)return tczrIB(D9%XL_,...)end;function ZG.bit.bnot(G)return NsoTwDs(q(
G%XL_))end
local function HGli(gE,QgC,CYoa,...)
if CYoa then return
HGli(HGli(gE,QgC),CYoa,...)elseif QgC then
return NsoTwDs(lqT(gE%XL_,QgC%XL_))else return NsoTwDs(gE)end end;ZG.bit.bor=HGli
local function iy(K3ipRr,F2tY,rb21L2,...)
if rb21L2 then return iy(iy(K3ipRr,F2tY),rb21L2,...)elseif
F2tY then return NsoTwDs(kP7O5(K3ipRr%XL_,F2tY%XL_))else return
NsoTwDs(K3ipRr)end end;ZG.bit.band=iy
local function m6SCS0(o_v255,wUVm,VQ,...)
if VQ then
return m6SCS0(m6SCS0(o_v255,wUVm),VQ,...)elseif wUVm then
return NsoTwDs(Vu0cCAf(o_v255%XL_,wUVm%XL_))else return NsoTwDs(o_v255)end end;ZG.bit.bxor=m6SCS0;function ZG.bit.lshift(oTYNsnP,I)return
NsoTwDs(mP3mlD(oTYNsnP%XL_,I%32))end
function ZG.bit.rshift(L,mR5gwW)return NsoTwDs(PrPyxMK(
L%XL_,mR5gwW%32))end;function ZG.bit.arshift(DfbW,sh)
return NsoTwDs(qW0lRiD1(DfbW%XL_,sh%32))end;function ZG.bit.rol(rrFLbCtj,YcPea0vg)return
NsoTwDs(hDc_M(rrFLbCtj%XL_,YcPea0vg%32))end
function ZG.bit.ror(usLpLoaH,e7dv)return NsoTwDs(N9L(
usLpLoaH%XL_,e7dv%32))end
function ZG.bit.bswap(inx0)return NsoTwDs(LB1Z(inx0%XL_))end
local function NUhYw6R4(A5k5yt,B7SHDx7h)
local EEpoeR=ZG.bor(ZG.bnot(A5k5yt),ZG.bnot(B7SHDx7h))local _k=ZG.bor(A5k5yt,B7SHDx7h)local Ef=ZG.band(_k,EEpoeR)return Ef end;local function Hv(KfM,Vd)check_int(KfM)if(KfM<0)then
KfM=ZG.bnot(math.abs(KfM))+1 end;for i=1,Vd do KfM=KfM/2 end
return math.floor(KfM)end
return
{bnot=ZG.bnot,band=ZG.band,bor=ZG.bor,bxor=m6SCS0,rshift=ZG.rshift,lshift=ZG.lshift,bxor2=NUhYw6R4,blogic_rshift=Hv,tobits=to_bits,tonumb=tbl_to_number}end)
util=Q(function()local Oynw=bit.bxor;local QBO=bit.rshift;local s4ggux=bit.band;local hrVI4meU=bit.lshift
local function xEq6TAF(ARuba)
ARuba=Oynw(ARuba,QBO(ARuba,4))ARuba=Oynw(ARuba,QBO(ARuba,2))
ARuba=Oynw(ARuba,QBO(ARuba,1))return s4ggux(ARuba,1)end
local function UIjls(Wo53nZ,XRfQ)if(XRfQ==0)then return s4ggux(Wo53nZ,0xff)else return
s4ggux(QBO(Wo53nZ,XRfQ*8),0xff)end end
local function jdLnB0vD(gFPRdEC,lw9gLt3)if(lw9gLt3 ==0)then return s4ggux(gFPRdEC,0xff)else return
hrVI4meU(s4ggux(gFPRdEC,0xff),lw9gLt3*8)end end
local function PSlD(T,I5,JmE)local s4={}for i=0,JmE-1 do
s4[i]=
jdLnB0vD(T[I5+ (i*4)],3)+
jdLnB0vD(T[I5+ (i*4)+1],2)+jdLnB0vD(T[I5+ (i*4)+2],1)+jdLnB0vD(T[I5+ (i*4)+3],0)end;return s4 end
local function nN(FFG,a31jEAS,LS4h,eux092_P)eux092_P=eux092_P or#FFG;for i=0,eux092_P do for j=0,3 do
a31jEAS[LS4h+i*4+ (3-j)]=UIjls(FFG[i],j)end end
return a31jEAS end
local function J(ZA9)local hWgmxm=""for UBg54E,gQGq in ipairs(ZA9)do
hWgmxm=hWgmxm..string.format("%02x ",gQGq)end;return hWgmxm end
local function A(OyHc5FEv)local Dn1Xi=type(OyHc5FEv)
if(Dn1Xi=="number")then return
string.format("%08x",OyHc5FEv)elseif(Dn1Xi=="table")then return J(OyHc5FEv)elseif
(Dn1Xi=="string")then
local _gGmBBE={string.byte(OyHc5FEv,1,#OyHc5FEv)}return J(_gGmBBE)else return OyHc5FEv end end
local function g3Qeqnr(rIX4)local AI14eFhp=#rIX4;local iW2O=math.random(0,255)
local Gdp=math.random(0,255)
local nbqmx=string.char(iW2O,Gdp,iW2O,Gdp,UIjls(AI14eFhp,3),UIjls(AI14eFhp,2),UIjls(AI14eFhp,1),UIjls(AI14eFhp,0))rIX4=nbqmx..rIX4
local IWQcC=math.ceil(#rIX4/16)*16-#rIX4;local cvRh=""for i=1,IWQcC do
cvRh=cvRh..string.char(math.random(0,255))end;return rIX4 ..cvRh end
local function qHpY64(W9yaJm)local oJ1ec={string.byte(W9yaJm,1,4)}
if(
oJ1ec[1]==oJ1ec[3]and oJ1ec[2]==oJ1ec[4])then return true end;return false end
local function z(L)if(not qHpY64(L))then return nil end
local MMNWLk=
jdLnB0vD(string.byte(L,5),3)+jdLnB0vD(string.byte(L,6),2)+
jdLnB0vD(string.byte(L,7),1)+
jdLnB0vD(string.byte(L,8),0)return string.sub(L,9,8+MMNWLk)end;local function qccJ5b(x6Ni,Q2waXkyp)
for i=1,16 do x6Ni[i]=Oynw(x6Ni[i],Q2waXkyp[i])end end
return
{byteParity=xEq6TAF,getByte=UIjls,putByte=jdLnB0vD,bytesToInts=PSlD,intsToBytes=nN,bytesToHex=J,toHexString=A,padByteString=g3Qeqnr,properlyDecrypted=qHpY64,unpadByteString=z,xorIV=qccJ5b}end)
bit=Q(function()local EG72=math.floor;local mlTMZ=2^32;local q=mlTMZ-1
local function xb6(KpCCA)local H6={}
local hgsKvTz=setmetatable({},H6)
function H6:__index(zEt)local Wjojpvg=KpCCA(zEt)hgsKvTz[zEt]=Wjojpvg;return Wjojpvg end;return hgsKvTz end
local function yK(l2PqbWw,EJTH9)
local function qTB82(KL,EATFLbgY)local FF,rh=0,1
while KL~=0 and EATFLbgY~=0 do local YcCR,G3p2Yn=KL%EJTH9,EATFLbgY%EJTH9;FF=
FF+l2PqbWw[YcCR][G3p2Yn]*rh;KL=
(KL-YcCR)/EJTH9
EATFLbgY=(EATFLbgY-G3p2Yn)/EJTH9;rh=rh*EJTH9 end;FF=FF+ (KL+EATFLbgY)*rh;return FF end;return qTB82 end
local function rHLz2GD(_jkkD9)local D=yK(_jkkD9,2^1)
local DMn=xb6(function(GBzFRjVV)return
xb6(function(pG4C8fDK)return D(GBzFRjVV,pG4C8fDK)end)end)return yK(DMn,2^ (_jkkD9.n or 1))end;local BlW0RhJA={}function BlW0RhJA.tobit(LLFUU)return LLFUU%2^32 end
BlW0RhJA.bxor=rHLz2GD{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local Uy=BlW0RhJA.bxor;function BlW0RhJA.bnot(kdmQtj6)return q-kdmQtj6 end
local n=BlW0RhJA.bnot;function BlW0RhJA.band(Hc35_,ubP)return
((Hc35_+ubP)-Uy(Hc35_,ubP))/2 end
local TKu=BlW0RhJA.band
function BlW0RhJA.bor(eN0UMW,lAG)return q-TKu(q-eN0UMW,q-lAG)end;local M6kL=BlW0RhJA.bor;local M7o_,dk2X7J7
function BlW0RhJA.rshift(AvEtR8Y,rl3MMqfm)if rl3MMqfm<0 then return
M7o_(AvEtR8Y,-rl3MMqfm)end;return
EG72(AvEtR8Y%2^32/2^rl3MMqfm)end;dk2X7J7=BlW0RhJA.rshift
function BlW0RhJA.lshift(nQj,Eq8jDq)if Eq8jDq<0 then
return dk2X7J7(nQj,-Eq8jDq)end;return(nQj*2^Eq8jDq)%2^32 end;M7o_=BlW0RhJA.lshift
function BlW0RhJA.tohex(LnQUN,Gm1)Gm1=Gm1 or 8;local Jp;if Gm1 <=0 then
if Gm1 ==0 then return''end;Jp=true;Gm1=-Gm1 end
LnQUN=TKu(LnQUN,16^Gm1-1)return
('%0'..Gm1 .. (Jp and'X'or'x')):format(LnQUN)end;local jv=BlW0RhJA.tohex
function BlW0RhJA.extract(NwBqNl3C,XuqjvYPF,Trh)Trh=Trh or 1;return TKu(dk2X7J7(NwBqNl3C,XuqjvYPF),2^
Trh-1)end;local MW=BlW0RhJA.extract;function BlW0RhJA.replace(K,uK,s0FU,wQl)wQl=wQl or 1;local g=2^wQl-1
uK=TKu(uK,g)local m4u=n(M7o_(g,s0FU))
return TKu(K,m4u)+M7o_(uK,s0FU)end
local E2OQ=BlW0RhJA.replace
function BlW0RhJA.bswap(StZ)local C1NqzxY=TKu(StZ,0xff)StZ=dk2X7J7(StZ,8)
local T1gVrYq=TKu(StZ,0xff)StZ=dk2X7J7(StZ,8)local P5G=TKu(StZ,0xff)StZ=dk2X7J7(StZ,8)
local JC=TKu(StZ,0xff)return
M7o_(M7o_(M7o_(C1NqzxY,8)+T1gVrYq,8)+P5G,8)+JC end;local SnbfLb6=BlW0RhJA.bswap
function BlW0RhJA.rrotate(PDA,K)K=K%32;local qne5Stra=TKu(PDA,2^K-1)return
dk2X7J7(PDA,K)+M7o_(qne5Stra,32-K)end;local ay=BlW0RhJA.rrotate
function BlW0RhJA.lrotate(FKLmmhnQ,F82)return ay(FKLmmhnQ,-F82)end;local W=BlW0RhJA.lrotate;BlW0RhJA.rol=BlW0RhJA.lrotate
BlW0RhJA.ror=BlW0RhJA.rrotate
function BlW0RhJA.arshift(wJ6tY_,TNg)local wO9T=dk2X7J7(wJ6tY_,TNg)if wJ6tY_>=0x80000000 then wO9T=wO9T+M7o_(2^TNg-1,
32-TNg)end;return
wO9T end;local WzM=BlW0RhJA.arshift;function BlW0RhJA.btest(QMcSUqdi,sKy2P9i)
return TKu(QMcSUqdi,sKy2P9i)~=0 end;BlW0RhJA.bit32={}local function PSx(S)
return(-1-S)%mlTMZ end;BlW0RhJA.bit32.bnot=PSx
local function I(AD,AkxLdb66,aUR,...)local c4
if AkxLdb66 then
AD=AD%mlTMZ;AkxLdb66=AkxLdb66%mlTMZ;c4=Uy(AD,AkxLdb66)
if aUR then c4=I(c4,aUR,...)end;return c4 elseif AD then return AD%mlTMZ else return 0 end end;BlW0RhJA.bit32.bxor=I
local function wnA(ZNXs3Bwd,Ginn,h_pK,...)local L
if Ginn then ZNXs3Bwd=ZNXs3Bwd%mlTMZ
Ginn=Ginn%mlTMZ
L=((ZNXs3Bwd+Ginn)-Uy(ZNXs3Bwd,Ginn))/2;if h_pK then L=wnA(L,h_pK,...)end;return L elseif ZNXs3Bwd then return ZNXs3Bwd%mlTMZ else
return q end end;BlW0RhJA.bit32.band=wnA
local function cW(vBKFXR3,FP3j,fe,...)local ggnA
if FP3j then vBKFXR3=vBKFXR3%mlTMZ
FP3j=FP3j%mlTMZ;ggnA=q-TKu(q-vBKFXR3,q-FP3j)if fe then
ggnA=cW(ggnA,fe,...)end;return ggnA elseif vBKFXR3 then return vBKFXR3%mlTMZ else return 0 end end;BlW0RhJA.bit32.bor=cW
function BlW0RhJA.bit32.btest(...)return wnA(...)~=0 end
function BlW0RhJA.bit32.lrotate(KaD2ExEO,TpiFT)return W(KaD2ExEO%mlTMZ,TpiFT)end
function BlW0RhJA.bit32.rrotate(J,CH)return ay(J%mlTMZ,CH)end
function BlW0RhJA.bit32.lshift(sJ05I,HrLCim)
if HrLCim>31 or HrLCim<-31 then return 0 end;return M7o_(sJ05I%mlTMZ,HrLCim)end
function BlW0RhJA.bit32.rshift(w,sUu7z)if sUu7z>31 or sUu7z<-31 then return 0 end;return dk2X7J7(
w%mlTMZ,sUu7z)end
function BlW0RhJA.bit32.arshift(M5oB,xIyIKo)M5oB=M5oB%mlTMZ
if xIyIKo>=0 then
if xIyIKo>31 then return
(M5oB>=0x80000000)and q or 0 else
local f2x=dk2X7J7(M5oB,xIyIKo)if M5oB>=0x80000000 then
f2x=f2x+M7o_(2^xIyIKo-1,32-xIyIKo)end;return f2x end else return M7o_(M5oB,-xIyIKo)end end
function BlW0RhJA.bit32.extract(Nwl,Xpt_SQ,...)local Y=...or 1
if
Xpt_SQ<0 or Xpt_SQ>31 or Y<0 or Xpt_SQ+Y>32 then error'out of range'end;Nwl=Nwl%mlTMZ;return MW(Nwl,Xpt_SQ,...)end
function BlW0RhJA.bit32.replace(SMa,Bo,zF6ZPjQ,...)local nNQG3=...or 1
if
zF6ZPjQ<0 or zF6ZPjQ>31 or nNQG3 <0 or zF6ZPjQ+nNQG3 >32 then error'out of range'end;SMa=SMa%mlTMZ;Bo=Bo%mlTMZ;return E2OQ(SMa,Bo,zF6ZPjQ,...)end;BlW0RhJA.bit={}function BlW0RhJA.bit.tobit(yW)yW=yW%mlTMZ;if yW>=0x80000000 then
yW=yW-mlTMZ end;return yW end
local PHpCof2=BlW0RhJA.bit.tobit
function BlW0RhJA.bit.tohex(efGM8UMy,...)return jv(efGM8UMy%mlTMZ,...)end
function BlW0RhJA.bit.bnot(KhH)return PHpCof2(n(KhH%mlTMZ))end
local function bUPpn4T2(H4tXd,Nq6If,II,...)
if II then return bUPpn4T2(bUPpn4T2(H4tXd,Nq6If),II,...)elseif Nq6If then
return PHpCof2(M6kL(
H4tXd%mlTMZ,Nq6If%mlTMZ))else return PHpCof2(H4tXd)end end;BlW0RhJA.bit.bor=bUPpn4T2
local function sode(Y_tefq,i,a3u,...)
if a3u then
return sode(sode(Y_tefq,i),a3u,...)elseif i then return PHpCof2(TKu(Y_tefq%mlTMZ,i%mlTMZ))else return
PHpCof2(Y_tefq)end end;BlW0RhJA.bit.band=sode
local function G9zkKODk(mzhB,sTxVGmb,GSIcq,...)
if GSIcq then return
G9zkKODk(G9zkKODk(mzhB,sTxVGmb),GSIcq,...)elseif sTxVGmb then return
PHpCof2(Uy(mzhB%mlTMZ,sTxVGmb%mlTMZ))else return PHpCof2(mzhB)end end;BlW0RhJA.bit.bxor=G9zkKODk;function BlW0RhJA.bit.lshift(Go,DGf)return
PHpCof2(M7o_(Go%mlTMZ,DGf%32))end
function BlW0RhJA.bit.rshift(kgRX7X,JB)return PHpCof2(dk2X7J7(
kgRX7X%mlTMZ,JB%32))end;function BlW0RhJA.bit.arshift(GGJhclKa,KWahIz)return
PHpCof2(WzM(GGJhclKa%mlTMZ,KWahIz%32))end
function BlW0RhJA.bit.rol(X2kyW,pVlvW)return PHpCof2(W(
X2kyW%mlTMZ,pVlvW%32))end;function BlW0RhJA.bit.ror(QcKn_,jiM)
return PHpCof2(ay(QcKn_%mlTMZ,jiM%32))end;function BlW0RhJA.bit.bswap(YUdA)return
PHpCof2(SnbfLb6(YUdA%mlTMZ))end
local function MGt(lx3cpJ,Yx9)
local Mn=BlW0RhJA.bor(BlW0RhJA.bnot(lx3cpJ),BlW0RhJA.bnot(Yx9))local ut0=BlW0RhJA.bor(lx3cpJ,Yx9)
local ZFhlP6eg=BlW0RhJA.band(ut0,Mn)return ZFhlP6eg end
local function ld9GuG4t(ExUgDG,jc4o42jz)check_int(ExUgDG)if(ExUgDG<0)then ExUgDG=
BlW0RhJA.bnot(math.abs(ExUgDG))+1 end;for i=1,jc4o42jz do ExUgDG=
ExUgDG/2 end;return math.floor(ExUgDG)end
return
{bnot=BlW0RhJA.bnot,band=BlW0RhJA.band,bor=BlW0RhJA.bor,bxor=G9zkKODk,rshift=BlW0RhJA.rshift,lshift=BlW0RhJA.lshift,bxor2=MGt,blogic_rshift=ld9GuG4t,tobits=to_bits,tonumb=tbl_to_number}end)
util=Q(function()local jc=bit.bxor;local Ojz_=bit.rshift;local x=bit.band;local Xtecl=bit.lshift
local function KVcYU(lacOdjf9)
lacOdjf9=jc(lacOdjf9,Ojz_(lacOdjf9,4))lacOdjf9=jc(lacOdjf9,Ojz_(lacOdjf9,2))
lacOdjf9=jc(lacOdjf9,Ojz_(lacOdjf9,1))return x(lacOdjf9,1)end
local function _(R2h4lP4l,Fh)if(Fh==0)then return x(R2h4lP4l,0xff)else
return x(Ojz_(R2h4lP4l,Fh*8),0xff)end end
local function C(a2e9fa,Rc9_ZID)if(Rc9_ZID==0)then return x(a2e9fa,0xff)else return
Xtecl(x(a2e9fa,0xff),Rc9_ZID*8)end end
local function CJeG(H1HF2wD6,hBph,bxNo9h)local Khst={}for i=0,bxNo9h-1 do
Khst[i]=
C(H1HF2wD6[hBph+ (i*4)],3)+C(H1HF2wD6[
hBph+ (i*4)+1],2)+C(H1HF2wD6[
hBph+ (i*4)+2],1)+C(H1HF2wD6[hBph+ (i*4)+3],0)end;return
Khst end
local function F43eMG(pUT,ISg1,Gh5UJya,k)k=k or#pUT;for i=0,k do for j=0,3 do
ISg1[Gh5UJya+i*4+ (3-j)]=_(pUT[i],j)end end;return ISg1 end
local function mCzjh4(Z8Ue)local TXbmx=""for r,Pqgz415t in ipairs(Z8Ue)do
TXbmx=TXbmx..string.format("%02x ",Pqgz415t)end;return TXbmx end
local function lU(McNxKV)local WcwGYJh=type(McNxKV)
if(WcwGYJh=="number")then return
string.format("%08x",McNxKV)elseif(WcwGYJh=="table")then return mCzjh4(McNxKV)elseif
(WcwGYJh=="string")then local gJt={string.byte(McNxKV,1,#McNxKV)}return
mCzjh4(gJt)else return McNxKV end end
local function epQue9(hCs8M)local GkjCn_mq=#hCs8M;local T9sySp=math.random(0,255)
local DL0mMXM=math.random(0,255)
local o4Kvi75g=string.char(T9sySp,DL0mMXM,T9sySp,DL0mMXM,_(GkjCn_mq,3),_(GkjCn_mq,2),_(GkjCn_mq,1),_(GkjCn_mq,0))hCs8M=o4Kvi75g..hCs8M
local ELb=math.ceil(#hCs8M/16)*16-#hCs8M;local FV5=""for i=1,ELb do
FV5=FV5 ..string.char(math.random(0,255))end;return hCs8M..FV5 end
local function cHUJrj(sX)local DH6mUlGB={string.byte(sX,1,4)}if
(
DH6mUlGB[1]==DH6mUlGB[3]and DH6mUlGB[2]==DH6mUlGB[4])then return true end;return false end
local function EI0x(A4ZRczp)if(not cHUJrj(A4ZRczp))then return nil end
local rUT=
C(string.byte(A4ZRczp,5),3)+C(string.byte(A4ZRczp,6),2)+
C(string.byte(A4ZRczp,7),1)+
C(string.byte(A4ZRczp,8),0)return string.sub(A4ZRczp,9,8+rUT)end
local function E(g,JPi)for i=1,16 do g[i]=jc(g[i],JPi[i])end end
return
{byteParity=KVcYU,getByte=_,putByte=C,bytesToInts=CJeG,intsToBytes=F43eMG,bytesToHex=mCzjh4,toHexString=lU,padByteString=epQue9,properlyDecrypted=cHUJrj,unpadByteString=EI0x,xorIV=E}end)
bit=Q(function()local Kkl6fa=math.floor;local t=2^32;local H=t-1
local function glZrOuSo(wE_4o)local F={}
local bUO1NvT=setmetatable({},F)
function F:__index(K)local RQG=wE_4o(K)bUO1NvT[K]=RQG;return RQG end;return bUO1NvT end
local function Zdzaj(tVwI_N,Jkp2lGXG)
local function ifcyuS(V03W,R)local X6_,tN5u=0,1
while V03W~=0 and R~=0 do local Yqc0GWr,UC7=V03W%Jkp2lGXG,R%Jkp2lGXG;X6_=X6_+
tVwI_N[Yqc0GWr][UC7]*tN5u
V03W=(V03W-Yqc0GWr)/Jkp2lGXG;R=(R-UC7)/Jkp2lGXG;tN5u=tN5u*Jkp2lGXG end;X6_=X6_+ (V03W+R)*tN5u;return X6_ end;return ifcyuS end
local function UxRGyO9e(WbvvcjER)local rOLxXC=Zdzaj(WbvvcjER,2^1)
local w762p7sZ=glZrOuSo(function(_7jt)return
glZrOuSo(function(ORXyFQ)return rOLxXC(_7jt,ORXyFQ)end)end)
return Zdzaj(w762p7sZ,2^ (WbvvcjER.n or 1))end;local fvj_L={}function fvj_L.tobit(OL1oV)return OL1oV%2^32 end
fvj_L.bxor=UxRGyO9e{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local _CPU89l=fvj_L.bxor;function fvj_L.bnot(QHQvT5)return H-QHQvT5 end
local U=fvj_L.bnot;function fvj_L.band(dN,B35igHj)return
((dN+B35igHj)-_CPU89l(dN,B35igHj))/2 end
local Kwxn=fvj_L.band
function fvj_L.bor(o8pPC2,f7nUIW)return H-Kwxn(H-o8pPC2,H-f7nUIW)end;local yp5DGSwX=fvj_L.bor;local Sb1Mw7R,fuF;function fvj_L.rshift(bDgD,Kg8PhSq)if Kg8PhSq<0 then
return Sb1Mw7R(bDgD,-Kg8PhSq)end
return Kkl6fa(bDgD%2^32/2^Kg8PhSq)end
fuF=fvj_L.rshift
function fvj_L.lshift(Tcv_,lygY)if lygY<0 then return fuF(Tcv_,-lygY)end;return
(Tcv_*2^lygY)%2^32 end;Sb1Mw7R=fvj_L.lshift
function fvj_L.tohex(HG,u)u=u or 8;local m9i;if u<=0 then if u==0 then return''end;m9i=true
u=-u end;HG=Kwxn(HG,16^u-1)return
('%0'..u..
(m9i and'X'or'x')):format(HG)end;local pA2=fvj_L.tohex;function fvj_L.extract(EqPMP,JR,G1Cl6)G1Cl6=G1Cl6 or 1;return
Kwxn(fuF(EqPMP,JR),2^G1Cl6-1)end
local M5lAedm=fvj_L.extract
function fvj_L.replace(h,fYUikw,W9qTCm,YlaSjEKp)YlaSjEKp=YlaSjEKp or 1;local u_ogp8=2^YlaSjEKp-1
fYUikw=Kwxn(fYUikw,u_ogp8)local K=U(Sb1Mw7R(u_ogp8,W9qTCm))return Kwxn(h,K)+
Sb1Mw7R(fYUikw,W9qTCm)end;local _uYRl2kj=fvj_L.replace
function fvj_L.bswap(ob)local a3=Kwxn(ob,0xff)ob=fuF(ob,8)
local MvWxr=Kwxn(ob,0xff)ob=fuF(ob,8)local HgY6=Kwxn(ob,0xff)ob=fuF(ob,8)local Wc=Kwxn(ob,0xff)return
Sb1Mw7R(Sb1Mw7R(
Sb1Mw7R(a3,8)+MvWxr,8)+HgY6,8)+Wc end;local tbN=fvj_L.bswap
function fvj_L.rrotate(eQ5,kvR)kvR=kvR%32;local So=Kwxn(eQ5,2^kvR-1)return
fuF(eQ5,kvR)+Sb1Mw7R(So,32-kvR)end;local x=fvj_L.rrotate;function fvj_L.lrotate(Wi,X1WM)return x(Wi,-X1WM)end
local m=fvj_L.lrotate;fvj_L.rol=fvj_L.lrotate;fvj_L.ror=fvj_L.rrotate
function fvj_L.arshift(OVBAVy,Joa)
local NF0=fuF(OVBAVy,Joa)if OVBAVy>=0x80000000 then
NF0=NF0+Sb1Mw7R(2^Joa-1,32-Joa)end;return NF0 end;local VVQ=fvj_L.arshift
function fvj_L.btest(OeF,sawaLtSr)return Kwxn(OeF,sawaLtSr)~=0 end;fvj_L.bit32={}local function Jb(KWeL)return(-1-KWeL)%t end
fvj_L.bit32.bnot=Jb
local function q(K,rvhod9t,bfx5oN,...)local XDKTNXw
if rvhod9t then K=K%t;rvhod9t=rvhod9t%t;XDKTNXw=_CPU89l(K,rvhod9t)if bfx5oN then
XDKTNXw=q(XDKTNXw,bfx5oN,...)end;return XDKTNXw elseif K then return K%t else return 0 end end;fvj_L.bit32.bxor=q
local function cpea(RyTb,ImqF1v,K,...)local Ru
if ImqF1v then RyTb=RyTb%t;ImqF1v=ImqF1v%t
Ru=(
(RyTb+ImqF1v)-_CPU89l(RyTb,ImqF1v))/2;if K then Ru=cpea(Ru,K,...)end;return Ru elseif RyTb then return RyTb%t else return H end end;fvj_L.bit32.band=cpea
local function tjDBv(Vy5qF,rokDhenZ,td8OL,...)local W
if rokDhenZ then Vy5qF=Vy5qF%t;rokDhenZ=rokDhenZ%t;W=
H-Kwxn(H-Vy5qF,H-rokDhenZ)if td8OL then
W=tjDBv(W,td8OL,...)end;return W elseif Vy5qF then return Vy5qF%t else return 0 end end;fvj_L.bit32.bor=tjDBv
function fvj_L.bit32.btest(...)return cpea(...)~=0 end;function fvj_L.bit32.lrotate(CS,i)return m(CS%t,i)end;function fvj_L.bit32.rrotate(v2VylMn,Oi)return x(
v2VylMn%t,Oi)end;function fvj_L.bit32.lshift(KwcrRu,bgFJ)if
bgFJ>31 or bgFJ<-31 then return 0 end
return Sb1Mw7R(KwcrRu%t,bgFJ)end;function fvj_L.bit32.rshift(fqGD1rfW,K0)if K0 >
31 or K0 <-31 then return 0 end
return fuF(fqGD1rfW%t,K0)end
function fvj_L.bit32.arshift(_1To2,lkzs)_1To2=
_1To2%t
if lkzs>=0 then
if lkzs>31 then return
(_1To2 >=0x80000000)and H or 0 else local Hhwf3oO=fuF(_1To2,lkzs)
if _1To2 >=0x80000000 then Hhwf3oO=Hhwf3oO+Sb1Mw7R(2^
lkzs-1,32-lkzs)end;return Hhwf3oO end else return Sb1Mw7R(_1To2,-lkzs)end end
function fvj_L.bit32.extract(Oh5,LgQF,...)local emGbhJGH=...or 1
if
LgQF<0 or LgQF>31 or emGbhJGH<0 or LgQF+emGbhJGH>32 then error'out of range'end;Oh5=Oh5%t;return M5lAedm(Oh5,LgQF,...)end
function fvj_L.bit32.replace(e_Ev8OQ,zBMvU6,ZmbDgbg,...)local hMxy=...or 1
if
ZmbDgbg<0 or ZmbDgbg>31 or hMxy<0 or ZmbDgbg+hMxy>32 then error'out of range'end;e_Ev8OQ=e_Ev8OQ%t;zBMvU6=zBMvU6%t
return _uYRl2kj(e_Ev8OQ,zBMvU6,ZmbDgbg,...)end;fvj_L.bit={}function fvj_L.bit.tobit(hj3)hj3=hj3%t
if hj3 >=0x80000000 then hj3=hj3-t end;return hj3 end
local vmn7v=fvj_L.bit.tobit
function fvj_L.bit.tohex(M7q3pa8,...)return pA2(M7q3pa8%t,...)end
function fvj_L.bit.bnot(guEhw)return vmn7v(U(guEhw%t))end
local function Au1mzs(sll,BzNBgGvD,KIQCH,...)if KIQCH then return Au1mzs(Au1mzs(sll,BzNBgGvD),KIQCH,...)elseif BzNBgGvD then return vmn7v(yp5DGSwX(
sll%t,BzNBgGvD%t))else
return vmn7v(sll)end end;fvj_L.bit.bor=Au1mzs
local function u39i(L4bw,XhBEPD,Uq,...)if Uq then
return u39i(u39i(L4bw,XhBEPD),Uq,...)elseif XhBEPD then return vmn7v(Kwxn(L4bw%t,XhBEPD%t))else
return vmn7v(L4bw)end end;fvj_L.bit.band=u39i
local function Fdg7p(RmyiI_D,w_2iiJwx,RRESd,...)
if RRESd then return
Fdg7p(Fdg7p(RmyiI_D,w_2iiJwx),RRESd,...)elseif w_2iiJwx then return
vmn7v(_CPU89l(RmyiI_D%t,w_2iiJwx%t))else return vmn7v(RmyiI_D)end end;fvj_L.bit.bxor=Fdg7p;function fvj_L.bit.lshift(S1qoVmFR,f2)return
vmn7v(Sb1Mw7R(S1qoVmFR%t,f2%32))end
function fvj_L.bit.rshift(O3rHR,YU80)return vmn7v(fuF(
O3rHR%t,YU80%32))end
function fvj_L.bit.arshift(ARnO_0E,Qh)return vmn7v(VVQ(ARnO_0E%t,Qh%32))end
function fvj_L.bit.rol(lqxbMC,qOk5Jm)return vmn7v(m(lqxbMC%t,qOk5Jm%32))end;function fvj_L.bit.ror(tpSe2fs,AuVgc7)
return vmn7v(x(tpSe2fs%t,AuVgc7%32))end;function fvj_L.bit.bswap(vxnB)return
vmn7v(tbN(vxnB%t))end
local function GD3AP(ZQOXXXd,cyBmTv)
local _TKd0F=fvj_L.bor(fvj_L.bnot(ZQOXXXd),fvj_L.bnot(cyBmTv))local Z=fvj_L.bor(ZQOXXXd,cyBmTv)
local Dw=fvj_L.band(Z,_TKd0F)return Dw end
local function jph00k(bsFpM,h)check_int(bsFpM)if(bsFpM<0)then
bsFpM=fvj_L.bnot(math.abs(bsFpM))+1 end;for i=1,h do bsFpM=bsFpM/2 end;return
math.floor(bsFpM)end
return
{bnot=fvj_L.bnot,band=fvj_L.band,bor=fvj_L.bor,bxor=Fdg7p,rshift=fvj_L.rshift,lshift=fvj_L.lshift,bxor2=GD3AP,blogic_rshift=jph00k,tobits=to_bits,tonumb=tbl_to_number}end)
gf=Q(function()local doBTofya=bit.bxor;local rNP=bit.lshift;local TL=0x100;local Tzgj_W=0xff;local g0AS39=0x11b;local t2={}
local PDewNmM={}local function GFlD(ZBUghmX,ncK)return doBTofya(ZBUghmX,ncK)end;local function y3owm5E(Deq,GH3wE)return
doBTofya(Deq,GH3wE)end
local function psHOEe2(xZFv)if(xZFv==1)then return 1 end;local bc0w4j=
Tzgj_W-PDewNmM[xZFv]return t2[bc0w4j]end
local function R1zT(OGMxal0,QlewVjkq)if(OGMxal0 ==0 or QlewVjkq==0)then return 0 end;local QyI=
PDewNmM[OGMxal0]+PDewNmM[QlewVjkq]if(QyI>=Tzgj_W)then QyI=
QyI-Tzgj_W end;return t2[QyI]end
local function J2Df(EDE3,FpWG11U)if(EDE3 ==0)then return 0 end
local kRY46C=PDewNmM[EDE3]-PDewNmM[FpWG11U]if(kRY46C<0)then kRY46C=kRY46C+Tzgj_W end
return t2[kRY46C]end;local function YyS()
for i=1,TL do print("log(",i-1,")=",PDewNmM[i-1])end end;local function o()for i=1,TL do
print("exp(",i-1,")=",t2[i-1])end end
local function MY16y()local MvOaiq=1;for i=0,Tzgj_W-1 do
t2[i]=MvOaiq;PDewNmM[MvOaiq]=i
MvOaiq=doBTofya(rNP(MvOaiq,1),MvOaiq)
if MvOaiq>Tzgj_W then MvOaiq=y3owm5E(MvOaiq,g0AS39)end end end;MY16y()
return{add=GFlD,sub=y3owm5E,invert=psHOEe2,mul=R1zT,div=dib,printLog=YyS,printExp=o}end)
bit=Q(function()local DUic_1K=math.floor;local rVj9z4=2^32;local mWkmCx=rVj9z4-1
local function qQpo(U)local uAbuU={}
local EF205E=setmetatable({},uAbuU)
function uAbuU:__index(YFR5myC)local K1Lgio=U(YFR5myC)EF205E[YFR5myC]=K1Lgio;return K1Lgio end;return EF205E end
local function qXKzBXo0(KMu,PPqE)
local function sOE(hf9m_U8,dTQ)local k29Z4,a=0,1
while hf9m_U8 ~=0 and dTQ~=0 do local i,t=hf9m_U8%PPqE,dTQ%PPqE;k29Z4=k29Z4+
KMu[i][t]*a;hf9m_U8=(hf9m_U8-i)/PPqE;dTQ=
(dTQ-t)/PPqE;a=a*PPqE end;k29Z4=k29Z4+ (hf9m_U8+dTQ)*a;return k29Z4 end;return sOE end
local function cJ(TmE)local xR=qXKzBXo0(TmE,2^1)
local LJ3E=qQpo(function(Vjx)return
qQpo(function(curjMDD)return xR(Vjx,curjMDD)end)end)return qXKzBXo0(LJ3E,2^ (TmE.n or 1))end;local HI4G3oH={}function HI4G3oH.tobit(gBS9Zk)return gBS9Zk%2^32 end
HI4G3oH.bxor=cJ{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local ncWw=HI4G3oH.bxor;function HI4G3oH.bnot(Xr)return mWkmCx-Xr end
local kdS=HI4G3oH.bnot;function HI4G3oH.band(UPp,hWpZC)return
((UPp+hWpZC)-ncWw(UPp,hWpZC))/2 end
local OS60=HI4G3oH.band;function HI4G3oH.bor(bFF8,RXM)
return mWkmCx-OS60(mWkmCx-bFF8,mWkmCx-RXM)end;local dl=HI4G3oH.bor;local b2UK,FC0yhp;function HI4G3oH.rshift(Ieb1cGC,Bf)if
Bf<0 then return b2UK(Ieb1cGC,-Bf)end;return
DUic_1K(Ieb1cGC%2^32/2^Bf)end
FC0yhp=HI4G3oH.rshift
function HI4G3oH.lshift(hKJi2,jW)if jW<0 then return FC0yhp(hKJi2,-jW)end;return
(hKJi2*2^jW)%2^32 end;b2UK=HI4G3oH.lshift
function HI4G3oH.tohex(JkVK,oXM7)oXM7=oXM7 or 8;local z__Va;if oXM7 <=0 then
if oXM7 ==0 then return''end;z__Va=true;oXM7=-oXM7 end
JkVK=OS60(JkVK,16^oXM7-1)return
('%0'..oXM7 .. (z__Va and'X'or'x')):format(JkVK)end;local lL30T=HI4G3oH.tohex
function HI4G3oH.extract(uGbp,OXK0,Ek3QueoD)Ek3QueoD=Ek3QueoD or 1;return OS60(FC0yhp(uGbp,OXK0),
2^Ek3QueoD-1)end;local zt=HI4G3oH.extract
function HI4G3oH.replace(g,m_l,LXmcB,l5Nd)l5Nd=l5Nd or 1;local sEMv=2^l5Nd-1
m_l=OS60(m_l,sEMv)local VPX=kdS(b2UK(sEMv,LXmcB))return
OS60(g,VPX)+b2UK(m_l,LXmcB)end;local Ofgm3g=HI4G3oH.replace
function HI4G3oH.bswap(c)local VGJdue=OS60(c,0xff)c=FC0yhp(c,8)
local ztMtdy=OS60(c,0xff)c=FC0yhp(c,8)local rA=OS60(c,0xff)c=FC0yhp(c,8)
local zHapMi=OS60(c,0xff)return
b2UK(b2UK(b2UK(VGJdue,8)+ztMtdy,8)+rA,8)+zHapMi end;local z6WE21dc=HI4G3oH.bswap;function HI4G3oH.rrotate(Jmsve1Q,_B8W1YL)_B8W1YL=_B8W1YL%32
local F=OS60(Jmsve1Q,2^_B8W1YL-1)
return FC0yhp(Jmsve1Q,_B8W1YL)+b2UK(F,32-_B8W1YL)end
local rJg9H=HI4G3oH.rrotate
function HI4G3oH.lrotate(FN7,cpNryuPy)return rJg9H(FN7,-cpNryuPy)end;local sNyznm3W=HI4G3oH.lrotate;HI4G3oH.rol=HI4G3oH.lrotate
HI4G3oH.ror=HI4G3oH.rrotate
function HI4G3oH.arshift(mVKRd8,TBV0052)local cGBeq=FC0yhp(mVKRd8,TBV0052)
if mVKRd8 >=0x80000000 then cGBeq=cGBeq+b2UK(2^
TBV0052-1,32-TBV0052)end;return cGBeq end;local UU=HI4G3oH.arshift
function HI4G3oH.btest(PRXb,t)return OS60(PRXb,t)~=0 end;HI4G3oH.bit32={}
local function YBciOAz2(Jk3TbYo)return(-1-Jk3TbYo)%rVj9z4 end;HI4G3oH.bit32.bnot=YBciOAz2
local function wJvNH(Nm61D3Il,Qjx7nk,ZfqIP,...)local p4ZD2RW
if Qjx7nk then
Nm61D3Il=Nm61D3Il%rVj9z4;Qjx7nk=Qjx7nk%rVj9z4;p4ZD2RW=ncWw(Nm61D3Il,Qjx7nk)if ZfqIP then
p4ZD2RW=wJvNH(p4ZD2RW,ZfqIP,...)end;return p4ZD2RW elseif Nm61D3Il then return Nm61D3Il%rVj9z4 else return 0 end end;HI4G3oH.bit32.bxor=wJvNH
local function dOvZoN(o,QK5cr,e575,...)local OP
if QK5cr then o=o%rVj9z4
QK5cr=QK5cr%rVj9z4
OP=((o+QK5cr)-ncWw(o,QK5cr))/2;if e575 then OP=dOvZoN(OP,e575,...)end;return OP elseif o then return o%rVj9z4 else
return mWkmCx end end;HI4G3oH.bit32.band=dOvZoN
local function IP01vP(HxUqj4B,dryo7a,Vvmt,...)local z1jKKH
if dryo7a then HxUqj4B=HxUqj4B%rVj9z4;dryo7a=
dryo7a%rVj9z4
z1jKKH=mWkmCx-OS60(mWkmCx-HxUqj4B,mWkmCx-dryo7a)if Vvmt then z1jKKH=IP01vP(z1jKKH,Vvmt,...)end;return z1jKKH elseif
HxUqj4B then return HxUqj4B%rVj9z4 else return 0 end end;HI4G3oH.bit32.bor=IP01vP;function HI4G3oH.bit32.btest(...)
return dOvZoN(...)~=0 end;function HI4G3oH.bit32.lrotate(A,i)
return sNyznm3W(A%rVj9z4,i)end;function HI4G3oH.bit32.rrotate(_ASR7X,lneZ2)return
rJg9H(_ASR7X%rVj9z4,lneZ2)end;function HI4G3oH.bit32.lshift(wZLxwQr,Z)if
Z>31 or Z<-31 then return 0 end
return b2UK(wZLxwQr%rVj9z4,Z)end;function HI4G3oH.bit32.rshift(b3h1,AGn)if AGn>
31 or AGn<-31 then return 0 end
return FC0yhp(b3h1%rVj9z4,AGn)end
function HI4G3oH.bit32.arshift(EQVz,pYXX)EQVz=
EQVz%rVj9z4
if pYXX>=0 then
if pYXX>31 then return
(EQVz>=0x80000000)and mWkmCx or 0 else local GvHSsw=FC0yhp(EQVz,pYXX)
if EQVz>=0x80000000 then GvHSsw=GvHSsw+b2UK(2^
pYXX-1,32-pYXX)end;return GvHSsw end else return b2UK(EQVz,-pYXX)end end
function HI4G3oH.bit32.extract(XvK5,bK2,...)local U=...or 1;if bK2 <0 or bK2 >31 or U<0 or
bK2+U>32 then error'out of range'end;XvK5=
XvK5%rVj9z4;return zt(XvK5,bK2,...)end
function HI4G3oH.bit32.replace(FVkHUl7,FOA,eF0tAUG,...)local _x=...or 1
if
eF0tAUG<0 or eF0tAUG>31 or _x<0 or eF0tAUG+_x>32 then error'out of range'end;FVkHUl7=FVkHUl7%rVj9z4;FOA=FOA%rVj9z4
return Ofgm3g(FVkHUl7,FOA,eF0tAUG,...)end;HI4G3oH.bit={}
function HI4G3oH.bit.tobit(J2o6d)J2o6d=J2o6d%rVj9z4;if J2o6d>=0x80000000 then J2o6d=
J2o6d-rVj9z4 end;return J2o6d end;local DIoX3=HI4G3oH.bit.tobit;function HI4G3oH.bit.tohex(r,...)
return lL30T(r%rVj9z4,...)end;function HI4G3oH.bit.bnot(PKiW0)return
DIoX3(kdS(PKiW0%rVj9z4))end
local function sjXYan(odc5tp,t3yD,_nofE2,...)
if _nofE2 then return
sjXYan(sjXYan(odc5tp,t3yD),_nofE2,...)elseif t3yD then return
DIoX3(dl(odc5tp%rVj9z4,t3yD%rVj9z4))else return DIoX3(odc5tp)end end;HI4G3oH.bit.bor=sjXYan
local function KxB8fW(kPOaEej,XrKR,EZSc2rAA,...)
if EZSc2rAA then return
KxB8fW(KxB8fW(kPOaEej,XrKR),EZSc2rAA,...)elseif XrKR then return
DIoX3(OS60(kPOaEej%rVj9z4,XrKR%rVj9z4))else return DIoX3(kPOaEej)end end;HI4G3oH.bit.band=KxB8fW
local function M(r0aOmY,YzL3P1,a2,...)
if a2 then
return M(M(r0aOmY,YzL3P1),a2,...)elseif YzL3P1 then
return DIoX3(ncWw(r0aOmY%rVj9z4,YzL3P1%rVj9z4))else return DIoX3(r0aOmY)end end;HI4G3oH.bit.bxor=M;function HI4G3oH.bit.lshift(hrEWj,Qgeq)return
DIoX3(b2UK(hrEWj%rVj9z4,Qgeq%32))end
function HI4G3oH.bit.rshift(ay_Dm,z8K0j)return DIoX3(FC0yhp(
ay_Dm%rVj9z4,z8K0j%32))end
function HI4G3oH.bit.arshift(yh,Yo)return DIoX3(UU(yh%rVj9z4,Yo%32))end;function HI4G3oH.bit.rol(nkWKbF,M9)
return DIoX3(sNyznm3W(nkWKbF%rVj9z4,M9%32))end;function HI4G3oH.bit.ror(cVvE,R8)return
DIoX3(rJg9H(cVvE%rVj9z4,R8%32))end
function HI4G3oH.bit.bswap(CsDz)return DIoX3(z6WE21dc(
CsDz%rVj9z4))end
local function JmyAd(u,Ru8E)
local nK=HI4G3oH.bor(HI4G3oH.bnot(u),HI4G3oH.bnot(Ru8E))local m5STS=HI4G3oH.bor(u,Ru8E)
local CJ4gk6Xx=HI4G3oH.band(m5STS,nK)return CJ4gk6Xx end
local function L(WwPLCA3t,YAwrq)check_int(WwPLCA3t)if(WwPLCA3t<0)then WwPLCA3t=
HI4G3oH.bnot(math.abs(WwPLCA3t))+1 end;for i=1,YAwrq
do WwPLCA3t=WwPLCA3t/2 end
return math.floor(WwPLCA3t)end
return
{bnot=HI4G3oH.bnot,band=HI4G3oH.band,bor=HI4G3oH.bor,bxor=M,rshift=HI4G3oH.rshift,lshift=HI4G3oH.lshift,bxor2=JmyAd,blogic_rshift=L,tobits=to_bits,tonumb=tbl_to_number}end)
aes=Q(function()local VHZ4I=util.putByte;local JTS=util.getByte;local zRbXf='rounds'local caDLM="type"local Pj=1
local xm=2;local we={}local uv={}local eu={}local j7Zsjoj={}local VDXpXH={}local NT23H={}local N8WCvTtk={}local vk7={}local aaOq={}
local F7JMSq_H={}
local BNZ09E={0x01000000,0x02000000,0x04000000,0x08000000,0x10000000,0x20000000,0x40000000,0x80000000,0x1b000000,0x36000000,0x6c000000,0xd8000000,0xab000000,0x4d000000,0x9a000000,0x2f000000}
local function mcJGlQD6(XRg)mask=0xf8;result=0
for i=1,8 do result=bit.lshift(result,1)
parity=util.byteParity(bit.band(XRg,mask))result=result+parity;lastbit=bit.band(mask,1)
mask=bit.band(bit.rshift(mask,1),0xff)if(lastbit~=0)then mask=bit.bor(mask,0x80)else
mask=bit.band(mask,0x7f)end end;return bit.bxor(result,0x63)end;local function AcM1nG()
for i=0,255 do if(i~=0)then inverse=gf.invert(i)else inverse=i end
mapped=mcJGlQD6(inverse)we[i]=mapped;uv[mapped]=i end end
local function mMJQWw()
for x=0,255
do byte=we[x]
eu[x]=
VHZ4I(gf.mul(0x03,byte),0)+VHZ4I(byte,1)+VHZ4I(byte,2)+VHZ4I(gf.mul(0x02,byte),3)
j7Zsjoj[x]=VHZ4I(byte,0)+VHZ4I(byte,1)+
VHZ4I(gf.mul(0x02,byte),2)+VHZ4I(gf.mul(0x03,byte),3)
VDXpXH[x]=VHZ4I(byte,0)+VHZ4I(gf.mul(0x02,byte),1)+
VHZ4I(gf.mul(0x03,byte),2)+VHZ4I(byte,3)
NT23H[x]=
VHZ4I(gf.mul(0x02,byte),0)+VHZ4I(gf.mul(0x03,byte),1)+VHZ4I(byte,2)+VHZ4I(byte,3)end end
local function sC()
for x=0,255 do byte=uv[x]
N8WCvTtk[x]=
VHZ4I(gf.mul(0x0b,byte),0)+
VHZ4I(gf.mul(0x0d,byte),1)+VHZ4I(gf.mul(0x09,byte),2)+VHZ4I(gf.mul(0x0e,byte),3)
vk7[x]=
VHZ4I(gf.mul(0x0d,byte),0)+VHZ4I(gf.mul(0x09,byte),1)+VHZ4I(gf.mul(0x0e,byte),2)+
VHZ4I(gf.mul(0x0b,byte),3)
aaOq[x]=
VHZ4I(gf.mul(0x09,byte),0)+VHZ4I(gf.mul(0x0e,byte),1)+VHZ4I(gf.mul(0x0b,byte),2)+
VHZ4I(gf.mul(0x0d,byte),3)
F7JMSq_H[x]=
VHZ4I(gf.mul(0x0e,byte),0)+VHZ4I(gf.mul(0x0b,byte),1)+VHZ4I(gf.mul(0x0d,byte),2)+
VHZ4I(gf.mul(0x09,byte),3)end end
local function RE(Q7c8C2T)local Gz=bit.band(Q7c8C2T,0xff000000)return(bit.lshift(Q7c8C2T,8)+
bit.rshift(Gz,24))end;local function mPRxk(XfMQy)
return
VHZ4I(we[JTS(XfMQy,0)],0)+VHZ4I(we[JTS(XfMQy,1)],1)+VHZ4I(we[JTS(XfMQy,2)],2)+
VHZ4I(we[JTS(XfMQy,3)],3)end
local function iVO(mu_2r)
local Es={}local c=math.floor(#mu_2r/4)if(
(c~=4 and c~=6 and c~=8)or(c*4 ~=#mu_2r))then
print("Invalid key size: ",c)return nil end;Es[zRbXf]=c+6
Es[caDLM]=Pj;for i=0,c-1 do
Es[i]=
VHZ4I(mu_2r[i*4+1],3)+VHZ4I(mu_2r[i*4+2],2)+VHZ4I(mu_2r[i*4+3],1)+
VHZ4I(mu_2r[i*4+4],0)end
for i=c,
(Es[zRbXf]+1)*4-1 do local C=Es[i-1]if(i%c==0)then C=RE(C)C=mPRxk(C)
local o0Xe6nHM=math.floor(i/c)C=bit.bxor(C,BNZ09E[o0Xe6nHM])elseif(c>6 and i%c==4)then
C=mPRxk(C)end;Es[i]=bit.bxor(Es[(
i-c)],C)end;return Es end
local function S5PgiAbz(ulAVnjc)local zF6Bw=JTS(ulAVnjc,3)local zuKqH=JTS(ulAVnjc,2)
local litdqp=JTS(ulAVnjc,1)local r=JTS(ulAVnjc,0)
return



VHZ4I(gf.add(gf.add(gf.add(gf.mul(0x0b,zuKqH),gf.mul(0x0d,litdqp)),gf.mul(0x09,r)),gf.mul(0x0e,zF6Bw)),3)+
VHZ4I(gf.add(gf.add(gf.add(gf.mul(0x0b,litdqp),gf.mul(0x0d,r)),gf.mul(0x09,zF6Bw)),gf.mul(0x0e,zuKqH)),2)+
VHZ4I(gf.add(gf.add(gf.add(gf.mul(0x0b,r),gf.mul(0x0d,zF6Bw)),gf.mul(0x09,zuKqH)),gf.mul(0x0e,litdqp)),1)+
VHZ4I(gf.add(gf.add(gf.add(gf.mul(0x0b,zF6Bw),gf.mul(0x0d,zuKqH)),gf.mul(0x09,litdqp)),gf.mul(0x0e,r)),0)end
local function jj1oYjc(n)local uSzWLeSi=JTS(n,3)local phUBXWJ9=JTS(n,2)local Qgtt7=JTS(n,1)local yTthTeWK=JTS(n,0)
local pG=bit.bxor(yTthTeWK,Qgtt7)local um_kO=bit.bxor(phUBXWJ9,uSzWLeSi)
local ngCGBaF=bit.bxor(pG,um_kO)ngCGBaF=bit.bxor(ngCGBaF,gf.mul(0x08,ngCGBaF))
w=bit.bxor(ngCGBaF,gf.mul(0x04,bit.bxor(Qgtt7,uSzWLeSi)))
ngCGBaF=bit.bxor(ngCGBaF,gf.mul(0x04,bit.bxor(yTthTeWK,phUBXWJ9)))
return


VHZ4I(bit.bxor(bit.bxor(yTthTeWK,ngCGBaF),gf.mul(0x02,bit.bxor(uSzWLeSi,yTthTeWK))),0)+
VHZ4I(bit.bxor(bit.bxor(Qgtt7,w),gf.mul(0x02,pG)),1)+
VHZ4I(bit.bxor(bit.bxor(phUBXWJ9,ngCGBaF),gf.mul(0x02,bit.bxor(uSzWLeSi,yTthTeWK))),2)+
VHZ4I(bit.bxor(bit.bxor(uSzWLeSi,w),gf.mul(0x02,um_kO)),3)end
local function YVjxMh(A8TTTd8)local yGa=iVO(A8TTTd8)if(yGa==nil)then return nil end;yGa[caDLM]=xm
for i=4,(
yGa[zRbXf]+1)*4-5 do yGa[i]=S5PgiAbz(yGa[i])end;return yGa end
local function sERpty(j4bdRB6o,f8jh,OLzzUp)for i=0,3 do
j4bdRB6o[i]=bit.bxor(j4bdRB6o[i],f8jh[OLzzUp*4+i])end end
local function R9WhkbR(VlN,r)
r[0]=bit.bxor(bit.bxor(bit.bxor(eu[JTS(VlN[0],3)],j7Zsjoj[JTS(VlN[1],2)]),VDXpXH[JTS(VlN[2],1)]),NT23H[JTS(VlN[3],0)])
r[1]=bit.bxor(bit.bxor(bit.bxor(eu[JTS(VlN[1],3)],j7Zsjoj[JTS(VlN[2],2)]),VDXpXH[JTS(VlN[3],1)]),NT23H[JTS(VlN[0],0)])
r[2]=bit.bxor(bit.bxor(bit.bxor(eu[JTS(VlN[2],3)],j7Zsjoj[JTS(VlN[3],2)]),VDXpXH[JTS(VlN[0],1)]),NT23H[JTS(VlN[1],0)])
r[3]=bit.bxor(bit.bxor(bit.bxor(eu[JTS(VlN[3],3)],j7Zsjoj[JTS(VlN[0],2)]),VDXpXH[JTS(VlN[1],1)]),NT23H[JTS(VlN[2],0)])end
local function Wjj(mhEYg,rUJN6)
rUJN6[0]=
VHZ4I(we[JTS(mhEYg[0],3)],3)+
VHZ4I(we[JTS(mhEYg[1],2)],2)+VHZ4I(we[JTS(mhEYg[2],1)],1)+VHZ4I(we[JTS(mhEYg[3],0)],0)
rUJN6[1]=
VHZ4I(we[JTS(mhEYg[1],3)],3)+
VHZ4I(we[JTS(mhEYg[2],2)],2)+VHZ4I(we[JTS(mhEYg[3],1)],1)+VHZ4I(we[JTS(mhEYg[0],0)],0)
rUJN6[2]=
VHZ4I(we[JTS(mhEYg[2],3)],3)+
VHZ4I(we[JTS(mhEYg[3],2)],2)+VHZ4I(we[JTS(mhEYg[0],1)],1)+VHZ4I(we[JTS(mhEYg[1],0)],0)
rUJN6[3]=
VHZ4I(we[JTS(mhEYg[3],3)],3)+
VHZ4I(we[JTS(mhEYg[0],2)],2)+VHZ4I(we[JTS(mhEYg[1],1)],1)+VHZ4I(we[JTS(mhEYg[2],0)],0)end
local function X9n9mro(cYH30J,VR)
VR[0]=bit.bxor(bit.bxor(bit.bxor(N8WCvTtk[JTS(cYH30J[0],3)],vk7[JTS(cYH30J[3],2)]),aaOq[JTS(cYH30J[2],1)]),F7JMSq_H[JTS(cYH30J[1],0)])
VR[1]=bit.bxor(bit.bxor(bit.bxor(N8WCvTtk[JTS(cYH30J[1],3)],vk7[JTS(cYH30J[0],2)]),aaOq[JTS(cYH30J[3],1)]),F7JMSq_H[JTS(cYH30J[2],0)])
VR[2]=bit.bxor(bit.bxor(bit.bxor(N8WCvTtk[JTS(cYH30J[2],3)],vk7[JTS(cYH30J[1],2)]),aaOq[JTS(cYH30J[0],1)]),F7JMSq_H[JTS(cYH30J[3],0)])
VR[3]=bit.bxor(bit.bxor(bit.bxor(N8WCvTtk[JTS(cYH30J[3],3)],vk7[JTS(cYH30J[2],2)]),aaOq[JTS(cYH30J[1],1)]),F7JMSq_H[JTS(cYH30J[0],0)])end
local function Uj6hK(pyzkzd,ksDuO71)
ksDuO71[0]=VHZ4I(uv[JTS(pyzkzd[0],3)],3)+
VHZ4I(uv[JTS(pyzkzd[3],2)],2)+
VHZ4I(uv[JTS(pyzkzd[2],1)],1)+
VHZ4I(uv[JTS(pyzkzd[1],0)],0)
ksDuO71[1]=VHZ4I(uv[JTS(pyzkzd[1],3)],3)+
VHZ4I(uv[JTS(pyzkzd[0],2)],2)+
VHZ4I(uv[JTS(pyzkzd[3],1)],1)+
VHZ4I(uv[JTS(pyzkzd[2],0)],0)
ksDuO71[2]=VHZ4I(uv[JTS(pyzkzd[2],3)],3)+
VHZ4I(uv[JTS(pyzkzd[1],2)],2)+
VHZ4I(uv[JTS(pyzkzd[0],1)],1)+
VHZ4I(uv[JTS(pyzkzd[3],0)],0)
ksDuO71[3]=VHZ4I(uv[JTS(pyzkzd[3],3)],3)+
VHZ4I(uv[JTS(pyzkzd[2],2)],2)+
VHZ4I(uv[JTS(pyzkzd[1],1)],1)+
VHZ4I(uv[JTS(pyzkzd[0],0)],0)end
local function qk3r(BAy,tTCbo2,p,UNyk,cG0)p=p or 1;UNyk=UNyk or{}cG0=cG0 or 1;local kzTZ7={}local f8SnhE4T={}
if
(BAy[caDLM]~=Pj)then print("No encryption key: ",BAy[caDLM])return end;kzTZ7=util.bytesToInts(tTCbo2,p,4)sERpty(kzTZ7,BAy,0)
local aascxP=1
while(aascxP<BAy[zRbXf]-1)do R9WhkbR(kzTZ7,f8SnhE4T)
sERpty(f8SnhE4T,BAy,aascxP)aascxP=aascxP+1;R9WhkbR(f8SnhE4T,kzTZ7)
sERpty(kzTZ7,BAy,aascxP)aascxP=aascxP+1 end;R9WhkbR(kzTZ7,f8SnhE4T)sERpty(f8SnhE4T,BAy,aascxP)aascxP=
aascxP+1;Wjj(f8SnhE4T,kzTZ7)sERpty(kzTZ7,BAy,aascxP)return
util.intsToBytes(kzTZ7,UNyk,cG0)end
local function Otbx_3g(eSG8f8ru,w2yJAi,lH1c,CHS,fQdTWIXs)lH1c=lH1c or 1;CHS=CHS or{}fQdTWIXs=fQdTWIXs or 1;local QG={}local d78={}if(
eSG8f8ru[caDLM]~=xm)then
print("No decryption key: ",eSG8f8ru[caDLM])return end
QG=util.bytesToInts(w2yJAi,lH1c,4)sERpty(QG,eSG8f8ru,eSG8f8ru[zRbXf])
local C6pS=eSG8f8ru[zRbXf]-1
while(C6pS>2)do X9n9mro(QG,d78)sERpty(d78,eSG8f8ru,C6pS)
C6pS=C6pS-1;X9n9mro(d78,QG)sERpty(QG,eSG8f8ru,C6pS)C6pS=C6pS-1 end;X9n9mro(QG,d78)sERpty(d78,eSG8f8ru,C6pS)C6pS=C6pS-1
Uj6hK(d78,QG)sERpty(QG,eSG8f8ru,C6pS)
return util.intsToBytes(QG,CHS,fQdTWIXs)end;AcM1nG()mMJQWw()sC()
return
{ROUNDS=zRbXf,KEY_TYPE=caDLM,ENCRYPTION_KEY=Pj,DECRYPTION_KEY=xm,expandEncryptionKey=iVO,expandDecryptionKey=YVjxMh,encrypt=qk3r,decrypt=Otbx_3g}end)
buffer=Q(function()local function GwH()return{}end
local function O(Rrfir0,lXr)table.insert(Rrfir0,lXr)
for i=#Rrfir0-1,1,-1 do if#
Rrfir0[i]>#Rrfir0[i+1]then break end;Rrfir0[i]=Rrfir0[i]..
table.remove(Rrfir0)end end;local function sbuS4(hz)
for i=#hz-1,1,-1 do hz[i]=hz[i]..table.remove(hz)end;return hz[1]end;return
{new=GwH,addString=O,toString=sbuS4}end)
ciphermode=Q(function()local f={}
function f.encryptString(knCGg,UPf,amxXn)
local CSwsYPyj=iv or{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}local I9I=aes.expandEncryptionKey(knCGg)local aB=buffer.new()
for i=1,
#UPf/16 do local BiUZ8vx4=(i-1)*16+1
local v={string.byte(UPf,BiUZ8vx4,BiUZ8vx4+15)}amxXn(I9I,v,CSwsYPyj)
buffer.addString(aB,string.char(unpack(v)))end;return buffer.toString(aB)end
function f.encryptECB(W8dN,eL,U4G6f)aes.encrypt(W8dN,eL,1,eL,1)end
function f.encryptCBC(gmhVDH,a,NesXI)util.xorIV(a,NesXI)aes.encrypt(gmhVDH,a,1,a,1)for j=1,16
do NesXI[j]=a[j]end end
function f.encryptOFB(OZ8oHL,sa,hT)aes.encrypt(OZ8oHL,hT,1,hT,1)util.xorIV(sa,hT)end
function f.encryptCFB(zICb5,HB_RPF,kJZlA)aes.encrypt(zICb5,kJZlA,1,kJZlA,1)
util.xorIV(HB_RPF,kJZlA)for j=1,16 do kJZlA[j]=HB_RPF[j]end end
function f.decryptString(blNC,l,y9)
local z=iv or{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}local MjtdB7KS;if
(y9 ==f.decryptOFB or y9 ==f.decryptCFB)then MjtdB7KS=aes.expandEncryptionKey(blNC)else
MjtdB7KS=aes.expandDecryptionKey(blNC)end
local _M_Cmn9C=buffer.new()
for i=1,#l/16 do local GZQBW7r7=(i-1)*16+1
local VHBi5G={string.byte(l,GZQBW7r7,GZQBW7r7+15)}z=y9(MjtdB7KS,VHBi5G,z)
buffer.addString(_M_Cmn9C,string.char(unpack(VHBi5G)))end;return buffer.toString(_M_Cmn9C)end
function f.decryptECB(Z1D6NL,XAy,zxyLTb)aes.decrypt(Z1D6NL,XAy,1,XAy,1)return zxyLTb end
function f.decryptCBC(rhMWaiC,pM,i)local k={}for j=1,16 do k[j]=pM[j]end
aes.decrypt(rhMWaiC,pM,1,pM,1)util.xorIV(pM,i)return k end;function f.decryptOFB(hr,M,Ucy5ca)aes.encrypt(hr,Ucy5ca,1,Ucy5ca,1)
util.xorIV(M,Ucy5ca)return Ucy5ca end
function f.decryptCFB(ycyK,Yfm6hogh,T6eti)
local z7j={}for j=1,16 do z7j[j]=Yfm6hogh[j]end
aes.encrypt(ycyK,T6eti,1,T6eti,1)util.xorIV(Yfm6hogh,T6eti)return z7j end;return f end)
bit=Q(function()local CGz=math.floor;local aukN3ZWX=2^32;local eSCsri5=aukN3ZWX-1
local function _g10f_(m7YIn)local tYqOsEJ={}
local udoq=setmetatable({},tYqOsEJ)
function tYqOsEJ:__index(boTHtaG)local zbQgT=m7YIn(boTHtaG)udoq[boTHtaG]=zbQgT;return zbQgT end;return udoq end
local function r4cyFP(duYPlVu,n5)
local function zl5hfbAb(xVvJF,zsKRyBU)local Lukg,rkKj=0,1
while xVvJF~=0 and zsKRyBU~=0 do local yAaxRZGY,_Tb=xVvJF%n5,zsKRyBU%n5
Lukg=
Lukg+duYPlVu[yAaxRZGY][_Tb]*rkKj;xVvJF=(xVvJF-yAaxRZGY)/n5
zsKRyBU=(zsKRyBU-_Tb)/n5;rkKj=rkKj*n5 end;Lukg=Lukg+ (xVvJF+zsKRyBU)*rkKj;return Lukg end;return zl5hfbAb end
local function fcSy4_k0(BJRFwSz)local C3MNkiZ=r4cyFP(BJRFwSz,2^1)
local beAAh6T=_g10f_(function(yUaD)return
_g10f_(function(Enu)return C3MNkiZ(yUaD,Enu)end)end)
return r4cyFP(beAAh6T,2^ (BJRFwSz.n or 1))end;local TrC17={}function TrC17.tobit(YJ31A6_)return YJ31A6_%2^32 end
TrC17.bxor=fcSy4_k0{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local MEwJPiqM=TrC17.bxor;function TrC17.bnot(fChy5)return eSCsri5-fChy5 end
local jHIxW_=TrC17.bnot
function TrC17.band(DNPo4Wqt,S8Kb)return
((DNPo4Wqt+S8Kb)-MEwJPiqM(DNPo4Wqt,S8Kb))/2 end;local gny=TrC17.band;function TrC17.bor(UMeQ,AGhdl3)return
eSCsri5-gny(eSCsri5-UMeQ,eSCsri5-AGhdl3)end
local KabKdEUu=TrC17.bor;local oQ8AOvfn,m
function TrC17.rshift(P32,xj1)if xj1 <0 then return oQ8AOvfn(P32,-xj1)end;return CGz(
P32%2^32/2^xj1)end;m=TrC17.rshift;function TrC17.lshift(rd,wtX)if wtX<0 then return m(rd,-wtX)end;return
(rd*2^wtX)%2^32 end
oQ8AOvfn=TrC17.lshift
function TrC17.tohex(Y,EHSv)EHSv=EHSv or 8;local Ati7Oq;if EHSv<=0 then if EHSv==0 then return''end;Ati7Oq=true
EHSv=-EHSv end;Y=gny(Y,16^EHSv-1)return
('%0'..EHSv.. (
Ati7Oq and'X'or'x')):format(Y)end;local cX88nonB=TrC17.tohex;function TrC17.extract(Tqo2jko,uJz,qVvlt)qVvlt=qVvlt or 1;return
gny(m(Tqo2jko,uJz),2^qVvlt-1)end
local kkWQP4=TrC17.extract
function TrC17.replace(aGkESg,KXnNMI7S,fL,Oj)Oj=Oj or 1;local pGR0Ig=2^Oj-1;KXnNMI7S=gny(KXnNMI7S,pGR0Ig)
local bBq=jHIxW_(oQ8AOvfn(pGR0Ig,fL))return gny(aGkESg,bBq)+oQ8AOvfn(KXnNMI7S,fL)end;local E4F=TrC17.replace
function TrC17.bswap(i)local yCkt=gny(i,0xff)i=m(i,8)
local irs579=gny(i,0xff)i=m(i,8)local ptD=gny(i,0xff)i=m(i,8)local mj_P=gny(i,0xff)return
oQ8AOvfn(oQ8AOvfn(
oQ8AOvfn(yCkt,8)+irs579,8)+ptD,8)+mj_P end;local E=TrC17.bswap
function TrC17.rrotate(w,Nge6L)Nge6L=Nge6L%32
local aWnFL1=gny(w,2^Nge6L-1)return m(w,Nge6L)+oQ8AOvfn(aWnFL1,32-Nge6L)end;local IGef7Hc5=TrC17.rrotate
function TrC17.lrotate(D,R)return IGef7Hc5(D,-R)end;local RY1=TrC17.lrotate;TrC17.rol=TrC17.lrotate
TrC17.ror=TrC17.rrotate
function TrC17.arshift(u51,O0NUxa)local RngfRQ6g=m(u51,O0NUxa)
if u51 >=0x80000000 then RngfRQ6g=RngfRQ6g+oQ8AOvfn(2^O0NUxa-1,32-
O0NUxa)end;return RngfRQ6g end;local bkV=TrC17.arshift
function TrC17.btest(F,WSlpP)return gny(F,WSlpP)~=0 end;TrC17.bit32={}
local function VOG(xSMd)return(-1-xSMd)%aukN3ZWX end;TrC17.bit32.bnot=VOG
local function r8MEhbdT(vYmD9ed,Cez,NvSMm,...)local wRpQf
if Cez then vYmD9ed=vYmD9ed%aukN3ZWX
Cez=Cez%aukN3ZWX;wRpQf=MEwJPiqM(vYmD9ed,Cez)if NvSMm then
wRpQf=r8MEhbdT(wRpQf,NvSMm,...)end;return wRpQf elseif vYmD9ed then return vYmD9ed%aukN3ZWX else return 0 end end;TrC17.bit32.bxor=r8MEhbdT
local function klSf0ZT5(ed9P,NJ5,bpAJ,...)local UdPyHc
if NJ5 then ed9P=ed9P%aukN3ZWX
NJ5=NJ5%aukN3ZWX
UdPyHc=((ed9P+NJ5)-MEwJPiqM(ed9P,NJ5))/2;if bpAJ then UdPyHc=klSf0ZT5(UdPyHc,bpAJ,...)end
return UdPyHc elseif ed9P then return ed9P%aukN3ZWX else return eSCsri5 end end;TrC17.bit32.band=klSf0ZT5
local function t85a4rt(SciVUxEq,Te,WN,...)local f
if Te then SciVUxEq=SciVUxEq%aukN3ZWX;Te=Te%
aukN3ZWX
f=eSCsri5-gny(eSCsri5-SciVUxEq,eSCsri5-Te)if WN then f=t85a4rt(f,WN,...)end;return f elseif SciVUxEq then
return SciVUxEq%aukN3ZWX else return 0 end end;TrC17.bit32.bor=t85a4rt;function TrC17.bit32.btest(...)
return klSf0ZT5(...)~=0 end;function TrC17.bit32.lrotate(FleDs3,LP)return
RY1(FleDs3%aukN3ZWX,LP)end
function TrC17.bit32.rrotate(RLovoVo,Je6Srpf8)return IGef7Hc5(
RLovoVo%aukN3ZWX,Je6Srpf8)end
function TrC17.bit32.lshift(p,Z0RFr5F)
if Z0RFr5F>31 or Z0RFr5F<-31 then return 0 end;return oQ8AOvfn(p%aukN3ZWX,Z0RFr5F)end;function TrC17.bit32.rshift(_Myb,Zq)if Zq>31 or Zq<-31 then return 0 end;return
m(_Myb%aukN3ZWX,Zq)end
function TrC17.bit32.arshift(TKS,DUSiwPZm)TKS=
TKS%aukN3ZWX
if DUSiwPZm>=0 then
if DUSiwPZm>31 then return
(TKS>=0x80000000)and eSCsri5 or 0 else local QSjpjN5=m(TKS,DUSiwPZm)if
TKS>=0x80000000 then
QSjpjN5=QSjpjN5+oQ8AOvfn(2^DUSiwPZm-1,32-DUSiwPZm)end;return QSjpjN5 end else return oQ8AOvfn(TKS,-DUSiwPZm)end end
function TrC17.bit32.extract(M3ptD1Cf,B,...)local jv=...or 1;if
B<0 or B>31 or jv<0 or B+jv>32 then error'out of range'end
M3ptD1Cf=M3ptD1Cf%aukN3ZWX;return kkWQP4(M3ptD1Cf,B,...)end
function TrC17.bit32.replace(oTpq,CjPV,d,...)local z0=...or 1;if
d<0 or d>31 or z0 <0 or d+z0 >32 then error'out of range'end
oTpq=oTpq%aukN3ZWX;CjPV=CjPV%aukN3ZWX;return E4F(oTpq,CjPV,d,...)end;TrC17.bit={}
function TrC17.bit.tobit(I_bHR9bD)I_bHR9bD=I_bHR9bD%aukN3ZWX;if
I_bHR9bD>=0x80000000 then I_bHR9bD=I_bHR9bD-aukN3ZWX end;return I_bHR9bD end;local OfQcD=TrC17.bit.tobit;function TrC17.bit.tohex(YJha,...)
return cX88nonB(YJha%aukN3ZWX,...)end;function TrC17.bit.bnot(g9QyV)return
OfQcD(jHIxW_(g9QyV%aukN3ZWX))end
local function Yj(An_hQ3m,S,eMj5b1DD,...)
if eMj5b1DD then return
Yj(Yj(An_hQ3m,S),eMj5b1DD,...)elseif S then return
OfQcD(KabKdEUu(An_hQ3m%aukN3ZWX,S%aukN3ZWX))else return OfQcD(An_hQ3m)end end;TrC17.bit.bor=Yj
local function LvKdRh(lDdmS,k1kp870h,Xfv1_F,...)
if Xfv1_F then
return LvKdRh(LvKdRh(lDdmS,k1kp870h),Xfv1_F,...)elseif k1kp870h then return
OfQcD(gny(lDdmS%aukN3ZWX,k1kp870h%aukN3ZWX))else return OfQcD(lDdmS)end end;TrC17.bit.band=LvKdRh
local function _D(F74YQ,SHlZ8Rw,FxP66,...)
if FxP66 then
return _D(_D(F74YQ,SHlZ8Rw),FxP66,...)elseif SHlZ8Rw then return
OfQcD(MEwJPiqM(F74YQ%aukN3ZWX,SHlZ8Rw%aukN3ZWX))else return OfQcD(F74YQ)end end;TrC17.bit.bxor=_D;function TrC17.bit.lshift(y,Ou)return
OfQcD(oQ8AOvfn(y%aukN3ZWX,Ou%32))end
function TrC17.bit.rshift(AbN,lINgqxG1)return OfQcD(m(
AbN%aukN3ZWX,lINgqxG1%32))end;function TrC17.bit.arshift(Tz4j,vUctRT)
return OfQcD(bkV(Tz4j%aukN3ZWX,vUctRT%32))end
function TrC17.bit.rol(ry0d9cxF,fdMS0Bi)return OfQcD(RY1(ry0d9cxF%aukN3ZWX,
fdMS0Bi%32))end;function TrC17.bit.ror(jUfRhXXt,bncqpLFj)return
OfQcD(IGef7Hc5(jUfRhXXt%aukN3ZWX,bncqpLFj%32))end
function TrC17.bit.bswap(c9P3)return OfQcD(E(
c9P3%aukN3ZWX))end
local function uYwYKAU(D,A)
local cO3SXQC=TrC17.bor(TrC17.bnot(D),TrC17.bnot(A))local qiw=TrC17.bor(D,A)local bQRP=TrC17.band(qiw,cO3SXQC)
return bQRP end
local function mq(K5,M)check_int(K5)if(K5 <0)then
K5=TrC17.bnot(math.abs(K5))+1 end;for i=1,M do K5=K5/2 end;return math.floor(K5)end
return
{bnot=TrC17.bnot,band=TrC17.band,bor=TrC17.bor,bxor=_D,rshift=TrC17.rshift,lshift=TrC17.lshift,bxor2=uYwYKAU,blogic_rshift=mq,tobits=to_bits,tonumb=tbl_to_number}end)
util=Q(function()local ZubW5sf=bit.bxor;local VLlBaUgt=bit.rshift;local QniH=bit.band;local j=bit.lshift
local function x_BU2(L)
L=ZubW5sf(L,VLlBaUgt(L,4))L=ZubW5sf(L,VLlBaUgt(L,2))
L=ZubW5sf(L,VLlBaUgt(L,1))return QniH(L,1)end
local function AFii(qx27,whvO)if(whvO==0)then return QniH(qx27,0xff)else return
QniH(VLlBaUgt(qx27,whvO*8),0xff)end end
local function Au(kpbY,m_gHw)if(m_gHw==0)then return QniH(kpbY,0xff)else
return j(QniH(kpbY,0xff),m_gHw*8)end end
local function fgK(RFOr,NL,g0d1ms_)local Xmu5={}for i=0,g0d1ms_-1 do
Xmu5[i]=
Au(RFOr[NL+ (i*4)],3)+
Au(RFOr[NL+ (i*4)+1],2)+Au(RFOr[NL+ (i*4)+2],1)+Au(RFOr[NL+ (i*4)+3],0)end;return Xmu5 end
local function gm(lC3P,QwHnJ1MC,giqW,UJP9j)UJP9j=UJP9j or#lC3P;for i=0,UJP9j do for j=0,3 do
QwHnJ1MC[giqW+i*4+ (3-j)]=AFii(lC3P[i],j)end end
return QwHnJ1MC end
local function jwJufiF(SObxoJk)local _nBsWM3x=""for D5,I in ipairs(SObxoJk)do
_nBsWM3x=_nBsWM3x..string.format("%02x ",I)end;return _nBsWM3x end
local function YogtAPf(rgZln)local vB=type(rgZln)
if(vB=="number")then
return string.format("%08x",rgZln)elseif(vB=="table")then return jwJufiF(rgZln)elseif(vB=="string")then
local vFea={string.byte(rgZln,1,#rgZln)}return jwJufiF(vFea)else return rgZln end end
local function q7h(_T5)local fx=#_T5;local ZkXY=math.random(0,255)
local sWJA=math.random(0,255)
local NVvo=string.char(ZkXY,sWJA,ZkXY,sWJA,AFii(fx,3),AFii(fx,2),AFii(fx,1),AFii(fx,0))_T5=NVvo.._T5
local P2Kd8=math.ceil(#_T5/16)*16-#_T5;local asrUjwf=""for i=1,P2Kd8 do
asrUjwf=asrUjwf..string.char(math.random(0,255))end;return _T5 ..asrUjwf end
local function WS(Qya253Ad)local T49bAP={string.byte(Qya253Ad,1,4)}if
(T49bAP[1]==
T49bAP[3]and T49bAP[2]==T49bAP[4])then return true end;return false end
local function Uee8Une(bS5Jz)if(not WS(bS5Jz))then return nil end
local yl=
Au(string.byte(bS5Jz,5),3)+Au(string.byte(bS5Jz,6),2)+
Au(string.byte(bS5Jz,7),1)+
Au(string.byte(bS5Jz,8),0)return string.sub(bS5Jz,9,8+yl)end
local function UtI(srV,tSO4)for i=1,16 do srV[i]=ZubW5sf(srV[i],tSO4[i])end end
return
{byteParity=x_BU2,getByte=AFii,putByte=Au,bytesToInts=fgK,intsToBytes=gm,bytesToHex=jwJufiF,toHexString=YogtAPf,padByteString=q7h,properlyDecrypted=WS,unpadByteString=Uee8Une,xorIV=UtI}end)AES128=16;AES192=24;AES256=32;ECBMODE=1;CBCMODE=2;OFBMODE=3;CFBMODE=4
local function ZA(ALU1Lf,odzL_)local rHhv=odzL_;if(odzL_==
AES192)then rHhv=32 end
if(rHhv>#ALU1Lf)then local qM23K=""
for i=1,rHhv-
#ALU1Lf do qM23K=qM23K..string.char(0)end;ALU1Lf=ALU1Lf..qM23K else ALU1Lf=string.sub(ALU1Lf,1,rHhv)end;local DUv3={string.byte(ALU1Lf,1,#ALU1Lf)}
ALU1Lf=ciphermode.encryptString(DUv3,ALU1Lf,ciphermode.encryptCBC)ALU1Lf=string.sub(ALU1Lf,1,odzL_)return
{string.byte(ALU1Lf,1,#ALU1Lf)}end
function encrypt(HnNik4,Tb,k,g)assert(HnNik4 ~=nil,"Empty password.")
assert(HnNik4 ~=nil,"Empty data.")local g=g or CBCMODE;local k=k or AES128;local mOxUSY=ZA(HnNik4,k)
local t=util.padByteString(Tb)
if(g==ECBMODE)then return
ciphermode.encryptString(mOxUSY,t,ciphermode.encryptECB)elseif(g==CBCMODE)then return
ciphermode.encryptString(mOxUSY,t,ciphermode.encryptCBC)elseif(g==OFBMODE)then return
ciphermode.encryptString(mOxUSY,t,ciphermode.encryptOFB)elseif(g==CFBMODE)then return
ciphermode.encryptString(mOxUSY,t,ciphermode.encryptCFB)else return nil end end
function decrypt(CY,EPz43s,zR,ZiGUK4j)local ZiGUK4j=ZiGUK4j or CBCMODE;local zR=zR or AES128;local X5xyw_Y=ZA(CY,zR)
local Zb3oLBm1
if(ZiGUK4j==ECBMODE)then
Zb3oLBm1=ciphermode.decryptString(X5xyw_Y,EPz43s,ciphermode.decryptECB)elseif(ZiGUK4j==CBCMODE)then
Zb3oLBm1=ciphermode.decryptString(X5xyw_Y,EPz43s,ciphermode.decryptCBC)elseif(ZiGUK4j==OFBMODE)then
Zb3oLBm1=ciphermode.decryptString(X5xyw_Y,EPz43s,ciphermode.decryptOFB)elseif(ZiGUK4j==CFBMODE)then
Zb3oLBm1=ciphermode.decryptString(X5xyw_Y,EPz43s,ciphermode.decryptCFB)end;result=util.unpadByteString(Zb3oLBm1)if(result==nil)then
return nil end;return result end
