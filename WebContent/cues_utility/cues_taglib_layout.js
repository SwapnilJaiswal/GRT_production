var cuesResizeBox=null;
var cuesResizeLayer=null;
var cuesNavResizing=false;
var cuesResizeId=null;
function icuesResizeLayerMouseDown(_1,_2){
try{
if(_1==null){
_1=window.event;
}
var _2=(isIE)?_1.srcElement:_1.target;
if(_2.tagName.toLowerCase()=="img"&&parseInt(cuesVersion)>=60){
_2=icuesFindObjectByTagname(_2,"td");
_2.style.backgroundColor="";
}
if(_2.id!="cuesLayoutTogglerArea"&&_2.id!="cuesLayoutTaskPanelResizer"){
return true;
}
cuesResizeId=_2.id;
var _3=icuesGetNavArea();
if(_3!=null&&_3.style.display=="none"){
cuesStopEventBubble(_1);
return cuesSchedulerNoop();
}
if(cuesResizeLayer==null){
cuesResizeLayer=document.getElementById("cuesResizeLayer");
}
cuesResizeLayer.style.display="block";
cuesResizeLayer.style.cursor="col-resize";
document.body.appendChild(cuesResizeLayer);
if(cuesResizeBox==null){
cuesResizeBox=document.getElementById("cuesResizeBox");
}
cuesResizeBox.style.top=icuesPhysicalTop(_2)+"px";
cuesResizeBox.style.left=icuesPhysicalLeft(_2)+"px";
cuesResizeBox.style.width=_2.offsetWidth+"px";
cuesResizeBox.style.height=_2.offsetHeight+"px";
cuesNavResizing=true;
icuesAttachResizeListeners();
cuesStopEventBubble(_1);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeLayerMouseMove(_4){
try{
if(_4==null){
_4=window.event;
}
if(!cuesNavResizing||_4.clientY<0||_4.clientX<0||_4.clientY>document.body.offsetHeight||_4.clientX>document.body.offsetWidth){
icuesResizeLayerAborted(_4);
}
if(cuesResizeBox.style.left==_4.clientX+"px"){
return false;
}
cuesResizeBox.style.left=_4.clientX;
cuesStopEventBubble(_4);
cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeLayerMouseUp(_5,_6){
try{
if(!cuesNavResizing){
return icuesResizeLayerAborted(_5);
}
icuesReleaseResizeListeners();
if(_5==null){
_5=window.event;
}
cuesResizeLayer.style.display="none";
if(cuesResizeId=="cuesLayoutTogglerArea"){
icuesResizeDrawerWidths(Math.max(0,_5.clientX),true);
try{
callbackNavAreaResized();
}
catch(e){
}
}else{
var _7=document.getElementById("cuesLayoutTaskPanelArea");
_7.style.width=Math.max(0,document.body.offsetWidth-_5.clientX);
try{
callbackTaskPanelResized();
}
catch(e){
}
}
cuesStopEventBubble(_5);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeDrawerWidths(w,_8,_9){
try{
var _a=icuesGetNavArea();
if(_a!=null){
_a.setAttribute("lastWidth",_a.offsetWidth);
if(w==null){
w=_a.offsetWidth;
}
if(_9==null||!_9){
if(parseInt(cuesVersion)>=60){
var _b=document.getElementById("cuesLayoutLeftBorder");
if(_b!=null){
w-=_b.offsetWidth;
}
}
}
w=Math.max(0,w);
if(isIE&&w==0){
w=1;
}
_a.width=w;
var _c=_a.getElementsByTagName("div");
var _d=_c.length;
var _e=-1;
for(var j=0;j<_d;j++){
if(_c[j].className.indexOf("cuesDrawersContainer")==0){
_e=j;
_c[j].style.width=w;
}else{
if(_c[j].className.indexOf("cuesDrawersLayer")==0){
_c[j].style.width=w;
}
}
}
if(_e!=-1&&_8){
cuesTileDrawers(_c[_e].id,true);
}
}
}
catch(e){
}
};
function icuesResizeLayerMouseOut(_f,obj){
try{
if(_f==null){
_f=window.event;
}
if(!cuesNavResizing||_f.clientY<0||_f.clientX<0||_f.clientY>document.body.offsetHeight||_f.clientX>document.body.offsetWidth){
return icuesResizeLayerAborted(_f);
}
cuesStopEventBubble(_f);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeLayerAborted(evt,obj){
try{
cuesNavResizing=false;
cuesResizeLayer.style.display="none";
icuesReleaseResizeListeners();
cuesStopEventBubble(evt);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesReleaseResizeListeners(){
if(document.removeEventListener){
document.removeEventListener("mousemove",icuesResizeLayerMouseMove,false);
document.removeEventListener("mouseup",icuesResizeLayerMouseUp,false);
document.removeEventListener("mouseout",icuesResizeLayerMouseOut,false);
}else{
if(document.detachEvent){
document.detachEvent("onmousemove",icuesResizeLayerMouseMove);
document.detachEvent("onmouseup",icuesResizeLayerMouseUp);
document.detachEvent("onmouseout",icuesResizeLayerMouseOut);
}
}
};
function icuesAttachResizeListeners(){
if(document.addEventListener){
document.addEventListener("mousemove",icuesResizeLayerMouseMove,false);
document.addEventListener("mouseup",icuesResizeLayerMouseUp,false);
document.addEventListener("mouseout",icuesResizeLayerMouseOut,false);
}else{
if(document.attachEvent){
document.attachEvent("onmousemove",icuesResizeLayerMouseMove);
document.attachEvent("onmouseup",icuesResizeLayerMouseUp);
document.attachEvent("onmouseout",icuesResizeLayerMouseOut);
}
}
};
function cuesMouseOverToggler(evt,obj){
if(obj.attributes["state"].value=="closed"){
obj.src=cuesKnownLocation+cuesImageFolder+"/split-closed-hl-html.gif";
}else{
obj.src=cuesKnownLocation+cuesImageFolder+"/split-opened-hl-html.gif";
}
obj.style.cursor="hand";
};
function cuesMouseOutToggler(evt,obj){
if(obj.attributes["state"].value=="closed"){
obj.src=cuesKnownLocation+cuesImageFolder+"/split-closed-html.gif";
}else{
obj.src=cuesKnownLocation+cuesImageFolder+"/split-opened-html.gif";
}
obj.style.cursor="default";
};
function cuesMouseOverGripper(evt,obj){
obj.style.cursor="col-resize";
obj.parentNode.style.backgroundColor="#0088c2";
};
function cuesMouseOutGripper(evt,obj){
obj.style.cursor="default";
obj.parentNode.style.backgroundColor="";
};
function cuesToggleNavArea(){
try{
if(parseInt(cuesVersion)>=61){
var _10=icuesGetNavArea();
var _11=_10.offsetWidth;
var _12=_10.getAttribute("lastWidth");
if(_11<2){
if(_12<2||_12==null){
_12=200;
}
icuesResizeDrawerWidths(_12,true,true);
}else{
icuesResizeDrawerWidths(0,true,true);
}
try{
callbackNavAreaToggled();
}
catch(e){
}
}
}
catch(e){
}
};
function icuesToggleNavArea(evt,obj,id){
try{
var _13;
var _14=document.getElementById("cuesLayoutContentArea");
if(obj.attributes["state"].value=="closed"){
if(isIE){
_13="inline";
}else{
_13="table-cell";
}
obj.src=cuesKnownLocation+cuesImageFolder+"/split-opened-html.gif";
obj.attributes["state"].value="opened";
obj.title=altCollapseNav;
}else{
_13="none";
obj.src=cuesKnownLocation+cuesImageFolder+"/split-closed-html.gif";
obj.attributes["state"].value="closed";
obj.title=altExpandNav;
}
icuesGetNavArea().style.display=_13;
try{
callbackNavAreaToggled();
}
catch(e){
}
}
catch(e){
}
};
function icuesGetNavArea(){
var _15=null;
try{
var _16=document.getElementById("cuesLayout");
var _17=_16.rows[0].cells.length;
for(var i=0;i<_17;i++){
if(_16.rows[0].cells[i].id=="cuesLayoutTogglerArea"){
_15=_16.rows[0].cells[i-1];
break;
}
}
}
catch(e){
}
return _15;
};

