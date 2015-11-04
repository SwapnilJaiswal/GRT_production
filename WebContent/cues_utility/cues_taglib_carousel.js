function cuesCarousel(id,_1,_2,_3){
this.showPrevious=_4;
this.showNext=_5;
this.slideLeft=_6;
this.slideRight=_7;
this.gotoPage=_8;
this.scrollIntoView=_9;
var _a=25;
var _b=30;
var _c=10;
var _d=100;
var _e=1;
var _f=null;
var _10=new Array();
var _11="na";
var _12=0;
var _13=1;
var _14=1;
var _15=((_d/_a)*_e);
var _16=false;
var _17=new Array();
var _18;
var _19=null;
try{
cuesCarousels[id]=this;
}
catch(e){
cuesCarousels=new Array();
cuesCarousels[id]=this;
}
_1a(id,_1,_2,_3);
function _1a(id,_1b,_1c,_1d){
_11=id;
_e=_1b;
_d=_1d+_b;
_f=document.getElementById(id+".items");
_f.style.left=0;
_19=null;
_18=icuesFindChildrenByTagnameClass(_f,"div","cuesCarouselItem");
_14=_18.length;
_13=Math.ceil(_14/_e);
_f.style.width=(_14*_d)+102;
var _1e=document.getElementById(id+".pane");
_1e.style.overflowX="hidden";
_1e.style.overflowY="hidden";
_1e.style.height=_1c+_f.offsetTop+10+25;
_1e.style.width=(_e*_1d)+((_e-1)*_b);
var _1f=document.getElementById(id);
_1f.style.overflowX="hidden";
_1f.style.overflowY="hidden";
_1f.style.width=_1e.offsetWidth+60;
_1f.style.height=_1e.offsetHeight;
_20();
var _21=_d*_e;
_15=Math.ceil(((_d/_a)*_e));
_22("visible");
_23(_21);
};
function _23(_24){
_17=new Array();
var _25=0;
var _26;
for(var i=1;i<=_15;i++){
_26=_27(i,0,_24,_15);
_17.push(_26-_25);
_25=_26;
}
};
function _27(t,b,c,d){
if((t/=d/2)<1){
return Math.ceil(c/2*t*t+b);
}
return Math.ceil(-c/2*((--t)*(t-2)-1)+b);
};
function _20(){
var _28=new Array();
var _29=document.getElementById(_11+".lights");
var _2a=_29.innerHTML;
for(var i=0;i<_13;i++){
_28.push(_2a.replace("Page(0)","Page("+i+")"));
}
_29.innerHTML=_28.join("");
_10=_29.getElementsByTagName("img");
for(var i=0;i<_13;i++){
_10[i].alt=altGotoPage[i];
_10[i].title=altGotoPage[i];
}
_2b(0,true);
};
function _2c(){
for(var i=0;i<_13;i++){
_2b(i,_12==i);
}
};
function _2b(idx,_2d){
try{
var src=_10[idx].src;
if(_2d){
src=src.replace("Available.","Active.");
src=src.replace("Hover.","Active.");
}else{
src=src.replace("Hover.","Available.");
src=src.replace("Active.","Available.");
}
_10[idx].src=src;
}
catch(e){
}
};
function _4(){
_19=null;
_7();
};
function _5(){
_19=null;
_6();
};
function _6(cnt){
if(cnt==null){
if(_16){
return;
}
_16=true;
_2b(_12,false);
_22("hidden");
cnt=_15;
if(_12>=_13-1){
_2e(-1);
}
}
_f.style.left=parseInt(_f.style.left)-_17[_15-cnt];
cnt--;
if(cnt==0){
_2f(_12+1);
_12++;
if(_19!=null&&_12!=_19){
_16=false;
setTimeout("cuesCarousels['"+_11+"'].slideLeft()",50);
}else{
_19=null;
_2b(_12,true);
_22("visible");
_16=false;
}
}else{
setTimeout("cuesCarousels['"+_11+"'].slideLeft("+cnt+")",_c);
}
};
function _7(cnt){
if(cnt==null){
if(_16){
return;
}
_16=true;
_2b(_12,false);
_22("hidden");
cnt=_15;
if(_12<=0){
_2e(_13);
}
}
_f.style.left=parseInt(_f.style.left)+_17[_15-cnt];
cnt--;
if(cnt==0){
_2f(_12-1);
_12--;
if(_19!=null&&_12!=_19){
_16=false;
setTimeout("cuesCarousels['"+_11+"'].slideRight()",50);
}else{
_19=null;
_2b(_12,true);
_22("visible");
_16=false;
}
}else{
setTimeout("cuesCarousels['"+_11+"'].slideRight("+cnt+")",_c);
}
};
function _9(obj){
try{
var _30=obj.getAttribute("owningPage");
if(_30==null){
var _31=icuesFindObjectByTagnameClass(obj,"div","cuesCarouselItem");
for(var i=0;i<_14;i++){
if(_18[i]==_31){
_30=Math.floor(i/_e);
break;
}
}
obj.setAttribute("owningPage",_30);
}
if(_30!=null&&_12!=_30){
_8(_30,true);
}
}
catch(e){
}
};
function _2f(_32){
_f.style.left=(_32*_e*_d*-1);
};
function _8(_33,_34){
if(_16){
return;
}
if(_34==null){
_34=false;
}
if(_12==_33){
return;
}
_22("hidden");
_2b(_12,false);
if(_34||_33==_12){
_12=_33;
_2f(_33);
_2b(_12,true);
_22("visible");
}else{
_19=_33;
if(_33<_12){
_7();
}else{
_6();
}
}
};
function _2e(_35){
_12=_35;
_2f(_35);
};
function _22(_36){
try{
var idx=_12*_e;
for(var i=0;i<_e;i++,idx++){
var _37=_18[idx].getElementsByTagName("a");
var _38=_37.length;
for(var j=0;j<_38;j++){
try{
_37[j].style.visibility=_36;
}
catch(e){
}
}
}
}
catch(e){
}
};
};

