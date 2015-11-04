var cuesDebug=false;
var cuesDebugTransforms=false;
var cuesVersion="62";
var cuesBuildInfo="6.2; built on 2010-10-25@23:10:21";
var cuesUsage="webapp";
var cuesIsInsideAction=false;
var cuesSecureCookies=false;
var cuesCSSMode="normal";
var CUESMINDRAWERHEIGHT=170;
var CUESDRAWERSCROLLDELAY=150;
var CUESTASKPANELWIDTH="200px";
var CUESTASKPANELWIDTHEXT="350px";
var CUESTASKPANELHEIGHTEXT="700px";
var CUESABOUTHEIGHT=345+4+14;
var CUESABOUTWIDTH=480+8+8;
var CUESMAXLOGINGAP=210;
var TREETABLEINDENTATION=16;
var drawerDefaultItemURL=new Array();
var drawerDefaultItemTarget=new Array();
var drawerDefaultItemId=new Array();
var cuesDrawersScrolling=false;
var cuesObjectScrollable=new Array();
var drawerActiveId=null;
var drawerActiveItemId=null;
var drawerFocusObject=null;
var navtreeActiveId=null;
var navtreeActiveItemId=null;
var tablesWithColgroup=new Array();
var transferMCLB=new Array();
var cuesKnownLocation="./";
var cuesImageFolder="cues_images";
var cuesIconFolder="cues_icons";
var cuesImageSuffix="";
var cuesImageRTLSuffix="";
var cuesSortSeparator="`";
var cuesMsg=new Array();
cuesMsg["InvalidData"]="Invalid data";
cuesMsg["NoncontiguousReorder"]="You can only reorder selected rows that are contiguous";
cuesMsg["VerifyingLogin"]="Verifying";
cuesMsg["EmptyRow"]="No data to display";
var cuesAlt=new Array();
cuesAlt["ExpandDrawer"]="Expand";
cuesAlt["CollapseDrawer"]="Collapse";
cuesAlt["ExpandNav"]="Expand Navigation Pane";
cuesAlt["CollapseNav"]="Collapse Navigation Pane";
cuesAlt["ExpandTree"]="Expand tree item";
cuesAlt["CollapseTree"]="Collapse tree item";
cuesAlt["LeafTree"]="Leaf";
cuesAlt["WizardStepErrorState"]="Wizard step contains 1 or more errors";
cuesAlt["TabErrorState"]="Tab contains 1 or more errors";
cuesAlt["ExpandPane"]="Expand";
cuesAlt["CollapsePane"]="Collapse";
var cuesMaskeditFormatError=new Array();
var cuesACP=new Array();
var icuesLoginBackgroundImage="";
String.prototype.trim=function(){
return this.replace(/^\s+|\s+$/,"");
};
var isIE=navigator.userAgent.indexOf("MSIE")!=-1;
var isIE6=navigator.userAgent.indexOf("MSIE 6.")!=-1;
var isIE7=navigator.userAgent.indexOf("MSIE 7.")!=-1;
var isFF=navigator.userAgent.indexOf("Firefox/")!=-1||navigator.userAgent.indexOf("Gecko/")!=-1;
var isFF10x=navigator.userAgent.indexOf("Firefox/1.0")!=-1;
var isFF15x=navigator.userAgent.indexOf("Firefox/1.5")!=-1;
var isFF2=navigator.userAgent.indexOf("Firefox/2.")!=-1;
var isFF2004=navigator.userAgent.indexOf("Firefox/2.0.0.4")!=-1;
var isFF301=navigator.userAgent.indexOf("Firefox/3.0.1")!=-1;
var isFF30=navigator.userAgent.indexOf("Firefox/3.0")!=-1;
var isFF3=navigator.userAgent.indexOf("Firefox/3")!=-1;
var isSafari=navigator.userAgent.indexOf("Safari")!=-1&&navigator.userAgent.indexOf("Chrome")==-1;
var isChrome=navigator.userAgent.indexOf("Chrome")!=-1;
var cuesScrollerWidth=isIE?19:16;
function isArray(_1){
try{
if(_1.constructor.toString().indexOf("Array")==-1){
return false;
}else{
return true;
}
}
catch(e){
return false;
}
};
function _makeNode(_2,_3,_4){
var n=document.createElement(_2);
if(_3){
for(var k in _3){
var v=_3[k];
var lk=k.toLowerCase();
switch(lk){
case "innerhtml":
n.innerHTML=v;
break;
case "classname":
n.className=v;
break;
case "style":
n.style.cssText=v;
break;
default:
if(typeof v=="string"||typeof v=="number"){
n.setAttribute(k,v);
}
}
}
}
if(_4){
_4.appendChild(n);
}
return n;
};
function _makeDiv(_5,_6){
return _makeNode("DIV",_5,_6);
};
function _byId(i){
return document.getElementById(i);
};
function icuesGetStyleProperty(_7,_8){
var _9=null;
try{
if(isFF||isSafari||isChrome){
_9=eval("document.defaultView.getComputedStyle(obj,'')."+_8);
}else{
_9=eval("obj.currentStyle."+_8);
}
}
catch(e){
}
return _9;
};
function icuesSleep(_a){
var _b=new Date().getTime();
var _c=_b;
while(_c-_b<_a){
_c=new Date().getTime();
}
};
function cuesGetIframeElementById(_d,_e){
var _f=null;
try{
var _10=document.getElementById(_d);
if(typeof _10=="object"&&_10.tagName.toLowerCase()=="iframe"){
var _11=(_10.contentWindow||_10.contentDocument);
if(_11.document){
_11=_11.document;
}
_f=_11.getElementById(_e);
}
}
catch(e){
}
return _f;
};
function icuesFindObjectByTagname(obj,_12){
try{
_12=_12.toLowerCase();
while(obj.tagName.toLowerCase()!=_12&&obj!=null){
obj=obj.parentNode;
}
}
catch(e){
obj=null;
}
return obj;
};
function icuesFindObjectByTagnameId(obj,_13,id){
try{
_13=_13.toLowerCase();
while(obj.tagName.toLowerCase()!=_13&&obj.id!=id&&obj!=null){
obj=obj.parentNode;
}
}
catch(e){
obj=null;
}
return obj;
};
function icuesFindObjectByTagnameClass(obj,_14,_15){
try{
_14=_14.toLowerCase();
while(obj!=null){
if(obj.tagName.toLowerCase()==_14&&obj.className==_15){
break;
}
obj=obj.parentNode;
}
}
catch(e){
obj=null;
}
return obj;
};
function icuesFindChildByTagnameId(obj,_16,id){
var _17=null;
try{
var _18=obj.getElementsByTagName(_16.toLowerCase());
var _19=_18.length;
for(var i=0;i<_19;i++){
if(_18[i].id==id){
return _18[i];
}
}
}
catch(e){
}
return _17;
};
function icuesFindChildrenByTagnameClass(obj,_1a,_1b){
var _1c=new Array();
try{
var _1d=obj.getElementsByTagName(_1a.toLowerCase());
var _1e=_1d.length;
for(var i=0;i<_1e;i++){
if(_1d[i].className==_1b){
_1c.push(_1d[i]);
}
}
}
catch(e){
}
return _1c;
};
function cuesDisableLink(id){
try{
var obj=document.getElementById(id);
obj.disabled=true;
if(obj.href!=null&&obj.href!=""){
obj.setAttribute("savehref",obj.href);
obj.removeAttribute("href");
}
if(obj.getAttribute("onclick")!=null){
obj.setAttribute("saveonclick",obj.getAttribute("onclick"));
obj.setAttribute("onclick","javascript:void(0)");
}
obj.style.color="#c0c0c0";
}
catch(e){
}
};
function cuesEnableLink(id){
try{
var obj=document.getElementById(id);
obj.disabled=false;
if(obj.getAttribute("savehref")!=null&&obj.getAttribute("savehref")!=""){
obj.href=obj.getAttribute("savehref");
obj.removeAttribute("savehref");
}
if(obj.getAttribute("saveonclick")!=null&&obj.getAttribute("saveonclick")!=""){
obj.setAttribute("onclick",obj.getAttribute("saveonclick"));
obj.removeAttribute("saveonclick");
}
obj.style.color="";
}
catch(e){
}
};
function icuesPhysicalTop(obj){
var _1f=0;
try{
while(obj!=null){
_1f+=obj.offsetTop*1;
obj=obj.offsetParent;
}
}
catch(e){
}
return _1f;
};
function icuesPhysicalTop2(obj){
var _20=0;
try{
while(obj!=null){
if(!(obj.tagName.toLowerCase()=="div"&&(obj.style.overflow.toLowerCase()=="scroll"||obj.style.overflow.toLowerCase()=="auto"))){
_20+=obj.offsetTop*1;
}
obj=obj.offsetParent;
if(obj.tagName.toLowerCase()=="body"){
break;
}
}
}
catch(e){
}
return _20;
};
function icuesGetOwnerScrollWidth(obj){
var w=0;
obj=obj.parentNode;
try{
while(obj!=null){
if(obj.tagName.toLowerCase()=="body"||(obj.tagName.toLowerCase()=="div"&&(obj.style.overflow.toLowerCase()=="scroll"||obj.style.overflow.toLowerCase()=="auto"))){
w=obj.scrollWidth;
break;
}
obj=obj.parentNode;
}
}
catch(e){
}
return w;
};
function icuesScrolledAmount(obj){
var _21=0;
try{
while(obj!=null){
_21+=obj.scrollTop*1;
obj=obj.parentNode;
if(obj.tagName.toLowerCase()=="body"){
break;
}
}
}
catch(e){
}
return _21;
};
function icuesPhysicalLeft(obj){
var _22=0;
try{
while(obj!=null){
_22+=obj.offsetLeft*1;
obj=obj.offsetParent;
}
}
catch(e){
}
return _22;
};
function icuesPhysicalLocation(obj,_23){
var _24=0;
try{
while(obj!=null&&obj.tagName.toLowerCase()!="html"){
if(_23=="left"){
_24+=obj.offsetLeft*1;
_24-=obj.scrollLeft*1;
obj=obj.parentNode;
}else{
_24+=obj.offsetTop*1;
_24-=obj.scrollTop*1;
obj=obj.offsetParent;
}
}
}
catch(e){
}
return _24;
};
function icuesPhysicalTop3(obj){
var _25=0;
try{
while(obj!=null&&obj.tagName.toLowerCase()!="html"){
physLeft+=obj.offsetLeft*1;
physLeft-=obj.scrollLeft*1;
obj=obj.parentNode;
}
}
catch(e){
}
return physLeft;
};
function cuesAnchor(_26,_27,_28,gap){
try{
var _29=document.getElementById(_26);
var _2a=document.getElementById(_27);
icuesAnchor(_29,_2a,_28,gap);
}
catch(e){
}
};
function icuesAnchor(_2b,_2c,_2d,gap){
try{
if(gap==null){
gap=0;
}
switch(_2d){
case "top":
break;
case "bottom":
var _2e=icuesPhysicalTop(_2b);
var _2f=_2e+(_2b.offsetHeight*1);
var _30=icuesPhysicalTop(_2c);
var _31=_30+(_2c.offsetHeight*1);
var _32=_2f-_31-gap;
_2c.style.top=_32+"px";
break;
case "right":
var _33=icuesPhysicalLeft(_2b);
var _34=_33+(_2b.offsetWidth*1);
var _35=icuesPhysicalLeft(_2c);
var _36=_35+(_2c.offsetWidth*1);
var _32=_34-_36-gap;
_2c.style.left=_32+"px";
break;
}
}
catch(e){
}
};
function cuesRepaint(id,obj){
try{
if(obj==null){
obj=document.getElementById(id);
}
obj.style.display="none";
obj.style.display="";
}
catch(e){
}
};
function cuesExpandHeight(id,gap,_37){
try{
if(gap==null){
gap=0;
}
var obj=document.getElementById(id);
if(obj==null){
return;
}
var _38=document.getElementById("cuesLayoutCopyright");
if(_38!=null){
gap+=_38.offsetHeight;
}
var _39=Math.max(0,(document.body.clientHeight-icuesPhysicalTop(obj)-gap))+"px";
if(obj.style!=null){
obj.style.height=_39;
}else{
obj.height=_39;
}
if(obj.getAttribute("contentblock")=="true"){
cuesExpandContentArea("cuesContentArea",cuesLastContentIndent,null,false,_39);
cuesExpandContentLayer();
}
if(_37){
cuesRepaint(id,obj);
}
}
catch(e){
}
};
function cuesFillHeight(id,gap){
try{
if(gap==null){
gap=0;
}
var obj=document.getElementById(id);
if(obj==null){
return;
}
var _3a=document.getElementById("cuesLayoutCopyright");
if(_3a!=null){
gap+=_3a.offsetHeight;
}
var _3b=icuesGetDrawersScrollers(id);
if(_3b=="false"){
var _3c=Math.max(0,(document.body.clientHeight-icuesPhysicalTop(obj)-gap))+"px";
if(obj.style!=null){
obj.style.height=_3c;
}else{
obj.height=_3c;
}
}else{
cuesObjectScrollable[id]=true;
var _3d=cuesGetDrawersScrollerHeight(id);
var _3c=Math.max(0,(document.body.clientHeight-_3d-icuesPhysicalTop(obj)-gap))+"px";
if(obj.style!=null){
obj.style.height=_3c;
}else{
obj.height=_3c;
}
obj=document.getElementById("DrawersScrollDown_"+id);
if(obj!=null){
var _3e=icuesFindObjectByTagname(obj,"TD");
icuesAnchor(_3e,obj,"bottom");
cuesSetDrawersScrollersState(id);
}
}
}
catch(e){
}
};
function cuesExpandLayer(id){
try{
var obj=document.getElementById(id);
obj.style.height=Math.max(obj.parentNode.scrollHeight,obj.parentNode.offsetHeight);
}
catch(e){
}
};
function cuesShrinkLayer(id){
try{
document.getElementById(id).style.height=10;
}
catch(e){
}
};
function cuesStopEventBubble(evt){
try{
if(evt==null){
evt=window.event;
}
if(evt.stopPropagation){
evt.stopPropagation();
}
evt.cancelBubble=true;
evt.returnValue=false;
}
catch(e){
}
};
function cuesFindDirection(obj){
if(obj.dir!=""){
return (obj.dir.toLowerCase());
}else{
if(obj.parentNode!=null){
return cuesFindDirection(obj.parentNode);
}else{
return "";
}
}
};
function icuesDetermineImageDirectionSuffix(obj,_3f){
if(cuesFindDirection(obj)=="rtl"){
switch(_3f.toLowerCase()){
case "left":
case "right":
return "RTL";
break;
default:
return "";
break;
}
}else{
return "";
}
};
function cuesCloneAttributes(_40,_41){
try{
_41.className=_40.className;
var _42=_40.attributes.length;
for(var i=0;i<_42;i++){
if(_40.attributes[i].specified){
_41.setAttribute(_40.attributes[i].name,_40.attributes[i].value);
}
}
}
catch(e){
}
};
function cuesExtractAttributes(_43){
var _44=new Array();
try{
if(_43.className){
_44.push("class=\""+_43.className+"\"");
}
var _45=_43.attributes.length;
for(var i=0;i<_45;i++){
if(_43.attributes[i].specified){
_44.push(_43.attributes[i].name+"=\""+_43.attributes[i].value+"\"");
}
}
}
catch(e){
}
return _44.join(" ");
};
function cuesLoadScript(url){
var _46=document.getElementsByTagName("head");
if(_46.length>0){
var _47=document.createElement("script");
_46[0].appendChild(_47);
_47.src=url;
}
};
var replaceExpression=new RegExp("-D.gif","gi");
function cuesManageButtonState(id,_48){
try{
var obj=document.getElementById(id);
obj.disabled=_48;
var _49=obj.getElementsByTagName("img");
var _4a=_49.length;
var src;
for(var i=0;i<_4a;i++){
src=_49[0].src;
src=src.replace(replaceExpression,".gif");
if(_48){
src=src.replace(".gif","-D.gif");
}
_49[0].src=src;
}
}
catch(e){
}
};
function icuesAddVMLSupport(){
if(isIE){
for(var i=0;i<document.namespaces.length;i++){
if(document.namespaces[i].name=="cues_vml"){
return;
}
}
document.namespaces.add("cues_vml","urn:schemas-microsoft-com:vml");
}
};
function cuesCloneListbox(_4b,_4c){
try{
var src=document.getElementById(_4b);
var _4d=document.getElementById(_4c);
icuesCloneListbox(src,_4d);
}
catch(e){
}
};
function icuesCloneListbox(src,_4e){
try{
_4e.size=src.size;
var _4f,_50;
_4e.options.length=0;
for(var i=0;i<src.options.length;i++){
_50=src.options[i];
_4f=document.createElement("option");
_4f.value=_50.value;
_4f.text=_50.text;
_4f.disabled=_50.disabled;
_4f.selected=_50.selected;
try{
_4f.title=_50.title;
}
catch(e){
}
_4e.options.add(_4f);
}
}
catch(e){
}
};
function cuesFixPNG(id,img){
if(!isIE6){
return;
}
var _51=new Array();
if(id!=null){
try{
_51.push(document.getElementById(id));
}
catch(e){
}
}else{
if(img!=null){
_51.push(img);
}else{
_51=document.getElementsByTagName("img");
}
}
var _52=_51.length;
for(var i=0;i<_52;i++){
try{
if(_51[i].tagName.toLowerCase()=="img"){
if(_51[i].src.toLowerCase().indexOf(".png")==-1){
continue;
}
if(_51[i].width==0||_51[i].height==0){
continue;
}
_51[i].style.cssText="width:"+_51[i].width+"px;height:"+_51[i].height+"px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+_51[i].src+"', sizingMethod=scale);";
_51[i].src=cuesKnownLocation+cuesImageFolder+"/spacer.gif";
}else{
if(isIE6){
var bg=_51[i].currentStyle.backgroundImage;
if(bg.toLowerCase().indexOf(".png")==-1){
continue;
}
var _53=bg.substring(5,bg.length-2);
_51[i].style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+_53+"', sizingMethod='scale');";
_51[i].style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/spacer.gif)";
}
}
}
catch(e){
}
}
};
var cuesLogText="";
function cuesLog(_54){
if(_54=="clear"){
cuesLogText="";
}else{
cuesLogText+=_54;
}
cuesLogText+="<br/>";
cuesLogWindow=window.open("","cuesLogWindow","status=no,scrollbars=yes,resizable=yes");
cuesLogWindow.document.open();
cuesLogWindow.document.write("<html><title>cues Log Window</title><body>");
cuesLogWindow.document.write(cuesLogText);
cuesLogWindow.document.write("<script>document.body.scrollTop=100000;</script>");
cuesLogWindow.document.write("</body></html>");
cuesLogWindow.document.close();
};
var icuesT0;
function icuesElap(msg){
if(msg!=null){
cuesLog(msg+"; elap="+(new Date()-icuesT0));
}
icuesT0=new Date();
};
function cuesResetFormFocus(obj){
try{
icuesFindObjectByTagname(obj,"form").elements[0].focus();
}
catch(e){
}
};
function cuesManageFormFieldState(id,_55,_56){
try{
if(_56!=null){
switch(_56){
case "date":
cuesManageFormFieldState(id+"_month",_55);
cuesManageFormFieldState(id+"_day",_55);
cuesManageFormFieldState(id+"_year",_55);
return;
break;
case "time":
cuesManageFormFieldState(id+"_hour",_55);
cuesManageFormFieldState(id+"_min",_55);
cuesManageFormFieldState(id+"_ampm",_55);
return;
break;
case "time2":
cuesManageFormFieldState(id+"_hourmin",_55);
cuesManageFormFieldState(id+"_ampm",_55);
return;
break;
case "miltime":
cuesManageFormFieldState(id+"_hour",_55);
cuesManageFormFieldState(id+"_min",_55);
return;
break;
case "ipv6":
cuesManageFormFieldState(id+"_address",_55);
cuesManageFormFieldState(id+"_mask",_55);
return;
break;
}
}
var obj=document.getElementById(id);
if(obj!=null){
switch(_55.toLowerCase()){
case "enable":
obj.disabled=false;
obj.className=obj.className.replace("cuesDisabledField","");
break;
case "disable":
obj.disabled=true;
if(obj.className.indexOf("cuesDisabledField")==-1){
obj.className+=" cuesDisabledField";
}
break;
case "toggle":
cuesManageFormFieldState(id,obj.disabled?"enable":"disable");
break;
}
}
}
catch(e){
}
};
function cuesSetPaneHeight(id,h){
try{
document.getElementById(id+"_scroller").style.height=h;
}
catch(e){
}
};
function icuesSetIconHoverState(obj,_57){
try{
var src=obj.src;
if(!_57&&src.indexOf("Hover")!=-1){
src=src.replace("Hover.gif",".gif");
}else{
if(_57&&src.indexOf("Hover")==-1){
src=src.replace(".gif","Hover.gif");
}
}
obj.src=src;
}
catch(e){
}
return false;
};
function icuesSetIconHoverStateById(id,_58){
return icuesSetIconHoverState(document.getElementById(id),_58);
};
function cuesResizeAboutWindowToContent(){
try{
var _59=135;
var h=Math.max(window.document.body.offsetHeight,window.document.body.scrollHeight);
if(h<CUESABOUTHEIGHT){
var _5a=document.getElementsByTagName("div");
for(var i=0;i<_5a.length;i++){
if(_5a[i].className.indexOf("cuesAboutProductName")==0){
var pt=parseInt(icuesGetStyleProperty(_5a[i],"paddingTop"));
if(isNaN(pt)){
pt=0;
}
_59=Math.max(135,pt+CUESABOUTHEIGHT-h);
_5a[i].style.paddingTop=_59+"px";
break;
}
}
}
if(parseInt(cuesVersion)>=62){
var _5b=top.window.document.getElementById("icuesAboutContainer");
var cw=_5b.offsetWidth;
var ch=_5b.offsetHeight;
var _5c=top.window.document.getElementById("icuesAboutWindow");
if(_5c.getAttribute("firstuse")=="true"){
_5c.setAttribute("firstuse","false");
_5c.setAttribute("minpad",_59-20);
var h=window.document.body.scrollHeight;
_5c.style.height=h;
_5c.style.width=CUESABOUTWIDTH;
}
var _5a=document.getElementsByTagName("div");
_59=_5c.getAttribute("minpad");
for(var i=0;i<_5a.length;i++){
if(_5a[i].className.indexOf("cuesAboutProductName")==0){
_5a[i].style.paddingTop=_59+"px";
break;
}
}
var iw=_5c.offsetWidth;
var ih=_5c.offsetHeight;
var _5d=(cw-iw)/2;
var _5e=(ch-ih)/2;
if(_5d>0){
_5c.style.marginLeft=_5d;
}
if(_5e>0){
_5c.style.marginTop=_5e;
}
cuesDrawnShape.makeShadowedContainer("cuesAboutBackground","#414141",0.4,4,8,14,8,icuesLoginBackgroundImage,6);
setTimeout("icuesDelayedShowAbout()",750);
}else{
cuesResizeWindowToContent();
}
}
catch(e){
}
};
function icuesDelayedShowAbout(){
try{
icuesSetOpacity(top.window.document.getElementById("icuesAboutWindow"),100);
}
catch(e){
}
};
function cuesResizeWindowToContent(){
try{
var obj=null;
for(var i=document.body.childNodes.length-1;i>=0;i--){
if(document.body.childNodes[i].tagName!=null&&document.body.childNodes[i].tagName.toLowerCase()!="script"){
obj=document.body.childNodes[i];
if(obj.offsetHeight>0){
break;
}
}
}
var _5f=icuesPhysicalTop(obj);
var _60=_5f+(obj.offsetHeight*1);
var _61=_60-window.document.body.offsetHeight;
window.resizeBy(0,_61);
}
catch(e){
}
};
function cuesSetTableTitle(_62,_63){
try{
var _64=document.getElementById(_62+"_title");
_64.innerHTML="<nobr>"+_63+"</nobr>";
}
catch(e){
}
};
function icuesTableRowMouseOverHandler(obj,_65,_66){
try{
if(obj.className.indexOf("Selected")==-1){
obj.className+=" cuesTableRowHover";
if(_65){
document.getElementById(_66).rows[obj.rowIndex].className+=" cuesTableRowHover";
}
}
}
catch(e){
}
};
function icuesTableRowMouseOutHandler(obj,_67,_68){
try{
if(obj.className.indexOf("cuesTableRowHover")!=-1){
obj.className=obj.className.replace(" cuesTableRowHover","");
if(_67){
var _69=document.getElementById(_68).rows[obj.rowIndex];
if(_69.className.indexOf("cuesTableRowHover")!=-1){
_69.className=_69.className.replace(" cuesTableRowHover","");
}
}
}
}
catch(e){
}
};
function cuesSetRowContainsError(_6a,_6b){
try{
var _6c=cuesGetTableRow(_6a,_6b);
if(icuesIsRowErrored(_6c)){
return;
}
var _6d=icuesIsRowSelected(_6c);
_6c.className=icuesRowUnselectedClass(_6c)+"Errored";
if(_6d){
_6c.className=icuesRowSelectedClass(_6c);
}
}
catch(e){
}
};
function cuesClearRowContainsError(_6e,_6f){
try{
var _70=cuesGetTableRow(_6e,_6f);
_70.className=_70.className.replace("Errored","");
}
catch(e){
}
};
function icuesIsRowErrored(_71){
try{
return _71.className.indexOf("Errored")!=-1;
}
catch(e){
return false;
}
};
function icuesIsRowSelected(_72){
try{
var _73=_72.className.split(" ");
return _73[0].indexOf("Selected")==_73[0].length-8;
}
catch(e){
return false;
}
};
function icuesRowSelectedClass(_74){
return icuesRowUnselectedClass(_74)+"Selected";
};
function icuesRowUnselectedClass(_75){
var _76=_75.className.split(" ");
return _76[0].replace("Selected","");
};
function icuesToggleAllTableRows(obj,_77,_78){
var _79;
var _7a=document.getElementById(_77+".th");
if(_7a!=null){
_7a=document.getElementById(_77+".td");
_79=0;
}else{
_7a=icuesFindObjectByTagname(obj,"TABLE");
_79=1;
}
if(tablesWithColgroup[_77]){
_7a=document.getElementById(_77+"_CG1.td");
_79=0;
}
if(_7a==null){
return;
}
var _7b;
var _7c;
var _7d=_7a.rows.length;
var _7e=0;
var _7f=0;
for(var i=_79;i<_7d;i++){
_7b=_7a.rows[i];
try{
var _80=false;
_7c=_7b.cells[0].getElementsByTagName("input");
if(_7c.length==0&&_7b.cells[0].className=="cuesTableReorderColumn"){
_7c=_7b.cells[1].getElementsByTagName("input");
_80=true;
}
if(_7c[0].disabled){
continue;
}
_7f++;
if(obj.checked){
if(!icuesIsRowSelected(_7b)){
_7e++;
var _81=icuesGetStyleProperty(_7b.cells[0],"color");
_7b.className=icuesRowSelectedClass(_7b);
if(_80){
_7b.cells[0].style.color=_81;
}
if(tablesWithColgroup[_77]){
icuesMatchRowClass(_7b,i);
}
}
}else{
if(icuesIsRowSelected(_7b)){
_7b.className=icuesRowUnselectedClass(_7b);
if(tablesWithColgroup[_77]){
icuesMatchRowClass(_7b,i);
}
}
}
_7c[0].checked=obj.checked;
}
catch(e){
}
}
if(obj.checked&&_7e>0){
cuesManageTableRowSelectionRules(_77,"all");
if(_7e==1&&_7f==1){
cuesManageTableRowSelectionRules(_77,"only");
}
}else{
cuesManageTableRowSelectionRules(_77,"none");
}
try{
if(cuesUsage=="webapp"){
if(typeof callbackTableRowSelected=="function"){
callbackTableRowSelected(null,obj.checked,_77,_78);
}
}else{
window[icuesGetPortletId(_77,obj,true)+"_callbackTableRowSelected"](null,obj.checked,_77,_78);
}
}
catch(e){
}
};
function cuesSelectTableSpecialRow(obj,_82){
if(obj.checked){
icuesDeselectTableRows(_82);
cuesManageTableRowSelectionRules(_82,"specialon");
}else{
cuesManageTableRowSelectionRules(_82,"specialoff");
}
};
function icuesGetRowSelectionObject(_83){
try{
var _84=_83.cells[0].getElementsByTagName("input");
if(_84.length==0&&_83.cells[0].className=="cuesTableReorderColumn"){
_84=_83.cells[1].getElementsByTagName("input");
}
if(_84.length>0){
return _84[0];
}
}
catch(e){
}
return null;
};
function icuesToggleTableRowSelection(evt,obj,_85,_86){
try{
var _87=false;
var bOn=false;
var _88=obj;
if(obj.tagName.toLowerCase()=="tr"){
var _89=(isIE)?evt.srcElement:evt.target;
try{
if(_89.tagName.toLowerCase()=="input"&&_89.getAttribute("rowselector")=="true"){
return true;
}
}
catch(e){
}
_88=icuesGetRowSelectionObject(obj);
if(_88.disabled){
return true;
}
_88.checked=!icuesIsRowSelected(obj);
}else{
obj=icuesFindObjectByTagname(obj,"TR");
}
icuesTableRowMouseOutHandler(obj);
var _8a=icuesGetStyleProperty(obj.cells[0],"color");
if(icuesIsRowSelected(obj)){
obj.className=icuesRowUnselectedClass(obj);
if(tablesWithColgroup[_85]){
icuesMatchRowClass(obj);
}
var _8b=icuesFindObjectByTagname(obj,"TABLE");
if(_8b!=null){
var _8c=null;
if(tablesWithColgroup[_85]){
_8c=document.getElementById(_85+"_CG1.th");
}else{
_8c=document.getElementById(_85+".th");
}
if(_8c!=null){
_8b=_8c;
}
var _8d=_8b.rows[0];
if(_8d.className=="cuesTableAlignmentRow"){
_8d=_8b.rows[1];
}
var _8e=_8d.cells[0].getElementsByTagName("input");
if(_8e.length==0&&_8d.cells[0].className=="cuesTableReorderColumn"){
_8e=_8d.cells[1].getElementsByTagName("input");
}
_8e[0].checked=false;
}
}else{
obj.className=icuesRowSelectedClass(obj);
if(tablesWithColgroup[_85]){
icuesMatchRowClass(obj);
}
bOn=true;
_87=icuesManageTableGlobalCheckbox(obj,_85);
}
if(!_87){
cuesManageTableRowSelectionRules(_85);
}
if(obj.cells.length>0&&obj.cells[0].className=="cuesTableReorderColumn"){
obj.cells[0].style.color=_8a;
}
if(cuesUsage=="webapp"){
if(typeof callbackTableRowSelected=="function"){
callbackTableRowSelected(obj.id,bOn,_85,_86,_88.name,_88.value);
}
}else{
window[icuesGetPortletId(_85,obj,true)+"_callbackTableRowSelected"](obj.id,bOn,_85,_86,_88.name,_88.value);
}
}
catch(e){
}
if(isFF){
cuesStopEventBubble(evt);
}
return true;
};
function cuesGetTableRow(_8f,_90){
var _91=null;
try{
_91=document.getElementById(_90);
}
catch(e){
}
return _91;
};
function cuesShowAllTableRows(_92){
try{
var _93=icuesFindTableObj(_92);
var _94=_93.rows.length;
for(var i=0;i<_94;i++){
_93.rows[i].style.display="";
}
}
catch(e){
}
};
function cuesShowErroredTableRows(_95){
try{
var _96=icuesFindTableObj(_95);
var _97=_96.rows.length;
for(var i=0;i<_97;i++){
if(icuesIsRowErrored(_96.rows[i])){
_96.rows[i].style.display="";
}else{
_96.rows[i].style.display="none";
}
}
}
catch(e){
}
};
function cuesScrollTableRowIntoView(_98,_99){
try{
var tbl=document.getElementById(_98+".td");
var div=document.getElementById(_98+".dd");
var row=document.getElementById(_99);
var _9a=icuesPhysicalTop(row)-icuesPhysicalTop(tbl);
var _9b=div.scrollWidth-div.offsetWidth;
div.scrollTop=Math.max(0,_9a-div.offsetHeight+row.offsetHeight+(_9b>0?cuesScrollerWidth:0));
}
catch(e){
}
};
function cuesSelectTableRow(_9c,_9d,_9e){
try{
var _9f=false;
var _a0=document.getElementById(_9d);
var _a1=_a0.cells[0].getElementsByTagName("input");
if(_a1.length==0&&_a0.cells[0].className=="cuesTableReorderColumn"){
_a1=_a0.cells[1].getElementsByTagName("input");
}
if(_a1[0].disabled){
return;
}
icuesTableRowMouseOutHandler(_a0);
if(!icuesIsRowSelected(_a0)){
_a0.className=icuesRowSelectedClass(_a0);
if(tablesWithColgroup[_9c]){
icuesMatchRowClass(_a0);
}
_a1[0].checked=true;
if(_a1[0].type.toLowerCase()=="checkbox"){
_9f=icuesManageTableGlobalCheckbox(_a0,_9c);
}else{
var _a2=icuesFindObjectByTagname(_a0,"TABLE");
var _a3=_a2.rows.length;
for(var i=0;i<_a3;i++){
if(icuesIsRowSelected(_a2.rows[i])&&_a2.rows[i]!=_a0){
_a2.rows[i].className=icuesRowUnselectedClass(_a2.rows[i]);
if(tablesWithColgroup[_9c]){
icuesMatchRowClass(_a2.rows[i],i);
}
}
}
}
if(!_9f){
cuesManageTableRowSelectionRules(_9c);
}
if(_9e){
cuesScrollTableRowIntoView(_9c,_9d);
}
if(cuesUsage=="webapp"){
if(typeof callbackTableRowSelected=="function"){
callbackTableRowSelected(_9d,true,_9c,null,_a1[0].name,_a1[0].value);
}
}else{
window[icuesGetPortletId(_9c,_a1[0],true)+"_callbackTableRowSelected"](_9d,true,_9c,null,_a1[0].name,_a1[0].value);
}
}
}
catch(e){
}
};
function icuesMarkTableRowAsSelected(_a4,_a5){
try{
var _a6=false;
var _a7=_a5.cells[0].getElementsByTagName("input");
if(_a7.length==0&&_a5.cells[0].className=="cuesTableReorderColumn"){
_a7=_a5.cells[1].getElementsByTagName("input");
}
if(_a7[0].disabled){
return;
}
if(!icuesIsRowSelected(_a5)){
_a5.className=icuesRowSelectedClass(_a5);
if(tablesWithColgroup[_a4]){
icuesMatchRowClass(_a5);
}
_a7[0].checked=true;
if(_a7[0].type.toLowerCase()=="checkbox"){
_a6=icuesManageTableGlobalCheckbox(_a5,_a4);
}else{
var _a8=icuesFindObjectByTagname(_a5,"TABLE");
var _a9=_a8.rows.length;
for(var i=0;i<_a9;i++){
if(icuesIsRowSelected(_a8.rows[i])&&_a8.rows[i]!=_a5){
_a8.rows[i].className=icuesRowUnselectedClass(_a8.rows[i]);
if(tablesWithColgroup[_a4]){
icuesMatchRowClass(_a8.rows[i],i);
}
}
}
}
}
}
catch(e){
}
};
function cuesDeselectTableRow(_aa,_ab,_ac){
try{
var _ad=document.getElementById(_ab);
var _ae=_ad.cells[0].getElementsByTagName("input");
if(_ae.length==0&&_ad.cells[0].className=="cuesTableReorderColumn"){
_ae=_ad.cells[1].getElementsByTagName("input");
}
if(_ae[0].disabled){
return;
}
if(icuesIsRowSelected(_ad)){
_ad.className=icuesRowUnselectedClass(_ad);
if(tablesWithColgroup[_aa]){
icuesMatchRowClass(_ad);
}
_ae[0].checked=false;
if(_ae[0].type.toLowerCase()=="checkbox"){
icuesManageTableGlobalCheckbox(_ad,_aa);
}
cuesManageTableRowSelectionRules(_aa);
if(_ac){
cuesScrollTableRowIntoView(_aa,_ab);
}
if(cuesUsage=="webapp"){
if(typeof callbackTableRowSelected=="function"){
callbackTableRowSelected(_ab,false,_aa,null,_ae[0].name,_ae[0].value);
}
}else{
window[icuesGetPortletId(_aa,_ae[0],true)+"_callbackTableRowSelected"](_ab,false,_aa,null,_ae[0].name,_ae[0].value);
}
}
}
catch(e){
}
};
function cuesDeselectAllTableRows(_af){
try{
var _b0=icuesFindTableObj(_af);
var _b1=_b0.rows.length;
var _b2;
var _b3;
var _b4;
for(var i=0;i<_b1;i++){
_b2=_b0.rows[i];
_b3=_b2.cells[0];
if(_b3.className=="cuesTableReorderColumn"){
_b3=_b2.cells[1];
}
if(_b3.tagName.toLowerCase()=="td"){
_b4=_b3.getElementsByTagName("input");
if(_b4.length>0&&_b4[0].checked){
_b4[0].checked=false;
_b2.className=icuesRowUnselectedClass(_b2);
if(tablesWithColgroup[_af]){
icuesMatchRowClass(_b2);
}
}
}
}
if(_b1>0){
icuesManageTableGlobalCheckbox(_b0.rows[0],_af);
}
cuesManageTableRowSelectionRules(_af);
}
catch(e){
}
};
function cuesSelectAllTableRows(_b5){
try{
var _b6=icuesFindTableObj(_b5);
var _b7=_b6.rows.length;
var _b8;
var _b9;
var _ba;
for(var i=0;i<_b7;i++){
_b8=_b6.rows[i];
_b9=_b8.cells[0];
if(_b9.className=="cuesTableReorderColumn"){
_b9=_b8.cells[1];
}
if(_b9.tagName.toLowerCase()=="td"){
_ba=_b9.getElementsByTagName("input");
if(_ba.length>0&&!_ba[0].checked){
_ba[0].checked=true;
_b8.className=icuesRowSelectedClass(_b8);
if(tablesWithColgroup[_b5]){
icuesMatchRowClass(_b8);
}
}
}
}
if(_b7>0){
icuesManageTableGlobalCheckbox(_b6.rows[0],_b5);
}
cuesManageTableRowSelectionRules(_b5);
}
catch(e){
}
};
function icuesManageTableGlobalCheckbox(obj,_bb){
try{
var _bc=icuesFindObjectByTagname(obj,"TABLE");
if(_bc!=null){
var _bd=true;
var _be=_bc.rows.length;
var _bf=_bc.rows[0];
if(_bf.className=="cuesTableAlignmentRow"){
_bf=_bc.rows[1];
}
var _c0=_bf.cells[0].getElementsByTagName("input");
if(_c0.length==0&&_bf.cells[0].className=="cuesTableReorderColumn"){
_c0=_bf.cells[1].getElementsByTagName("input");
}
var _c1=_c0[0];
var _c2=1;
var _c3=null;
if(tablesWithColgroup[_bb]){
_c3=document.getElementById(_bb+"_CG1.th");
}else{
_c3=document.getElementById(_bb+".th");
}
if(_c3!=null){
_c2=0;
_bf=_c3.rows[0];
if(_bf.className=="cuesTableAlignmentRow"){
_bf=_c3.rows[1];
}
_c0=_bf.cells[0].getElementsByTagName("input");
if(_c0.length==0&&_bf.cells[0].className=="cuesTableReorderColumn"){
_c0=_bf.cells[1].getElementsByTagName("input");
}
_c1=_c0[0];
}
var _c4=0;
for(var i=_c2;i<_be;i++){
_bf=_bc.rows[i];
try{
_c0=_bf.cells[0].getElementsByTagName("input");
if(_c0.length==0&&_bf.cells[0].className=="cuesTableReorderColumn"){
_c0=_bf.cells[1].getElementsByTagName("input");
}
if(_c0[0].disabled){
continue;
}
_c4++;
if(!_c0[0].checked){
_bd=false;
break;
}
}
catch(e){
}
}
if(icuesTableHasEmptyRow(_bb)||_c4==0){
_bd=false;
}
_c1.checked=_bd;
if(_bd){
cuesManageTableRowSelectionRules(_bb,"all");
if(_c4==1){
cuesManageTableRowSelectionRules(_bb,"only");
}
}
return _bd;
}
}
catch(e){
}
return false;
};
function icuesSelectTableRow(evt,obj,_c5,_c6){
var _c7=obj;
var bOn=false;
try{
var _c8=(isIE)?evt.srcElement:evt.target;
if(obj.tagName.toLowerCase()=="tr"){
try{
if(_c8.tagName.toLowerCase()=="input"&&_c8.getAttribute("rowselector")=="true"){
return true;
}
}
catch(e){
}
_c7=icuesGetRowSelectionObject(obj);
if(_c7.disabled){
return true;
}
}else{
obj=icuesFindObjectByTagname(obj,"TR");
}
if(icuesIsRowSelected(obj)){
obj.className=icuesRowUnselectedClass(obj);
_c7.checked=false;
}else{
var _c9=icuesGetStyleProperty(obj.cells[0],"color");
obj.className=icuesRowSelectedClass(obj);
_c7.checked=true;
bOn=true;
if(obj.cells.length>0&&obj.cells[0].className=="cuesTableReorderColumn"){
obj.cells[0].style.color=_c9;
}
}
if(tablesWithColgroup[_c5]){
icuesMatchRowClass(obj);
}
var _ca=icuesFindObjectByTagname(obj,"TABLE");
var _cb=_ca.rows.length;
for(var i=0;i<_cb;i++){
if(icuesIsRowSelected(_ca.rows[i])&&_ca.rows[i]!=obj){
_ca.rows[i].className=icuesRowUnselectedClass(_ca.rows[i]);
if(tablesWithColgroup[_c5]){
icuesMatchRowClass(_ca.rows[i],i);
}
}
}
cuesManageTableRowSelectionRules(_c5);
if(cuesUsage=="webapp"){
if(typeof callbackTableRowSelected=="function"){
callbackTableRowSelected(obj.id,bOn,_c5,_c6,_c7.name,_c7.value);
}
}else{
window[icuesGetPortletId(_c5,obj,true)+"_callbackTableRowSelected"](obj.id,bOn,_c5,_c6,_c7.name,_c7.value);
}
}
catch(e){
}
if(isFF){
cuesStopEventBubble(evt);
}
return true;
};
function icuesMatchRowClass(_cc,_cd){
try{
var _ce=icuesFindObjectByTagname(_cc,"TABLE");
var _cf=document.getElementById(_ce.id.replace("_CG1.","_CG2."));
if(_cf!=null){
if(_cd!=null){
_cf.rows[_cd].className=_cc.className;
return;
}
var _d0=_ce.rows.length;
for(var i=0;i<_d0;i++){
if(_ce.rows[i]==_cc){
_cf.rows[i].className=_cc.className;
return;
}
}
}
}
catch(e){
}
};
function cuesFindTableObj(_d1){
return icuesFindTableObj(_d1);
};
function icuesFindTableObj(_d2){
var _d3="cuesTableContent";
var _d4=null;
try{
if(_d2==null){
_d2=_d3;
}
if(tablesWithColgroup[_d2]){
_d4=document.getElementById(_d2+"_CG1.td");
}else{
_d4=document.getElementById(_d2);
}
if(_d4==null||_d4.className=="cuesTableTitleContainer"||_d4.className=="cuesTableTitlelessContainer"){
_d4=document.getElementById(_d2+".td");
if(_d4==null){
_d4=document.getElementById(_d3);
}
}
}
catch(e){
}
return _d4;
};
function icuesFindSecondaryTableObj(_d5){
var _d6=null;
try{
if(tablesWithColgroup[_d5]){
_d6=document.getElementById(_d5+"_CG2.td");
}
}
catch(e){
}
return _d6;
};
function icuesFindTableHeaderObj(_d7){
var _d8=null;
try{
_d8=document.getElementById(_d7+".th");
}
catch(e){
}
return _d8;
};
function icuesFindTableFooterObj(_d9){
return document.getElementById(_d9+"Footer");
};
function cuesGetSelectedTableRowIds(_da){
var _db=new Array();
try{
var _dc=icuesFindTableObj(_da);
var _dd=_dc.rows.length;
var _de;
var _df;
for(var i=0;i<_dd;i++){
_de=_dc.rows[i].cells[0];
if(_de.className=="cuesTableReorderColumn"){
_de=_dc.rows[i].cells[1];
}
if(_de.tagName.toLowerCase()=="td"){
_df=_de.getElementsByTagName("input");
if(_df.length>0&&_df[0].checked){
_db.push(_dc.rows[i].id);
}
}
}
}
catch(e){
}
return _db;
};
function cuesGetAllTableRowIds(_e0){
var _e1=new Array();
try{
var _e2=icuesFindTableObj(_e0);
var _e3=_e2.rows.length;
for(var i=0;i<_e3;i++){
if(_e2.rows[i].className.indexOf("cuesTable")==0){
_e1.push(_e2.rows[i].id);
}
}
}
catch(e){
}
return _e1;
};
function cuesGetSelectedTableRowNumbers(_e4){
var _e5=new Array();
try{
var _e6=icuesFindTableObj(_e4);
var _e7=_e6.rows.length;
var _e8;
var _e9;
for(var i=0;i<_e7;i++){
_e8=_e6.rows[i].cells[0];
if(_e8.className=="cuesTableReorderColumn"){
_e8=_e6.rows[i].cells[1];
}
if(_e8.tagName.toLowerCase()=="td"){
_e9=_e8.getElementsByTagName("input");
if(_e9.length>0&&_e9[0].checked){
_e5.push(i);
}
}
}
}
catch(e){
}
return _e5;
};
function cuesGetSelectableTableRowNumbers(_ea){
var _eb=new Array();
try{
var _ec=icuesFindTableObj(_ea);
var _ed=_ec.rows.length;
var _ee;
var _ef;
for(var i=0;i<_ed;i++){
_ee=_ec.rows[i].cells[0];
if(_ee.className=="cuesTableReorderColumn"){
_ee=_ec.rows[i].cells[1];
}
if(_ee.tagName.toLowerCase()=="td"){
_ef=_ee.getElementsByTagName("input");
if(_ef.length>0&&!_ef[0].disabled){
_eb.push(i);
}
}
}
}
catch(e){
}
return _eb;
};
function icuesDeselectTableRows(_f0){
try{
var _f1=icuesFindTableObj(_f0);
var _f2=_f1.rows.length;
var _f3;
var _f4;
var _f5;
for(var i=0;i<_f2;i++){
_f5=_f1.rows[i];
_f3=_f5.cells[0];
if(_f3.className=="cuesTableReorderColumn"){
_f3=_f5.cells[1];
}
if(_f3.tagName.toLowerCase()=="td"){
_f4=_f3.getElementsByTagName("input");
if(_f4.length>0&&_f4[0].checked){
if(icuesIsRowSelected(_f5)){
_f5.className=icuesRowUnselectedClass(_f5);
}
_f4[0].checked=false;
}
}
}
icuesManageTableGlobalCheckbox(_f1,_f0);
cuesManageTableRowSelectionRules(_f0,"none");
}
catch(e){
}
};
function cuesRemoveTableRows(_f6,_f7){
var _f8=false;
try{
var _f9=0;
if(isArray(_f7)){
_f9=_f7.length;
}else{
var _fa=_f7;
if(_fa==null){
return false;
}
_f7=new Array();
_f7.push(_fa);
_f9=1;
}
var _fb=icuesFindTableObj(_f6);
var _fc=_fb.rows.length;
var _fd;
var _fe;
var _ff;
var _100=0;
for(var i=_fc-1;i>=0;i--){
_fd=_fb.rows[i].id;
for(var j=0;j<_f9;j++){
if(_fd==_f7[j]){
if(i==0&&isIE&&_fc>1){
_fe=_fb.rows[1];
_ff=_fb.rows[0];
cuesCloneAttributes(_fe,_ff);
var _101=_fe.cells.length;
for(var k=0;k<_101;k++){
_ff.cells[k].innerHTML=_fe.cells[k].innerHTML;
cuesCloneAttributes(_fe.cells[k],_ff.cells[k]);
}
_fb.deleteRow(1);
_fc=_fb.rows.length;
}else{
_fb.deleteRow(i);
_fc=_fb.rows.length;
}
_f8=true;
_100++;
break;
}
}
if(_100==_f9){
break;
}
}
var _102=null;
if(tablesWithColgroup[_f6]){
var _102=icuesFindSecondaryTableObj(_f6);
var _fc=_102.rows.length;
var _fd;
var _fe;
var _ff;
var _100=0;
for(var i=_fc-1;i>=0;i--){
_fd=_102.rows[i].id;
for(var j=0;j<_f9;j++){
if(_fd==_f7[j]+".2"){
if(i==0&&isIE&&_fc>1){
_fe=_102.rows[1];
_ff=_102.rows[0];
cuesCloneAttributes(_fe,_ff);
var _101=_fe.cells.length;
for(var k=0;k<_101;k++){
_ff.cells[k].innerHTML=_fe.cells[k].innerHTML;
cuesCloneAttributes(_fe.cells[k],_ff.cells[k]);
}
_102.deleteRow(1);
_fc=_102.rows.length;
}else{
_102.deleteRow(i);
_fc=_102.rows.length;
}
_100++;
break;
}
}
if(_100==_f9){
break;
}
}
}
var _103=icuesTableHasAccessibilityRow(_f6);
if(((_fb.rows.length==0&&!_103)||(_fb.rows.length==1&&_103))||(icuesFindTableHeaderObj(_f6)==null&&((_fb.rows.length==1&&!_103)||(_fb.rows.length==2&&_103)))){
icuesAddEmptyClientTableRow(_f6);
}else{
icuesRestripeTableRows(_fb);
if(_102!=null){
icuesRestripeTableRows(_102);
}
}
icuesManageTableGlobalCheckbox(_fb.rows[0],_f6);
cuesManageTableRowSelectionRules(_f6);
if(icuesTabularGrid[_f6]!=null){
icuesRenumTabularGrid(_f6);
}
}
catch(e){
}
return _f8;
};
var excelApp=null;
function cuesExportTableToExcel(_104,_105,url){
try{
if(_105==null){
_105="table";
}
var _106=icuesFindTableObj(_104);
var _107=icuesFindTableHeaderObj(_104);
if(isIE&&url==null){
try{
if(excelApp==null){
excelApp=new ActiveXObject("Excel.Application");
}
var _108=excelApp.Workbooks.Add();
_108.worksheets("Sheet1").activate;
var _109=_108.activeSheet;
if(_105=="table"){
var data=new Array();
data.push("<table>");
if(_107!=null){
data.push(_107.innerHTML);
}
data.push(_106.innerHTML);
data.push("</table>");
var _10a=true;
try{
var _10b=_108.HTMLProject;
}
catch(e){
_10a=false;
}
if(_10a){
_108.HTMLProject.HTMLProjectItems.Item(1).Text=data.join("");
_108.HTMLProject.RefreshDocument();
}else{
var hack=document.createElement("textarea");
hack.innerText=data.join("");
var _10c=hack.createTextRange();
_10c.execCommand("Copy");
var _10d=_109.get_Range("A1",null);
_109.Paste(_10d,false);
}
}else{
var _10e,_10f,_110,_111;
var _112=1;
var _113=1;
if(_107!=null){
_110=_107.rows.length;
for(var i=0;i<_110;i++){
_10e=_107.rows[i];
if(_10e.className=="cuesTableAlignmentRow"){
continue;
}
_111=_10e.cells.length;
for(var j=0,_113=1;j<_111;j++){
_10f=_10e.cells[j];
if(_10f.className=="cuesTableReorderColumn"||_10f.className=="cuesTableSelectionColumn"){
continue;
}
_109.cells(_112,_113).value=_10f.innerText;
_113++;
}
_112++;
}
}
if(_106!=null){
_110=_106.rows.length;
for(var i=0;i<_110;i++){
_10e=_106.rows[i];
_111=_10e.cells.length;
for(var j=0,_113=1;j<_111;j++){
_10f=_10e.cells[j];
if(_10f.className=="cuesTableReorderColumn"||_10f.className=="cuesTableSelectionColumn"){
continue;
}
_109.cells(_112,_113).value=_10f.innerText;
_113++;
}
_112++;
}
}
_109.columns.autofit;
}
_109=null;
_108=null;
excelApp.visible=true;
return;
}
catch(e){
_109=null;
_108=null;
}
}
var _114=document.createElement("form");
if(url!=null){
_114.action=url;
}else{
if(_105=="table"){
_114.action=cuesKnownLocation+"/cues_utility/table_as_excel.jsp";
}else{
_114.action=cuesKnownLocation+"/cues_utility/table_as_exceldata.jsp";
}
}
_114.method="post";
_114.target="cuesExportTable";
var _115=document.createElement("input");
_115.type="hidden";
_115.name="data";
_114.appendChild(_115);
document.body.appendChild(_114);
var data=new Array();
if(_105=="table"){
data.push("<table>");
if(_107!=null){
data.push(_107.innerHTML);
}
data.push(_106.innerHTML);
data.push("</table>");
}else{
data.push("<Table>");
if(_107!=null){
data.push(icuesConvertTableToExcelml(_107));
}
data.push(icuesConvertTableToExcelml(_106));
data.push("</Table>");
}
_115.value=data.join("");
_114.submit();
}
catch(e){
throw e.message;
}
};
function cuesExportTableToWord(_116,url){
try{
var _117=icuesFindTableObj(_116);
var _118=icuesFindTableHeaderObj(_116);
if(isIE&&url==null){
try{
var _119=new ActiveXObject("Word.Application");
var _11a;
if(_119.Documents.Count>0){
_11a=_119.ActiveDocument;
}else{
_11a=_119.Documents.Add();
}
var data=new Array();
data.push("<w:tbl xmlns:w=\"http://schemas.microsoft.com/office/word/2003/wordml\"><w:tblPr><w:tblStyle w:val=\"TableGrid\"/><w:tblW w:w=\"5000\" w:type=\"pct\"/></w:tblPr>");
if(_118!=null){
data.push(icuesConvertTableToWordml(_118));
}
data.push(icuesConvertTableToWordml(_117));
data.push("</w:tbl>");
_11a.Content.InsertXML(data.join(""));
_119.visible=true;
_11a=null;
_119=null;
return;
}
catch(e){
_11a=null;
_119=null;
}
}
var _11b=document.createElement("form");
if(url!=null){
_11b.action=url;
}else{
_11b.action=cuesKnownLocation+"/cues_utility/table_as_word.jsp";
}
_11b.method="post";
_11b.target="cuesExportTable";
var _11c=document.createElement("input");
_11c.type="hidden";
_11c.name="data";
_11b.appendChild(_11c);
document.body.appendChild(_11b);
var data=new Array();
if(_118!=null){
data.push(icuesConvertTableToWordml(_118));
}
data.push(icuesConvertTableToWordml(_117));
_11c.value=data.join("");
_11b.submit();
}
catch(e){
throw e.message;
}
};
function icuesConvertTableToWordml(_11d){
var data=new Array();
try{
var _11e,_11f,_120;
_11e=_11d.rows.length;
for(var i=0;i<_11e;i++){
data.push("<w:tr>");
_120=_11d.rows[i];
_11f=_120.cells.length;
for(var j=0;j<_11f;j++){
data.push("<w:tc><w:p><w:r><w:t>"+_120.cells[j].innerHTML+"</w:t></w:r></w:p></w:tc>");
}
data.push("</w:tr>");
}
}
catch(e){
}
return data.join("");
};
function icuesConvertTableToExcelml(_121){
var data=new Array();
try{
var _122,_123,_124;
_122=_121.rows.length;
for(var i=0;i<_122;i++){
data.push("<Row>");
_124=_121.rows[i];
_123=_124.cells.length;
for(var j=0;j<_123;j++){
data.push("<Cell><Data ss:Type=\"String\">"+_124.cells[j].innerHTML+"</Data></Cell>");
}
data.push("</Row>");
}
}
catch(e){
}
return data.join("");
};
function cuesMergeHeaderCells(_125,span,_126){
try{
var _127;
if(tablesWithColgroup[_125]){
_127=document.getElementById(_125+"_CG1.th");
}else{
_127=document.getElementById(_125+".th");
}
if(_127==null){
_127=icuesFindTableObj(_125);
}
_127.rows[0].cells[0].rowSpan=span;
if(_126>1){
_127.rows[0].cells[1].rowSpan=span;
}
for(var i=1;i<span;i++){
for(var j=0;j<_126;j++){
_127.rows[i].deleteCell(0);
}
}
}
catch(e){
}
};
function icuesGetNumFixedTableCells(id){
var _128=0;
try{
var _129=cuesModelRow[id];
var _12a=_129.substring(0,1)=="T"?true:false;
var _12b=_129.substring(2,3)=="M"||_129.substring(2,3)=="S"?true:false;
if(_12b){
_128++;
}
if(_12a){
_128++;
}
}
catch(e){
}
return _128;
};
function cuesRebuildTableColumns(id,_12c,_12d,_12e){
if(_12d==null){
_12d=0;
}
if(_12e==null){
_12e=0;
}
var _12f=cuesModelRow[id];
if(_12f==null){
return;
}
var _130=_12f.substring(0,1)=="T"?true:false;
var _131=_12f.substring(1,2)=="T"?true:false;
var _132=_12f.substring(2,3)=="M"||_12f.substring(2,3)=="S"?true:false;
var _133=0;
if(_132){
_133++;
}
if(_130){
_133++;
}
var tbl=icuesFindTableObj(id);
var _134=tbl;
if(_131){
_134=document.getElementById(id+".th");
}
var _135=_134.rows[_134.rows.length-1];
var _136=_135.cells.length;
var _137=(_134.rows.length>2&&isIE)|(_134.rows.length>1&&isFF)?true:false;
if(_134.rows.length>1&&isIE&&(tbl.rows.length==0||(tbl.rows.length==1&&tbl.rows[0].className=="cuesTableRowEmpty"))){
_137=true;
}
var _138=_12c.length;
if(_137){
for(var i=_136-1;i>=0;i--){
_135.deleteCell(i);
}
}else{
for(var i=_136-1;i>=_138+_133;i--){
_135.deleteCell(i);
}
}
for(var i=_12d;i<_138-_12e;i++){
try{
var _139=_135.cells[i-_12d+_133];
_139.innerHTML="";
icuesRenderColumnHeader(_134,_12c[i],_139);
}
catch(e){
var _13a=document.createElement(_131?"TD":"TH");
_135.appendChild(_13a);
icuesRenderColumnHeader(_134,_12c[i],_13a);
}
}
var at=0;
if(_133==0){
at+=_12f.indexOf("<td");
}else{
for(var i=0;i<_133;i++){
at+=_12f.substring(at).indexOf("</td>")+5;
}
}
var _13b=_12f.substring(0,at);
for(var i=0;i<_138;i++){
_13b+="<td xpath=\""+_12c[i].value+"\">"+_12c[i].getAttribute("default")+"</td>";
}
_13b+="</tr></table>";
cuesModelRow[id]=_13b;
cuesModelRowDiv[id]=null;
cuesModelRowTemp[id]=null;
if(icuesTableHasEmptyRow(id)){
icuesRemoveEmptyClientTableRow(id);
icuesAddEmptyClientTableRow(id);
}
};
function icuesRenderColumnHeader(_13c,data,_13d){
var _13e=data.getAttribute("id");
var _13f=data.getAttribute("sorted");
var _140=data.getAttribute("level");
var _141=_13f!="none"?true:(data.getAttribute("reserve")||false);
if(_13f!=null){
var _142=["position:relative","width:100%","white-space:nowrap"];
var _143=["position:absolute","right:0px"];
var _144=_makeDiv({style:_142.join(";")},_13d);
var _145=_makeNode("SPAN",{style:_143.join(";"),innerHTML:"&nbsp;"},_144);
var _146=icuesRenderSortArrowIndicator(data,_145);
var _147=_makeNode("A",{id:[_13e,"sortlink"].join("_"),columnid:_13e,reservespace:_141,href:"javascript:void(0)",title:data.getAttribute("sortclue"),className:["cuesSortableColumn",(_141?"cuesSortableColumnReserve":null),"cuesSorted"+_13f].join(" ")},_144);
var _148=_13c.getAttribute("id");
var _149=_148.lastIndexOf(".th");
if(_149>0){
var _14a=_148.substring(0,_149);
_147.onclick=function(){
return cuesSortColumn(this.getAttribute("columnid"),_13f,_140,window.event,_14a);
};
}
var _14b=_makeNode("NOBR",{innerHTML:data.text},_147);
return _144;
}else{
var _14b=_makeNode("NOBR",{innerHTML:data.text},_13d);
return _14b;
}
};
function icuesRenderSortArrowIndicator(data,_14c){
var _14d=data.getAttribute("id");
var _14e=data.getAttribute("sorted");
var _14f=data.getAttribute("level");
var _150=_14e!="none"?true:(data.getAttribute("reserve")||false);
var _151=[_14d,"sorticon"].join("_");
var _152;
var _153=function(_154,_155,_156){
var _157=data.getAttribute("arrowclue")||((_155>=0)?"Ascending":"Descending");
var file=[["table-sort",(_155>0?"ascend":"descend")].join("-"),cuesImageSuffix,".gif"].join("");
var url=[cuesKnownLocation,cuesImageFolder,"/",file].join("");
var node=_makeNode("img",{id:_154,border:0,align:"absmiddle",alt:_157,title:_157,src:url},_156);
if(_155==0){
node.style.display="none";
}
};
if(_14e!="none"){
var _158=_14e=="ascending"?1:-1;
_152=_153(_151,_158,_14c);
if(_14f&&_14f!=""){
var _159=_makeNode("sup",{innerHTML:_14f},_14c);
}
}else{
_152=_153(_151,0,_14c);
}
return _152;
};
function cuesRebuildTableAccessibility(id,_15a){
try{
var _15b=cuesModelRow[id];
if(_15b==null){
return;
}
var _15c=_15b.substring(0,1)=="T"?true:false;
var _15d=_15b.substring(1,2)=="T"?true:false;
var _15e=_15b.substring(2,3)=="M"||_15b.substring(2,3)=="S"?true:false;
var row=icuesGetTableAccessibilityRow(id);
if(row!=null){
var _15f=0;
if(_15c){
_15f++;
}
if(_15e){
_15f++;
}
var _160=row.cells.length;
for(var i=_15f;i<_160;i++){
row.deleteCell(i);
}
var _160=_15a.length;
for(var i=0;i<_160;i++){
var _161=document.createElement("th");
row.appendChild(_161);
_161.innerHTML=_15a[i];
_161.setAttribite("scope","col");
}
}
}
catch(e){
}
};
function cuesClearTable(_162){
try{
var tbl=icuesFindTableObj(_162);
var rows=tbl.rows;
var _163=rows.length;
for(var i=_163-1;i>=0;i--){
if(rows[i].className=="CUESHEADER"||rows[i].className=="cuesTableRowAccessibility"){
break;
}
tbl.deleteRow(i);
}
if(tablesWithColgroup[_162]){
tbl=icuesFindSecondaryTableObj(_162);
var rows=tbl.rows;
var _163=rows.length;
for(var i=_163-1;i>=0;i--){
if(rows[i].className=="CUESHEADER"||rows[i].className=="cuesTableRowAccessibility"){
break;
}
tbl.deleteRow(i);
}
}
tbl.setAttribute("icuesState","");
}
catch(e){
}
};
function cuesSetTableSelectionCount(_164,_165){
try{
document.getElementById(_164+".selectioncount").innerHTML=_165;
}
catch(e){
}
};
function cuesSetTableBulkVisibleCount(_166,_167){
try{
document.getElementById(_166+".bulkvisible").innerHTML=_167;
}
catch(e){
}
};
function cuesSetTableBulkTotalCount(_168,_169){
try{
document.getElementById(_168+".bulktotal").innerHTML=_169;
}
catch(e){
}
};
var icuesBulkTimeout=null;
function cuesShowTableBulkSelection(_16a){
try{
if(icuesBulkTimeout==null){
icuesBulkTimeout=new Array();
}
document.getElementById(_16a+".bulkselectionarea").style.display="";
icuesSetOpacity(document.getElementById(_16a+".bulkselectionlayer"),100);
icuesBulkTimeout[_16a]=setTimeout("icuesFadeTableBulkSelection('"+_16a+"',100)",3000);
}
catch(e){
}
};
function cuesHideTableBulkSelection(_16b){
try{
document.getElementById(_16b+".bulkselectionarea").style.display="none";
if(icuesBulkTimeout[_16b]!=null){
clearTimeout(icuesBulkTimeout[_16b]);
icuesBulkTimeout[_16b]=null;
}
}
catch(e){
}
};
function icuesFadeTableBulkSelection(_16c,_16d){
try{
_16d-=10;
icuesSetOpacity(document.getElementById(_16c+".bulkselectionlayer"),Math.max(0,_16d));
if(_16d>0){
icuesBulkTimeout[_16c]=setTimeout("icuesFadeTableBulkSelection('"+_16c+"',"+_16d+")",200);
}else{
icuesBulkTimeout[_16c]=null;
}
}
catch(e){
}
};
function icuesSetOpacity(obj,_16e){
try{
if(isIE){
if(_16e==100){
obj.style.filter=null;
}else{
obj.style.filter="alpha(opacity="+_16e+")";
}
}else{
obj.style.opacity=_16e/100;
}
}
catch(e){
}
};
function cuesSetTableRowSelectionTooltip(_16f,text){
try{
icuesGetRowSelectionObject(cuesGetTableRow(null,_16f)).title=text;
}
catch(e){
}
};
function cuesSetTableRowSelectionValue(_170,text){
try{
icuesGetRowSelectionObject(cuesGetTableRow(null,_170)).value=text;
}
catch(e){
}
};
function cuesUpdateTableRows(_171,url){
try{
var _172=cuesHTTP(url);
var _173=document.createElement("div");
_173.innerHTML=_172;
var _174=_173.getElementsByTagName("table");
var _175=icuesGetNumFixedTableCells(_171);
var _176=_174[_174.length-1];
var _177=_176.rows.length;
for(var i=0;i<_177;i++){
var _178=_176.rows[i];
var _179=document.getElementById(_178.id);
if(_179!=null){
var _17a=_178.cells.length;
for(var j=0;j<_17a;j++){
_179.cells[_175+j].innerHTML=_178.cells[j].innerHTML;
}
}
}
_173=null;
}
catch(e){
}
};
function cuesReplaceTableRows(_17b,url,_17c,_17d,_17e){
try{
var _17f=cuesHTTP(url);
cuesClearTable(_17b);
var _180=document.getElementById(_17b+".td").getElementsByTagName("tbody")[0];
var _181=document.createElement("div");
_181.innerHTML=_17f;
var _182=_181.getElementsByTagName("table");
var _183=_182[_182.length-1];
var _184=_183.rows.length;
for(var i=0;i<_184;i++){
_180.appendChild(_183.rows[i].cloneNode(true));
}
if(_17c!=null&&_17d!=null&&_17e!=null){
icuesUpdateClientTablePagingControls(_17b,_17c*_17d,_17d/1,_17e/1,_17d/1);
}
_181=null;
}
catch(e){
}
};
function cuesShowClearColumnFilter(id,obj){
try{
if(id==null&&obj!=null){
id=obj.id;
}
document.getElementById(id+".clear").style.visibility="visible";
}
catch(e){
}
};
function cuesHideClearColumnFilter(id,obj){
try{
if(id==null&&obj!=null){
id=obj.id;
}
document.getElementById(id+".clear").style.visibility="hidden";
}
catch(e){
}
};
function icuesClearColumnFilter(obj){
try{
document.getElementById(obj.id.replace(".clear","")).value="";
var _185=obj.getAttribute("action");
if(_185.indexOf("javascript:")==0){
while(_185.indexOf("&amp;apos;")!=-1){
_185=_185.replace("&amp;apos;","'");
}
while(_185.indexOf("&apos;")!=-1){
_185=_185.replace("&apos;","'");
}
eval(_185);
}else{
window.location=_185;
}
}
catch(e){
}
};
function icuesScrollableTable(_186){
this.align=_187;
this.icuesComputeSpannedColumnWidths=_188;
this.removeAllExtraCols=_189;
var id=_186;
var _18a;
var _18b;
var _18c=0;
var _18d;
var div1=null;
var div2=null;
var div3=null;
var tbl0=null;
var tbl1=null;
var tbl2=null;
var tbl3=null;
var _18e;
var _18f;
var _190;
var _191;
var _192="";
var _193=false;
var _194=15;
function _187(_195,_196,_197){
_18a=_195;
_18d=(_196==null)?false:_196;
if(tablesWithColgroup[id]){
var _198=_199();
_19a(_198[0],_198[1]);
_19a(_198[1],_198[0]);
_19b(document.getElementById(id+"_CG1.th"),document.getElementById(id+"_CG2.th"));
_19b(document.getElementById(id+"_CG1.td"),document.getElementById(id+"_CG2.td"));
_19b(document.getElementById(id+"_CG1.ts"),document.getElementById(id+"_CG2.ts"));
_19c(id+_198[0],id+_198[1]);
}else{
if(_197){
tbl0=document.getElementById(id);
tbl0.width="25%";
_19a("");
tbl0.width="";
_19a("");
}else{
try{
if(isIE){
if(document.getElementById(id+".th").getAttribute("icuesState")==null){
_19a("");
}
}
}
catch(e){
}
_19a("");
}
}
};
function _19d(msg,_19e,_19f,_1a0){
cuesLog("analyze:"+msg);
var _1a1=Math.min(_19e.length,_19f.length);
if(_1a0==null){
for(var i=0;i<_1a1;i++){
cuesLog("1.w="+_19e[i].width+" 2.w="+_19f[i].width+" 1.ow="+_19e[i].offsetWidth+" 2.ow="+_19f[i].offsetWidth);
}
}else{
for(var i=0;i<_1a1;i++){
cuesLog("1.w="+_19e[i].width+" 2.w="+_19f[i].width+" 1.ow="+_19e[i].offsetWidth+" 2.ow="+_19f[i].offsetWidth+" w="+_1a0[i]);
}
}
};
function _1a2(){
var _1a3=null;
try{
var _1a4=tbl2.rows.length;
if(_1a4>0){
var _1a5=0;
if(tbl2.rows[0].className=="cuesTableRowAccessibility"){
_1a5++;
}
for(var i=_1a5;i<_1a4;i++){
if(tbl2.rows[i].style.display!="none"){
_1a3=tbl2.rows[i];
break;
}
}
}
}
catch(e){
}
return _1a3;
};
function _189(){
try{
tbl1=document.getElementById(id+".th");
tbl2=document.getElementById(id+".td");
tbl3=document.getElementById(id+".ts");
var cnt=_188(tbl1).length;
_1a6(tbl1,cnt);
_1a6(tbl2,cnt);
if(tbl3!=null){
_1a6(tbl3,cnt);
}
}
catch(e){
}
};
function _1a6(tbl,cnt){
try{
if(tbl.rows.length==0){
return;
}
var cols=tbl.getElementsByTagName("col");
for(var i=cols.length-1;i>=cnt;i--){
try{
cols[i].parentNode.removeChild(cols[i]);
}
catch(e){
}
}
}
catch(e){
}
};
function _1a7(tbl){
try{
if(tbl.rows.length==0){
return;
}
var cols=tbl.getElementsByTagName("col");
for(var i=cols.length-1;i>=0;i--){
try{
cols[i].parentNode.removeChild(cols[i]);
}
catch(e){
}
}
}
catch(e){
}
};
function _1a8(tbl,_1a9){
var _1aa=tbl.firstChild;
var _1ab=_1a9.length;
var _1ac;
for(var i=0;i<_1ab;i++){
_1ac=document.createElement("col");
_1ac.width=_1a9[i];
tbl.insertBefore(_1ac,_1aa);
}
};
function _1ad(tbl,cnt,_1ae,_1af){
try{
if(_1af==null){
_1af="";
}
for(var i=0;i<cnt;i++){
var _1b0=document.createElement("col");
_1b0.className="cuesNowrap";
_1b0.width=_1af;
_1ae.parentNode.insertBefore(_1b0,_1ae);
}
}
catch(e){
}
};
function _1b1(_1b2,_1b3){
try{
var _1b4=_191.length;
if(_18e!=null){
if(_1b4>_18e.length){
_1ad(tbl1,_1b4-_18e.length,_18e[_18e.length-1]);
_18e=tbl1.getElementsByTagName("col");
}
for(var i=0;i<_1b4;i++){
_18e[i].width=_191[i];
}
}
}
catch(e){
}
try{
if(_18f!=null){
if(_1b4>_18f.length){
_1ad(tbl2,_1b4-_18f.length,_18f[_18f.length-1]);
_18f=tbl2.getElementsByTagName("col");
}
if(_1b2){
if(_1b3!=null){
for(var i=0;i<_1b3;i++){
_18f[i].width=_191[i];
}
for(var i=_1b3;i<_1b4;i++){
_18f[i].width="*";
}
}
}else{
for(var i=0;i<_1b4;i++){
_18f[i].width=_191[i];
}
}
}
}
catch(e){
}
try{
if(_190!=null){
if(_1b4>_190.length){
_1ad(tbl3,_1b4-_190.length,_190[_190.length-1]);
_190=tbl3!=null?tbl3.getElementsByTagName("col"):null;
}
for(var i=0;i<_1b4;i++){
_190[i].width=_191[i];
}
}
}
catch(e){
}
};
function _1b5(){
var idx=0;
_18c=0;
if(tbl1.getAttribute("reorderable")=="true"){
_18c+=_191[0];
idx=1;
}
if(tbl1.rows[0].cells[idx].className=="cuesTableSelectionColumn"){
_18c+=_191[idx];
}
};
function _1b6(cols){
try{
var _1b7=_191.length;
var _1b8,_1b9;
for(var i=0;i<_1b7;i++){
_1b9=cols[i].getAttribute("userassigned");
if(_1b9!=null&&_1b9!=""){
_191[i]=_1b9/1;
tbl1.rows[0].cells[i].style.width=_191[i];
tbl2.rows[0].cells[i].style.width=_191[i];
if(tbl3!=null){
tbl3.rows[0].cells[i].style.width=_191[i];
}
_193=true;
continue;
}
_1b8=cols[i].getAttribute("suggested");
if(_1b8!=null&&_1b8!="*"&&_1b8!="auto"){
if(_1b8.indexOf("%")!=-1){
try{
_1b8=Math.round((_1b8.replace("%","")/100)*(_18b-_18c));
if(isNaN(_1b8)){
continue;
}
}
catch(e){
continue;
}
}
_191[i]=Math.max(_191[i],_1b8);
}
}
}
catch(e){
}
};
function _1ba(){
var w=0;
try{
var _1bb=_1bc(false);
var _1bd=_1bb.length;
for(var i=0;i<_1bd;i++){
w+=_1bb[i];
}
}
catch(e){
}
return w;
};
function _188(tbl){
var _1be=new Array();
try{
var _1bf=tbl.rows[0];
var _1c0=tbl.rows[1];
var _1c1=_1bf.cells.length;
var idx=0;
var idx2=0;
var _1c2=1;
var _1c3=1;
for(var i=0;i<_1c1;i++){
try{
_1c2=_1bf.cells[i].colSpan;
}
catch(e){
_1c2=1;
}
try{
_1c3=_1bf.cells[i].rowSpan;
}
catch(e){
_1c3=1;
}
if(_1c2==1){
if(isIE){
_1be[idx]=_1bf.cells[i].scrollWidth+2;
try{
if(_1c3==1&&_1c0!=null){
_1be[idx]=Math.max(_1be[idx],_1c0.cells[idx2].scrollWidth+2);
}
}
catch(e){
}
}else{
_1be[idx]=_1bf.cells[i].offsetWidth;
try{
if(_1c3==1&&_1c0!=null){
_1be[idx]=Math.max(_1be[idx],_1c0.cells[idx2].offsetWidth);
}
}
catch(e){
}
}
idx++;
if(_1c3==1){
idx2++;
}
}else{
var _1c4=isIE?_1bf.cells[i].scrollWidth+2:_1bf.cells[i].offsetWidth;
if(_1c0!=null){
var _1c5=0;
for(var j=0;j<_1c2;j++,idx++,idx2++){
try{
_1be[idx]=isIE?_1c0.cells[idx2].scrollWidth+2:_1c0.cells[idx2].offsetWidth;
}
catch(e){
_1be[idx]=1;
}
_1c5+=_1be[idx];
}
if(_1c4>_1c5){
_1be[idx-1]+=(_1c4-_1c5);
}
}else{
if(isFF2){
_1bf.cells[i].style.width=1;
_1c4=_1bf.cells[i].scrollWidth;
_1bf.cells[i].style.width=null;
}
var _1c6=Math.ceil(_1c4/_1c2);
for(var j=0;j<_1c2;j++,idx++,idx2++){
_1be[idx]=_1c6;
}
}
}
}
}
catch(e){
}
return _1be;
};
function _1bc(_1c7){
var _1c8=new Array();
try{
var _1c9=new Array();
var _1ca=new Array();
var _1cb=_188(tbl1);
if(!_1c7&&tbl2!=null&&tbl2.rows.length>0&&!icuesTableHasEmptyRow(id)){
if(isIE){
var _1cc=tbl2.rows.length;
var _1cd=tbl2.rows[0].cells.length;
for(var i=0;i<_1cd;i++){
var w=0;
for(var j=0;j<_1cc;j++){
if(tbl2.rows[j].offsetHeight>1){
try{
w=Math.max(w,tbl2.rows[j].cells[i].scrollWidth+2);
}
catch(e){
}
}
}
_1c9[i]=w;
}
}else{
var _1ce=_1a2();
var _1cd=_1ce.cells.length;
for(var i=0;i<_1cd;i++){
try{
_1c9.push(_1ce.cells[i].offsetWidth);
}
catch(e){
_1c9.push(1);
}
}
}
}else{
_1c9=_1cb;
}
if(tbl3!=null){
_1ca=_188(tbl3);
}
var _1cf=Math.min(_1cb.length,_1c9.length);
_1a6(tbl1,_1cf);
_1a6(tbl2,_1cf);
if(tbl3!=null){
_1a6(tbl3,_1cf);
}
var _1d0;
for(var i=0;i<_1cf;i++){
_1d0=Math.max(_1cb[i],_1c9[i]);
if(tbl3!=null&&_1ca[i]!=null){
_1d0=Math.max(_1d0,_1ca[i]);
}
_1c8.push(_1d0);
}
}
catch(e){
}
return _1c8;
};
function _1d1(_1d2){
try{
var gap=div2.offsetWidth-div2.clientWidth;
if(isIE){
gap+=2;
}
if(_1d2+gap<_18b){
var _1d3=gap+4;
if(isSafari||isChrome){
_1d3-=2;
}
var _1d4=_191[_191.length-1]-_1d3;
_18e[_191.length-1].width=_18f[_191.length-1].width=_1d4;
if(_190!=null){
_190[_191.length-1].width=_1d4;
}
_191[_191.length-1]=_1d4;
if(isSafari||isChrome){
var w=tbl1.clientWidth-_1d3;
tbl1.style.width=w;
tbl2.style.width=w;
if(tbl3!=null){
tbl3.style.width=w;
}
}
}
var _1d5=div2.scrollWidth-div2.offsetWidth;
div1.style.paddingRight=_194;
if(div3!=null){
div3.style.paddingRight=_194;
}
if(!isIE){
div1.style.width=_18b-_194-2;
if(div3!=null){
div3.style.width=_18b-_194-2;
}
if(_1d5>2&&isFF3){
div1.style.width=_18b-_194-2-_194;
if(div3!=null){
div3.style.overflowY="scroll";
}
}
}
if(_1d5>2&&!_18d){
div2.style.height=Math.min(_18a,tbl2.offsetHeight+_194+2+(isIE6?1:0));
}else{
div2.style.height=_18a;
}
}
catch(e){
}
};
function _199(){
var _1d6=new Array("_CG1","_CG2");
try{
if(document.getElementById(id+"_CG2.dd").getAttribute("colgroup")=="fixed"){
_1d6=new Array("_CG2","_CG1");
}
}
catch(e){
}
return _1d6;
};
function _19c(_1d7,_1d8){
try{
var _1d9=document.getElementById(_1d7+".dd");
var _1da=document.getElementById(_1d8+".dd");
if(_1da.scrollWidth>_1da.offsetWidth){
_1d9.style.height=_1da.offsetHeight-19;
}
_1d9.style.overflow="hidden";
var _1d9=document.getElementById(_1d7+".dh");
var _1da=document.getElementById(_1d8+".dh");
var h=Math.max(_1d9.offsetHeight,_1da.offsetHeight);
_1d9.style.height=h;
_1da.style.height=h;
}
catch(e){
}
};
function _19b(tbl1,tbl2){
try{
var _1db=tbl1.rows.length;
var _1dc=tbl2.rows.length;
if(_1db!=_1dc){
return;
}
var h;
for(var i=0;i<_1db;i++){
h=Math.max(tbl1.rows[i].offsetHeight,tbl2.rows[i].offsetHeight);
tbl1.rows[i].style.height=h;
tbl2.rows[i].style.height=h;
}
tbl1.style.display="none";
tbl2.style.display="none";
tbl1.style.display="";
tbl2.style.display="";
}
catch(e){
}
};
function _1dd(_1de){
try{
_191=_1bc(true);
var _1df=_191.length;
var w=0;
for(var i=0;i<_1df;i++){
w+=_191[i];
}
_1a6(tbl1,_1df);
_1a6(tbl2,_1df);
_1a6(tbl3,_1df);
tbl1.style.tableLayout="fixed";
tbl2.style.tableLayout="fixed";
if(tbl3!=null){
tbl3.style.tableLayout="fixed";
}
var _1e0=0;
if(tbl1.getAttribute("reorderable")=="true"){
_1e0++;
}
try{
if(tbl1.rows[0].cells[_1e0].getAttribute("selectable")=="true"){
_1e0++;
}
}
catch(e){
}
_1b1(isFF2,_1e0);
var _1e1=false;
if(w>_18b){
w+=(2*_1df);
_1e1=true;
}else{
if(_192=="none"&&isFF){
w=_18b;
}else{
var _1e2=(_18b-w)-2;
_191[_191.length-1]+=_1e2;
w+=_1e2-2;
_1b1(isFF2);
}
}
if(_1de==""&&isIE){
div1.style.width="100%";
}else{
div1.style.width=_18b-(isIE?0:2);
}
tbl1.style.width=w;
if(_18d){
div2.style.height=_18a;
}else{
div2.style.height="auto";
}
if(_1de==""&&isIE){
div2.style.width="100%";
}else{
div2.style.width=_18b-(isIE?0:2);
}
if(!_1e1&&!isFF2){
tbl2.style.width="100%";
}else{
tbl2.style.width=w;
if(isIE){
div2.style.height=div2.offsetHeight+_194+2+(isIE6?1:0);
}
}
if(div3!=null){
if(_1de==""&&isIE){
div3.style.width="100%";
}else{
div3.style.width=_18b-(isIE?0:2);
}
tbl3.style.width=w;
}
tbl1.setAttribute("icuesState","aligned");
}
catch(e){
}
};
function _1e3(){
tbl1.setAttribute("icuesState","");
if(isIE){
div1.style.width="auto";
div2.style.width="auto";
if(div3!=null){
div3.style.width="auto";
}
tbl1.style.width="auto";
tbl2.style.width="auto";
if(tbl3!=null){
tbl3.style.width="auto";
}
tbl1.style.tableLayout="auto";
tbl2.style.tableLayout="auto";
if(tbl3!=null){
tbl3.style.tableLayout="auto";
}
div1.style.paddingRight=0;
if(div3!=null){
div3.style.paddingRight=0;
}
for(var i=0;i<_18e.length;i++){
_18e[i].width=null;
}
for(var i=0;i<_18f.length;i++){
_18f[i].width=null;
}
if(_190!=null){
for(var i=0;i<_190.length;i++){
_190[i].width=null;
}
}
_191=_1bc(false);
}else{
div1.style.overflowY="hidden";
if(div3!=null){
div3.style.overflowY="hidden";
}
div1.style.width="auto";
div2.style.width="auto";
if(div3!=null){
div3.style.width="auto";
}
tbl1.style.width="auto";
tbl2.style.width="auto";
if(tbl3!=null){
tbl3.style.width="auto";
}
tbl1.style.tableLayout="auto";
tbl2.style.tableLayout="auto";
if(tbl3!=null){
tbl3.style.tableLayout="auto";
}
div1.style.paddingRight=0;
if(div3!=null){
div3.style.paddingRight=0;
}
for(var i=0;i<_18e.length;i++){
_18e[i].width=null;
}
for(var i=0;i<_18f.length;i++){
_18f[i].width=null;
}
if(_190!=null){
for(var i=0;i<_190.length;i++){
_190[i].width=null;
}
}
if(isSafari||isChrome){
tbl2.style.width="20";
}
var _1e4=new Array();
var _1e5=new Array();
var _1e6=new Array();
_1e4=_188(tbl1);
var _1e7=_1a2();
if(_1e7!=null){
var _1e8=_1e7.cells.length;
if(isFF){
for(var i=0;i<_1e8;i++){
_1e5[i]=_1e7.cells[i].scrollWidth;
}
}else{
for(var i=0;i<_1e8;i++){
_1e5[i]=_1e7.cells[i].offsetWidth;
}
}
}else{
_1e5=_188(tbl1);
}
if(tbl3!=null){
_1e6=_188(tbl3);
}
for(var i=_1e5.length;i<_1e4.length;i++){
_1e5[i]=1;
}
var _1e9=Math.max(_1e4[_1e4.length-1],_1e5[_1e5.length-1]);
_18e[_18e.length-1].width=_1e9;
_18f[_18f.length-1].width=_1e9;
if(_190!=null){
_190[_190.length-1].width=_1e9;
}
var _1ea=Math.min(_1e4.length,_1e5.length);
var _1eb;
_191=new Array();
for(var i=0;i<_1ea;i++){
_1eb=Math.max(_1e4[i],_1e5[i]);
if(tbl3!=null&&_1e6[i]!=null){
_1eb=Math.max(_1eb,_1e6[i]);
}
_191.push(_1eb);
}
_1a6(tbl1,_1e4.length);
_1a6(tbl2,_1e4.length);
if(tbl3!=null){
_1a6(tbl3,_1e4.length);
}
}
};
function _19a(_1ec,_1ed){
try{
_191=new Array();
div1=document.getElementById(id+_1ec+".dh");
div2=document.getElementById(id+_1ec+".dd");
div3=document.getElementById(id+_1ec+".ds");
tbl0=document.getElementById(id);
tbl1=document.getElementById(id+_1ec+".th");
tbl2=document.getElementById(id+_1ec+".td");
tbl3=document.getElementById(id+_1ec+".ts");
_18b=tbl0.offsetWidth;
var _1ee=document.getElementById(id+"Footer");
if(_1ee!=null){
_1ee.style.width=_18b;
}
_192="";
if(_1ec!=""){
if(div2.getAttribute("colgroup")=="fixed"){
_192="none";
}
if(_192==""&&_1ed!=null){
_18b-=document.getElementById(id+_1ed+".dd").offsetWidth;
}else{
if(isIE){
_18b=_1ba();
}else{
_18b=Math.max(Math.max(div1.parentNode.offsetWidth,tbl1.offsetWidth),Math.max(div2.parentNode.offsetWidth,tbl2.offsetWidth));
if(div3!=null){
_18b=Math.max(_18b,Math.max(div3.parentNode.offsetWidth,tbl3.offsetWidth));
}
}
}
}
_18e=tbl1.getElementsByTagName("col");
_18f=tbl2.getElementsByTagName("col");
_190=tbl3!=null?tbl3.getElementsByTagName("col"):null;
if(icuesTableHasEmptyRow(id)){
if(tbl1.getAttribute("icuesState")=="aligned"){
_1e3();
}
_1dd(_1ec);
return;
}
if(tbl1.getAttribute("icuesState")=="aligned"){
_1e3();
}else{
_191=_1bc(false);
}
_1b5();
_1b6(_18e);
div1.style.width=_18b-(isIE?0:2);
div2.style.width=_18b-(isIE?0:2);
if(div3!=null){
div3.style.width=_18b-(isIE?0:2);
}
div2.style.height=_18a;
var w=0;
var _1ef=_191.length;
for(var i=0;i<_1ef;i++){
w+=_191[i];
}
var _1f0=w;
if(w<_18b){
var _1f1=(_18b-w)-2;
_191[_191.length-1]+=_1f1;
w+=_1f1-2;
if((isFF||isChrome||isSafari)&&icuesIsTreeTable(tbl2)){
tbl1.style.tableLayout="auto";
tbl2.style.tableLayout="auto";
if(tbl3!=null){
tbl3.style.tableLayout="auto";
}
tbl1.style.width=w+2;
tbl2.style.width=w+2;
if(tbl3!=null){
tbl3.style.width=w+2;
}
tbl1.style.tableLayout="fixed";
tbl2.style.tableLayout="fixed";
if(tbl3!=null){
tbl3.style.tableLayout="fixed";
}
_1b1(false);
var _1f2=div2.scrollWidth-div2.offsetWidth;
if(div2.scrollHeight>div2.offsetHeight||(div2.scrollHeight+_1f2<div2.offsetHeight&&_1f2>0)){
if(_192==""){
_1d1(_1f0);
}else{
div2.style.height=_18a;
}
}else{
if(!_18d){
div2.style.height="auto";
}
}
tbl1.setAttribute("icuesState","aligned");
return;
}
}else{
w+=(2*_1ef);
tbl1.style.width="auto";
tbl2.style.width="auto";
if(tbl3!=null){
tbl3.style.width="auto";
}
}
_18e=tbl1.getElementsByTagName("col");
_18f=tbl2.getElementsByTagName("col");
_190=(tbl3!=null)?tbl3.getElementsByTagName("col"):null;
if(w>_18b){
if(isFF||isSafari||isChrome){
div1.style.paddingRight=_194;
div1.style.width=_18b-_194-2;
if(div3!=null){
div3.style.paddingRight=_194;
div3.style.width=_18b-_194-2;
}
tbl1.style.tableLayout="auto";
tbl2.style.tableLayout="auto";
if(tbl3!=null){
tbl3.style.tableLayout="auto";
}
tbl1.style.width=w+1;
tbl2.style.width=w;
if(tbl3!=null){
tbl3.style.width=w+1;
}
tbl1.style.tableLayout="fixed";
tbl2.style.tableLayout="fixed";
if(tbl3!=null){
tbl3.style.tableLayout="fixed";
}
_1b1(false);
var _1f2=div2.scrollWidth-div2.offsetWidth;
var _1f3=div2.scrollHeight-div2.offsetHeight;
if(div2.scrollHeight>div2.offsetHeight||(_18d&&Math.abs(_1f3)<=17&&_1f2>0)||div2.scrollHeight+_1f2<div2.offsetHeight){
if(_192==""){
_1d1(_1f0);
}else{
div2.style.height=_18a;
}
}else{
if(!_18d){
div2.style.height="auto";
}
}
tbl1.setAttribute("icuesState","aligned");
return;
}else{
if(_18d){
var _1f2=div2.scrollWidth-div2.offsetWidth;
var _1f3=div2.scrollHeight-div2.offsetHeight;
if(Math.abs(_1f3)<=17&&_1f2>0){
div1.style.paddingRight="17px";
}
}
tbl1.style.width=w;
tbl2.style.width=w;
if(tbl3!=null){
tbl3.style.width=w;
}
}
}
_1b1(false);
if((isFF||isSafari||isChrome)&&_193){
tbl1.style.width=w;
tbl2.style.width=w;
if(tbl3!=null){
tbl3.style.width=w;
}
}else{
if(isFF){
tbl1.style.width=w+"px";
tbl2.style.width=null;
}else{
if(isSafari||isChrome){
tbl1.style.width=w+"px";
tbl2.style.width=w+"px";
}else{
tbl1.style.width="auto";
tbl2.style.width="auto";
}
}
if(tbl3!=null){
tbl3.style.width="auto";
}
}
tbl1.style.tableLayout="fixed";
tbl2.style.tableLayout="fixed";
if(tbl3!=null){
tbl3.style.tableLayout="fixed";
}
var _1f2=div2.scrollWidth-div2.offsetWidth;
if(div2.scrollHeight>div2.offsetHeight||(isIE&&_1f2>0&&div2.scrollHeight+_194<div2.offsetHeight)){
if(_192==""){
_1d1(_1f0);
}else{
div2.style.height=_18a;
}
}else{
if(!_18d){
div2.style.height="auto";
}
}
tbl1.setAttribute("icuesState","aligned");
}
catch(e){
}
};
};
function cuesGetTableColumnWidths(_1f4){
var _1f5=new Array();
try{
var tbl=document.getElementById(_1f4+".th");
var cols=tbl.getElementsByTagName("col");
var _1f6=cols.length;
for(var i=0;i<_1f6;i++){
_1f5.push(cols[i].width);
}
}
catch(e){
}
return _1f5;
};
function cuesSetTableColumnWidths(_1f7,_1f8){
try{
var tbl1=document.getElementById(_1f7+".th");
var tbl2=document.getElementById(_1f7+".td");
var _1f9=tbl1.getElementsByTagName("col");
var _1fa=tbl2.getElementsByTagName("col");
var _1fb=Math.min(Math.min(_1f8.length,_1f9.length),_1fa.length);
for(var i=0;i<_1fb;i++){
try{
_1f9[i].width=_1f8[i];
_1f9[i].setAttribute("suggested",_1f8[i]);
}
catch(e){
}
try{
_1fa[i].width=_1f8[i];
_1fa[i].setAttribute("suggested",_1f8[i]);
}
catch(e){
}
}
if(isIE){
_1f9[_1fb-1].width=null;
_1fa[_1fb-1].width=null;
}
tbl1.setAttribute("icuesState","");
}
catch(e){
}
};
function cuesAlignTable(id,_1fc,_1fd,_1fe){
if(isChrome||isSafari){
_1fe=true;
}
var tbl=new icuesScrollableTable(id);
tbl.align(_1fc,_1fd,_1fe);
tbl=null;
};
function icuesComputeSpannedTableColumWidths(_1ff){
var _200=new Array();
try{
var tbl=new icuesScrollableTable();
_200=tbl.icuesComputeSpannedColumnWidths(_1ff);
tbl=null;
}
catch(e){
}
return _200;
};
function icuesReduceTableCols(id){
try{
var tbl=new icuesScrollableTable(id);
tbl.removeAllExtraCols();
tbl=null;
}
catch(e){
}
};
function cuesScrollHandler(id){
try{
var div1=document.getElementById(id+".dh");
var div2=document.getElementById(id+".dd");
var div3=document.getElementById(id+".ds");
div1.scrollLeft=div2.scrollLeft;
if(div3!=null){
div3.scrollLeft=div2.scrollLeft;
}
}
catch(e){
}
return true;
};
function cuesScrollTable(id,_201){
try{
var div2=document.getElementById(id+".dd");
switch(_201){
case "top":
div2.scrollTop=0;
break;
case "bottom":
div2.scrollTop=100000;
break;
}
}
catch(e){
}
};
function cuesGetMaxAllowableTableHeight(_202,_203){
try{
if(_203==null){
_203="cuesContentArea";
}
var _204=document.getElementById(_203);
if(_204==null){
_204=document.body;
}
var _205=_204.offsetHeight;
var _206=icuesPhysicalTop(_204);
var _207=icuesPhysicalTop(icuesFindTableObj(_202));
var _208=_207-_206;
var _209=icuesFindTableFooterObj(_202);
var _20a=(_209==null)?0:_209.offsetHeight;
var _20b=10;
var _20c=document.getElementById(_202);
if(_20c!=null){
if(_20c.offsetHeight<10){
_20b=35;
}
}
return Math.max(50,_205-_208-_20a-_20b);
}
catch(e){
return 50;
}
};
function cuesGetFullTableHeight(_20d){
try{
var div2=document.getElementById(_20d+".dd");
return div2.scrollHeight+2;
}
catch(e){
return 0;
}
};
function cuesGetFullTableWidth(_20e){
try{
var div1=document.getElementById(_20e+".dd");
var div2=document.getElementById(_20e+".dh");
return Math.max(div1.scrollWidth,div2.scrollWidth)+2;
}
catch(e){
return 0;
}
};
function icuesTableHasEmptyRow(id){
try{
var _20f=document.getElementById(id);
var _210=document.getElementById(id+".td");
var _211=document.getElementById(id+".th");
if(_210==null){
_210=document.getElementById(id+"_CG1.td");
}
if((_210==null&&_20f.rows[_20f.rows.length-1].className=="cuesTableRowEmpty")||(_211==null&&_210!=null&&_210.rows[_210.rows.length-1].className=="cuesTableRowEmpty")||(_210!=null&&_210.rows.length==1&&_210.rows[0].className=="cuesTableRowEmpty")||(_210!=null&&_210.rows.length==2&&_210.rows[0].className=="cuesTableRowAccessibility"&&_210.rows[1].className=="cuesTableRowEmpty")){
return true;
}
}
catch(e){
}
return false;
};
function icuesTableHasAccessibilityRow(id){
try{
var _212=document.getElementById(id+".td");
if(_212==null){
_212=document.getElementById(id+"_CG1.td");
}
return (_212.rows[0].className=="cuesTableRowAccessibility");
}
catch(e){
}
return false;
};
function icuesGetTableAccessibilityRow(id,_213){
try{
var _214=document.getElementById(id+".td");
if(_214==null){
_214=document.getElementById(id+"_CG"+_213+".td");
}
if(_214.rows[0].className=="cuesTableRowAccessibility"){
return _214.rows[0];
}
}
catch(e){
}
return null;
};
function icuesAnalyzeWidths(obj,msg){
var _215=new Array();
try{
var _216=obj.rows[0];
for(var i=0;i<_216.cells.length;i++){
_215[i]=_216.cells[i].clientWidth;
}
}
catch(e){
}
cuesLog(msg+" id="+obj.id+" computed_widths="+_215+" #cols="+obj.getElementsByTagName("col").length);
};
function cuesIsSelectedTableRowLeftmost(_217,_218){
try{
var _219=icuesFindTableObj(_217);
var row=_219.rows[_218[0]];
var _21a=row.getAttribute("treelevel");
if(_21a*1==0){
return true;
}
}
catch(e){
}
return false;
};
function cuesIsSelectedTableRowIndented(_21b,_21c){
try{
var _21d=_21c[0];
if(_21d>0){
var _21e=icuesFindTableObj(_21b);
var _21f=_21e.rows[_21d];
var _220=_21e.rows[_21d-1];
var _221=_21f.getAttribute("treelevel");
var _222=_220.getAttribute("treelevel");
if(_221*1>_222*1){
return true;
}
}
}
catch(e){
}
return false;
};
function cuesColgroupOnScroll(id,_223){
try{
if(_223==1){
document.getElementById(id+"_CG2.dd").scrollTop=document.getElementById(id+"_CG1.dd").scrollTop;
}else{
document.getElementById(id+"_CG1.dd").scrollTop=document.getElementById(id+"_CG2.dd").scrollTop;
}
}
catch(e){
}
try{
document.getElementById(id+"_CG"+_223+".dh").scrollLeft=document.getElementById(id+"_CG"+_223+".dd").scrollLeft;
}
catch(e){
}
try{
document.getElementById(id+"_CG"+_223+".ds").scrollLeft=document.getElementById(id+"_CG"+_223+".dd").scrollLeft;
}
catch(e){
}
};
function icuesFindOpenDrawer(_224){
var _225=null;
try{
var _226=document.getElementById(_224);
var _227=_226.getElementsByTagName("div");
var _228=_227.length;
for(var i=0;i<_228;i++){
if(icuesIsDrawer(_227[i])){
if(_227[i].attributes["state"].value=="open"){
_225=_227[i].id;
break;
}
}
}
}
catch(e){
}
return _225;
};
function icuesCountOpenDrawers(_229){
var cnt=0;
try{
var _22a=document.getElementById(_229);
var _22b=_22a.getElementsByTagName("div");
var _22c=_22b.length;
for(var i=0;i<_22c;i++){
if(icuesIsDrawer(_22b[i])){
if(_22b[i].attributes["state"].value=="open"){
cnt++;
}
}
}
}
catch(e){
}
return cnt;
};
function icuesGetDrawersMode(_22d){
var mode="single";
try{
var _22e=document.getElementById(_22d);
mode=_22e.attributes["mode"].value;
}
catch(e){
}
return mode;
};
function icuesIsNavScrolling(_22f){
return false;
};
function icuesGetDrawersScrollers(_230){
return "false";
};
function icuesDeselectOtherDrawers(_231,_232){
try{
var _233;
var _234=document.getElementById(_232);
var _235=_234.getElementsByTagName("div");
var _236=_235.length;
for(var i=0;i<_236;i++){
_233=_235[i];
if(icuesIsDrawer(_233)&&_233.attributes["id"].value!=_231){
_233.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBg.gif)";
}
}
}
catch(e){
}
};
function icuesDeselectDrawer(_237){
try{
var _238=document.getElementById(_237);
icuesSetDrawerTogglerState(_237,_238.attributes["state"].value,false);
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.makeDrawerInactive(_237);
}else{
_238.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBg.gif)";
_238.style.fontWeight="normal";
}
}
catch(e){
}
};
function icuesSetSelectedDrawer(_239){
drawerActiveId=_239;
document.cookie="drawerActiveId="+_239+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
};
function icuesSelectDrawer(_23a,_23b){
try{
if(drawerActiveId!=_23a){
if(drawerActiveId!=null){
icuesDeselectDrawer(drawerActiveId);
}
var _23c=document.getElementById(_23a);
icuesSetDrawerTogglerState(_23a,_23c.attributes["state"].value,true);
if(parseInt(cuesVersion)>=60){
var _23d=cuesDrawnShape.makeDrawerActive(_23a);
if(!_23d){
return;
}
}else{
_23c.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHilite"+cuesImageSuffix+".gif)";
_23c.style.fontWeight="bold";
}
drawerActiveId=_23a;
if(_23b){
document.cookie="drawerActiveId="+_23a+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
}
}
}
catch(e){
}
};
function icuesSetDrawerTogglerState(_23e,_23f){
try{
var _240=document.getElementById(_23e+"Toggler");
var _241;
if(_23f=="open"){
_241=cuesAlt["CollapseDrawer"];
if(parseInt(cuesVersion)>=60){
newImage=cuesKnownLocation+cuesImageFolder+"/drawerTriangleOpenT.gif";
}else{
newImage=cuesKnownLocation+cuesImageFolder+"/drawerTriangleOpen.gif";
}
}else{
_241=cuesAlt["ExpandDrawer"];
if(parseInt(cuesVersion)>=60){
newImage=cuesKnownLocation+cuesImageFolder+"/drawerTriangleCollapsedT.gif";
}else{
newImage=cuesKnownLocation+cuesImageFolder+"/drawerTriangleCollapsed.gif";
}
}
_240.title=_241;
_240.src=newImage;
cuesFixPNG(null,_240);
}
catch(e){
}
};
function cuesToggleDrawer(_242,_243,_244){
if(_242==null){
return;
}
try{
var _245=document.getElementById(_242);
var _246=document.getElementById(_242+"Content");
var _247;
var _248;
var _249;
if(_245.attributes["state"].value=="open"){
icuesSetDrawerTogglerState(_242,"closed",_242==drawerActiveId);
_247="none";
_248="closed";
_249="0px";
}else{
if(icuesGetDrawersMode(_243)=="single"){
cuesToggleDrawer(icuesFindOpenDrawer(_243),_243);
}
icuesSetDrawerTogglerState(_242,"open",_242==drawerActiveId);
_247="";
_248="open";
_249="160px";
}
_246.style.display=_247;
_246.style.height=_249;
_245.attributes["state"].value=_248;
if(_243!=null){
cuesFillHeight(_243);
cuesTileDrawers(_243,true);
}
try{
if(typeof callbackDrawerStateChange=="function"){
callbackDrawerStateChange(_243,_242,_248);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesOpenDrawer(_24a){
icuesOpenDrawer(_24a);
};
function icuesOpenDrawer(_24b,_24c){
if(_24b==null){
return;
}
try{
var _24d=document.getElementById(_24b);
var _24e=document.getElementById(_24b+"Content");
var _24f;
var _250;
var _251;
var _252;
if(_24d.attributes["state"].value=="open"){
return;
}
if(icuesGetDrawersMode(_24c)=="single"){
cuesToggleDrawer(icuesFindOpenDrawer(_24c),_24c);
}
icuesSetDrawerTogglerState(_24b,"open",_24b==drawerActiveId);
_24f="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHilite"+cuesImageSuffix+".gif)";
_250="";
_251="open";
_252="160px";
_24e.style.display=_250;
_24e.style.height=_252;
_24d.attributes["state"].value=_251;
cuesTileDrawers(_24c,true);
if(typeof callbackDrawerStateChange=="function"){
callbackDrawerStateChange(_24c,_24b,_251);
}
}
catch(e){
}
};
function cuesClickDrawer(evt,id){
try{
var _253=document.getElementById(id);
var _254=_253.getElementsByTagName("a");
if(evt==null&&isIE){
evt=window.event;
}
var _255=(isIE)?evt.srcElement:evt.target;
if(evt.clientX<20||(_255.id!=null&&_255.id.indexOf("Toggler")!=-1)){
if(_254.length==2){
return;
}
}else{
if(isIE){
_254[_254.length-1].click();
}else{
var tag=evt.target.tagName.toLowerCase();
if(tag!="a"){
eval(_254[_254.length-1].href);
}
}
}
}
catch(e){
}
};
function cuesMouseOverDrawer(evt,id){
try{
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.drawerMouseover(id);
return;
}
var _256=document.getElementById(id);
if(evt==null&&isIE){
evt=window.event;
}
if(evt.clientX<20){
if(id==drawerActiveId){
_256.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHiliteArrow"+cuesImageSuffix+".gif)";
}else{
_256.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHiliteToggler"+cuesImageSuffix+".gif)";
}
}else{
_256.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHiliteRollover"+cuesImageSuffix+".gif)";
}
}
catch(e){
}
};
function cuesMouseOutDrawer(evt,id){
try{
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.drawerMouseout(id);
return;
}
var _257=document.getElementById(id);
if(id!=drawerActiveId){
_257.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBg.gif)";
}else{
_257.style.backgroundImage="url("+cuesKnownLocation+cuesImageFolder+"/drawerBgHilite"+cuesImageSuffix+".gif)";
}
}
catch(e){
}
};
function cuesMouseOverDrawerItem(id){
try{
var _258=document.getElementById(id);
}
catch(e){
}
};
function cuesMouseOutDrawerItem(evt,id){
try{
var _259=document.getElementById(id);
}
catch(e){
}
};
function icuesIsDrawer(obj){
var _25a=false;
try{
_25a=(obj.className=="cuesDrawer"||obj.className=="cuesDrawer cuesDrawerCaptionActive"||obj.className=="cuesDrawer cuesDrawerCaptionInactive");
}
catch(e){
}
return _25a;
};
function cuesTileDrawers(id,_25b){
try{
if(_25b==null){
_25b=false;
}
var _25c=document.getElementById(id);
var _25d=_25c.clientHeight;
if(parseInt(cuesVersion)>=60){
try{
document.getElementById("cuesDrawersLayer").style.height=_25d;
}
catch(e){
}
try{
var _25e=Math.min(_25c.clientWidth,_25c.parentNode.clientWidth);
document.getElementById("cuesDrawersLayer").style.width=_25e;
}
catch(e){
}
}
var _25f=_25c.getElementsByTagName("div");
var _260=_25f.length;
var _261=0;
var _262=new Array();
var _263=new Array();
var _264=new Array();
var _265=0;
var _266=0;
var _267;
var _268=0;
for(var i=0;i<_260;i++){
if(icuesIsDrawer(_25f[i])){
_264.push(_25f[i]);
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.adjustDrawer(_25f[i].id,_25c.clientWidth);
}
_261++;
_265+=_25f[i].offsetHeight;
if(_25f[i].attributes["state"].value=="open"){
_262.push(i);
_267=document.getElementById(_25f[i].id+"Content");
if(_267!=null){
try{
_268=parseInt(icuesGetStyleProperty(_267,"paddingTop"));
if(isNaN(_268)){
_268=8;
}
}
catch(e){
_268=8;
}
if(!isIE){
_268--;
}
_266+=Math.max(CUESMINDRAWERHEIGHT,_267.offsetHeight+_268);
_263.push(_267);
}
}else{
_267=document.getElementById(_25f[i].id+"Content");
if(_267!=null){
_267.style.display="none";
}
}
}
}
var _269=_263.length;
if(_269>0){
if(isFF||isSafari||isChrome){
_25d-=_269;
}
var _26a=0;
if(parseInt(cuesVersion)>=60&&icuesGetDrawersMode(id)=="single"){
var tree=_263[0].getElementsByTagName("div")[0];
_26a=Math.min(_25d-_265-(isIE?0:_268),3+tree.offsetHeight+(_263[0].scrollWidth>_263[0].offsetWidth?18:0)+(isIE?2:0)+_268);
}else{
if(parseInt(cuesVersion)<60&&cuesObjectScrollable[id]){
_26a=Math.floor(Math.max(CUESMINDRAWERHEIGHT,(_25d-_265)/_269));
}else{
_26a=Math.floor((_25d-_265-(isIE?0:_269*_268))/_269);
}
}
var node=_263[0];
var _26b=node.offsetWidth;
while(node!=null){
if(node.tagName.toLowerCase()=="html"){
break;
}
if(node.offsetWidth*1==node.offsetWidth&&node.offsetWidth*1>0){
_26b=Math.min(_26b,node.offsetWidth);
}
node=node.parentNode;
}
if(_25b){
var node=_25c;
var _26c=node.offsetWidth;
while(node!=null){
if(node.tagName.toLowerCase()=="html"){
break;
}
if(node.offsetWidth*1==node.offsetWidth&&node.offsetWidth*1>0){
_26c=Math.min(_26c,node.offsetWidth);
}
node=node.parentNode;
}
if(_26c>_26b){
_26b=_26c;
}
}
_26a=icuesIsNavScrolling(id)?"auto":(_26a+"px");
for(var i=0;i<_269;i++){
_263[i].style.height=_26a;
if(_26b!=0){
_263[i].style.width=_26b+"px";
}
}
}
if(parseInt(cuesVersion)>=60){
if(parseInt(cuesVersion)>=61){
_265=0;
for(var i=0;i<_260;i++){
if(icuesIsDrawer(_25f[i])){
_265+=_25f[i].offsetHeight;
}
}
for(var i=0;i<_269;i++){
_265+=_263[i].offsetHeight;
}
try{
document.getElementById("cuesDrawersLayer").style.height=_265;
}
catch(e){
}
}else{
try{
document.getElementById("cuesDrawersLayer").style.height=_25c.scrollHeight;
}
catch(e){
}
}
try{
document.getElementById("cuesDrawersLayer").style.width=_25c.scrollWidth;
}
catch(e){
}
if(icuesIsNavScrolling(id)){
var _26d=_264.length;
for(var i=0;i<_26d;i++){
cuesDrawnShape.adjustDrawer(_264[i].id,_25c.scrollWidth);
}
}
}
if(!icuesIsNavScrolling(id)){
var _26e=_25c.scrollHeight-_25c.offsetHeight;
if(sb<_25c.scrollTop&&_26e>=0){
_25c.scrollTop=_26e;
}
if(_25c.scrollHeight<=_25c.offsetHeight&&_25c.scrollTop>0){
_25c.scrollTop=0;
}
if(cuesObjectScrollable[id]){
cuesSetDrawersScrollersState(id);
}
}
}
catch(e){
}
};
function cuesGetDrawersScrollerHeight(id){
var h=0;
try{
h=document.getElementById("DrawersScrollDown_"+id).offsetHeight;
}
catch(e){
}
return h;
};
function cuesSetDrawersScrollersState(id){
try{
var _26f=document.getElementById("DrawersScrollUpImage_"+id);
var _270=document.getElementById("DrawersScrollDownImage_"+id);
var _271=document.getElementById(id);
if(_271.scrollTop==0){
if(_26f.src.indexOf("Disabled")==-1){
_26f.src=cuesKnownLocation+cuesImageFolder+"/drawerScrollUpDisabled.gif";
}
}else{
if(_26f.src.indexOf("Disabled")!=-1){
_26f.src=cuesKnownLocation+cuesImageFolder+"/drawerScrollUp.gif";
}
}
if(_271.scrollHeight-_271.scrollTop>_271.offsetHeight){
if(_270.src.indexOf("Disabled")!=-1){
_270.src=cuesKnownLocation+cuesImageFolder+"/drawerScrollDown.gif";
}
}else{
if(_270.src.indexOf("Disabled")==-1){
_270.src=cuesKnownLocation+cuesImageFolder+"/drawerScrollDownDisabled.gif";
}
}
}
catch(e){
}
};
function cuesCancelScrollDrawers(){
cuesDrawersScrolling=false;
};
function cuesScrollDrawersDown(id,flag){
try{
if(flag!=null){
cuesDrawersScrolling=flag;
}
if(!cuesDrawersScrolling){
return;
}
var _272=document.getElementById(id);
var _273=_272.scrollTop+16;
_272.scrollTop=_273;
cuesSetDrawersScrollersState(id);
if(cuesDrawersScrolling){
setTimeout("cuesScrollDrawersDown('"+id+"')",CUESDRAWERSCROLLDELAY);
}
}
catch(e){
}
};
function cuesScrollDrawersUp(id,flag){
try{
if(flag!=null){
cuesDrawersScrolling=flag;
}
if(!cuesDrawersScrolling){
return;
}
var _274=document.getElementById(id);
var _275=Math.max(0,_274.scrollTop-16);
_274.scrollTop=_275;
cuesSetDrawersScrollersState(id);
if(_274.scrollTop==0){
return;
}
if(cuesDrawersScrolling){
setTimeout("cuesScrollDrawersUp('"+id+"')",CUESDRAWERSCROLLDELAY);
}
}
catch(e){
}
};
function cuesInvokeDrawerDefaultItem(_276,_277){
try{
var _278=document.getElementById(_276);
if(_278.attributes["state"].value=="closed"){
cuesToggleDrawer(_276,_277);
}
if(drawerDefaultItemId[_276]!=""&&drawerDefaultItemId[_276]!=null){
if(drawerDefaultItemId[_276].indexOf(".link")==-1){
drawerDefaultItemId[_276]=cuesTree[_276+"NavTree"].getVisualId(drawerDefaultItemId[_276])+".link";
}
cuesInvokeDrawerURL(_276,drawerDefaultItemURL[_276],drawerDefaultItemTarget[_276],drawerDefaultItemId[_276],true);
}else{
icuesSelectInvokeNavItem(_276,null,null,false);
}
}
catch(e){
}
};
function cuesSelectNavItem(_279,name,_27a){
icuesSelectInvokeNavItem(_279,name,_27a,false);
};
function cuesInvokeNavItem(_27b,name,_27c){
icuesSelectInvokeNavItem(_27b,name,_27c,true);
};
function icuesSelectInvokeNavItem(_27d,name,_27e,_27f,id){
try{
icuesSelectDrawerItem();
icuesDeselectDrawer(drawerActiveId);
drawerActiveId=null;
icuesDeselectDrawerItem(drawerActiveItemId);
var _280=document.getElementById(_27d);
var _281=icuesFindObjectByTagnameClass(_280,"div","cuesDrawersContainer");
icuesOpenDrawer(_27d,_281.id);
if(name==null&&id==null){
icuesSelectDrawer(_27d);
if(_27f){
var _280=document.getElementById(_27d);
var link=_280.getElementsByTagName("a")[0];
if(isIE){
link.click();
}else{
eval(link.href);
}
}
}else{
var node;
if(id==null){
node=cuesTree[_27d+"NavTree"].locateNode(name,_27e);
}else{
node=cuesTree[_27d+"NavTree"].locateNode(id);
}
var _282=node.getAttribute("id");
var _283=node.getAttribute("nodeid");
var link=icuesSelectDrawerItem(_283+".link");
cuesTree[_27d+"NavTree"].expandAncestors(_282);
cuesTileDrawers(_281.id);
try{
var div=document.getElementById(_27d+"Content");
var _284=icuesPhysicalTop(link)-icuesPhysicalTop(div);
div.scrollTop=Math.max(0,_284-div.offsetHeight+link.offsetHeight);
}
catch(e){
}
if(_27f){
var link=document.getElementById(_283+".link");
if(isIE){
link.click();
}else{
eval(link.href);
}
}
}
}
catch(e){
}
};
function icuesDeselectDrawerItem(_285,_286){
try{
if(_286==null){
_286=document.getElementById(_285);
}
if(_286!=null){
var _287=_286.getElementsByTagName("span");
if(_287.length>0){
_286=_287[0];
}
_286.className="cuesNormalDrawerItem";
if(_286.tagName.toLowerCase()=="a"){
_286.className="cuesDrawerItemLink "+_286.className;
}
}
}
catch(e){
}
};
function icuesToggleNavItem(_288,id){
try{
icuesSelectInvokeNavItem(_288,null,null,false,id);
cuesTree[_288+"NavTree"].toggleNode(id);
var _289=document.getElementById(_288);
var _28a=icuesFindObjectByTagnameClass(_289,"div","cuesDrawersContainer");
cuesTileDrawers(_28a.id);
}
catch(e){
}
};
function icuesSelectDrawerItem(_28b,_28c){
var _28d=null;
try{
if(drawerActiveItemId!=null){
icuesDeselectDrawerItem(drawerActiveItemId);
drawerActiveItemId=null;
}
if(_28b!=null){
_28d=document.getElementById(_28b);
if(_28d!=null){
var _28e=_28d.getElementsByTagName("span");
if(_28e.length>0){
_28d=_28e[0];
}
_28d.className="cuesSelectedDrawerItem";
if(_28d.tagName.toLowerCase()=="a"){
_28d.className="cuesDrawerItemLink "+_28d.className;
}
drawerActiveItemId=_28b;
if(_28c){
document.cookie="drawerActiveItemId="+_28b+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
}
}
}
}
catch(e){
}
return _28d;
};
function cuesInvokeChildlessDrawerURL(_28f,url,_290,_291){
if(icuesGetDrawersMode(_291)=="single"){
try{
cuesToggleDrawer(icuesFindOpenDrawer(_291),_291);
}
catch(e){
}
}
var _292=document.getElementById(_28f);
if(_292.attributes["state"].value=="closed"){
cuesToggleDrawer(_28f,_291);
}
cuesInvokeDrawerURL(_28f,url,_290);
};
function cuesInvokeDrawerURL(_293,url,_294,_295,_296){
try{
if(typeof callbackPreNavigation=="function"){
if(!callbackPreNavigation("drawer")){
return;
}
}
}
catch(e){
}
if(_296){
icuesExpandDrawerItem(_293,_295);
var _297=document.getElementById(_293);
var _298=icuesFindObjectByTagnameClass(_297,"div","cuesDrawersContainer");
cuesTileDrawers(_298.id);
}
icuesSelectDrawerItem(_295,true);
drawerDefaultItemURL[_293]=url;
drawerDefaultItemTarget[_293]=_294;
if(_295!=null){
drawerDefaultItemId[_293]=_295;
}
icuesSelectDrawer(_293,true);
if(_295!=null&&parseInt(cuesVersion)>=60){
icuesDeselectDrawer(_293);
}
if(url==""||url==null){
return;
}
if(_294==""||_294=="null"){
if(url.indexOf("javascript:")==0){
while(url.indexOf("&amp;apos;")!=-1){
url=url.replace("&amp;apos;","'");
}
while(url.indexOf("&apos;")!=-1){
url=url.replace("&apos;","'");
}
eval(url);
}else{
window.location=url;
}
}else{
if(url.indexOf("javascript:")==0){
while(url.indexOf("&amp;apos;")!=-1){
url=url.replace("&amp;apos;","'");
}
while(url.indexOf("&apos;")!=-1){
url=url.replace("&apos;","'");
}
eval(url);
}else{
var _299=document.getElementById(_294);
icuesTTLt0=new Date();
if(_299==null){
try{
var _29a=_294+".location.href='"+url+"'";
eval(_29a);
}
catch(e){
window.open(url,_294);
}
}else{
if(_299.tagName.toLowerCase()=="iframe"){
_299.src=url;
}
}
}
}
};
function cuesInitNavTree(_29b,_29c,_29d){
cuesInitTree(_29b,_29c,_29d,true);
if(parseInt(cuesVersion)<60){
var _29e=document.getElementById(_29c);
var _29f=_29e.getElementsByTagName("div");
var _2a0=_29f.length;
if(_2a0>0){
_29f[0].style.backgroundColor="#f8f8f8";
}
}
};
function cuesInitTree(_2a1,_2a2,_2a3,_2a4,_2a5){
try{
if(_2a5==null){
_2a5="";
}
var _2a6=document.getElementById(_2a2);
var _2a7=_2a6.getElementsByTagName("tr");
var _2a8=_2a7.length;
for(var i=0;i<_2a8;i++){
_2a7[i].style.height="18px";
if(_2a7[i].cells[0].getElementsByTagName("img").length==0){
_2a7[i].cells[0].innerHTML="<IMG width='16' src='"+cuesKnownLocation+"tigra/icons/empty.gif'>";
}
}
var _2a9=_2a6.getElementsByTagName("img");
var _2aa=_2a9.length;
for(var i=0;i<_2aa;i++){
_2a9[i].className="treeIcon";
}
var _2ab=_2a6.getElementsByTagName("a");
var _2ac=_2ab.length;
var _2ad;
var _2ae;
for(var i=0;i<_2ac;i++){
_2ad=_2ab[i];
if(_2ad.onclick!=null){
_2ad.removeAttribute("onclick");
}
if(_2ad.ondblclick!=null){
_2ad.removeAttribute("ondblclick");
}
if(_2ad.id=="skipme"){
try{
var _2af=icuesFindObjectByTagname(_2ad,"td");
if(_2af!=null&&(_2af.className==""||_2af.className==null)){
_2ad.style.marginLeft="2px";
}
}
catch(e){
}
_2ad.removeAttribute("href");
continue;
}
_2ad.style.color="";
_2ad.style.textDecoration+="";
_2ad.className="cuesDrawerItemLink";
if(_2a4){
_2ad.onfocus=icuesSetDrawerFocus;
if(_2a5!=""&&_2ad.href.indexOf("javascript:")==-1){
_2ad.target=_2a5;
}
}
var _2b0=icuesFindObjectByTagname(_2ad,"TD");
var _2b1=icuesFindObjectByTagname(_2ad,"TR");
if(_2b1!=null&&_2b0!=null){
if(_2ad.href.indexOf("javascript:cuesInvokeDrawerURL")!=-1){
_2b0.className="cuesNormalTreeDrawerItem";
if(_2b1.onmouseover!=null){
_2b1.removeAttribute("onmouseover");
}
if(_2b1.onmouseout!=null){
_2b1.removeAttribute("onmouseout");
}
}else{
if(_2ad.href.indexOf("javascript:cuesToggleDrawerItem")!=-1){
_2b0.className="cuesNormalTreeDrawerItem";
if(_2b1.onmouseover!=null){
_2b1.removeAttribute("onmouseover");
}
if(_2b1.onmouseout!=null){
_2b1.removeAttribute("onmouseout");
}
}else{
_2b0.className="cuesDrawerItemLink";
}
}
}
}
var _2b2;
var _2b3=document.cookie.split(";");
var _2b4=_2b3.length;
var _2b5=0;
var _2b6=null;
var _2b7=null;
for(var i=0;i<_2b4;i++){
_2b2=_2b3[i].split("=");
if(_2b2[0].trim()=="drawerActiveId"){
if(_2b2[1]=="null"){
continue;
}
_2b6=_2b2[1];
icuesSelectDrawer(_2b2[1],false);
icuesOpenDrawer(_2b2[1]);
_2b5++;
}else{
if(_2b2[0].trim()=="drawerActiveItemId"){
if(_2b2[1]=="null"){
continue;
}
_2b7=_2b2[1];
icuesSelectDrawerItem(_2b2[1],false);
if(_2b6!=null){
_2b5++;
}
}
}
}
if(parseInt(cuesVersion)>=60&&_2b6!=null&&_2b7!=null){
icuesDeselectDrawer(_2b6);
}
if(_2b5!=2||_2a3){
if(!(_2a4&&!_2a3)){
var _2b8=TREES[_2a1].o_root.a_nodes.length;
for(var i=0;i<_2b8;i++){
if(TREES[_2a1].o_root.a_nodes[i].n_depth==0){
TREES[_2a1].o_root.a_nodes[i].open(true,true);
}
}
}
}
}
catch(e){
}
};
function icuesFixSelectableTree(id){
try{
var _2b9=document.getElementById(id+"Content").getElementsByTagName("input");
var _2ba=_2b9.length;
for(var i=0;i<_2ba;i++){
if(_2b9[i].className=="treeRadiobutton"){
try{
icuesFindObjectByTagname(_2b9[i],"td").insertBefore(_2b9[i],_2b9[i].parentNode);
}
catch(e){
}
}
}
}
catch(e){
}
};
function cuesFixTreeLinks(_2bb){
if(isIE6){
try{
var _2bc=document.getElementById(_2bb+"Content");
var _2bd=_2bc.getElementsByTagName("a");
var _2be=_2bd.length;
var link,href;
for(var i=0;i<_2be;i++){
link=_2bd[i];
href=link.getAttribute("href");
if(href.indexOf("javascript:")==0){
href=href.replace("javascript:","");
link.setAttribute("action",href);
link.onclick=function(){
icuesInvokeFixedTreeLink(this);
return false;
};
link.setAttribute("href","javascript:void(0)");
}
}
}
catch(e){
}
}
};
function icuesInvokeFixedTreeLink(obj){
try{
eval(unescape(obj.getAttribute("action")));
}
catch(e){
}
};
function icuesDrawerItemOncontextmenu(evt,_2bf,_2c0){
try{
if(typeof callbackOnDrawerItemContextmenu=="function"){
var node=cuesTree[_2bf+"NavTree"].locateNode(_2c0);
var _2c1=cuesGetDrawerItemAppdata(node);
if(evt==null&&isIE){
evt=window.event;
}
callbackOnDrawerItemContextmenu(evt,node,_2c1);
cuesStopEventBubble(evt);
return false;
}
}
catch(e){
}
return true;
};
function icuesDrawerItemLoadOnDemand(node){
try{
var _2c2=cuesGetDrawerItemAppdata(node);
if(_2c2["loadondemand"]=="true"){
if(typeof callbackOnDrawerItemLOD=="function"){
callbackOnDrawerItemLOD(node,_2c2);
}
}
}
catch(e){
}
return true;
};
var activeTreeNodes=new Array();
function cuesClearDrawerCookie(){
document.cookie="drawerActiveId=null;timeout=null;path=/"+(cuesSecureCookies?";secure":"");
document.cookie="drawerActiveItemId=null;timeout=null;path=/"+(cuesSecureCookies?";secure":"");
};
function cuesClearNavStates(){
try{
var _2c3=document.cookie.split(";");
var _2c4=_2c3.length;
for(var i=0;i<_2c4;i++){
var _2c5=_2c3[i].split("=");
try{
if(_2c5[0].indexOf("tree_")<=1){
document.cookie=_2c5[0]+"="+_2c5[1]+"; expires=Thu, 01 Jan 1970 00:00:01";
}
}
catch(e){
}
}
}
catch(e){
}
};
function icuesToggleDrawerItem(_2c6,_2c7,_2c8){
icuesManageTreeItemState(_2c6,_2c7,_2c8,"toggle");
};
function icuesExpandDrawerItem(_2c9,_2ca){
try{
var _2cb=_2ca.replace(".link","");
cuesTree[_2c9+"NavTree"].expandAncestors(_2cb);
}
catch(e){
}
};
function cuesCollapseDrawerItem(_2cc,_2cd,_2ce){
icuesManageTreeItemState(_2cc,_2cd,_2ce,"close");
};
function icuesSetDrawerFocus(){
drawerFocusObject=this;
};
function cuesSetDrawerFocus(_2cf,_2d0){
var _2d1=document.getElementById(_2cf);
var _2d2=_2d1.getElementsByTagName("a");
var _2d3=_2d2.length;
if(_2d0==null||(_2d0=="toggler"&&_2d3==2)||(_2d0=="title"&&_2d3==1)){
_2d2[0].focus();
}else{
if(_2d0=="title"&&_2d3==2){
_2d2[1].focus();
}
}
};
function cuesDrawersRefocus(flag){
if(flag){
try{
if(drawerFocusObject!=null){
drawerFocusObject.focus();
}else{
if(drawerActiveItemId!=null){
var _2d4=document.getElementById(drawerActiveItemId);
var _2d5=_2d4.getElementsByTagName("a");
var _2d6=_2d5.length;
if(_2d6==1){
_2d5[0].focus();
}
}
}
}
catch(e){
}
}
return false;
};
function cuesUpdateNavDrawer(url){
try{
cuesHTTP(url,"GET",null,"text",icuesUpdateNavDrawerReply);
}
catch(e){
}
};
function icuesUpdateNavDrawerReply(){
try{
if(!cuesHTTPIsComplete()){
return;
}
var _2d7=cuesHTTPGetResponseText();
var at=_2d7.indexOf("<xml id=");
var _2d8=_2d7.substring(at+9,at+100);
at=_2d8.indexOf("NavTree");
var _2d9=_2d8.substring(0,at);
var _2da=document.getElementById(_2d9+"Content");
if(_2da!=null){
drawerDefaultItemURL[_2d9]=null;
drawerDefaultItemTarget[_2d9]=null;
drawerDefaultItemId[_2d9]=null;
cuesClearDrawerCookie();
var from=_2d7.indexOf("<tree>");
var thru=_2d7.indexOf("</tree>");
var _2db=_2d7.substring(from,thru+7);
cuesTree[_2d9+"NavTree"].rebuildTree(_2db);
}
if(typeof callbackNavDrawerUpdated=="function"){
callbackNavDrawerUpdated(_2d9);
}
}
catch(e){
}
};
function cuesGetActiveDraweritemAppdata(){
try{
var node=cuesTree[drawerActiveId+"NavTree"].locateNode(drawerActiveItemId.replace(".link",""));
return cuesGetDrawerItemAppdata(node);
}
catch(e){
}
return null;
};
function cuesGetActiveDrawerId(){
return drawerActiveId;
};
function cuesLocateDrawerItem(_2dc,name,_2dd){
try{
return cuesTree[_2dc+"NavTree"].locateNode(name,_2dd);
}
catch(e){
return null;
}
};
function cuesGetDrawerItemId(node){
try{
return node.getAttribute("id");
}
catch(e){
return null;
}
};
function cuesGetDrawerItemText(node){
try{
return node.getAttribute("label");
}
catch(e){
return null;
}
};
function cuesGetDrawerItemAction(node){
try{
return node.getAttribute("onclick");
}
catch(e){
return null;
}
};
function cuesGetDrawerItemAppdata(node){
try{
return eval("("+"{"+node.getAttribute("appdata")+"}"+")");
}
catch(e){
return null;
}
};
function cuesMakeButton(id,size,_2de,_2df){
var _2e0,_2e1,_2e2;
try{
if(!document.getElementById(id+"link").disabled){
if(isFF||isSafari||isChrome){
var cell=document.getElementById(id);
cell.className="cuesToolbarTableButtonHover";
return;
}
if("table"==_2df){
_2e0=cuesKnownLocation+cuesImageFolder+"/toolbar_button_tile24px.gif";
_2e1=cuesKnownLocation+cuesImageFolder+"/toolbar_button_left24px.gif";
_2e2=cuesKnownLocation+cuesImageFolder+"/toolbar_button_right24px.gif";
}else{
if(size&&"small"==size){
_2e0=cuesKnownLocation+cuesImageFolder+"/toolbar_button_tile28px.gif";
_2e1=cuesKnownLocation+cuesImageFolder+"/toolbar_button_left28px.gif";
_2e2=cuesKnownLocation+cuesImageFolder+"/toolbar_button_right28px.gif";
}else{
_2e0=cuesKnownLocation+cuesImageFolder+"/toolbar_button_tile.gif";
_2e1=cuesKnownLocation+cuesImageFolder+"/toolbar_button_left.gif";
_2e2=cuesKnownLocation+cuesImageFolder+"/toolbar_button_right.gif";
}
}
if("table"==_2df){
document.getElementById(id+"center").style.backgroundImage="url("+_2e0+")";
}else{
document.getElementById(id).style.backgroundImage="url("+_2e0+")";
}
document.getElementById(id+"left").style.visibility="visible";
document.getElementById(id+"right").style.visibility="visible";
document.getElementById(id+"left").src=_2e1;
document.getElementById(id+"right").src=_2e2;
document.getElementById(id+"center").style.color="#000000";
if(_2de){
document[id+"separator"].src=_2e1;
}
}
}
catch(e){
}
};
function cuesMakeButtonDown(id,size,_2e3,_2e4){
var _2e5,_2e6,_2e7;
try{
if(!document.getElementById(id+"link").disabled){
if(isFF||isSafari||isChrome){
var cell=document.getElementById(id);
cell.className="cuesToolbarTableButtonPressed";
return;
}
if(_2e4=="table"){
_2e5=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownTile24px.gif";
_2e6=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownLeft24px.gif";
_2e7=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownRight24px.gif";
}else{
if(size&&"small"==size){
_2e5=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownTile28px.gif";
_2e6=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownLeft28px.gif";
_2e7=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownRight28px.gif";
}else{
_2e5=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownTile.gif";
_2e6=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownLeft.gif";
_2e7=cuesKnownLocation+cuesImageFolder+"/toolbarButtonDownRight.gif";
}
}
if(_2e4=="table"){
document.getElementById(id+"center").style.backgroundImage="url("+_2e5+")";
}else{
document.getElementById(id).style.backgroundImage="url("+_2e5+")";
}
document[id+"left"].src=_2e6;
document[id+"right"].src=_2e7;
document.getElementById(id+"center").style.color="#FFFFFF";
if(_2e3){
document[id+"separator"].src=_2e6;
}
}
}
catch(e){
}
};
function cuesClearButton(id,size,_2e8,_2e9){
var _2ea,_2eb;
try{
if(!document.getElementById(id+"link").disabled){
if(isFF||isSafari||isChrome){
var cell=document.getElementById(id);
cell.className="cuesToolbarTableButton";
return;
}
if(_2e9=="table"){
_2eb=cuesKnownLocation+cuesImageFolder+"/toolbarGradient3px24.gif";
}else{
if(size&&"small"==size){
_2ea=cuesKnownLocation+cuesImageFolder+"/toolbarGradient28px.gif";
_2eb=cuesKnownLocation+cuesImageFolder+"/toolbarGradient3px28.gif";
}else{
_2ea=cuesKnownLocation+cuesImageFolder+"/toolbarGradient.gif";
_2eb=cuesKnownLocation+cuesImageFolder+"/toolbarGradient3px.gif";
}
}
if(parseInt(cuesVersion)>=60){
if(_2e9=="table"){
document.getElementById(id+"center").style.backgroundImage="";
}else{
document.getElementById(id).style.backgroundImage="";
}
document.getElementById(id+"left").style.visibility="hidden";
document.getElementById(id+"right").style.visibility="hidden";
if(_2e8){
try{
document[id+"separator"].src=_2eb;
}
catch(e){
}
}
}else{
document.getElementById(id).style.backgroundImage="url("+_2ea+")";
document.getElementById(id+"left").src=_2eb;
document.getElementById(id+"right").src=_2eb;
document.getElementById(id+"center").style.color="#000000";
if(_2e8){
try{
document[id+"separator"].src=_2eb;
}
catch(e){
}
}
}
}
}
catch(e){
}
};
function cuesHideToolbarItem(id){
try{
document.getElementById(id).style.display="none";
}
catch(e){
}
};
function cuesShowToolbarItem(id){
try{
document.getElementById(id).style.display="";
}
catch(e){
}
};
function cuesToolbarItemOnclickHandler(id,evt){
if(evt==null){
evt=window.event;
}
try{
var obj=(isIE)?evt.srcElement:evt.target;
if(obj.tagName.toLowerCase()=="td"){
cuesInvokeToolbarItem(id);
}
}
catch(e){
}
};
function cuesDisableToolbarItem(id,_2ec){
try{
var _2ed=document.getElementById(id+"link");
_2ed.disabled=true;
_2ed.style.color="#c0c0c0";
_2ed.style.cursor="default";
var _2ee=document.getElementById(id+"center");
if(_2ee!=null){
_2ee.style.cursor="default";
}
_2ed.removeAttribute("href");
var _2ef=document.getElementById(id+"image");
_2ef.src=_2ef.attributes["disabledsrc"].value;
if(_2ec==null||_2ec){
var _2f0=document.getElementById(id+"dropdown");
_2f0.disabled=true;
_2f0.style.cursor="default";
_2f0.removeAttribute("href");
_2f0.parentNode.style.cursor="default";
var _2f1=document.getElementById(id+"dropdownimage");
_2f1.src=cuesKnownLocation+cuesImageFolder+"/benu-arrow-disabled.gif";
}
}
catch(e){
}
};
function cuesEnableToolbarItem(id,_2f2){
try{
var _2f3=document.getElementById(id+"link");
_2f3.removeAttribute("disabled");
_2f3.disabled=false;
_2f3.style.color="";
_2f3.style.cursor="pointer";
var _2f4=document.getElementById(id+"center");
if(_2f4!=null){
_2f4.style.cursor="pointer";
}
_2f3.setAttribute("href",_2f3.attributes["keephref"].value);
var _2f5=document.getElementById(id+"image");
_2f5.src=_2f5.attributes["normalsrc"].value;
if(_2f2==null||_2f2){
var _2f6=document.getElementById(id+"dropdown");
_2f6.disabled=false;
_2f6.style.cursor="pointer";
_2f6.setAttribute("href",_2f6.attributes["keephref"].value);
_2f6.parentNode.style.cursor="pointer";
var _2f7=document.getElementById(id+"dropdownimage");
_2f7.src=cuesKnownLocation+cuesImageFolder+"/benu-arrow.gif";
}
}
catch(e){
}
};
function cuesInvokeToolbarItem(id){
try{
if(typeof callbackPreNavigation=="function"){
if(!callbackPreNavigation("toolbar",id)){
return;
}
}
}
catch(e){
}
try{
var _2f8=document.getElementById(id+"link");
if(_2f8.disabled){
return;
}
if(isIE){
_2f8.click();
}else{
if(_2f8.href.indexOf("javascript:")==0){
eval(_2f8.href);
}else{
document.location.href=_2f8.href;
}
}
}
catch(e){
}
};
function cuesShowToolbarItemMenu(id,evt){
try{
cuesSetInsideAction(true);
cuesButtonMenuDelayedHide();
var _2f9=document.getElementById(id+"link");
if(!_2f9.disabled){
var item=document.getElementById(id);
var _2fa=icuesFindObjectByTagnameId(item,"div","cuesToolbar");
var menu=document.getElementById(id+"menu");
cuesActiveMenu=menu;
document.body.appendChild(menu);
menu.style.display="inline";
menu.style.zIndex=99;
menu.style.left=icuesPhysicalLeft(item)+"px";
menu.style.top=(_2fa.offsetHeight-2)+"px";
var _2fb=item.offsetWidth;
var _2fc=menu.firstChild.childNodes.length;
for(var i=0;i<_2fc;i++){
try{
if(menu.firstChild.childNodes[i].tagName.toLowerCase()=="li"){
_2fb=Math.max(_2fb,menu.firstChild.childNodes[i].offsetWidth);
}
}
catch(e){
}
}
menu.firstChild.style.width=_2fb+2;
menu.style.width=menu.firstChild.offsetWidth;
var _2fd=menu.getElementsByTagName("a");
var _2fe=_2fd.length;
var _2ff=false;
for(var i=0;i<_2fe;i++){
if(_2fd[i].disabled||_2fd[i].getAttribute("href")==null||_2fd[i].getAttribute("href")==""){
continue;
}
_2fd[i].focus();
_2ff=true;
break;
}
if(!_2ff){
cuesButtonMenuTimer=setTimeout("cuesButtonMenuDelayedHide()",2000);
}
}
}
catch(e){
}
if(evt!=null){
cuesStopEventBubble(evt);
}
};
var cuesHTTPobj=null;
var icuesHTTPFileURL=false;
function cuesHTTP(url,_300,_301,_302,_303,_304,_305,uid,psw,_306){
if(cuesHTTPobj==null){
cuesHTTPInit();
if(cuesHTTPobj==null){
return false;
}
}
if(_300==null){
_300="GET";
}
if(_302==null){
_302="text";
}
var _307=false;
if(_303!=null){
_307=true;
}
try{
cuesHTTPobj.open(_300.toUpperCase(),url,_307,uid,psw);
if(_307){
cuesHTTPobj.onreadystatechange=_303;
}
cuesHTTPobj.setRequestHeader("accept-encoding","gzip, deflate");
try{
if(_304!=null&&_305!=null){
cuesHTTPobj.setRequestHeader(_304,_305);
}
}
catch(e){
}
if(_306==null||!_306){
cuesHTTPobj.setRequestHeader("pragma","no-cache");
cuesHTTPobj.setRequestHeader("cache-control","no-store, must-revalidate, private");
cuesHTTPobj.setRequestHeader("If-Modified-Since","Tue, 11 Jul 2000 18:23:51 GMT");
}
if(_300.toLowerCase()=="post"){
cuesHTTPobj.setRequestHeader("Content-type","application/x-www-form-urlencoded");
if(_301==null){
_301="";
}
cuesHTTPobj.send(_301);
}else{
cuesHTTPobj.send(null);
}
if(_307){
return true;
}else{
if(_302.toLowerCase()=="xml"){
return cuesHTTPGetResponseXML();
}else{
return cuesHTTPGetResponseText();
}
}
}
catch(e){
return false;
}
};
function cuesHTTPGetResponseText(){
return (cuesHTTPobj==null)?"":cuesHTTPobj.responseText;
};
function cuesHTTPGetResponseXML(){
return (cuesHTTPobj==null)?"":cuesHTTPobj.responseXML;
};
function cuesHTTPIsComplete(){
if(cuesHTTPobj.readyState==4){
return true;
}else{
return false;
}
};
function cuesHTTPGetResponseHeaders(){
return (cuesHTTPobj==null)?"":cuesHTTPobj.getAllResponseHeaders();
};
function cuesHTTPGetStatus(){
try{
return (cuesHTTPobj==null)?null:cuesHTTPobj.status;
}
catch(e){
return null;
}
};
function cuesHTTPGetStatusText(){
try{
return (cuesHTTPobj==null)?null:cuesHTTPobj.statusText;
}
catch(e){
return null;
}
};
function cuesHTTPAllowFileURL(_308){
icuesHTTPFileURL=_308;
};
function cuesHTTPInit(){
if(icuesHTTPFileURL&&isIE){
}else{
try{
cuesHTTPobj=new XMLHttpRequest();
return;
}
catch(e){
}
}
if(isIE){
var _309=["MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XmlHttp","Microsoft.XmlHttp","MSXML.XmlHttp","MSXML3.XmlHttp"];
for(var i=0;i<_309.length;i++){
try{
cuesHTTPobj=new ActiveXObject(_309[i]);
return;
}
catch(e){
}
}
}
alert("Sorry, your browser can not handle this request");
};
function cuesProcessScripts(_30a){
try{
var head=document.getElementsByTagName("head");
if(head.length>0){
var from=_30a.indexOf("<script>");
var _30b=0;
while(from!=-1&&_30b<40){
_30b++;
_30a=_30a.substring(from+8);
var to=_30a.indexOf("</script>");
if(to!=-1){
var code=_30a.substring(0,to);
var _30c=document.createElement("script");
head[0].appendChild(_30c);
_30c.text=code;
head[0].removeChild(_30c);
_30a=_30a.substring(to+9);
from=_30a.indexOf("<script>");
}else{
break;
}
}
var from=_30a.indexOf("<SCRIPT>");
var _30b=0;
while(from!=-1&&_30b<40){
_30b++;
_30a=_30a.substring(from+8);
var to=_30a.indexOf("</SCRIPT>");
if(to!=-1){
var code=_30a.substring(0,to);
var _30c=document.createElement("script");
head[0].appendChild(_30c);
_30c.text=code;
head[0].removeChild(_30c);
_30a=_30a.substring(to+9);
from=_30a.indexOf("<SCRIPT>");
}else{
break;
}
}
}
}
catch(e){
}
};
var validMask=new Array();
validMask["ipv4"]=/[0123456789.]/;
validMask["ipv6"]=/[0123456789abcdefABCDEF:]/;
validMask["ipv6mask"]=/[0123456789]/;
validMask["netmask"]=/[0123456789.]/;
validMask["integer"]=/[0123456789+-]/;
validMask["positiveinteger"]=/[0123456789]/;
validMask["numeric"]=/[0123456789]/;
validMask["float"]=/[0123456789.+-]/;
validMask["mac"]=/[0123456789abcdefABCDEF:]/;
validMask["time2"]=/[0123456789:]/;
validMask["miltime2"]=/[0123456789:]/;
var validToken=new Array();
validToken["ipv4"]=".";
validToken["ipv6"]=":";
validToken["netmask"]=".";
validToken["mac"]=":";
validToken["time"]=":";
validToken["time2"]=":";
validToken["miltime"]=":";
validToken["miltime2"]=":";
var navChars=/[\x08\x0D\x00]/;
function icuesShowMaskedEditErr(id,_30d,_30e){
try{
var _30f=false;
var _310=id;
var at=id.lastIndexOf("_");
if(at!=-1){
id=id.substring(0,at);
}
var obj=document.getElementById(id+"_err");
if(_30d==""){
var _311=obj.getAttribute("errId");
if(_311!=""&&_311!=_310){
return;
}
if(obj.style.display=="block"){
_30f=true;
}
obj.style.display="none";
obj.setAttribute("errId","");
}else{
obj.style.display="block";
_30f=true;
}
if(_30d!=""){
obj.setAttribute("errId",_310);
try{
if(cuesMaskeditFormatError[_30e]!=null){
_30d=cuesMaskeditFormatError[_30e];
}
}
catch(e){
}
}
obj.innerHTML=_30d;
if(_30f){
if(_30d==""){
if(typeof callbackMaskedEditErrResolved=="function"){
callbackMaskedEditErrResolved(id);
}
}else{
if(typeof callbackMaskedEditErrDetected=="function"){
callbackMaskedEditErrDetected(id);
}
}
}
}
catch(e){
}
};
function icuesMaskedEditOnKeyHandler(evt,_312){
var _313,_314;
if(window.event){
_313=evt.keyCode;
}else{
_313=evt.which;
}
_314=String.fromCharCode(_313);
if(isFF&&evt.ctrlKey&&(_314=="x"||_314=="c"||_314=="v")){
return true;
}
if(!validMask[_312].test(_314)&&!navChars.test(_314)&&_313!=9&&_313!=25){
return false;
}else{
return true;
}
};
function icuesMaskedEditRefocus(id){
try{
document.getElementById(id).focus();
}
catch(e){
}
};
function icuesMaskedEditOnBlurHandler(evt,obj,_315){
var err=false;
try{
if(obj==null){
obj=evt.srcElement;
}
var id=obj.id;
var _316=obj.value;
var _317;
if(_316!=""){
switch(_315){
case "ipv4":
case "netmask":
_317=_316.split(validToken[_315]);
if(_317.length!=4){
err=true;
}else{
for(var i=0;i<4;i++){
if(_317[i]>255||_317[i]==""||_317[i]==null){
err=true;
}
}
}
break;
case "time2":
var at=obj.id.indexOf("_");
id=obj.id.substring(0,at);
_317=_316.split(validToken[_315]);
if(_317.length!=2){
err=true;
}else{
if(_317[0]>12||_317[0]==""||_317[0]==null||_317[0]<1||_317[1]>59||_317[1]==""||_317[1]==null||_317[1]<0){
err=true;
}else{
icuesMaskedEditOnChangeHandler(evt,obj,_315);
}
}
break;
case "integer":
case "float":
try{
var _318=new Number(_316);
_316=_316.replace(/^[+]/,"");
var _319=false;
if(_316.indexOf("-")==0){
_319=true;
_316=_316.substring(1);
}
_316=_316.replace(/^0+/,"");
if(_316==""){
_316="0";
}
if(_315=="float"){
_316=_316.replace(/^[.]/,"0.");
if(_316.indexOf(".")!=-1){
_316=_316.replace(/[0]+$/,"");
}
_316=_316.replace(/[.]+$/,"");
}
if(_319){
_316="-"+_316;
}
if(isNaN(_318)||_318.toString()!=_316){
err=true;
}
}
catch(e){
err=true;
}
break;
case "positiveinteger":
case "ipv6mask":
try{
var _318=new Number(_316);
_316=_316.replace(/^[+]/,"");
var _319=false;
if(_316.indexOf("-")==0){
_319=true;
_316=_316.substring(1);
}
_316=_316.replace(/^0+/,"");
if(_316==""){
_316="0";
}
if(_319){
_316="-"+_316;
}
if(isNaN(_318)||_318.toString()!=_316||_319){
err=true;
}
}
catch(e){
err=true;
}
break;
case "mac":
_317=_316.split(validToken[_315]);
if(_317.length!=6){
err=true;
}else{
for(var i=0;i<6;i++){
if(_317[i].length!=2){
err=true;
}
}
}
break;
case "ipv6":
_317=_316.split(validToken[_315]);
if(_317.length>8){
err=true;
}else{
var _31a=_316.split("::");
if(_31a.length>2){
err=true;
}else{
if(_31a.length==1&&_317.length<8){
err=true;
}
}
}
break;
case "miltime2":
_317=_316.split(validToken[_315]);
if(_317.length!=2){
err=true;
}else{
if(_317[0]>23||_317[0]==""||_317[0]==null||_317[0]<0||_317[1]>59||_317[1]==""||_317[1]==null||_317[1]<0){
err=true;
}else{
obj.value=icuesAddLeadingZero(_317[0],2)+validToken[_315]+icuesAddLeadingZero(_317[1],2);
}
}
break;
}
}
if(err){
icuesShowMaskedEditErr(id,cuesMsg["InvalidData"],_315);
if(isFF){
cuesStopEventBubble(evt);
setTimeout("icuesMaskedEditRefocus('"+obj.id+"'),1");
}
}else{
icuesShowMaskedEditErr(id,"",_315);
}
}
catch(e){
}
return !err;
};
function icuesInitMaskedEditRetValue(id,_31b){
var err=false;
var _31c;
var _31d,day,year,_31e,hour,min,ampm,_31f,_320;
var _321;
try{
if(_31b=="date"){
_31d=document.getElementById(id+"_month");
day=document.getElementById(id+"_day");
year=document.getElementById(id+"_year");
_31e=new Date(year.options[year.selectedIndex].value,_31d.options[_31d.selectedIndex].value,day.options[day.selectedIndex].value);
_31c=document.getElementById(id);
_31c.value=_31e.toUTCString();
}else{
if(_31b=="time"){
hour=document.getElementById(id+"_hour");
hour=hour.options[hour.selectedIndex].value;
min=document.getElementById(id+"_min");
min=min.options[min.selectedIndex].value;
ampm=document.getElementById(id+"_ampm");
ampm=ampm.options[ampm.selectedIndex].value;
if(hour*1==11){
_31f=(ampm*1==0)?0:12;
}else{
_31f=(hour*1)+(12*ampm)+1;
}
_31c=document.getElementById(id);
_31c.value=icuesAddLeadingZero(_31f,2)+validToken[_31b]+icuesAddLeadingZero(min,2);
}else{
if(_31b=="time2"){
_320=document.getElementById(id+"_hourmin").value;
_321=_320.split(validToken[_31b]);
if(_321[0]>12||_321[0]==""||_321[0]==null||_321[0]<1||_321[1]>59||_321[1]==""||_321[1]==null||_321[1]<0){
_31c=document.getElementById(id);
_31c.value="";
err=true;
}else{
hour=_321[0];
hour--;
min=_321[1];
ampm=document.getElementById(id+"_ampm");
ampm=ampm.options[ampm.selectedIndex].value;
if(hour*1==11){
_31f=(ampm*1==0)?0:12;
}else{
_31f=(hour*1)+(12*ampm)+1;
}
_31c=document.getElementById(id);
_31c.value=icuesAddLeadingZero(_31f,2)+validToken[_31b]+icuesAddLeadingZero(min,2);
}
}else{
if(_31b=="miltime"){
_31f=document.getElementById(id+"_hour");
_31f=_31f.options[_31f.selectedIndex].value;
min=document.getElementById(id+"_min");
min=min.options[min.selectedIndex].value;
_31e=new Date(2006,0,1);
_31e.setHours(_31f);
_31e.setMinutes(min);
_31c=document.getElementById(id);
_31c.value=icuesAddLeadingZero(_31f,2)+validToken[_31b]+icuesAddLeadingZero(min,2);
}else{
if(_31b=="ipv6"){
var _322=document.getElementById(id+"_address").value;
var mask=document.getElementById(id+"_mask").value;
_31c=document.getElementById(id);
if(mask==""||mask==null){
_31c.value=_322;
}else{
_31c.value=_322+"/"+mask;
}
}
}
}
}
}
}
catch(e){
err=true;
}
};
function icuesMaskedEditOnChangeHandler2(evt,obj,_323){
try{
if(obj==null){
obj=evt.srcElement;
}
if(typeof callbackMaskedEditValueChanged=="function"){
callbackMaskedEditValueChanged(obj.id);
}
}
catch(e){
}
return icuesMaskedEditOnBlurHandler(evt,obj,_323);
};
function icuesMaskedEditOnChangeHandler(evt,obj,_324){
var err=false;
var id="";
var at;
var _325;
var _326,day,year,_327,hour,min,ampm,_328,_329;
var _32a;
try{
if(_324=="date"){
if(obj==null){
obj=evt.srcElement;
}
id=obj.id;
at=id.indexOf("_");
id=id.substring(0,at);
_326=document.getElementById(id+"_month");
day=document.getElementById(id+"_day");
year=document.getElementById(id+"_year");
_327=new Date(year.options[year.selectedIndex].value,_326.options[_326.selectedIndex].value,day.options[day.selectedIndex].value);
_325=document.getElementById(id);
_325.value=_327.toUTCString();
}else{
if(_324=="time"){
if(obj==null){
obj=evt.srcElement;
}
id=obj.id;
at=id.indexOf("_");
id=id.substring(0,at);
hour=document.getElementById(id+"_hour");
hour=hour.options[hour.selectedIndex].value;
min=document.getElementById(id+"_min");
min=min.options[min.selectedIndex].value;
ampm=document.getElementById(id+"_ampm");
ampm=ampm.options[ampm.selectedIndex].value;
if(hour*1==11){
_328=(ampm*1==0)?0:12;
}else{
_328=(hour*1)+(12*ampm)+1;
}
_325=document.getElementById(id);
_325.value=icuesAddLeadingZero(_328,2)+validToken[_324]+icuesAddLeadingZero(min,2);
}else{
if(_324=="time2"){
if(obj==null){
obj=evt.srcElement;
}
id=obj.id;
at=id.indexOf("_");
id=id.substring(0,at);
_329=document.getElementById(id+"_hourmin").value;
_32a=_329.split(validToken[_324]);
if(_32a[0]>12||_32a[0]==""||_32a[0]==null||_32a[0]<1||_32a[1]>59||_32a[1]==""||_32a[1]==null||_32a[1]<0){
_325=document.getElementById(id);
_325.value="";
err=true;
}else{
hour=_32a[0];
hour--;
min=_32a[1];
ampm=document.getElementById(id+"_ampm");
ampm=ampm.options[ampm.selectedIndex].value;
if(hour*1==11){
_328=(ampm*1==0)?0:12;
}else{
_328=(hour*1)+(12*ampm)+1;
}
_325=document.getElementById(id);
_325.value=icuesAddLeadingZero(_328,2)+validToken[_324]+icuesAddLeadingZero(min,2);
}
}else{
if(_324=="miltime"){
if(obj==null){
obj=evt.srcElement;
}
id=obj.id;
at=id.indexOf("_");
id=id.substring(0,at);
_328=document.getElementById(id+"_hour");
_328=_328.options[_328.selectedIndex].value;
min=document.getElementById(id+"_min");
min=min.options[min.selectedIndex].value;
_327=new Date(2006,0,1);
_327.setHours(_328);
_327.setMinutes(min);
_325=document.getElementById(id);
_325.value=icuesAddLeadingZero(_328,2)+validToken[_324]+icuesAddLeadingZero(min,2);
}else{
if(_324=="ipv6"||_324=="ipv6mask"){
if(obj==null){
obj=evt.srcElement;
}
id=obj.id;
at=id.indexOf("_");
if(at!=-1){
id=id.substring(0,at);
}
var _32b=document.getElementById(id+"_address").value;
var mask=document.getElementById(id+"_mask").value;
_325=document.getElementById(id);
if(mask==""||mask==null){
_325.value=_32b;
}else{
_325.value=_32b+"/"+mask;
}
}
}
}
}
}
}
catch(e){
err=true;
}
if(err){
icuesShowMaskedEditErr(id,cuesMsg["InvalidData"],_324);
}else{
icuesShowMaskedEditErr(id,"",_324);
}
try{
if(typeof callbackMaskedEditValueChanged=="function"){
callbackMaskedEditValueChanged(id,err);
}
}
catch(e){
}
return true;
};
function icuesAddLeadingZero(_32c,len){
var _32d="00000000"+_32c;
return _32d.substring(_32d.length-len);
};
function cuesGetMaskedEditDate(id){
var _32e=null;
try{
var _32f=document.getElementById(id+"_month");
var day=document.getElementById(id+"_day");
var year=document.getElementById(id+"_year");
_32e=new Date(year.options[year.selectedIndex].value,_32f.options[_32f.selectedIndex].value,day.options[day.selectedIndex].value);
}
catch(e){
}
return _32e;
};
function cuesSetMaskedEditDate(id,_330){
try{
var _331=document.getElementById(id+"_month");
var day=document.getElementById(id+"_day");
var year=document.getElementById(id+"_year");
_331.selectedIndex=_330.getMonth();
day.selectedIndex=_330.getDate()-1;
for(var i=0;i<year.options.length;i++){
if(year.options[i].value==_330.getFullYear()){
year.selectedIndex=i;
break;
}
}
}
catch(e){
}
};
var cuesComboboxTimer=null;
var cuesComboboxInterval=null;
var cuesCombobox;
var cuesComboboxId;
var cuesComboboxChoices=null;
var cuesComboboxTotalChoices;
var cuesComboboxRegExp;
var cuesComboboxLastLen=0;
var cuesNavChars=/[\x08\x0D\x00]/;
function cuesComboboxOnKeyHandler(evt,obj){
try{
var _332,_333;
if(window.event){
_332=evt.keyCode;
}else{
_332=evt.which;
}
_333=String.fromCharCode(_332);
cuesCombobox=obj;
cuesComboboxId=obj.id;
cuesComboboxChoices=document.getElementById(obj.id+"_choices");
cuesComboboxTotalChoices=document.getElementById(obj.id+"_totalchoices");
if(cuesComboboxTimer!=null&&!isFF){
clearTimeout(cuesComboboxTimer);
cuesComboboxTimer=null;
}
if(!cuesNavChars.test(_333)){
cuesComboboxTimer=setTimeout(cuesComboboxTimerHandler,500);
}
}
catch(e){
}
return true;
};
function cuesComboboxIntervalHandler(){
try{
if(cuesCombobox.value.length!=cuesComboboxLastLen){
cuesComboboxLastLen=cuesCombobox.value.length;
cuesComboboxTimerHandler();
}
}
catch(e){
}
};
function cuesComboboxTimerHandler(){
if(cuesComboboxTimer!=null){
clearTimeout(cuesComboboxTimer);
cuesComboboxTimer=null;
}
var _334=cuesCombobox.value;
var cnt=0;
var len;
var _335=cuesComboboxChoices.getAttribute("filtered")=="true";
var url=cuesComboboxChoices.getAttribute("ajaxurl");
try{
if(url!=null&&url!=""){
url=url.replace("%pattern%",_334.toLowerCase());
var _336=cuesHTTP(url,"GET",null,"xml");
var _337="/choices/choice";
var _338=cuesXpath(_336,_337);
cuesComboboxChoices.options.length=0;
cuesComboboxChoices.style.width="auto";
len=_338.length;
var txt;
for(var i=0;i<len;i++){
cuesComboboxChoices.options.length++;
txt=isIE?_338[i].text:_338[i].textContent;
cuesComboboxChoices.options[cnt].text=txt;
cnt++;
}
}else{
cuesComboboxChoices.options.length=0;
cuesComboboxChoices.style.width="auto";
var _339=_334.indexOf("'");
if(isIE&&_339==-1){
_334=_334.toLowerCase();
var _33a=null;
var _337="/choices/choice[starts-with(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'"+_334+"')]";
cuesComboboxTotalChoices.setProperty("SelectionLanguage","XPath");
var _338=cuesComboboxTotalChoices.selectNodes(_337);
if(!_335){
if(_338.length>0){
_33a=_338[0].text;
}
_337="/choices/choice";
_338=cuesComboboxTotalChoices.selectNodes(_337);
}
len=_338.length;
for(var i=0;i<len;i++){
cuesComboboxChoices.options.length++;
cuesComboboxChoices.options[cnt].text=_338[i].text;
if(_33a!=null&&_33a==_338[i].text){
cuesComboboxChoices.options[cnt].selected=true;
}
cnt++;
}
}else{
var _33b=_334.replace("*",".+");
_33b=_33b.replace("[","\\[");
cuesComboboxRegExp=new RegExp("^"+_33b,"i");
var _33c,_33d="";
var _33e=null;
len=cuesComboboxTotalChoices.childNodes.length;
for(var i=0;i<len;i++){
_33c=cuesComboboxTotalChoices.childNodes[i];
if(_33c.nodeType!=3){
_33e=cuesComboboxTotalChoices.childNodes[i];
}
}
if(_33e!=null&&_33e.hasChildNodes()){
var i=0;
while(_33e.childNodes[i]){
_33c=_33e.childNodes[i];
if(_33c.nodeType!=3){
_33d=_33c.firstChild.nodeValue;
if(!_335||cuesComboboxRegExp.test(_33d)){
cuesComboboxChoices.options.length++;
cuesComboboxChoices.options[cnt].text=_33d;
if(!_335&&_33a==null&&cuesComboboxRegExp.test(_33d)){
_33a=_33d;
cuesComboboxChoices.options[cnt].selected=true;
}
cnt++;
}
}
i++;
}
}
}
}
}
catch(e){
}
if(cnt>0){
cuesComboboxChoices.style.display="inline";
cuesComboboxChoices.size=Math.max(2,Math.min(cnt,5));
var _33f=50;
if(parseInt(cuesVersion)>=60){
_33f=cuesCombobox.parentNode.offsetWidth;
}else{
_33f=cuesCombobox.offsetWidth;
}
cuesComboboxChoices.style.width=Math.max(_33f,cuesComboboxChoices.offsetWidth);
}else{
cuesComboboxChoices.style.display="none";
}
clearInterval(cuesComboboxInterval);
cuesComboboxInterval=setInterval(cuesComboboxIntervalHandler,250);
};
function cuesComboboxOnChangeHandler(evt,obj,id,_340){
var _341=obj.options[obj.selectedIndex].text;
cuesComboboxLastLen=_341.length;
try{
var _342=document.getElementById(id);
var _343=(_342.value==_341);
_342.value=_341;
if(_340){
_342.focus();
}
if(!_343){
_342.onchange();
}
}
catch(e){
}
};
function cuesComboboxChoiceMade(evt,obj,id){
try{
var _344,_345;
if(window.event){
_344=evt.keyCode;
}else{
_344=evt.which;
}
_345=String.fromCharCode(_344);
if(cuesNavChars.test(_345)&&_344!=13){
return true;
}
cuesComboboxChoices.style.display="none";
document.getElementById(id).focus();
return true;
}
catch(e){
return false;
}
};
var cuesDelayedHideId=null;
function cuesComboboxOnBlurHandler(obj,id){
if(cuesComboboxTimer!=null){
clearTimeout(cuesComboboxTimer);
cuesComboboxTimer=null;
}
clearInterval(cuesComboboxInterval);
if(id==null){
id=obj.id;
}
cuesDelayedHideId=setTimeout("cuesDelayedHide('"+id+"')",200);
clearInterval(cuesComboboxInterval);
};
function cuesDelayedHide(id){
try{
cuesDelayedHideId=null;
document.getElementById(id).style.display="none";
}
catch(e){
}
};
function cuesComboboxOnFocusHandler(obj){
if(cuesComboboxTimer!=null){
clearTimeout(cuesComboboxTimer);
cuesComboboxTimer=null;
}
try{
if(cuesDelayedHideId!=null){
clearTimeout(cuesDelayedHideId);
cuesDelayedHideId=null;
}
obj.style.display="inline";
}
catch(e){
}
return true;
};
function cuesComboboxShowChoices(id){
try{
if(cuesComboboxChoices!=null&&cuesComboboxChoices==document.getElementById(id+"_choices")){
cuesComboboxChoices.style.display="none";
cuesComboboxChoices=null;
return;
}
if(cuesComboboxChoices!=null&&cuesComboboxChoices!=document.getElementById(id+"_choices")){
cuesComboboxChoices.style.display="none";
}
clearInterval(cuesComboboxInterval);
if(cuesDelayedHideId!=null){
clearTimeout(cuesDelayedHideId);
cuesDelayedHideId=null;
}
cuesCombobox=document.getElementById(id);
if(cuesCombobox.disabled){
return;
}
cuesComboboxId=id;
cuesComboboxChoices=document.getElementById(id+"_choices");
cuesComboboxTotalChoices=document.getElementById(id+"_totalchoices");
cuesCombobox.focus();
cuesComboboxChoices.style.display="inline";
cuesComboboxTimer=setTimeout(cuesComboboxTimerHandler,50);
}
catch(e){
}
};
function cuesSetComboboxState(id,_346){
try{
document.getElementById(id).disabled=(_346=="disabled");
}
catch(e){
}
};
function cuesCreateCombobox(_347,_348,_349){
var rc=false;
try{
var _34a=document.getElementById(_347+".model");
var _34b=new RegExp(_347,"gi");
_349.innerHTML=_34a.innerHTML.replace(_34b,_348);
rc=true;
}
catch(e){
}
return rc;
};
function cuesSetComboboxChoices(id,_34c,_34d){
try{
cuesComboboxTotalChoices=document.getElementById(id+"_totalchoices");
if(isIE){
cuesComboboxTotalChoices.loadXML(_34c);
}else{
cuesComboboxTotalChoices.innerHTML=_34c;
}
if(_34d==null){
_34d=false;
}
if(_34d){
document.getElementById(id).value="";
}
}
catch(e){
}
};
function cuesPageTable(id,page,_34e,_34f){
try{
var _350;
if(_34e==-2||_34e==2){
_350=page;
}else{
_350=page*1+_34e*1;
}
if(typeof appPagingTableCallback=="function"){
appPagingTableCallback(id,_350,_34f);
}
}
catch(e){
}
};
function cuesPageClientTable(id,_351){
try{
if(typeof appPagingClientTableCallback=="function"){
appPagingClientTableCallback(id,_351);
}
}
catch(e){
}
};
function cuesPagingTableRowsPerHandler(evt,id,_352){
try{
var obj=document.getElementById(id+"_rowsper");
if(typeof appPagingTableCallback=="function"){
appPagingTableCallback(id,_352,obj.options[obj.selectedIndex].value);
}
}
catch(e){
}
};
function cuesPagingTableGoToHandler(evt,obj,id,per){
var _353=window.event?evt.keyCode:evt.which;
if(_353==13){
try{
if(Math.floor(obj.value)==obj.value&&obj.value>0){
if(typeof appPagingTableCallback=="function"){
appPagingTableCallback(id,obj.value,per);
}
}
}
catch(e){
}
return false;
}else{
var _354=String.fromCharCode(_353);
if(isFF&&evt.ctrlKey&&(_354=="x"||_354=="c"||_354=="v")){
return true;
}
if(!validMask["numeric"].test(_354)&&!navChars.test(_354)){
return false;
}else{
return true;
}
}
};
function cuesTransfer(id,_355,_356,_357,_358,_359){
try{
if(_359!=null&&_359!=0){
return cuesTransferMCLB(id,_355,_356,_357,_358);
}
if(_358==null){
_358="move";
}
var _35a;
var _35b;
var _35c;
var _35d=id+_355.toLowerCase();
var _35e,_35f;
var len;
var _360;
var _361=parseInt(cuesVersion)>=60?12:16;
var _362="";
var _363=new Array();
var _364=function(_365,pos){
_363.push(_365.value);
var _366=document.createElement("OPTION");
_366.value=_365.value;
_366.text=_365.text;
try{
_366.title=_365.title;
}
catch(e){
}
var args=[_366];
if(pos!=null){
args.push(pos);
}
_35b.options.add.apply(_35b.options,args);
return _366;
};
var _367=function(_368){
if(_355!="Right"){
return true;
}
var flg=true;
var _369=parseInt(_35b.getAttribute("minimumItemsCount"));
var _36a=parseInt(_35b.getAttribute("maximumItemsCount"));
var _36b=_35b.options.length;
var _36c=0;
var _36d=[];
switch(_368){
case "all":
len=_35a.options.length;
for(var i=len-1;i>=0;i--){
var _36e=_35a.options[i];
if(_36e.disabled){
continue;
}
_36f=true;
if(_358=="copy"&&_355=="Right"){
_360=_35b.options.length;
for(var j=_360-1;j>=0;j--){
if(_35b.options[j].value==_36e.value&&_35b.options[j].text==_36e.text){
_36f=false;
break;
}
}
}else{
if(_358=="copy"&&_355=="Left"){
_36f=false;
}
}
if(_36f){
_36d.push(_36e);
}
}
break;
case "one":
var _36e=_35a.options[_35a.selectedIndex];
_36d.push(_36e);
break;
case "selected":
var len=_35a.options.length;
for(var i=len-1;i>=0;i--){
var _36e=_35a.options[i];
if(_36e.selected&&!_36e.disabled){
_36f=true;
if(_358=="copy"&&_355=="Right"){
_360=_35b.options.length;
for(var j=_360-1;j>=0;j--){
if(_35b.options[j].value==_36e.value&&_35b.options[j].text==_36e.text){
_36f=false;
break;
}
}
}
if(_36f&&(_358=="move"||_355=="Right")){
_36d.push(_36e);
}
}
}
break;
}
if(_36a>0&&_36b+_36d.length>_36a){
try{
cuesOnTransferboxChosenMaximumItemsCountException(id,_355,_368,_357,_358,_359,_36d,_36a);
}
catch(e){
}
flg=false;
}
return flg;
};
if(_355=="Right"){
_35a=document.getElementById(id+"choices");
_35b=document.getElementById(id+"chosen");
_35c=id+"chosen";
}else{
_35b=document.getElementById(id+"choices");
_35a=document.getElementById(id+"chosen");
_35c=id+"choices";
}
var _370;
var _371;
var _36f=true;
var _372=_35b.options.length;
var _373=false;
if(_356=="all"&&(_35a.options.length>500||_35b.options.length>500)){
_373=true;
}else{
if((_358=="move"||_355=="Right")&&(_356=="selected"||_356=="one")){
if(_35b.options.length>500){
_373=true;
}else{
var cnt=0;
len=_35a.options.length;
for(var i=0;i<len;i++){
_370=_35a.options[i];
if(_370.selected&&!_370.disabled){
cnt++;
}
}
if(cnt>500||cnt+_35b.options.length>500){
_373=true;
}
}
}
}
if(_373){
icuesAsyncTransferMessage();
var _358="cuesAsyncTransfer('"+id+"','"+_355+"','"+_356+"','"+_357+"','"+_358+"')";
setTimeout(_358,100);
return;
}
if(_356=="all"){
_362="all"+_355.toLowerCase();
len=_35a.options.length;
if(!_367(_356)){
return;
}
for(var i=len-1;i>=0;i--){
_370=_35a.options[i];
if(_370.disabled){
continue;
}
_36f=true;
if(_358=="copy"&&_355=="Right"){
_360=_35b.options.length;
for(var j=_360-1;j>=0;j--){
if(_35b.options[j].value==_370.value&&_35b.options[j].text==_370.text){
_36f=false;
break;
}
}
}else{
if(_358=="copy"&&_355=="Left"){
_36f=false;
}
}
if(_36f){
_371=_364(_370,_372);
}
if(_358=="move"||_355=="Left"){
if(isIE){
_35a.options.remove(i);
}else{
_35a.options[i]=null;
}
}
}
}else{
if(_356=="selected"){
if(!_367(_356)){
return;
}
_362=_355.toLowerCase();
len=_35a.options.length;
for(var i=len-1;i>=0;i--){
_370=_35a.options[i];
if(_370.selected&&!_370.disabled){
_36f=true;
if(_358=="copy"&&_355=="Right"){
_360=_35b.options.length;
for(var j=_360-1;j>=0;j--){
if(_35b.options[j].value==_370.value&&_35b.options[j].text==_370.text){
_36f=false;
break;
}
}
}
if(_36f&&(_358=="move"||_355=="Right")){
_371=_364(_370,_372);
}
if(_358=="move"||_355=="Left"){
if(isIE){
_35a.options.remove(i);
}else{
_35a.options[i]=null;
}
}
}
}
}else{
if(_356=="one"){
if(_35a.selectedIndex==-1){
return;
}
if(!_367(_356)){
return;
}
_362=_355.toLowerCase();
var _374=_35a.selectedIndex;
_370=_35a.options[_374];
if(_370.selected&&!_370.disabled){
_36f=true;
if(_358=="copy"&&_355=="Right"){
_360=_35b.options.length;
for(var j=_360-1;j>=0;j--){
if(_35b.options[j].value==_370.value&&_35b.options[j].text==_370.text){
_36f=false;
break;
}
}
}
if(_36f&&(_358=="move"||_355=="Right")){
_371=_364(_370,null);
}
if(_358=="move"||_355=="Left"){
if(isIE){
_35a.options.remove(_374);
}else{
_35a.options[_374]=null;
}
}
}
}else{
if(_356=="top"&&_35a.selectedIndex!=-1){
_362=_356;
_361=12;
var _375=_35a.selectedIndex;
_370=_35a.options[_375];
if(_370.selected&&!_370.disabled){
_363.push(_370.value);
for(var i=_375;i>0;i--){
icuesSwapListboxItems(_35a.options[i],_35a.options[i-1]);
}
icuesDetermineTransferStates(id);
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_362,_363);
}
}
catch(e){
}
return;
}
}else{
if(_356=="up"&&_35a.selectedIndex!=-1){
_362=_356;
_361=12;
var _375=_35a.selectedIndex;
_370=_35a.options[_375];
if(_370.selected&&!_370.disabled){
_363.push(_370.value);
if(_375>0){
_371=_35a.options[_375-1];
icuesSwapListboxItems(_370,_371);
}
icuesDetermineTransferStates(id);
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_362,_363);
}
}
catch(e){
}
return;
}
}else{
if(_356=="down"&&_35a.selectedIndex!=-1){
_362=_356;
_361=12;
var _375=_35a.selectedIndex;
_370=_35a.options[_375];
if(_370.selected&&!_370.disabled){
_363.push(_370.value);
var _376=_35a.options.length-1;
if(_375<_376){
_371=_35a.options[_375+1];
icuesSwapListboxItems(_370,_371);
}
icuesDetermineTransferStates(id);
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_362,_363);
}
}
catch(e){
}
return;
}
}else{
if(_356=="bottom"&&_35a.selectedIndex!=-1){
_362=_356;
_361=12;
var _375=_35a.selectedIndex;
_370=_35a.options[_375];
if(_370.selected&&!_370.disabled){
_363.push(_370.value);
var _376=_35a.options.length-1;
for(var i=_375;i<_376;i++){
icuesSwapListboxItems(_35a.options[i],_35a.options[i+1]);
}
icuesDetermineTransferStates(id);
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_362,_363);
}
}
catch(e){
}
return;
}
}
}
}
}
}
}
}
document.getElementById(_35d).disabled=true;
var img=document.getElementById(_35d+"img");
img.src=cuesKnownLocation+cuesImageFolder+"/Move"+_355+_361+"T-D"+icuesDetermineImageDirectionSuffix(img,_355)+".gif";
icuesDetermineTransferAllStates(id);
if(_355=="Right"&&document.getElementById(id+"up")==null){
cuesSortListbox(_35c,_357);
}
if(_355=="Left"){
cuesSortListbox(_35c,_357=="user"?"text":_357);
if(document.getElementById(id+"up")!=null){
icuesDetermineTransferStates(id);
}
}
icuesDetermineTransferMinWidth(id);
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_362,_363);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesOnTransferboxChosenMaximumItemsCountException(id,_377,_378,_379,_37a,_37b,_37c,_37d){
};
var icuesTransferMsgBox=null;
var icuesTransferMsgBoxText="<br/><br/>Please wait while the items are transferred.";
function icuesAsyncTransferMessage(){
if(icuesTransferMsgBox==null){
icuesTransferMsgBox=new cuesDynamicMessageBox(icuesTransferMsgBoxText);
}
};
function icuesPopulateListbox(obj,_37e){
var _37f,_380;
var len=_37e.length;
if(isIE||isSafari||isChrome){
_380=document.createElement("div");
var _381=new Array();
var _382=cuesExtractAttributes(obj);
_381.push("<select "+_382+"\">");
var _383;
for(i=0;i<len;i++){
_383="<option title=\""+_37e[i].title+"\""+((_37e[i].value!=null&&_37e[i].value!="")?" value=\""+_37e[i].value+"\">":">")+_37e[i].text+"</option>";
_381.push(_383);
}
_381.push("</select>");
_380.innerHTML=_381.join("");
_37f=_380.childNodes[0];
}else{
_37f=document.createElement("select");
cuesCloneAttributes(obj,_37f);
for(i=0;i<len;i++){
_37f.options[i]=_37e[i];
}
}
_37f.style.width=obj.style.width;
obj.parentNode.insertBefore(_37f,obj);
obj.parentNode.removeChild(obj);
_380=null;
return _37f;
};
function cuesAsyncTransfer(id,_384,_385,_386,_387){
try{
if(_387==null){
_387="move";
}
var _388;
var _389;
var _38a=id+_384.toLowerCase();
var _38b,_38c;
var len;
var _38d;
var _38e=parseInt(cuesVersion)>=60?12:16;
var _38f="";
var _390=new Array();
if(_384=="Right"){
_388=document.getElementById(id+"choices");
_389=document.getElementById(id+"chosen");
}else{
_388=document.getElementById(id+"chosen");
_389=document.getElementById(id+"choices");
}
var _391,_392,_393,noop;
var _394=true;
var _395=_389.options.length;
var _396=null;
var _397=null;
if(_385=="all"){
_396=new Array();
_397=new Array();
_38f="all"+_384.toLowerCase();
len=_388.options.length;
for(var i=0;i<len;i++){
_391=_388.options[i];
if(isSafari||isChrome){
_393={"text":_391.text,"value":_391.value,"disabled":_391.disabled,"selected":false,"title":_391.title};
}else{
_393=new Option(_391.text,_391.value,false,false);
try{
_393.title=_391.title;
}
catch(e){
}
}
if(_391.disabled){
_396.push(_393);
continue;
}
_394=true;
if(_387=="copy"&&_384=="Right"){
_38d=_389.options.length;
for(var j=_38d-1;j>=0;j--){
if(_389.options[j].value==_391.value&&_389.options[j].text==_391.text){
_394=false;
break;
}
}
_396.push(_393);
}else{
if(_387=="copy"&&_384=="Left"){
_394=false;
}
}
if(_394){
_390.push(_391.value);
_397.push(_393);
}
}
len=_389.options.length;
for(var i=0;i<len;i++){
_392=_389.options[i];
_393=new Option(_392.text,_392.value,false,false);
try{
_393.title=_392.title;
}
catch(e){
}
_397.push(_393);
}
}else{
if(_385=="selected"){
_396=new Array();
_397=new Array();
_38f=_384.toLowerCase();
len=_388.options.length;
for(var i=0;i<len;i++){
_391=_388.options[i];
_393=new Option(_391.text,_391.value,false,false);
try{
_393.title=_391.title;
}
catch(e){
}
if(_391.selected&&!_391.disabled){
_394=true;
if(_387=="copy"&&_384=="Right"){
_38d=_389.options.length;
for(var j=_38d-1;j>=0;j--){
if(_389.options[j].value==_391.value&&_389.options[j].text==_391.text){
_394=false;
break;
}
}
_396.push(_393);
}
if(_394&&(_387=="move"||_384=="Right")){
_390.push(_391.value);
_397.push(_393);
}
}else{
_396.push(_393);
}
}
len=_389.options.length;
for(var i=0;i<len;i++){
_392=_389.options[i];
_393=new Option(_392.text,_392.value,false,false);
try{
_393.title=_392.title;
}
catch(e){
}
_397.push(_393);
}
}else{
if(_385=="one"){
if(_388.selectedIndex==-1){
return;
}
_38f=_384.toLowerCase();
var _398=_388.selectedIndex;
_391=_388.options[_398];
if(_391.selected&&!_391.disabled){
_394=true;
if(_387=="copy"&&_384=="Right"){
_38d=_389.options.length;
for(var j=_38d-1;j>=0;j--){
if(_389.options[j].value==_391.value&&_389.options[j].text==_391.text){
_394=false;
break;
}
}
}
if(_394&&(_387=="move"||_384=="Right")){
_390.push(_391.value);
_392=document.createElement("option");
_392.value=_391.value;
_392.text=_391.text;
try{
_392.title=_391.title;
}
catch(e){
}
_389.options.add(_392);
_397=new Array();
len=_389.options.length;
for(var i=0;i<len;i++){
_392=_389.options[i];
_393=new Option(_392.text,_392.value,false,false);
try{
_393.title=_392.title;
}
catch(e){
}
_397.push(_393);
}
}
if(_387=="move"||_384=="Left"){
if(isIE){
_388.options.remove(_398);
}else{
_388.options[_398]=null;
}
}
}
}
}
}
document.getElementById(_38a).disabled=true;
var img=document.getElementById(_38a+"img");
img.src=cuesKnownLocation+cuesImageFolder+"/Move"+_384+_38e+"T-D"+icuesDetermineImageDirectionSuffix(img,_384)+".gif";
if(_384=="Right"&&document.getElementById(id+"up")==null){
if(_397!=null){
if(_386=="text"){
_397.sort(icuesSortByText);
}else{
if(_386=="value"){
_397.sort(icuesSortByValue);
}
}
}
}
if(_384=="Left"){
if(_397!=null){
if(_386=="text"||_386=="user"){
_397.sort(icuesSortByText);
}else{
if(_386=="value"){
_397.sort(icuesSortByValue);
}
}
}
}
if(_396!=null){
_388=icuesPopulateListbox(_388,_396);
}
_388.selectedIndex=-1;
if(_397!=null){
_389=icuesPopulateListbox(_389,_397);
}
_389.selectedIndex=-1;
icuesDetermineTransferAllStates(id);
if(document.getElementById(id+"up")!=null){
icuesDetermineTransferStates(id);
}
icuesDetermineTransferMinWidth(id);
if(icuesTransferMsgBox!=null){
icuesTransferMsgBox.close();
icuesTransferMsgBox=null;
}
try{
if(typeof callbackTransferComplete=="function"){
callbackTransferComplete(id,_38f,_390);
}
}
catch(e){
}
}
catch(e){
if(icuesTransferMsgBox!=null){
icuesTransferMsgBox.close();
icuesTransferMsgBox=null;
}
}
};
function cuesTransferMCLB(id,_399,_39a,_39b,_39c){
try{
var _39d=transferMCLB[id+".choices"];
var _39e=transferMCLB[id+".chosen"];
var _39f;
var _3a0;
switch(_399.toLowerCase()){
case "right":
_39f=_39d;
_3a0=_39e;
break;
case "left":
_39f=_39e;
_3a0=_39d;
break;
}
var _3a1;
if(_39a=="all"){
_3a1=cuesGetAllMCLBRowNumbers(_39f);
}else{
_3a1=cuesGetSelectedMCLBRowNumbers(_39f);
}
var _3a2,txt,_3a3,_3a4,_3a5;
if((_39c.toLowerCase()=="move"&&_39f==_39e)||_39f==_39d){
for(var i=0;i<_3a1.length;i++){
_3a2=cuesInsertMCLBRow(_3a0,false);
for(var j=0;j<20;j++){
txt=cuesGetMCLBField(_39f,_3a1[i],j);
_3a3=cuesGetMCLBFieldValue(_39f,_3a1[i],j);
if(txt==null){
_3a4=cuesGetMCLBFieldId(_3a0,j);
_3a5=document.getElementById(id+"."+_3a4);
if(_3a5!=null){
txt=_3a5.options[_3a5.selectedIndex].text;
_3a3=_3a5.options[_3a5.selectedIndex].value;
}else{
txt=" ";
}
}
cuesSetMCLBField(_3a0,_3a2,j,txt);
cuesSetMCLBFieldValue(_3a0,_3a2,j,_3a3);
}
}
}
if((_39c.toLowerCase()=="move"&&_39f==_39d)||_39f==_39e){
cuesRemoveMCLBRow(_39f,_3a1);
}
icuesDetermineTransferMCLBStates(id,"Right",cuesGetSelectedMCLBRowNumbers(_39e).length);
icuesDetermineTransferMCLBStates(id,"Left",cuesGetSelectedMCLBRowNumbers(_39d).length);
icuesDetermineTransferMCLBAllStates(id);
cuesBestfitMCLB(_39d);
cuesBestfitMCLB(_39e);
}
catch(e){
}
};
function icuesSwapListboxItems(_3a6,_3a7){
try{
var _3a8=_3a6.value;
var _3a9=_3a6.text;
var _3aa=_3a6.selected;
var _3ab=_3a6.title;
_3a6.value=_3a7.value;
_3a6.text=_3a7.text;
_3a6.selected=_3a7.selected;
_3a6.title=_3a7.title;
_3a7.value=_3a8;
_3a7.text=_3a9;
_3a7.selected=_3aa;
_3a7.title=_3ab;
}
catch(e){
}
};
function cuesTransferOnClick(id,_3ac){
try{
var _3ad=parseInt(cuesVersion)>=60?12:16;
var obj=document.getElementById(id+_3ac);
var _3ae;
if(_3ac=="choices"){
_3ae="Right";
}else{
_3ae="Left";
}
var img=document.getElementById(id+_3ae.toLowerCase()+"img");
if(obj.selectedIndex==-1){
document.getElementById(id+_3ae.toLowerCase()).disabled=true;
img.src=cuesKnownLocation+cuesImageFolder+"/Move"+_3ae+_3ad+"T-D"+icuesDetermineImageDirectionSuffix(img,_3ae)+".gif";
}else{
document.getElementById(id+_3ae.toLowerCase()).disabled=false;
img.src=cuesKnownLocation+cuesImageFolder+"/Move"+_3ae+_3ad+"T"+icuesDetermineImageDirectionSuffix(img,_3ae)+".gif";
}
if(_3ac=="chosen"){
icuesDetermineTransferStates(id);
}
cuesManageTransferboxSelectionRules(id);
}
catch(e){
}
};
function icuesDetermineTransferStates(id){
try{
var obj=document.getElementById(id+"chosen");
var cnt=0;
var len=obj.options.length;
var item;
if(obj.selectedIndex!=-1){
for(var i=len-1;i>=0;i--){
item=obj.options[i];
if(item.selected){
cnt++;
if(cnt>1){
break;
}
}
}
}
if(cnt!=1||obj.selectedIndex==0||obj.disabled){
document.getElementById(id+"up").disabled=true;
document.getElementById(id+"upimg").src=cuesKnownLocation+cuesImageFolder+"/MoveUp12T-D.gif";
document.getElementById(id+"top").disabled=true;
document.getElementById(id+"topimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToTop12T-D.gif";
}else{
document.getElementById(id+"up").disabled=false;
document.getElementById(id+"upimg").src=cuesKnownLocation+cuesImageFolder+"/MoveUp12T.gif";
document.getElementById(id+"top").disabled=false;
document.getElementById(id+"topimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToTop12T.gif";
}
if(cnt!=1||obj.selectedIndex==len-1||obj.disabled){
document.getElementById(id+"down").disabled=true;
document.getElementById(id+"downimg").src=cuesKnownLocation+cuesImageFolder+"/MoveDown12T-D.gif";
document.getElementById(id+"bottom").disabled=true;
document.getElementById(id+"bottomimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToBottom12T-D.gif";
}else{
document.getElementById(id+"down").disabled=false;
document.getElementById(id+"downimg").src=cuesKnownLocation+cuesImageFolder+"/MoveDown12T.gif";
document.getElementById(id+"bottom").disabled=false;
document.getElementById(id+"bottomimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToBottom12T.gif";
}
}
catch(e){
}
};
function icuesDetermineTransferAllStates(id,_3af,_3b0){
try{
var _3b1=16;
var img;
if(_3af==null){
_3af=document.getElementById(id+"choices");
}
if(_3b0==null){
_3b0=document.getElementById(id+"chosen");
}
img=document.getElementById(id+"rightallimg");
if(_3af==null||_3af.options.length==0||_3af.disabled){
document.getElementById(id+"rightall").disabled=true;
img.src=cuesKnownLocation+cuesImageFolder+"/MoveAllRight"+_3b1+"T-D"+icuesDetermineImageDirectionSuffix(img,"Right")+".gif";
}else{
document.getElementById(id+"rightall").disabled=false;
img.src=cuesKnownLocation+cuesImageFolder+"/MoveAllRight"+_3b1+"T"+icuesDetermineImageDirectionSuffix(img,"Right")+".gif";
}
img=document.getElementById(id+"leftallimg");
if(_3b0==null||_3b0.options.length==0||_3b0.disabled){
document.getElementById(id+"leftall").disabled=true;
img.src=cuesKnownLocation+cuesImageFolder+"/MoveAllLeft"+_3b1+"T-D"+icuesDetermineImageDirectionSuffix(img,"Left")+".gif";
}else{
document.getElementById(id+"leftall").disabled=false;
img.src=cuesKnownLocation+cuesImageFolder+"/MoveAllLeft"+_3b1+"T"+icuesDetermineImageDirectionSuffix(img,"Left")+".gif";
}
}
catch(e){
}
cuesManageTransferboxSelectionRules(id);
};
function icuesDetermineTransferMinWidth(id){
try{
var obj=document.getElementById(id+"chosen");
var _3b2=obj.getAttribute("minwidth");
if(_3b2!=null&&_3b2!=""){
if(obj.options.length==0){
obj.style.width=_3b2;
}else{
obj.style.width="";
obj.style.width=Math.max(obj.offsetWidth,parseInt(_3b2));
}
}
var obj=document.getElementById(id+"choices");
var _3b2=obj.getAttribute("minwidth");
if(_3b2!=null&&_3b2!=""){
if(obj.options.length==0){
obj.style.width=_3b2;
}else{
obj.style.width="";
obj.style.width=Math.max(obj.offsetWidth,parseInt(_3b2));
}
}
}
catch(e){
}
};
function icuesSortByFrontRoutine(_3b3,_3b4){
var at1=_3b3.indexOf(cuesSortSeparator);
var at2=_3b4.indexOf(cuesSortSeparator);
var _3b5=_3b3.substring(1,at1);
var _3b6=_3b4.substring(1,at2);
try{
if(_3b5.toUpperCase()<_3b6.toUpperCase()){
return -1;
}else{
if(_3b5.toUpperCase()>_3b6.toUpperCase()){
return 1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function icuesSortByFrontRoutineDescending(_3b7,_3b8){
var at1=_3b7.indexOf(cuesSortSeparator);
var at2=_3b8.indexOf(cuesSortSeparator);
var _3b9=_3b7.substring(1,at1);
var _3ba=_3b8.substring(1,at2);
try{
if(_3b9.toUpperCase()<_3ba.toUpperCase()){
return 1;
}else{
if(_3b9.toUpperCase()>_3ba.toUpperCase()){
return -1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function icuesSortByFrontRoutineNumeric(_3bb,_3bc){
var at1=_3bb.indexOf(cuesSortSeparator);
var at2=_3bc.indexOf(cuesSortSeparator);
var _3bd=_3bb.substring(1,at1);
var _3be=_3bc.substring(1,at2);
try{
var _3bf=parseFloat(_3bd);
var _3c0=parseFloat(_3be);
if(_3bf<_3c0){
return -1;
}else{
if(_3bf>_3c0){
return 1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function icuesSortByFrontRoutineDescendingNumeric(_3c1,_3c2){
var at1=_3c1.indexOf(cuesSortSeparator);
var at2=_3c2.indexOf(cuesSortSeparator);
var _3c3=_3c1.substring(1,at1);
var _3c4=_3c2.substring(1,at2);
try{
var _3c5=parseFloat(_3c3);
var _3c6=parseFloat(_3c4);
if(_3c5<_3c6){
return 1;
}else{
if(_3c5>_3c6){
return -1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function icuesSortByBackRoutine(_3c7,_3c8){
var at1=_3c7.lastIndexOf(cuesSortSeparator);
var at2=_3c8.lastIndexOf(cuesSortSeparator);
var _3c9=_3c7.substring(at1+1);
var _3ca=_3c8.substring(at2+1);
try{
if(_3c9.toUpperCase()<_3ca.toUpperCase()){
return -1;
}else{
if(_3c9.toUpperCase()>_3ca.toUpperCase()){
return 1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function icuesSortByBackRoutineNumeric(_3cb,_3cc){
var at1=_3cb.lastIndexOf(cuesSortSeparator);
var at2=_3cc.lastIndexOf(cuesSortSeparator);
var _3cd=_3cb.substring(at1+1);
var _3ce=_3cc.substring(at2+1);
try{
var _3cf=parseFloat(_3cd);
var _3d0=parseFloat(_3ce);
if(_3cf<_3d0){
return -1;
}else{
if(_3cf>_3d0){
return 1;
}else{
return 0;
}
}
}
catch(e){
return 0;
}
};
function ORIGcuesSortListbox(id,_3d1){
try{
if(_3d1=="none"||_3d1=="user"){
return;
}
var obj=document.getElementById(id);
var i,at1,at2,_3d2;
var len=obj.options.length;
var _3d3=new Array();
for(i=0;i<len;i++){
_3d3.push((obj.options[i].selected?"1":"0")+obj.options[i].text+cuesSortSeparator+obj.options[i].getAttribute("title")+cuesSortSeparator+obj.options[i].value);
}
if(_3d1=="text"){
_3d3.sort(icuesSortByFrontRoutine);
}else{
if(_3d1=="value"){
_3d3.sort(icuesSortByBackRoutine);
}
}
for(i=0;i<len;i++){
at1=_3d3[i].indexOf(cuesSortSeparator);
at2=_3d3[i].lastIndexOf(cuesSortSeparator);
obj.options[i].text=_3d3[i].substring(1,at1);
obj.options[i].value=_3d3[i].substring(at2+1);
_3d2=_3d3[i].substring(at1+1,at2);
if(_3d2+""=="null"){
_3d2="";
}
try{
obj.options[i].title=_3d2;
}
catch(e){
}
}
}
catch(e){
}
};
function icuesSortByText(_3d4,_3d5){
var _3d6=_3d4.text.toLowerCase();
var _3d7=_3d5.text.toLowerCase();
return _3d6<_3d7?-1:_3d6>_3d7?1:0;
};
function icuesSortByTextDescending(_3d8,_3d9){
var _3da=_3d8.text.toLowerCase();
var _3db=_3d9.text.toLowerCase();
return _3da>_3db?-1:_3da<_3db?1:0;
};
function icuesSortByTextNumeric(_3dc,_3dd){
var _3de=parseFloat(_3dc.text);
var _3df=parseFloat(_3dd.text);
return _3de<_3df?-1:_3de>_3df?1:0;
};
function icuesSortByTextNumericDescending(_3e0,_3e1){
var _3e2=parseFloat(_3e0.text);
var _3e3=parseFloat(_3e1.text);
return _3e2>_3e3?-1:_3e2<_3e3?1:0;
};
function icuesSortByValue(_3e4,_3e5){
var _3e6=_3e4.value.toLowerCase();
var _3e7=_3e5.value.toLowerCase();
return _3e6<_3e7?-1:_3e6>_3e7?1:0;
};
function icuesSortByValueDescending(_3e8,_3e9){
var _3ea=_3e8.value.toLowerCase();
var _3eb=_3e9.value.toLowerCase();
return _3ea>_3eb?-1:_3ea<_3eb?1:0;
};
function icuesSortByValueNumeric(_3ec,_3ed){
var _3ee=parseFloat(_3ec.value);
var _3ef=parseFloat(_3ed.value);
return _3ee<_3ef?-1:_3ee>_3ef?1:0;
};
function icuesSortByValueNumericDescending(_3f0,_3f1){
var _3f2=parseFloat(_3f0.value);
var _3f3=parseFloat(_3f1.value);
return _3f2>_3f3?-1:_3f2<_3f3?1:0;
};
function icuesSortListbox(obj,_3f4){
try{
if(_3f4=="none"||_3f4=="user"){
return obj;
}
var i,_3f5,_3f6;
var len=obj.options.length;
var _3f7=new Array();
for(i=0;i<len;i++){
_3f6=new Option(obj.options[i].text,obj.options[i].value,false,false);
try{
_3f6.title=obj.options[i].title;
}
catch(e){
}
_3f7.push(_3f6);
}
if(_3f4=="text"){
_3f7.sort(icuesSortByText);
}else{
if(_3f4=="value"){
_3f7.sort(icuesSortByValue);
}
}
var _3f8=document.createElement("select");
cuesCloneAttributes(obj,_3f8);
for(i=0;i<len;i++){
_3f8.options[i]=_3f7[i];
}
return _3f8;
}
catch(e){
return obj;
}
};
function cuesSortListbox(id,_3f9){
try{
if(_3f9=="none"||_3f9=="user"){
return;
}
var obj=document.getElementById(id);
var _3fa=icuesSortListbox(obj,_3f9);
obj.parentNode.insertBefore(clone,obj);
obj.parentNode.removeChild(obj);
}
catch(e){
}
};
function cuesTransferboxLocate(id,_3fb,_3fc){
try{
var _3fd=document.getElementById(id+_3fb).options;
var cnt=_3fd.length;
for(var i=0;i<cnt;i++){
if(_3fd[i].selected){
_3fd[i].selected=false;
}
}
if(_3fc.length>0){
_3fc=_3fc.toLowerCase();
for(var i=0;i<cnt;i++){
if(_3fd[i].text.toLowerCase().indexOf(_3fc)==0){
_3fd[i].selected=true;
break;
}
}
}
cuesTransferOnClick(id,_3fb);
}
catch(e){
}
};
function cuesSetTransferboxState(id,_3fe){
try{
var _3ff=document.getElementById(id+"choices");
var _400=document.getElementById(id+"chosen");
if(_3fe=="disabled"){
_3ff.disabled=true;
_400.disabled=true;
_3ff.selectedIndex=-1;
_400.selectedIndex=-1;
}else{
_3ff.disabled=false;
_400.disabled=false;
}
cuesTransferOnClick(id,"choices");
cuesTransferOnClick(id,"chosen");
icuesDetermineTransferStates(id);
icuesDetermineTransferAllStates(id,_3ff,_400);
}
catch(e){
}
};
function cuesGetTransferOptions(id,side){
var _401=new Array();
try{
var obj=document.getElementById(id+side);
var _402=obj.options.length;
for(var i=0;i<_402;i++){
_401.push(obj.options[i]);
}
}
catch(e){
}
return _401;
};
function cuesAddTransferOption(id,side,text,_403){
try{
var obj=document.getElementById(id+side);
var item=document.createElement("option");
item.value=_403;
item.text=text;
obj.options.add(item);
icuesDetermineTransferAllStates(id);
}
catch(e){
}
};
function cuesClearTransferOptions(id,side){
try{
if(side==null){
cuesClearTransferOptions(id,"chosen");
cuesClearTransferOptions(id,"choices");
return;
}
var obj=document.getElementById(id+side);
obj.options.length=0;
icuesDetermineTransferAllStates(id);
}
catch(e){
}
};
function cuesSelectAllTransferOptions(id,side){
try{
if(side==null){
cuesClearTransferOptions(id,"chosen");
cuesClearTransferOptions(id,"choices");
return;
}
var obj=document.getElementById(id+side);
var len=obj.options.length;
for(var i=0;i<len;i++){
obj.options[i].selected=true;
}
icuesDetermineTransferAllStates(id);
}
catch(e){
}
};
function cuesSetPageHeaderItemText(id,text){
try{
document.getElementById(id).innerHTML=text;
}
catch(e){
}
};
function cuesFixPageHeader(obj){
try{
var _404;
if(obj==null){
_404=document.getElementsByTagName("table");
}else{
_404=obj.getElementsByTagName("table");
}
var dir;
for(var i=0;i<_404.length;i++){
if(_404[i].className=="cuesHeaderBg"||cuesVersion!="50"){
dir=cuesFindDirection(_404[i]).toUpperCase();
_404[i].className=_404[i].className+dir;
var divs=_404[i].getElementsByTagName("div");
for(var j=0;j<divs.length;j++){
var _405;
if(isIE){
_405=divs[j].style.styleFloat;
}else{
_405=divs[j].style.cssFloat;
}
if(dir=="RTL"&&_405.toLowerCase()=="right"){
if(isIE){
divs[j].style.styleFloat="left";
}else{
divs[j].style.cssFloat="left";
}
}else{
if(dir=="LTR"&&_405=="left"){
if(isIE){
divs[j].style.styleFloat="right";
}else{
divs[j].style.cssFloat="right";
}
}
}
}
var _406=_404[i].getElementsByTagName("img");
for(var j=0;j<_406.length;j++){
if(cuesVersion=="50"){
if(dir=="RTL"&&_406[j].src.indexOf("bevel.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/bevelRTL.gif";
}else{
if(dir=="LTR"&&_406[j].src.indexOf("bevelRTL.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/bevel.gif";
}
}
}else{
if(dir=="RTL"&&_406[j].src.indexOf("Beg.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderBegRTL.gif";
}else{
if(dir=="LTR"&&_406[j].src.indexOf("BegRTL.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderBeg.gif";
}
}
if(dir=="RTL"&&_406[j].src.indexOf("Mid.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderMidRTL.gif";
}else{
if(dir=="LTR"&&_406[j].src.indexOf("MidRTL.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderMid.gif";
}
}
if(dir=="RTL"&&_406[j].src.indexOf("End.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderEndRTL.gif";
}else{
if(dir=="LTR"&&_406[j].src.indexOf("EndRTL.")!=-1){
_406[j].src=cuesKnownLocation+cuesImageFolder+"/HeaderEnd.gif";
}
}
}
}
}
}
}
catch(e){
}
};
function cuesAlignPageHeader(evt){
try{
var _407=document.getElementById("cuesPageHeader");
var _408;
if(parseInt(cuesVersion)>=60){
_408=_407.getElementsByTagName("table")[0];
}else{
var _409=_407.getElementsByTagName("table")[0];
var _40a=document.getElementById("cuesPageHeaderData");
_408=_40a.getElementsByTagName("table")[0];
var h=_408.offsetHeight;
if(evt==null){
_40a.style.marginTop=-1*_409.offsetHeight;
}
var _40b=new Array();
if(_408.rows[0].cells.length==3){
for(var i=0;i<3;i++){
_40b.push(_408.rows[0].cells[i].offsetWidth);
}
}else{
_40b.push(1*_408.rows[0].cells[0].offsetWidth+1*_408.rows[0].cells[1].offsetWidth);
for(var i=2;i<4;i++){
_40b.push(_408.rows[0].cells[i].offsetWidth);
}
}
for(var i=0;i<3;i++){
var img=_409.rows[0].cells[i].getElementsByTagName("img")[0];
if(img!=null){
img.style.width=_40b[i];
img.style.height=h;
}
}
}
var _40c=false;
if(_408.offsetWidth>document.body.offsetWidth){
if(isIE){
_407.style.overflowX="scroll";
}else{
_407.style.overflow="auto";
}
_40c=true;
}else{
if(isIE){
_407.style.overflowX="";
}else{
_407.style.overflow="";
}
}
_407.style.display="none";
_407.style.display="";
try{
if(typeof callbackPageHeaderAligned=="function"){
callbackPageHeaderAligned(_40c,h);
}
}
catch(e){
}
if(evt==null){
if(document.addEventListener){
window.addEventListener("resize",cuesAlignPageHeader,false);
}else{
if(document.attachEvent){
window.attachEvent("onresize",cuesAlignPageHeader);
}
}
}
}
catch(e){
}
};
function icuesAlignPageHeaderCallback(_40d,h){
try{
if(typeof callbackPageHeaderAligned=="function"){
callbackPageHeaderAligned(_40d,h);
}
}
catch(e){
}
};
function cuesSetFieldMessage(id,txt){
try{
document.getElementById(id+"_err").innerHTML=txt;
}
catch(e){
}
};
function cuesShowFieldMessage(id){
try{
var obj=document.getElementById(id+"_err");
if(obj.className.indexOf("Inline")>0){
obj.style.display="inline";
}else{
obj.style.display="block";
}
}
catch(e){
}
};
function cuesHideFieldMessage(id){
try{
document.getElementById(id+"_err").style.display="none";
}
catch(e){
}
};
var cuesWizardActiveStep=0;
var cuesWizardNumSteps=1;
var cuesWizardNumContent=1;
var icuesWizardDirectNav=false;
function cuesInitWizard(){
if(parseInt(cuesVersion)<60){
cuesAnchor("cuesWizardPane","cuesWizardNav","bottom",(isIE?4:10));
if(isFF||isSafari||isChrome){
cuesAnchor("cuesWizardPane","cuesWizardNav","right",0);
}
}
icuesWizardDirectNav=false;
icuesFixButtonHover();
icuesManageConditionalWizardSteps();
icuesCountWizardSteps();
icuesCountWizardContent();
try{
document.getElementById("cuesWizardNextButton").disabled=(cuesWizardNumSteps==1);
}
catch(e){
}
try{
document.getElementById("cuesWizardFinishButton").disabled=!(cuesWizardNumContent==1);
}
catch(e){
}
icuesTileWizardSteps();
if(document.addEventListener){
window.addEventListener("resize",icuesResizeWizard,false);
}else{
if(document.attachEvent){
window.attachEvent("onresize",icuesResizeWizard);
}
}
if(parseInt(cuesVersion)>=60&&isFF){
cuesReglueWizardButtons();
}
};
function cuesReglueWizardButtons(){
var _40e=document.getElementById("cuesWizardContainer");
var _40f=document.getElementById("cuesWizardPane");
if(parseInt(cuesVersion)>=60&&isFF&&_40f.tagName.toLowerCase()=="table"){
var _410=_40f.rows[0].cells[0];
var _411=_40f.rows[0].cells[1];
var _412=document.body.offsetWidth-document.body.clientWidth;
_411.style.width=document.body.offsetWidth-_410.offsetWidth-(2*_412);
}
var _413=document.getElementById("cuesWizardNav");
var _414;
_413.style.position="absolute";
if(parseInt(cuesVersion)<60){
if(_40e!=null&&isIE){
_414=_40e.offsetHeight+4;
}else{
_414=icuesPhysicalTop2(_40f)*1+_40f.offsetHeight;
}
_413.style.top=(_414-_413.offsetHeight)+"px";
}
if(_40f.tagName.toLowerCase()=="table"){
try{
_413.style.width=_40f.rows[0].cells[1].offsetWidth;
var _415=icuesPhysicalLeft(_40f)+_40f.rows[0].cells[0].offsetWidth;
_413.style.left=_415+"px";
}
catch(e){
}
}
};
function cuesShowPreviousWizardStep(id){
if(!icuesWizardDirectNav){
try{
var _416=document.getElementById(id+".steplink"+(cuesWizardActiveStep-1));
if(_416!=null){
_416.removeAttribute("href");
_416.removeAttribute("state");
}
}
catch(e){
}
}
icuesManageWizardStep(id,-1);
};
function cuesShowNextWizardStep(id,_417){
try{
var _418=document.getElementById(id+".steplink"+cuesWizardActiveStep);
if(_418!=null){
_418.href="javascript:icuesGotoWizardStep('"+id+"',"+cuesWizardActiveStep+")";
_418.setAttribute("state",_417?_417:"complete");
}
}
catch(e){
}
icuesManageWizardStep(id,1,_417);
};
function cuesManageWizardButtonState(_419,_41a){
try{
var _41b=null;
switch(_419.toLowerCase()){
case "back":
_41b=document.getElementById("cuesWizardBackButton");
break;
case "next":
_41b=document.getElementById("cuesWizardNextButton");
break;
case "finish":
_41b=document.getElementById("cuesWizardFinishButton");
break;
}
if(_41b!=null){
_41b.disabled=(_41a.toLowerCase()=="disable");
if(isIE&&_41a.toLowerCase()=="disable"){
try{
icuesClearButtonHover(_41b);
}
catch(e){
}
}
}
}
catch(e){
}
};
function icuesManageConditionalWizardSteps(){
try{
var _41c=new Array();
cuesWizardNumSteps=0;
var _41d=document.getElementById("cuesWizardStepsInpage");
if(_41d==null){
_41d=document.getElementById("cuesWizardPane");
}
if(_41d.tagName.toLowerCase()=="table"){
_41c=_41d.rows[0].cells[0].getElementsByTagName("div");
}else{
if(_41d.tagName.toLowerCase()=="div"){
_41c=_41d.getElementsByTagName("div");
}
}
for(var i=0;i<_41c.length;i++){
if(_41c[i].parentNode==_41d||_41c[i].className.indexOf("cuesWizardStep")==0){
if(_41c[i].getAttribute("conditional")=="true"||_41c[i].getAttribute("conditional")=="exclude"){
_41c[i].style.display="none";
}
}
}
icuesManageWizardConditionalStepsMarkers();
}
catch(e){
}
};
function icuesGetWizardSteps(){
var _41e=new Array();
try{
var _41f=new Array();
var _420=document.getElementById("cuesWizardStepsInpage");
if(_420==null){
_420=document.getElementById("cuesWizardPane");
}
if(_420.tagName.toLowerCase()=="table"){
_41f=_420.rows[0].cells[0].getElementsByTagName("div");
}else{
if(_420.tagName.toLowerCase()=="div"){
_41f=_420.getElementsByTagName("div");
}
}
for(var i=0;i<_41f.length;i++){
if(_41f[i].parentNode==_420||_41f[i].className.indexOf("cuesWizardStep")==0){
_41e.push(_41f[i]);
}
}
}
catch(e){
}
return _41e;
};
function icuesCountWizardSteps(){
try{
cuesWizardNumSteps=icuesGetWizardSteps().length;
}
catch(e){
}
};
function icuesCountWizardContent(){
try{
cuesWizardNumContent=0;
var _421=document.getElementById("cuesWizardPane");
var _422=_421.getElementsByTagName("div");
for(var i=0;i<_422.length;i++){
if(_422[i].className.indexOf("cuesWizardContent")==0){
cuesWizardNumContent++;
}
}
}
catch(e){
}
};
function icuesGotoWizardStep(id,step){
if(step!=cuesWizardActiveStep){
icuesWizardDirectNav=true;
var _423=document.getElementById(id+".steplink"+cuesWizardActiveStep);
if(_423!=null){
_423.href="javascript:icuesGotoWizardStep('"+id+"',"+cuesWizardActiveStep+")";
}
icuesManageWizardStep(id,step-cuesWizardActiveStep,null,true);
}
};
function icuesManageWizardStep(id,_424,_425,_426){
try{
var _427;
var _428="";
var _429=document.getElementById("cuesWizardStepsInpage");
if(_429==null){
_429=document.getElementById("cuesWizardPane");
}else{
_428="Inpage";
}
if(_429.tagName.toLowerCase()=="table"){
_427=_429.rows[0].cells[0].getElementsByTagName("div");
}else{
if(_429.tagName.toLowerCase()=="div"){
_427=_429.getElementsByTagName("div");
}else{
return;
}
}
var _42a=icuesGetWizardSteps();
var idx=cuesWizardActiveStep;
if((idx==0&&_424==-1)||(idx==cuesWizardNumSteps-1&&_424==1)){
return;
}
if(_424>0&&document.getElementById("cuesWizardNextButton").disabled){
return;
}
document.getElementById(id+"_title"+idx).className="cuesWizardTitle"+_428+"Hidden";
document.getElementById(id+"_content"+idx).className="cuesWizardContent"+_428+"Hidden";
var _42b=(_42a[idx].getAttribute("inerror")=="true")?"error":"";
if(_426==null){
if(_424==-1){
var _42c="future";
if(icuesWizardDirectNav){
var _42d=document.getElementById(id+".steplink"+idx);
if(_42d!=null){
var temp=_42d.getAttribute("state");
if(temp=="default"||temp=="complete"){
_42c=temp;
}
}
}
_42a[idx].className="cuesWizardStep"+_428+_42c+_42b;
}else{
if(_425=="default"){
_42a[idx].className="cuesWizardStep"+_428+"default"+_42b;
}else{
_42a[idx].className="cuesWizardStep"+_428+"complete"+_42b;
}
}
}else{
var _42d=document.getElementById(id+".steplink"+idx);
var _42c="future";
if(_42d!=null){
var temp=_42d.getAttribute("state");
if(temp=="default"||temp=="complete"){
_42c=temp;
}
}
_42a[idx].className="cuesWizardStep"+_428+_42c+_42b;
}
idx+=_424;
try{
var _42e;
while(_42a[idx].getAttribute("conditional")=="true"||_42a[idx].getAttribute("conditional")=="exclude"){
_42e=document.getElementById(_42a[idx].id+"marker");
if(_42e!=null){
_42e.style.display=(_424>0)?"none":"";
}
idx+=_424;
}
}
catch(e){
}
_42b=(_42a[idx].getAttribute("inerror")=="true")?"error":"";
document.getElementById(id+"_title"+idx).className="cuesWizardTitle"+_428;
document.getElementById("cuesWizardBackButton").disabled=(idx==0);
if(isIE&&idx==0){
try{
icuesClearButtonHover(document.getElementById("cuesWizardBackButton"));
}
catch(e){
}
}
document.getElementById("cuesWizardNextButton").disabled=(idx==cuesWizardNumSteps-1);
if(isIE&&idx==cuesWizardNumSteps-1){
try{
icuesClearButtonHover(document.getElementById("cuesWizardNextButton"));
}
catch(e){
}
}
document.getElementById("cuesWizardFinishButton").disabled=!(idx==cuesWizardNumSteps-1);
if(isIE&&idx==!(cuesWizardNumSteps-1)){
try{
icuesClearButtonHover(document.getElementById("cuesWizardFinishButton"));
}
catch(e){
}
}
_42a[idx].className="cuesWizardStep"+_428+"active"+_42b;
cuesWizardActiveStep=idx;
cuesReglueWizardButtons();
document.getElementById(id+"_content"+idx).className="cuesWizardContent"+_428+(isFF?"FF":"");
icuesTileWizardSteps(true);
if(typeof callbackWizardStep=="function"){
callbackWizardStep(id,cuesWizardActiveStep,cuesWizardNumSteps);
}
}
catch(e){
}
};
function cuesGetWizardStepsHeight(){
try{
return document.getElementById("cuesWizardStepsMarker").offsetTop;
}
catch(e){
}
return 0;
};
function cuesResizeWizardContent(id){
try{
var gap=document.getElementById("cuesWizardNav").offsetHeight;
if(isFF&&document.getElementById(id+"_title"+cuesWizardActiveStep)!=null){
gap+=document.getElementById(id+"_title"+cuesWizardActiveStep).offsetHeight;
}
cuesExpandHeight(id+"_content"+cuesWizardActiveStep,gap);
}
catch(e){
}
};
function cuesGetWizardStepErrorCount(id){
var cnt=0;
try{
var _42f=icuesGetWizardSteps();
var _430=_42f.length;
for(var i=0;i<_430;i++){
if(_42f[i].getAttribute("inerror")=="true"){
cnt++;
}
}
}
catch(e){
}
return cnt;
};
function cuesIsWizardStepInError(id,_431){
var _432=false;
try{
var _433=icuesGetWizardSteps();
_432=(_433[_431].getAttribute("inerror")=="true");
}
catch(e){
}
return _432;
};
function cuesSetWizardStepError(id,_434,_435){
try{
var _436=icuesGetWizardSteps();
_436[_434].setAttribute("inerror",_435+"");
var img=_436[_434].getElementsByTagName("img");
var _437=_436[_434].className;
_437=_437.replace("error","");
if(_435){
_437+="error";
if(img.length==0){
var html=_436[_434].innerHTML;
_436[_434].innerHTML="<img src=\""+cuesKnownLocation+cuesIconFolder+"/statuserror_12.gif\" title=\""+cuesAlt["WizardStepErrorState"]+"\" alt=\""+cuesAlt["WizardStepErrorState"]+"\"/>"+html;
}else{
img[0].style.display="";
}
}else{
if(img.length!=0){
img[0].style.display="none";
}
}
_436[_434].className=_437;
}
catch(e){
}
};
function icuesManageWizardConditionalStepsMarkers(){
try{
var _438=icuesGetWizardSteps();
var _439=_438.length;
var _43a;
for(var i=1;i<_439;i++){
if(_438[i].getAttribute("conditional")=="true"){
if(_438[i-1].getAttribute("conditional")=="false"){
_43a=document.getElementById(_438[i].id+"marker");
if(_43a==null){
_43a=document.createElement("span");
_43a.id=_438[i].id+"marker";
_43a.innerHTML="...";
_438[i].parentNode.insertBefore(_43a,_438[i]);
}
continue;
}
}
_43a=document.getElementById(_438[i].id+"marker");
if(_43a!=null){
_43a.parentNode.removeChild(_43a);
}
}
}
catch(e){
}
};
function cuesSetWizardStepAsConditional(_43b,_43c,_43d){
try{
if(_43c>cuesWizardActiveStep){
var _43e=document.getElementById(_43b+".step"+_43c);
if(_43e!=null){
_43e.setAttribute("conditional",_43d+"");
if(_43d||_43d=="true"||_43d=="exclude"){
_43e.style.display="none";
}else{
_43e.style.display="";
}
icuesManageWizardConditionalStepsMarkers(_43b);
icuesTileWizardSteps(true);
}
}
}
catch(e){
}
};
function icuesResizeWizard(){
icuesTileWizardSteps();
try{
if(typeof callbackWizardResized=="function"){
callbackWizardResized();
}
}
catch(e){
}
};
function icuesTileWizardSteps(){
try{
var _43f=icuesGetWizardSteps();
var _440=_43f.length;
var _441=999;
for(var i=0;i<_440;i++){
if(_43f[i].getAttribute("conditional")=="exclude"){
_43f[i].style.display="none";
}else{
if(_43f[i].getAttribute("conditional")!="true"){
_43f[i].style.display="";
}else{
if(i>cuesWizardActiveStep){
_441=Math.min(i,_441);
}
}
}
}
var _442=document.getElementById("cuesWizardStepsInpage");
if(_442==null){
return;
}
var _443=_43f[cuesWizardActiveStep].id.substring(0,_43f[cuesWizardActiveStep].id.indexOf(".step"));
try{
document.getElementById(_443+".beforeStepNames").style.display="none";
}
catch(e){
}
try{
document.getElementById(_443+".afterStepNames").style.display="none";
}
catch(e){
}
var _444=_43f[cuesWizardActiveStep].offsetHeight;
if(cuesWizardActiveStep>0){
_444=Math.min(_444,_43f[0].offsetHeight);
}
_444=Math.floor(1.5*_444);
if(_442.offsetHeight>_444){
var i,j,_445=true,_446=true;
for(i=0;i<_440;i++){
if(i!=cuesWizardActiveStep){
_43f[i].style.display="none";
}
}
if(cuesWizardActiveStep>0){
for(i=cuesWizardActiveStep-1;i>=0;i--){
if(_43f[i].getAttribute("conditional")!="true"&&_43f[i].getAttribute("conditional")!="exclude"){
try{
_43f[i].style.display="inline";
}
catch(e){
}
break;
}
}
}
if(cuesWizardActiveStep>1){
try{
document.getElementById(_443+".beforeStepNames").style.display="inline";
}
catch(e){
}
_445=false;
}
try{
document.getElementById(_443+".afterStepNames").style.display="inline";
}
catch(e){
}
for(i=cuesWizardActiveStep+1;i<_440;i++){
if(_43f[i].getAttribute("conditional")!="true"&&_43f[i].getAttribute("conditional")!="exclude"){
_43f[i].style.display="";
}
if(_442.offsetHeight>_444){
_446=false;
for(j=i;j<_440;j++){
_43f[j].style.display="none";
}
break;
}
}
if(_446){
try{
document.getElementById(_443+".afterStepNames").style.display="none";
}
catch(e){
}
}
if(_446){
_445=true;
for(i=cuesWizardActiveStep-2;i>=0;i--){
if(_43f[i].getAttribute("conditional")!="true"&&_43f[i].getAttribute("conditional")!="exclude"){
_43f[i].style.display="";
}
if(_442.offsetHeight>_444){
_445=false;
for(j=i;j>=0;j--){
_43f[j].style.display="none";
}
break;
}
}
}
if(_445){
try{
document.getElementById(_443+".beforeStepNames").style.display="none";
}
catch(e){
}
}else{
try{
document.getElementById(_443+".beforeStepNames").style.display="inline";
}
catch(e){
}
}
}
if(_441!=999){
try{
document.getElementById(_443+".afterStepNames").style.display="none";
}
catch(e){
}
for(var i=_441;i<_440;i++){
_43f[i].style.display="none";
}
}
}
catch(e){
}
};
var cuesSchedulerState=new Array();
function cuesSchedulerNoop(){
try{
document.selection.empty();
}
catch(e){
}
return false;
};
function cuesSchedulerGetChosen(id){
var _447=new Array();
var obj=document.getElementById(id);
var row;
var pair;
if(obj!=null){
var _448=false;
if(obj.rows.length>24){
_448=true;
}
for(var i=1;i<obj.rows.length;i++){
row=obj.rows[i];
if(row!=null){
for(var j=1;j<row.cells.length;j++){
if(row.cells[j].id=="cuesSchedulerPicked"){
pair=new Array();
if(!_448){
pair.push(row.id);
pair.push(j-1);
}else{
pair.push(obj.rows[0].cells[j].id);
pair.push(i-1);
}
_447.push(pair);
}
}
}
}
}
return _447;
};
function cuesSchedulerPopulate(id){
var tbl=document.getElementById(id);
var obj=document.getElementById(id+"_data");
if(tbl!=null&&obj!=null){
var _449=false;
if(tbl.rows.length>24){
_449=true;
}
var days;
if(isIE){
days=obj.selectNodes("/data/*");
}else{
days=obj.firstChild.childNodes;
}
var _44a=days.length;
var row,_44b,_44c,_44b,_44d;
for(var i=0;i<_44a;i++){
_44d=days[i].nodeName.toLowerCase();
row=null;
if(_449){
for(var j=1;j<8;j++){
if(tbl.rows[0].cells[j].id==_44d){
row=j;
break;
}
}
}else{
for(var j=2;j<9;j++){
if(tbl.rows[j].id==_44d){
row=tbl.rows[j];
break;
}
}
}
if(row!=null){
_44b=isIE?days[i].text:days[i].textContent;
_44b=_44b.split(",");
_44c=_44b.length;
for(var j=0;j<_44c;j++){
try{
hour=_44b[j]/1;
if(_449){
tbl.rows[hour+1].cells[row].id="cuesSchedulerPicked";
}else{
row.cells[hour+1].id="cuesSchedulerPicked";
}
}
catch(e){
}
}
}
}
var cols=tbl.getElementsByTagName("col");
var _44e=cols.length;
var _44f,_450,_451;
_44f=tbl.rows[0].cells.length;
_450=1;
for(var i=1;i<_44f;i++){
_451=tbl.rows[0].cells[i];
_450=Math.max(_450,_451.scrollWidth/_451.offsetWidth);
}
if(_450>1){
for(var i=1;i<_44e;i++){
cols[i].width=cols[i].width*_450+(_449?3:0);
}
}
_44f=tbl.rows.length;
_450=1;
for(var i=1;i<_44f;i++){
_451=tbl.rows[i].cells[0];
_450=Math.max(_450,_451.scrollWidth/_451.offsetWidth);
}
if(_450>1){
cols[0].width=cols[0].width*_450+(_449?0:3);
}
}
};
var cuesLastSchedulerCell=new Array();
function cuesSchedulerToggleHour(evt,obj,id){
if(evt==null){
evt=window.event;
}
if(evt.shiftKey){
try{
document.selection.empty();
}
catch(e){
}
}
if(cuesSchedulerState[id]){
return;
}
if((evt.shiftKey&&cuesLastSchedulerCell[id]==null)||!evt.shiftKey){
if(obj.id=="cuesSchedulerPicked"){
obj.id="cuesSchedulerNotPicked";
}else{
obj.id="cuesSchedulerPicked";
}
cuesLastSchedulerCell[id]=obj;
}else{
var _452=cuesLastSchedulerCell[id];
cuesLastSchedulerCell[id]=obj;
var _453=_452.id;
var _454=icuesFindObjectByTagname(obj,"TR");
var _455=icuesFindObjectByTagname(_452,"TR");
var _456=icuesFindObjectByTagname(_454,"TABLE");
var row1,row2;
for(var i=0;i<_456.rows.length;i++){
if(_456.rows[i]==_454){
row1=i;
}
if(_456.rows[i]==_455){
row2=i;
}
}
var _457,_458;
for(var i=0;i<_454.cells.length;i++){
if(_454.cells[i]==obj){
_457=i;
}
}
for(var i=0;i<_455.cells.length;i++){
if(_455.cells[i]==_452){
_458=i;
}
}
var _459=Math.min(row1,row2);
var _45a=Math.max(row1,row2);
var _45b=Math.min(_457,_458);
var _45c=Math.max(_457,_458);
for(var i=_459;i<=_45a;i++){
for(var j=_45b;j<=_45c;j++){
_456.rows[i].cells[j].id=_453;
}
}
}
cuesStopEventBubble(evt);
};
function cuesSchedulerUndoAll(id){
if(cuesSchedulerState[id]){
return;
}
cuesSchedulerClearAll(id);
cuesSchedulerPopulate(id);
};
function cuesSchedulerClearAll(id){
if(cuesSchedulerState[id]){
return;
}
var _45d=document.getElementById(id);
if(_45d!=null){
var _45e;
var _45f=_45d.rows.length;
for(var i=0;i<_45f;i++){
_45e=_45d.rows[i].cells.length;
for(var j=0;j<_45e;j++){
if(_45d.rows[i].cells[j].id=="cuesSchedulerPicked"){
_45d.rows[i].cells[j].id="cuesSchedulerNotPicked";
}
}
}
}
};
function cuesSchedulerSetAll(id){
if(cuesSchedulerState[id]){
return;
}
var _460=document.getElementById(id);
if(_460!=null){
var _461;
var _462=_460.rows.length;
for(var i=0;i<_462;i++){
_461=_460.rows[i].cells.length;
for(var j=0;j<_461;j++){
if(_460.rows[i].cells[j].id=="cuesSchedulerNotPicked"){
_460.rows[i].cells[j].id="cuesSchedulerPicked";
}
}
}
}
};
var cuesSchedulerActiveCell=null;
var cuesSchedulerActiveRow=null;
var cuesSchedulerActiveCol=null;
function cuesSchedulerOnFocusHandler(evt,obj,id,_463){
var obj2=(isIE)?evt.srcElement:evt.target;
if(cuesSchedulerActiveCell==null&&obj.tagName.toLowerCase()==obj2.tagName.toLowerCase()){
try{
var _464=document.getElementById(id);
cuesSchedulerActiveRow=_463;
cuesSchedulerActiveCol=1;
cuesSchedulerActiveCell=_464.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
cuesSchedulerSetFocus(cuesSchedulerActiveCell);
evt.returnValue=false;
evt.cancelBubble=true;
window.status=" ";
}
catch(e){
}
}
return false;
};
function cuesSchedulerOnBlurHandler(evt,obj,id){
if(cuesSchedulerActiveCell!=null){
try{
cuesSchedulerRemoveFocus(cuesSchedulerActiveCell);
cuesSchedulerActiveCell=null;
evt.returnValue=false;
evt.cancelBubble=true;
}
catch(e){
}
}
return false;
};
function cuesSchedulerSetFocus(cell){
try{
cell.className="cuesSchedulerFocus "+cell.className;
}
catch(e){
}
};
function cuesSchedulerRemoveFocus(cell){
try{
var at=cell.className.indexOf("cuesSchedulerFocus ");
if(at!=-1){
cell.className=cell.className.substring(19);
}
cuesSchedulerActiveCell=null;
}
catch(e){
}
};
function cuesSchedulerOnKeyHandler(evt,obj,id,_465,_466,_467){
var rc=true;
try{
var _468;
if(window.event){
_468=evt.keyCode;
}else{
_468=evt.which;
}
var _469=document.getElementById(id);
var _46a=null;
switch(_468){
case 32:
cuesSchedulerToggleHour(evt,cuesSchedulerActiveCell,id);
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
break;
case 36:
cuesSchedulerActiveRow=_465;
cuesSchedulerActiveCol=1;
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
break;
case 50:
case 40:
if(cuesSchedulerActiveRow<_466){
cuesSchedulerActiveRow++;
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
}
break;
case 52:
case 37:
if(cuesSchedulerActiveCol>1){
cuesSchedulerActiveCol--;
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
}
break;
case 54:
case 39:
if(cuesSchedulerActiveCol<_467){
cuesSchedulerActiveCol++;
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
}
break;
case 56:
case 38:
if(cuesSchedulerActiveRow>_465){
cuesSchedulerActiveRow--;
_46a=_469.rows[cuesSchedulerActiveRow].cells[cuesSchedulerActiveCol];
}
break;
}
if(_46a!=null){
cuesSchedulerRemoveFocus(cuesSchedulerActiveCell);
cuesSchedulerActiveCell=_46a;
cuesSchedulerSetFocus(cuesSchedulerActiveCell);
evt.returnValue=false;
evt.cancelBubble=true;
rc=false;
}
}
catch(e){
}
return rc;
};
function cuesManageTreeTable(_46b,_46c){
try{
var _46d=icuesFindTableObj(_46b);
var _46e=_46d.rows.length;
var link;
var _46f;
for(var i=0;i<_46e;i++){
_46f=_46d.rows[i].getAttribute("treelevel")*1;
if(_46f==0){
link=_46d.rows[i].cells[0].getElementsByTagName("button")[0];
if(link==null){
link=_46d.rows[i].cells[1].getElementsByTagName("button")[0];
}
if(link!=null){
cuesToggleTreeTable(link,_46c);
}
}
}
}
catch(e){
}
};
function icuesManageTreeTableRowState(row,_470,link){
var _471="";
try{
if(link==null||link.tagName.toLowerCase()!="button"){
var _472=row.getElementsByTagName("button");
if(_472.length>0&&_472[0].className.indexOf("cuesTreetableNode")==0){
link=_472[0];
}
}
if((row.getAttribute("treeexpanded")=="true"&&_470==null)||_470=="collapsed"){
_471="none";
if(link!=null){
link.className="cuesTreetableNodeCollapsed";
link.title=cuesAlt["ExpandTree"];
}
row.setAttribute("treeexpanded","false");
}else{
if((row.getAttribute("treeexpanded")=="false"&&_470==null)||_470=="expanded"){
_471="";
if(link!=null){
link.className="cuesTreetableNodeExpanded";
link.title=cuesAlt["CollapseTree"];
}
row.setAttribute("treeexpanded","true");
}
}
}
catch(e){
}
return _471;
};
function cuesToggleTreeTable(obj,_473,_474){
if(obj==null){
return;
}
if(_474==null){
_474=true;
}
var row=icuesFindObjectByTagname(obj,"TR");
var _475=row.id;
var _476=icuesManageTreeTableRowState(row,_473,obj);
var tbl=icuesFindObjectByTagname(row,"TABLE");
var _477=row.getAttribute("treeid");
var _478=row.getAttribute("treelevel")*1;
var _479=tbl.rows.length;
for(var i=0;i<_479;i++){
if(tbl.rows[i].getAttribute("treeid")==_477){
for(var j=i+1;j<_479;j++){
if(tbl.rows[j].getAttribute("treeid")==_477){
continue;
}
if(tbl.rows[j].getAttribute("treeid").indexOf(_477)==0){
if(_476=="none"){
tbl.rows[j].style.display=_476;
}else{
if(_478==tbl.rows[j].getAttribute("treelevel")*1-1){
tbl.rows[j].style.display=_476;
if(tbl.rows[j].getAttribute("treeexpanded")=="true"){
icuesManageTreetableChildren(tbl,j,tbl.rows[j].getAttribute("treelevel")*1,_479);
}
}
}
}else{
break;
}
}
break;
}
}
if(_474){
try{
var id=tbl.getAttribute("baseid");
if(id==null){
id=tbl.id;
}
if(typeof callbackTableTreeRowToggled=="function"){
callbackTableTreeRowToggled(id,(_476=="")?true:false,_475);
}
}
catch(e){
}
}
};
function cuesCollapseTreeTableExcept(_47a,_47b){
icuesManageTreeTable("collapse",_47a,_47b);
};
function cuesCollapseTreeTableFully(_47c){
icuesManageTreeTable("collapse",_47c);
};
function cuesExpandTreeTableFully(_47d){
icuesManageTreeTable("expand",_47d);
};
function cuesBuildTreeTableState(_47e){
var _47f=new Array();
try{
var tbl=icuesFindTableObj(_47e);
var _480=tbl.rows.length;
var _481=0;
var row,_482;
if(icuesTableHasAccessibilityRow(_47e)){
_481++;
}
for(var i=_481;i<_480;i++){
row=tbl.rows[i];
if(row.getAttribute("treeexpanded")=="false"&&row.getAttribute("detailrow")!="true"){
_47f.push(row.getAttribute("id"));
}
}
}
catch(e){
}
return _47f;
};
function cuesRestoreTreeTableState(_483,_484){
cuesExpandTreeTableFully(_483);
var row,_485,_486;
var len=_484.length;
for(var i=0;i<len;i++){
try{
row=document.getElementById(_484[i]);
_485=row.getAttribute("treeid");
row.setAttribute("treeexpanded","false");
icuesManageTreeTableNodeIndicator(row,"collapse");
row=row.nextSibling;
while(row!=null){
_486=row.getAttribute("treeid");
if(_486!=null&&_486!=_485){
if(_486.indexOf(_485)==0){
row.style.display="none";
}else{
break;
}
}
row=row.nextSibling;
}
}
catch(e){
}
}
};
function icuesManageTreeTable(_487,_488,_489){
try{
var tbl=icuesFindTableObj(_488);
var _48a=tbl.rows.length;
var _48b=0;
if(_489!=null){
row=document.getElementById(_489);
if(row!=null&&row.getAttribute("treelevel")*1>0){
return;
}
}
if(icuesTableHasAccessibilityRow(_488)){
_48b++;
}
var _48c="";
for(var i=_48b;i<_48a;i++){
var row=tbl.rows[i];
if(_489!=null&&row.getAttribute("id")==_489){
continue;
}
if(_487=="collapse"&&row.getAttribute("treelevel")*1>0){
continue;
}
var _48d=row.getAttribute("treeid");
if(_48d==null||_48d==_48c){
continue;
}
if(_487=="collapse"){
row.setAttribute("treeexpanded","false");
}else{
row.setAttribute("treeexpanded","true");
}
for(var j=i+1;j<_48a;j++){
if(tbl.rows[j].getAttribute("treeid")==_48d){
continue;
}
if(tbl.rows[j].getAttribute("treeid").indexOf(_48d)==0){
tbl.rows[j].style.display=(_487=="collapse")?"none":"";
if(_487=="collapse"&&_489==null){
icuesManageTreeTableNodeIndicator(tbl.rows[j],_487);
tbl.rows[j].setAttribute("treeexpanded","false");
}
}else{
break;
}
}
icuesManageTreeTableNodeIndicator(row,_487);
}
}
catch(e){
}
};
function icuesManageTreeTableNodeIndicator(row,_48e){
var link=row.cells[0].getElementsByTagName("button");
if(link.length>0){
link=link[0];
if(link.className.indexOf("cuesTreetable")!=0){
link=null;
}
}else{
link=null;
}
if(link==null){
link=row.cells[1].getElementsByTagName("button");
if(link.length>0){
link=link[0];
if(link.className.indexOf("cuesTreetable")!=0){
link=null;
}
}else{
link=null;
}
}
if(link!=null){
if(_48e=="collapse"){
link.className="cuesTreetableNodeCollapsed";
link.title=cuesAlt["ExpandTree"];
}else{
link.className="cuesTreetableNodeExpanded";
link.title=cuesAlt["CollapseTree"];
}
}
};
function icuesMakeTreeTableRowVisible(obj){
if(obj==null){
return;
}
var row=icuesFindObjectByTagname(obj,"TR");
if(row.style.display=="none"){
icuesManageTreeTableParents(obj);
obj.focus();
}
};
function icuesIsTreeTable(_48f){
var _490=false;
try{
if(_48f.rows.length>1){
_490=_48f.rows[1].getAttribute("treeid")!=null;
}else{
_490=_48f.rows[0].getAttribute("treeid")!=null;
}
}
catch(e){
}
return _490;
};
function icuesManageTreeTableParents(obj){
try{
var _491,_492;
var _493=true;
var row=icuesFindObjectByTagname(obj,"TR");
var tbl=icuesFindObjectByTagname(row,"TABLE");
var _494=row.getAttribute("treelevel")*1;
if(_494==0){
return;
}
var _495=tbl.rows.length;
for(var i=0;i<_495;i++){
if(tbl.rows[i]==row){
for(var j=i-1;j>=0;j--){
_491=tbl.rows[j].getAttribute("treelevel")*1;
if(_494==_491+1){
if(_493){
_493=false;
for(var k=j+1;k<_495;k++){
_492=tbl.rows[k].getAttribute("treelevel")*1;
if(_494==_492){
tbl.rows[k].style.display="";
}else{
if(_494>_492){
break;
}
}
}
icuesManageTreeTableRowState(tbl.rows[j],"expanded");
}
if(tbl.rows[j].style.display!="none"){
return;
}
tbl.rows[j].style.display="";
icuesManageTreeTableRowState(tbl.rows[j],"expanded");
_494=_491;
}
}
break;
}
}
}
catch(e){
}
};
function icuesManageTreetableChildren(tbl,idx,_496,_497){
var _498;
try{
for(var i=idx+1;i<_497;i++){
_498=tbl.rows[i].getAttribute("treelevel")*1;
if(_496==_498-1||tbl.rows[i].getAttribute("detailrow")=="true"){
tbl.rows[i].style.display="";
if(tbl.rows[i].getAttribute("treeexpanded")=="true"){
icuesManageTreetableChildren(tbl,i,_498,_497);
}
}else{
if(_496>=_498){
break;
}
}
}
}
catch(e){
}
};
function cuesIndent(id,_499,_49a){
try{
var _49b=icuesFindTableObj(id);
if(_49a==null){
var _49c=cuesGetSelectedTableRowNumbers(id);
_49a=_49c[0];
}
var row=_49b.rows[_49a];
var _49d=row.getAttribute("treelevel")*1;
var _49e=false;
if(_49d>0&&_499=="left"){
for(var i=_49a+1;i<_49b.rows.length-1;i++){
var row2=_49b.rows[i];
var _49f=row2.getAttribute("treelevel")*1;
if(_49f>_49d){
row2.setAttribute("treelevel",_49f-1);
}else{
break;
}
}
_49d--;
row.setAttribute("treelevel",_49d);
_49e=true;
}else{
if(_499=="right"&&_49a>0){
var row2=_49b.rows[_49a-1];
var _49f=row2.getAttribute("treelevel")*1;
if(_49d<=_49f){
_49d++;
row.setAttribute("treelevel",_49d);
_49e=true;
}
}
}
cuesRepaint(null,row);
if(_49e){
icuesRekeyTreeTable(_49b,id,_49a);
cuesManageTableRowSelectionRules(id);
}
}
catch(e){
}
};
function icuesRekeyTreeTable(_4a0,id,_4a1){
try{
if(_4a0==null){
_4a0=icuesFindTableObj(id);
}
var keys=new Array();
var cnt=_4a0.rows.length;
var row;
var _4a2=0;
var _4a3=0;
for(var i=0;i<cnt;i++){
row=_4a0.rows[i];
var _4a4=row.getAttribute("treelevel")*1;
try{
if(keys[_4a4]==null){
keys[_4a4]=1;
}else{
keys[_4a4]++;
}
}
catch(e){
keys[_4a4]=1;
}
var key="K";
for(var j=0;j<=_4a4;j++){
key+=keys[j]+".";
}
row.setAttribute("treeid",key);
row.cells[2].style.paddingLeft=(_4a4*TREETABLEINDENTATION)+"px";
if(_4a4==0){
_4a2++;
_4a3=0;
row.className="cuesTableTreeRowTop"+(_4a2%2==0?"Odd":"Even");
}else{
_4a3++;
row.className="cuesTableTreeRowChild"+((_4a3+_4a2)%2==0?"Odd":"Even");
}
}
if(_4a1!=null){
row=_4a0.rows[_4a1];
row.className=icuesRowSelectedClass(row);
}
}
catch(e){
}
};
function cuesMoveSelectedTableRows(_4a5,_4a6){
var _4a7,_4a8;
var _4a9=false;
var _4aa=new Array();
try{
var _4ab=icuesFindTableObj(_4a5);
var _4ac=null;
if(tablesWithColgroup[_4a5]){
_4ac=document.getElementById(_4a5+"_CG2.td");
}
var _4ad=_4ab.rows.length;
var _4ae;
for(var i=0;i<_4ad;i++){
_4ae=_4ab.rows[i].cells[1];
if(_4ae.tagName.toLowerCase()=="td"){
_4af=_4ae.getElementsByTagName("input");
if(_4af.length>0&&_4af[0].checked){
if(_4aa.length>0&&i!=_4aa[_4aa.length-1]+1){
alert(cuesMsg["NoncontiguousReorder"]);
return false;
}
_4aa.push(i);
}
}
}
var _4af;
var _4a8=null;
if(_4a6=="up"){
_4a7=_4aa[0]-1;
_4a8=_4aa[_4aa.length-1];
if(_4a7<0){
return false;
}
}else{
if(_4a6=="down"){
_4a8=_4aa[0]-1;
_4a7=_4aa[_4aa.length-1]+1;
if(_4a7==_4ad){
return false;
}
}else{
return false;
}
}
var _4b0=_4ab.rows[_4a7];
var _4b1=null;
if(_4ac!=null){
_4b1=_4ac.rows[_4a7];
}
var _4b2=_4b0.getAttribute("origposition");
if(_4b2==null||_4b2==""){
return false;
}
var _4b3;
var _4b4;
if(_4a8+1==0&&isIE){
_4b3=_4ab.insertRow(1);
_4b0=_4ab.rows[0];
if(_4ac!=null){
_4b4=_4ac.insertRow(1);
_4b1=_4ac.rows[0];
}
}else{
_4b3=_4ab.insertRow(_4a8+1);
if(_4ac!=null){
_4b4=_4ac.insertRow(_4a8+1);
}
}
cuesCloneAttributes(_4b0,_4b3);
if(_4ac!=null){
cuesCloneAttributes(_4b1,_4b4);
}
var _4b5=_4b0.cells.length;
var _4b6;
for(var i=0;i<_4b5;i++){
_4b6=_4b3.insertCell(i);
_4b6.innerHTML=_4b0.cells[i].innerHTML;
cuesCloneAttributes(_4b0.cells[i],_4b6);
}
var _4b7;
if(_4ac!=null){
_4b7=_4b1.cells.length;
for(var i=0;i<_4b7;i++){
_4b6=_4b4.insertCell(i);
_4b6.innerHTML=_4b1.cells[i].innerHTML;
cuesCloneAttributes(_4b1.cells[i],_4b6);
}
}
try{
var tbl=icuesFindObjectByTagname(_4b0,"TABLE");
var div=document.getElementById(_4a5+".dd");
var _4b8=icuesPhysicalTop(_4b0)-icuesPhysicalTop(tbl);
div.scrollTop=Math.max(0,_4b8-div.offsetHeight+((_4a6=="up")?_4b0.offsetHeight:0));
}
catch(e){
}
if(_4a6=="up"){
if(_4a7==0&&isIE){
_4b0=_4ab.rows[1];
cuesCloneAttributes(_4b0,_4ab.rows[0]);
for(var i=0;i<_4b5;i++){
_4b6=_4ab.rows[0].cells[i];
_4b6.innerHTML=_4b0.cells[i].innerHTML;
cuesCloneAttributes(_4b0.cells[i],_4b6);
}
if(_4ac!=null){
_4b1=_4ac.rows[1];
cuesCloneAttributes(_4b1,_4ac.rows[0]);
for(var i=0;i<_4b7;i++){
_4b6=_4ac.rows[0].cells[i];
_4b6.innerHTML=_4b1.cells[i].innerHTML;
cuesCloneAttributes(_4b1.cells[i],_4b6);
}
}
_4a7++;
}
_4ab.deleteRow(_4a7);
if(_4ac!=null){
_4ac.deleteRow(_4a7);
}
}else{
if(_4a8+1==0&&isIE){
_4b0=_4ab.rows[_4a7+1];
cuesCloneAttributes(_4b0,_4ab.rows[0]);
for(var i=0;i<_4b5;i++){
_4b6=_4ab.rows[0].cells[i];
_4b6.innerHTML=_4b0.cells[i].innerHTML;
cuesCloneAttributes(_4b0.cells[i],_4b6);
}
if(_4ac!=null){
_4b1=_4ac.rows[_4a7+1];
cuesCloneAttributes(_4b1,_4ac.rows[0]);
for(var i=0;i<_4b7;i++){
_4b6=_4ac.rows[0].cells[i];
_4b6.innerHTML=_4b1.cells[i].innerHTML;
cuesCloneAttributes(_4b1.cells[i],_4b6);
}
}
}
_4ab.deleteRow(_4a7+1);
if(_4ac!=null){
_4ac.deleteRow(_4a7+1);
}
}
_4a9=true;
icuesRestripeTableRows(_4ab);
if(_4ac!=null){
icuesRestripeTableRows(_4ac);
}
}
catch(e){
}
if(_4a9){
cuesManageTableRowSelectionRules(_4a5,"moved");
cuesManageTableRowSelectionRules(_4a5);
}
if(icuesTabularGrid[_4a5]!=null){
icuesRenumTabularGrid(_4a5);
}
try{
if(typeof callbackTableRowMoved=="function"){
callbackTableRowMoved(_4a5);
}
}
catch(e){
}
return _4a9;
};
function icuesLocateRowPosition(_4b9,_4ba){
var _4bb=icuesFindTableObj(_4b9);
var _4bc=_4bb.rows.length;
var _4bd;
for(var i=0;i<_4bc;i++){
_4bd=_4bb.rows[i].cells[0];
if(_4bd.tagName.toLowerCase()=="td"&&_4bd.innerHTML==_4ba){
return i;
}
}
return -1;
};
function cuesMoveSelectedTableRowsTo(_4be,_4bf,_4c0){
var nums=cuesGetSelectedTableRowNumbers(_4be);
var _4c1=nums.length;
var _4c2=icuesLocateRowPosition(_4be,_4bf);
if(_4c2==-1){
return;
}
var _4c3="none";
var _4c4=0;
if(nums[0]>_4c2){
_4c3="up";
_4c4=nums[0]-_4c2-1;
if(_4c0=="above"){
_4c4++;
}
}else{
if(nums[_4c1-1]<_4c2){
_4c3="down";
_4c4=_4c2-nums[_4c1-1]-1;
if(_4c0=="below"){
_4c4++;
}
}
}
for(var i=0;i<_4c4;i++){
cuesMoveSelectedTableRows(_4be,_4c3);
}
};
var cuesMoveToActiveTableId="";
function cuesMovetoPrompt(_4c5){
try{
if(cuesGetSelectedTableRowNumbers(_4c5).length==0){
return;
}
if(!cuesAreSelectedTableRowsContiguous(_4c5)){
alert(cuesMsg["NoncontiguousReorder"]);
return;
}
cuesMoveToActiveTableId=_4c5;
cuesDialog.open(cuesKnownLocation+"/cues_utility/cues_dialog_MoveTo.jsp",icuesMovetoReply,80,325,"moveto_dialog");
}
catch(e){
}
};
function icuesMovetoReply(_4c6){
if(_4c6==null||typeof _4c6=="string"){
return;
}
try{
cuesMoveSelectedTableRowsTo(cuesMoveToActiveTableId,_4c6[1],_4c6[0]);
}
catch(e){
}
};
function cuesAreSelectedTableRowsContiguous(_4c7){
var _4c8=new Array();
try{
var _4c9=icuesFindTableObj(_4c7);
var _4ca=_4c9.rows.length;
var _4cb=0;
if(_4ca>0&&_4c9.getAttribute("reorderable")=="true"){
_4cb=1;
}
var _4cc;
var _4cd;
for(var i=0;i<_4ca;i++){
_4cc=_4c9.rows[i].cells[_4cb];
if(_4cc.tagName.toLowerCase()=="td"){
_4cd=_4cc.getElementsByTagName("input");
if(_4cd.length>0&&_4cd[0].checked){
if(_4c8.length>0&&i!=_4c8[_4c8.length-1]+1){
return false;
}
_4c8.push(i);
}
}
}
}
catch(e){
}
return true;
};
function cuesAreTableRowsMoveableUp(_4ce){
var _4cf=new Array();
try{
var _4d0=icuesFindTableObj(_4ce);
var _4d1=_4d0.rows.length;
var _4d2=0;
if(_4d1>0&&_4d0.getAttribute("reorderable")=="true"){
_4d2=1;
}
var _4d3=_4d0.rows[0].cells[_4d2];
if(_4d3.tagName.toLowerCase()=="th"){
for(var i=0;i<3;i++){
_4d3=_4d0.rows[i].cells[_4d2];
if(_4d3.tagName.toLowerCase()=="td"){
break;
}
}
}
if(_4d3.tagName.toLowerCase()=="td"){
var _4d4=_4d3.getElementsByTagName("input");
if(_4d4.length>0&&_4d4[0].checked){
return false;
}
}
}
catch(e){
}
return true;
};
function cuesAreTableRowsMoveableDown(_4d5){
try{
var _4d6=icuesFindTableObj(_4d5);
var _4d7=_4d6.rows.length;
var _4d8=0;
if(_4d7>0&&_4d6.getAttribute("reorderable")=="true"){
_4d8=1;
}
var _4d7=_4d6.rows.length;
var _4d9=_4d6.rows[_4d7-1].cells[_4d8];
if(_4d9.tagName.toLowerCase()=="td"){
var _4da=_4d9.getElementsByTagName("input");
if(_4da.length>0&&_4da[0].checked){
return false;
}
}
}
catch(e){
}
return true;
};
function cuesRestripeTableRows(_4db){
if(!icuesTableHasEmptyRow(_4db)){
icuesRestripeTableRows(icuesFindTableObj(_4db));
}
};
function icuesRestripeTableRows(_4dc){
try{
var _4dd=_4dc.rows.length;
var _4de=_4dc.getAttribute("hasspans")=="true";
if(_4de&&_4dc.className.indexOf("cuesTableSpan")==-1){
_4dc.className+=" cuesTableSpan";
}
var _4df;
var _4e0;
var _4e1;
var span=1;
var _4e2=-1;
for(var i=0;i<_4dd;i++){
_4df=_4dc.rows[i];
if(_4df.className=="CUESHEADER"||_4df.className.indexOf("cuesTableRow")!=0||_4df.className=="cuesTableRowAccessibility"){
continue;
}
if(span<2){
if(_4de){
try{
span=_4df.getAttribute("spaninfo")/1;
}
catch(e){
span=1;
}
}
_4e2++;
}else{
span=Math.max(1,span-1);
}
_4e0=icuesIsRowSelected(_4df);
_4e1=icuesIsRowErrored(_4df);
_4df.className="cuesTableRow"+(_4e2%2==0?"Odd":"Even")+(_4e1?"Errored":"")+(_4e0?"Selected":"");
}
}
catch(e){
}
};
function cuesGetReorderedTableRowNumbers(_4e3){
var _4e4=new Array();
try{
var _4e5=icuesFindTableObj(_4e3);
var _4e6=_4e5.rows.length;
var _4e7=_4e5.rows[0].getAttribute("origposition");
var _4e8=(_4e7==null||_4e7=="")?0:1;
for(var i=0;i<_4e6;i++){
_4e7=_4e5.rows[i].getAttribute("origposition");
if(_4e7!=""&&_4e7!=null&&_4e7!=i+_4e8){
_4e4.push(i);
}
}
}
catch(e){
}
return _4e4;
};
function cuesGetReorderedTableRowIds(_4e9){
var _4ea=new Array();
try{
var _4eb=icuesFindTableObj(_4e9);
var _4ec=_4eb.rows.length;
var _4ed=_4eb.rows[0].getAttribute("origposition");
var _4ee=(_4ed==null||_4ed=="")?0:1;
for(var i=0;i<_4ec;i++){
_4ed=_4eb.rows[i].getAttribute("origposition");
if(_4ed!=""&&_4ed!=null&&_4ed!=i+_4ee){
_4ea.push(_4eb.rows[i].id);
}
}
}
catch(e){
}
return _4ea;
};
var cuesModelRow=new Array();
var cuesModelRowDiv=new Array();
var cuesModelRowTemp=new Array();
function icuesGetModelRowHTML(_4ef){
var _4f0=cuesModelRowTemp[_4ef];
if(_4f0==null){
var _4f1=cuesModelRowDiv[_4ef];
if(_4f1==null){
_4f1=cuesModelRowDiv[_4ef]=document.createElement("div");
var _4f2=cuesModelRow[_4ef].substr(3);
while(_4f2.indexOf("&amp;apos;")!=-1){
_4f2=_4f2.replace("&amp;apos;","'");
}
while(_4f2.indexOf("&apos;")!=-1){
_4f2=_4f2.replace("&apos;","'");
}
while(_4f2.indexOf("&lt;")!=-1){
_4f2=_4f2.replace("&lt;","<");
}
while(_4f2.indexOf("&gt;")!=-1){
_4f2=_4f2.replace("&gt;",">");
}
_4f1.innerHTML=_4f2;
}
var _4f3=_4f1.getElementsByTagName("table")[0];
var _4f0=cuesModelRowTemp[_4ef]=_4f3.rows[0];
}
return _4f0.parentNode.innerHTML;
};
function cuesGetModelRowXpaths(_4f4){
var _4f5=new Array();
var _4f6=cuesModelRowTemp[_4f4];
if(_4f6==null){
icuesGetModelRowHTML(_4f4);
_4f6=cuesModelRowTemp[_4f4];
}
if(_4f6!=null){
var _4f7=_4f6.cells.length;
for(var i=0;i<_4f7;i++){
_4f5.push(_4f6.cells[i].getAttribute("xpath"));
}
}
return _4f5;
};
function cuesInsertTableRow(_4f8,_4f9,_4fa,_4fb,_4fc){
try{
icuesRemoveEmptyClientTableRow(_4f8);
var _4fd=icuesFindTableObj(_4f8);
var _4fe=0;
try{
_4fe=_4fd.rows.length;
}
catch(e){
}
if(_4fa==null){
if(isSafari||isChrome){
_4fa=-1;
}else{
_4fa=_4fe;
}
}
if(tablesWithColgroup[_4f8]){
try{
if(cuesModelRow[_4f8+"_CG1"].substr(0,1)=="T"&&(_4fb==null||_4fb=="")){
_4fb=icuesLocateMaxTableRowPosition(_4f8)+1;
}
}
catch(e){
}
var _4ff=new Array();
_4ff.push(icuesInsertTableRow(_4f8,_4fd,_4f9,_4fa,_4fb,_4fc,"_CG1"));
_4fd=document.getElementById(_4fd.id.replace("_CG1","_CG2"));
_4ff.push(icuesInsertTableRow(_4f8,_4fd,_4f9+".2",_4fa,_4fb,_4fc,"_CG2"));
return _4ff;
}else{
try{
if(cuesModelRow[_4f8].substr(0,1)=="T"&&(_4fb==null||_4fb=="")){
_4fb=icuesLocateMaxTableRowPosition(_4f8)+1;
}
}
catch(e){
}
return icuesInsertTableRow(_4f8,_4fd,_4f9,_4fa,_4fb,_4fc);
}
}
catch(e){
}
return null;
};
function icuesInsertTableRow(_500,_501,_502,_503,_504,_505,_506){
var _507=null;
try{
if(_506==null){
_506="";
}
_507=_501.insertRow(_503);
_507.className="cuesTableRowOdd";
var _508;
var _509=cuesModelRowTemp[_500+_506];
if(_509==null){
var _50a=cuesModelRowDiv[_500+_506];
if(_50a==null){
_50a=cuesModelRowDiv[_500+_506]=document.createElement("div");
var _50b=cuesModelRow[_500+_506].substr(3);
while(_50b.indexOf("&amp;apos;")!=-1){
_50b=_50b.replace("&amp;apos;","'");
}
while(_50b.indexOf("&apos;")!=-1){
_50b=_50b.replace("&apos;","'");
}
while(_50b.indexOf("&lt;")!=-1){
_50b=_50b.replace("&lt;","<");
}
while(_50b.indexOf("&gt;")!=-1){
_50b=_50b.replace("&gt;",">");
}
_50a.innerHTML=_50b;
}
var _50c=_50a.getElementsByTagName("table")[0];
_509=cuesModelRowTemp[_500+_506]=_50c.rows[0];
}
cuesCloneAttributes(_509,_507);
if(_504!=null){
_507.setAttribute("origposition",_504);
}
if(_502!=null){
_507.id=_502;
}
if(isIE){
try{
_507.onclick=_509.onclick;
}
catch(e){
}
try{
_507.onmouseover=_509.onmouseover;
}
catch(e){
}
try{
_507.onmouseout=_509.onmouseout;
}
catch(e){
}
}
var _50d=_509.cells.length;
for(var i=0;i<_50d;i++){
_508=_507.insertCell(i);
_508.innerHTML=_509.cells[i].innerHTML;
cuesCloneAttributes(_509.cells[i],_508);
}
if(cuesModelRow[_500+_506].substr(0,1)=="T"&&_506!="_CG2"){
_507.cells[0].innerHTML=_504;
}
if(_505==null||_505){
icuesRestripeTableRows(_501);
icuesManageTableGlobalCheckbox(_507,_500);
cuesManageTableRowSelectionRules(_500);
}
if(icuesTabularGrid[_500]!=null){
icuesRenumTabularGrid(_500);
}
}
catch(e){
}
return _507;
};
function cuesGetTableModelRowFields(_50e){
var _50f=new Array();
try{
var _510=document.createElement("div");
var _511=cuesModelRow[_50e].substr(3);
while(_511.indexOf("&amp;apos;")!=-1){
_511=_511.replace("&amp;apos;","'");
}
while(_511.indexOf("&apos;")!=-1){
_511=_511.replace("&apos;","'");
}
_510.innerHTML=_511;
var _512=_510.getElementsByTagName("table")[0];
var _513=_512.rows[0];
var _514=_513.cells.length;
for(i=0;i<_514;i++){
_50f.push(_513.cells[i]);
}
}
catch(e){
}
return _50f;
};
function cuesGetTableModelRowFieldAttributes(_515,_516){
var _517=new Array();
try{
var _518=document.createElement("div");
var _519=cuesModelRow[_515].substr(3);
while(_519.indexOf("&amp;apos;")!=-1){
_519=_519.replace("&amp;apos;","'");
}
while(_519.indexOf("&apos;")!=-1){
_519=_519.replace("&apos;","'");
}
_518.innerHTML=_519;
var _51a=_518.getElementsByTagName("table")[0];
var _51b=_51a.rows[0];
var _51c=_51b.cells.length;
for(i=0;i<_51c;i++){
_517.push(_51b.cells[i].getAttribute(_516));
}
}
catch(e){
}
return _517;
};
var cuesButtonMenuTimer=null;
function cuesButtonMenuOnfocusHandler(obj,evt){
clearTimeout(cuesButtonMenuTimer);
};
function cuesButtonMenuOnblurHandler(obj,evt){
if(cuesActiveMenu){
cuesButtonMenuTimer=setTimeout("cuesButtonMenuDelayedHide()",500);
}
if(evt.stopPropagation){
evt.stopPropagation();
}
evt.cancelBubble=true;
return false;
};
function cuesButtonMenuOnKeyHandler(obj,evt){
var rc=true;
var _51d;
if(window.event){
_51d=evt.keyCode;
}else{
_51d=evt.which;
}
if(_51d==40){
cuesButtonMenuClick(obj,evt,true);
if(evt.stopPropagation){
evt.stopPropagation();
}
evt.returnValue=false;
evt.cancelBubble=true;
rc=false;
}
return rc;
};
function cuesButtonMenuDelayedHide(){
clearTimeout(cuesButtonMenuTimer);
if(cuesActiveMenu){
cuesActiveMenu.style.display="none";
}
cuesActiveMenu=null;
};
function icuesLongcaptionButtonMenuOnfocusHandler(obj){
try{
obj=document.getElementById(obj.id+"caption");
obj.dashstyle="2 0";
obj.parentNode.style.display="none";
obj.parentNode.style.display="";
}
catch(e){
}
return false;
};
function icuesLongcaptionButtonMenuOnblurHandler(obj){
try{
obj=document.getElementById(obj.id+"caption");
obj.dashstyle="solid";
obj.parentNode.style.display="none";
obj.parentNode.style.display="";
}
catch(e){
}
return false;
};
var cuesActiveMenu=null;
function cuesButtonMenuClick(obj,evt,_51e){
if(evt==null){
evt=window.event;
}
var _51f;
if(isIE){
_51f=evt.offsetX;
}else{
_51f=evt.clientX-icuesPhysicalLeft(obj);
var _520=0;
var _521=obj;
while(_521!=null){
if(_521.scrollLeft!=null){
_520+=_521.scrollLeft*1;
}
_521=_521.parentNode;
}
_51f+=_520;
}
var rtl=document.body.dir.toLowerCase()=="rtl";
if(_51e||(_51f>obj.offsetWidth-24&&_51f<=obj.offsetWidth&&!rtl)||(((_51f<16&&isIE)||(_51f<36&&!isIE))&&rtl)){
try{
cuesButtonMenuDelayedHide();
var menu=document.getElementById(obj.id+"menu");
var _522=icuesGetOwnerScrollWidth(menu);
cuesActiveMenu=menu;
menu.style.display="inline";
var _523=parseInt(icuesGetStyleProperty(obj,"top"));
if(isNaN(_523)){
_523=0;
}
if(isFF){
menu.style.top=(5+_523)+"px";
}else{
menu.style.top=(obj.offsetHeight+_523)+"px";
}
var _524=obj.offsetWidth;
var _525=menu.firstChild.childNodes.length;
for(var i=0;i<_525;i++){
try{
if(menu.firstChild.childNodes[i].tagName.toLowerCase()=="li"){
_524=Math.max(_524,menu.firstChild.childNodes[i].offsetWidth);
}
}
catch(e){
}
}
if(isIE){
menu.firstChild.style.width=_524+2;
}else{
menu.firstChild.style.width=_524;
}
menu.style.width=menu.firstChild.offsetWidth;
if(rtl){
if(isIE){
var _521=menu.parentNode;
var _526=document.createElement("br");
_521.appendChild(_526);
menu.style.left=(-1*menu.offsetWidth+obj.offsetWidth)+"px";
_521.removeChild(_526);
}else{
menu.style.left=(-1*menu.offsetWidth-4)+"px";
}
}else{
menu.style.left=(-1*obj.offsetWidth)+"px";
}
var _526=document.getElementById(obj.id+"block");
if(_526!=null){
_526.style.height=menu.offsetHeight+"px";
_526.style.width=menu.offsetWidth+"px";
}
var _527=icuesGetOwnerScrollWidth(menu);
if(_527>_522){
if(rtl){
if(isIE){
menu.style.left=(-1*menu.offsetWidth+obj.offsetWidth-(_527-_522)+4)+"px";
}else{
menu.style.left=(-1*menu.offsetWidth-4)+"px";
}
}else{
var _523=Math.max(_527-_522,_524-obj.offsetWidth-8);
menu.style.left=(-1*obj.offsetWidth-_523-4)+"px";
}
}
icuesSetFocusToButtonMenu(menu);
}
catch(e){
}
}else{
try{
var href=obj.getAttribute("href");
if(href.toLowerCase().indexOf("javascript:")==0){
eval(href);
}else{
document.location.href=href;
}
}
catch(e){
}
}
};
function icuesSetFocusToButtonMenu(menu){
try{
var _528=menu.getElementsByTagName("a");
var _529=_528.length;
var _52a=false;
for(var i=0;i<_529;i++){
if(_528[i].disabled||_528[i].getAttribute("href")==null||_528[i].getAttribute("href")==""){
continue;
}
_528[i].focus();
_52a=true;
break;
}
if(!_52a){
cuesButtonMenuTimer=setTimeout("cuesButtonMenuDelayedHide()",2000);
}
}
catch(e){
}
};
function cuesSetButtonMenuCaption(id,_52b){
try{
var _52c=document.getElementById(id);
var _52d=!(_52c.getAttribute("href")=="javascript:void(0)");
var divs=_52c.getElementsByTagName("div");
if(isIE){
divs[0].innerHTML="<nobr>"+_52b+"&nbsp;"+(_52d?"|":"")+"</nobr>";
}else{
divs[0].innerHTML=_52b+"&nbsp;"+(_52d?"|&nbsp;&nbsp;&nbsp;":"&nbsp;&nbsp;&nbsp;");
}
}
catch(e){
}
};
function cuesDisableButtonmenuItem(id){
try{
var obj=document.getElementById(id);
obj.disabled=true;
if(obj.href!=null&&obj.href!=""){
obj.setAttribute("savehref",obj.href);
obj.removeAttribute("href");
}
var _52e=icuesFindObjectByTagname(obj,"div");
cuesSetButtonmenuState(_52e.id.replace("menu",""));
}
catch(e){
}
};
function cuesEnableButtonmenuItem(id){
try{
var obj=document.getElementById(id);
obj.disabled=false;
if(obj.getAttribute("savehref")!=null&&obj.getAttribute("savehref")!=""){
obj.href=obj.getAttribute("savehref");
obj.removeAttribute("savehref");
}
var _52f=icuesFindObjectByTagname(obj,"div");
cuesSetButtonmenuState(_52f.id.replace("menu",""));
}
catch(e){
}
};
function cuesSetButtonmenuState(id){
try{
var _530=document.getElementById(id);
var _531=document.getElementById(id+"menu");
var _532=_531.getElementsByTagName("a");
var _533=_532.length;
var _534=0;
for(var i=0;i<_533;i++){
if(_532[i].getAttribute("href")==null||_532[i].getAttribute("href")==""){
_534++;
}
}
if(_534==_533){
_530.disabled=true;
}else{
try{
_530.removeAttribute("disabled");
}
catch(e){
}
}
}
catch(e){
}
};
function icuesDropdownToButtonmenu(_535,_536){
try{
var _537=_535+"."+_536;
var _538=_535+"."+_536+".apply";
var _539=document.getElementById(_537);
var _53a=document.getElementById(_538+"menu");
var cnt=_539.options.length;
var txt,_53b;
var _53c=new Array();
for(var i=0;i<cnt;i++){
txt=_539.options[i].text;
_53b=_539.options[i].value;
_53c.push("<li><nobr><a onblur=\"return cuesButtonMenuOnblurHandler(this, event)\" onfocus=\"return cuesButtonMenuOnfocusHandler(this, event)\"  href=\"javascript:cuesSetMCLBExtraField('"+_535+"','"+_536+"','"+txt+"',"+_53b+")\" title=\"\">"+txt+"</a></nobr></li>");
}
_53a.firstChild.innerHTML=_53c.join("");
}
catch(e){
}
};
function icuesFixButtonHover(_53d){
if(isIE){
if(_53d==null){
_53d=document;
}
var _53e=_53d.getElementsByTagName("button");
var _53f=_53e.length;
for(var i=0;i<_53f;i++){
if(_53e[i].className.indexOf("cuesButton")==-1){
continue;
}
_53e[i].onmouseover=function(){
this.className+=" cuesButtonHover";
};
_53e[i].onmouseout=function(){
this.className=this.className.replace(" cuesButtonHover","");
};
}
}
};
function icuesClearButtonHover(_540){
var _541=new RegExp(" cuesButtonHover","gi");
try{
_540.className=_540.className.replace(_541,"");
}
catch(e){
}
};
function cuesShowPopupMenu(id,evt,_542){
try{
cuesButtonMenuDelayedHide();
var menu=document.getElementById(id+"menu");
var obj;
var x,y;
var _543=0;
var _544=0;
if(_542!=null){
obj=document.getElementById(_542);
x=icuesPhysicalLeft(obj);
var _545=icuesPhysicalTop(obj)*1+obj.offsetHeight;
var _546=icuesPhysicalTop2(obj)*1+obj.offsetHeight;
_543=_545-_546;
var _547=obj;
while(_547!=null){
if(_547.scrollTop!=null){
_544+=_547.scrollTop*1;
}
_547=_547.parentNode;
}
if(isSafari||isChrome||isFF){
_546-=_544;
y=_546;
}else{
y=_545;
}
}else{
obj=menu;
var _545=icuesPhysicalTop(obj)*1+obj.offsetHeight;
var _546=icuesPhysicalTop2(obj)*1+obj.offsetHeight;
_543=_545-_546;
x=evt.clientX;
y=evt.clientY-_543;
var _547=menu.parentNode;
if(isFF){
var _545=icuesPhysicalTop(_547)*1;
var _546=icuesPhysicalTop2(_547)*1;
var _548=_545-_546;
y=evt.clientY-_543-_548;
}
while(_547!=null){
if(_547.scrollTop!=null){
_544+=_547.scrollTop*1;
}
_547=_547.parentNode;
}
if(isIE){
y+=_544;
}
}
if(isIE){
document.body.appendChild(menu);
}
cuesActiveMenu=menu;
menu.style.display="inline";
menu.style.left=x+"px";
menu.style.top=y+"px";
menu.style.zIndex=99;
var _549=0;
var _54a=menu.firstChild.childNodes.length;
for(var i=0;i<_54a;i++){
_549=Math.max(_549,menu.firstChild.childNodes[i].offsetWidth);
}
menu.firstChild.style.width=_549+2;
menu.style.width=menu.firstChild.offsetWidth;
var _54b=document.body.offsetHeight-_543-4;
if(isIE){
_54b+=_544;
}
var _547=menu.parentNode;
var _548=0;
while(_547!=null&&isIE){
if(_547.offsetTop){
_548=_547.offsetTop*1;
}
_547=_547.parentNode;
}
if(y+menu.offsetHeight>_54b-20){
var _54c=y+menu.offsetHeight-_54b;
if(isFF){
_54c=Math.abs(_54c);
}
if(_548>_543){
_54c+=_548;
}
if(_54c>0){
menu.style.top=(y-_54c-20)+"px";
}
}
var _54d=menu.getElementsByTagName("a");
var _54e=_54d.length;
var _54f=false;
for(var i=0;i<_54e;i++){
if(_54d[i].disabled||_54d[i].getAttribute("href")==null||_54d[i].getAttribute("href")==""){
continue;
}
_54d[i].focus();
_54f=true;
break;
}
if(!_54f){
cuesButtonMenuTimer=setTimeout("cuesButtonMenuDelayedHide()",2000);
}
}
catch(e){
}
return false;
};
function icuesHTML2XML(str){
var _550=new Array();
_550.push(new RegExp(".*id=[^\"]","i"));
_550.push(new RegExp(".*title=[^\"]","i"));
_550.push(new RegExp(".*onclick=[^\"]","i"));
var _551=new RegExp("[^ >//]*","i");
var len;
var _552;
for(var i=0;i<_550.length;i++){
while(_550[i].test(str)){
len=RegExp.lastMatch.length;
_552=RegExp.lastMatch.substring(0,len-1)+"\""+RegExp.lastMatch.substring(len-1);
_551.test(RegExp.rightContext);
str=_552+RegExp.lastMatch+"\""+RegExp.rightContext;
}
}
return str;
};
var cuesXslDom=null;
var cuesXslLocale="en";
var cuesXslAppStrings=null;
var cuesXslBrandStrings=null;
var cuesXslSkin="base";
function cuesSetTransformLocale(_553){
if(_553!=cuesXslLocale&&_553!=null&&_553!=""){
cuesXslDom=null;
cuesXslLocale=_553;
}
};
function cuesSetTransformAppStrings(_554){
if(_554!=cuesXslAppStrings&&_554!=null&&_554!=""){
cuesXslDom=null;
cuesXslAppStrings=_554;
}
};
function cuesSetTransformBrandStrings(_555){
if(_555!=cuesXslBrandStrings&&_555!=null&&_555!=""){
cuesXslDom=null;
cuesXslBrandStrings=_555;
}
};
function cuesSetTransformSkin(skin){
if(skin!=cuesXslSkin&&skin!=null&&skin!=""){
cuesXslDom=null;
cuesXslSkin=skin;
}
};
function cuesCheckTransformBuildVersion(){
try{
if(cuesXslDom==null){
if(isFF||isSafari||isChrome){
cuesXslDom=cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET",null,"xml",null,null,null,null,null,true);
}else{
cuesXslDom=cuesGetXmlDoc(null,cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET",null,null,null,null,null,null,null,true));
}
}
var info=cuesXpath(cuesXslDom,"//*[@name=\"CUESBUILDVERSION\"]");
if(info.length==1){
if(info[0].text!=null){
info=info[0].text;
}else{
info=info[0].textContent;
}
}
return info==cuesBuildInfo;
}
catch(e){
}
return false;
};
function cuesGetTransformBuildVersion(){
var _556="";
try{
if(cuesXslDom==null){
if(isFF||isSafari||isChrome){
cuesXslDom=cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET",null,"xml");
}else{
cuesXslDom=cuesGetXmlDoc(null,cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET"));
}
}
var info=cuesXpath(cuesXslDom,"//*[@name=\"CUESBUILDVERSION\"]");
if(info.length==1){
if(info[0].text!=null){
info=info[0].text;
}else{
info=info[0].textContent;
}
}
_556="CUES version XSLT:"+info+" CLIENT:"+cuesBuildInfo;
}
catch(e){
}
return _556;
};
function cuesGetTransformVariable(name){
var _557=icuesGetTransformVariable(name,cuesXslDom);
if(_557==null){
_557=icuesGetTransformVariable(name,cuesGetXmlDoc(null,cuesHTTP(cuesKnownLocation+"cues_utility/cuesSkin_"+cuesXslSkin+".xsl","GET")));
}
return _557;
};
function icuesGetTransformVariable(name,dom){
var _558=null;
try{
if(dom!=null){
var info;
if(isIE){
info=cuesXpath(dom,"//xsl:variable[@name=\""+name+"\"]");
}else{
info=cuesXpath(dom,"//*[local-name()=\"variable\"][@name=\""+name+"\"]");
}
if(info.length==1){
if(info[0].text!=null){
_558=info[0].text;
}else{
_558=info[0].textContent;
}
}
}
}
catch(e){
}
return _558;
};
var bInsideBootstrap=false;
function cuesBootstrap(url,id,_559,_55a){
var _55b="<html xmlns:cues=\"http://www.cisco.com\"><head><cues:supportfiles clienttree=\"true\"/></head><body></body></html>";
cuesTransform(_55b,id,null,null,true);
if(url!=null&&url!=""){
bInsideBootstrap=true;
setTimeout("cuesTransform(cuesHTTP('"+url+"'),'"+id+"')",500);
}else{
try{
if(callbackBootstrapComplete!=null){
setTimeout("callbackBootstrapComplete()",500);
}
}
catch(e){
}
}
};
var icuesTransformT0=icuesTransformT1=icuesTransformT2=icuesTransformT3=icuesTransformT4=icuesTransformT5=0;
function icuesTT(){
return ((icuesTransformT3-icuesTransformT0)+"ms : "+(icuesTransformT1-icuesTransformT0)+"ms "+(icuesTransformT2-icuesTransformT1)+"ms "+(icuesTransformT3-icuesTransformT2)+"ms "+(icuesTransformT4-icuesTransformT3)+"ms "+(icuesTransformT5-icuesTransformT4)+"ms ");
};
function cuesTransform(_55c,_55d,name,_55e,_55f){
icuesTransformT0=new Date();
var _560=null;
var _561=null;
try{
var _562=null;
if(_55d!=null){
_562=document.getElementById(_55d);
}
var _563=null;
if(typeof _55c=="string"){
var _564=document.getElementById(_55c);
if(_564==null){
_563=cuesGetXmlDoc(null,_55c);
}else{
var _565=false;
if(isIE){
for(var i=0;i<document.childNodes.length;i++){
try{
if(document.childNodes[i].nodeName.toLowerCase()=="xhtml:html"){
_565=true;
}
}
catch(e){
}
}
}
_563=cuesGetXmlDoc(null,"<data xmlns:cues=\"http://www.cisco.com\" xmlns:CUES=\"http://www.cisco.com\" xmlns:xhtml=\"http://www.w3.org/1999/xhtml\" xmlns:XHTML=\"http://www.w3.org/1999/xhtml\">"+icuesInnerXml2(_564,false,_565)+"</data>");
if(isIE&&_563.xml.length==0){
if(cuesDebugTransforms){
alert(icuesInnerXml2(_564,false,_565));
}
return;
}
}
}else{
if(typeof _55c=="object"&&_55c.tagName!=null&&_55c.tagName.toLowerCase()=="iframe"){
var _566=(_55c.contentWindow||_55c.contentDocument);
if(_566.document){
_566=_566.document;
}
if(isIE){
var _565=false;
if(isIE){
for(var i=0;i<document.childNodes.length;i++){
try{
if(document.childNodes[i].nodeName.toLowerCase()=="xhtml:html"){
_565=true;
}
}
catch(e){
}
}
}
_563=cuesGetXmlDoc(null,"<data xmlns:cues=\"http://www.cisco.com\" xmlns:CUES=\"http://www.cisco.com\" xmlns:xhtml=\"http://www.w3.org/1999/xhtml\" xmlns:XHTML=\"http://www.w3.org/1999/xhtml\">"+icuesInnerXml2(_566.body,false,_565)+"</data>");
}else{
_563=_566;
}
}else{
if(typeof _55c=="object"){
if(isIE&&_55c.xml){
_563=cuesGetXmlDoc(null,_55c.xml);
}else{
_563=_55c;
}
}else{
throw "No valid source";
}
}
}
if(_563==null||(isIE&&_563.xml.length==0)){
if(cuesDebugTransforms){
cuesLog("Transform error.  Not valid XML");
}
throw "Not valid XML";
}
if(cuesXslDom==null){
var _567;
if(isIE||isSafari||isChrome){
var at;
var url=window.location+"";
if(cuesUsage=="webapp"){
if(cuesKnownLocation=="/"||icuesHTTPFileURL){
at=url.lastIndexOf("?");
if(at!=-1){
url=url.substring(0,at);
}
at=url.lastIndexOf("/");
_567=url.substring(0,at);
}else{
at=url.lastIndexOf(cuesKnownLocation);
if(at==-1){
at=url.lastIndexOf("/");
_567=url.substring(0,at);
}else{
_567=url.substring(0,at)+cuesKnownLocation;
}
}
}else{
var _568=url.split("/");
_567=_568[0]+"//"+_568[2]+"/"+cuesKnownLocation;
}
}
if(isFF||isSafari||isChrome){
cuesXslDom=cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET",null,"xml",null,null,null,null,null,true);
}else{
cuesXslDom=cuesGetXmlDoc(null,cuesHTTP(cuesKnownLocation+"cues_utility/cues_taglib.xsl","GET",null,null,null,null,null,null,null,true));
}
var _569=cuesXpath(cuesXslDom,"//*[@href=\"cuesStrings_en.xsl\"]");
if(_569.length>0){
var num=_569.length;
for(var ii=0;ii<num;ii++){
var href=_569[ii].getAttribute("href");
if(ii==num-1){
href=href.replace("_en","_"+cuesXslLocale);
}
if(isIE){
href=_567+"/cues_utility/"+href;
}
_569[ii].setAttribute("href",href);
if(isSafari||isChrome){
href=_567+"/cues_utility/"+href;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"variable\"][@name]");
var _56c=_56b.length;
try{
var _56d=_569[ii].parentNode;
for(j=0;j<_56c;j++){
var _56e="//*[local-name()=\"variable\"][@name=\""+_56b[j].getAttribute("name")+"\"]";
var _56f=cuesXpath(cuesXslDom,_56e);
if(_56f.length>0){
_56d.removeChild(_56f[0]);
}
_56d.insertBefore(_56b[j].cloneNode(true),_569[ii]);
}
}
catch(e){
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"APPSTRINGS\"]");
if(_570.length>0){
if(cuesXslAppStrings==null){
_570[0].text=href;
_570[0].firstChild.nodeValue=href;
}else{
if(isIE){
_570[0].text=_567+"/cues_utility/"+cuesXslAppStrings;
_570[0].firstChild.nodeValue=_567+"/cues_utility/"+cuesXslAppStrings;
}else{
if(isSafari||isChrome){
href=_567+"/cues_utility/"+cuesXslAppStrings;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"name\"][@key]");
var _56c=_56b.length;
try{
var _56d=_570[0].parentNode;
for(j=0;j<_56c;j++){
_56d.insertBefore(_56b[j].cloneNode(true),_570[0]);
}
}
catch(e){
}
}
}else{
_570[0].text=cuesXslAppStrings;
_570[0].firstChild.nodeValue=cuesXslAppStrings;
}
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"BRANDSTRINGS\"]");
if(_570.length>0){
if(cuesXslBrandStrings==null){
_570[0].text=href;
_570[0].firstChild.nodeValue=href;
}else{
if(isIE){
_570[0].text=_567+"/cues_utility/"+cuesXslBrandStrings;
_570[0].firstChild.nodeValue=_567+"/cues_utility/"+cuesXslBrandStrings;
}else{
if(isSafari||isChrome){
href=_567+"/cues_utility/"+cuesXslBrandStrings;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"name\"][@key]");
var _56c=_56b.length;
try{
var _56d=_570[0].parentNode;
for(j=0;j<_56c;j++){
_56d.insertBefore(_56b[j].cloneNode(true),_570[0]);
}
}
catch(e){
}
}
}else{
_570[0].text=cuesXslBrandStrings;
_570[0].firstChild.nodeValue=cuesXslBrandStrings;
}
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"CUESSTRINGS\"]");
if(_570.length>0){
_570[0].text=href;
_570[0].firstChild.nodeValue=href;
}
}
if(isSafari||isChrome){
for(var ii=num-1;ii>=0;ii--){
_569[ii].parentNode.removeChild(_569[ii]);
_569[ii]=null;
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"APPSTRINGS\"]");
if(_570.length>0){
if(cuesXslAppStrings==null){
}else{
if(isIE){
_570[0].text=_567+"/cues_utility/"+cuesXslAppStrings;
_570[0].firstChild.nodeValue=_567+"/cues_utility/"+cuesXslAppStrings;
}else{
if(isSafari||isChrome){
href=_567+"/cues_utility/"+cuesXslAppStrings;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"name\"][@key]");
var _56c=_56b.length;
try{
var _56d=_570[0].parentNode;
for(j=0;j<_56c;j++){
_56d.insertBefore(_56b[j].cloneNode(true),_570[0]);
}
}
catch(e){
}
}
}else{
_570[0].text=cuesXslAppStrings;
_570[0].firstChild.nodeValue=cuesXslAppStrings;
}
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"BRANDSTRINGS\"]");
if(_570.length>0){
if(cuesXslBrandStrings==null){
_570[0].text=href;
_570[0].firstChild.nodeValue=href;
}else{
if(isIE){
_570[0].text=_567+"/cues_utility/"+cuesXslBrandStrings;
_570[0].firstChild.nodeValue=_567+"/cues_utility/"+cuesXslBrandStrings;
}else{
if(isSafari||isChrome){
href=_567+"/cues_utility/"+cuesXslBrandStrings;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"name\"][@key]");
var _56c=_56b.length;
try{
var _56d=_570[0].parentNode;
for(j=0;j<_56c;j++){
_56d.insertBefore(_56b[j].cloneNode(true),_570[0]);
}
}
catch(e){
}
}
}else{
_570[0].text=cuesXslBrandStrings;
_570[0].firstChild.nodeValue=cuesXslBrandStrings;
}
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"CUESSTRINGS\"]");
if(_570.length>0){
_570[0].text=href;
_570[0].firstChild.nodeValue=href;
}
var _569=cuesXpath(cuesXslDom,"//*[@href=\"cuesSkin_base.xsl\"]");
if(_569.length>0){
var num=_569.length;
for(var ii=0;ii<num;ii++){
var href=_569[ii].getAttribute("href");
href=href.replace("_base","_"+cuesXslSkin);
if(isIE){
href=_567+"/cues_utility/"+href;
}
_569[ii].setAttribute("href",href);
if(isSafari||isChrome){
href=_567+"/cues_utility/"+href;
var _56a=cuesHTTP(href,"GET",null,"xml");
if(_56a!=null){
var _56b=cuesXpath(_56a,"//*[local-name()=\"variable\"][@name]");
var _56c=_56b.length;
try{
var _56d=_569[ii].parentNode;
for(j=0;j<_56c;j++){
var _56e="//*[local-name()=\"variable\"][@name=\""+_56b[j].getAttribute("name")+"\"]";
var _56f=cuesXpath(cuesXslDom,_56e);
if(_56f.length>0){
_56d.removeChild(_56f[0]);
}
_56d.insertBefore(_56b[j].cloneNode(true),_569[ii]);
}
}
catch(e){
}
}
}
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"LOCALE\"]");
if(_570.length>0){
_570[0].text=cuesXslLocale;
_570[0].firstChild.nodeValue=cuesXslLocale;
}
if(isSafari||isChrome){
for(var ii=num-1;ii>=0;ii--){
_569[ii].parentNode.removeChild(_569[ii]);
_569[ii]=null;
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"CUESKNOWNLOCATION\"]");
if(_570.length>0){
_570[0].text=cuesKnownLocation;
_570[0].firstChild.nodeValue=cuesKnownLocation;
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"ISIE\"]");
if(_570.length>0){
_570[0].text=(isIE?"1":"0");
_570[0].firstChild.nodeValue=(isIE?"1":"0");
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"ISIE6\"]");
if(_570.length>0){
_570[0].text=(isIE6?"1":"0");
_570[0].firstChild.nodeValue=(isIE6?"1":"0");
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"ISFF\"]");
if(_570.length>0){
_570[0].text=(isFF?"1":"0");
_570[0].firstChild.nodeValue=(isFF?"1":"0");
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"ISSAFARI\"]");
if(_570.length>0){
_570[0].text=(isSafari?"1":"0");
_570[0].firstChild.nodeValue=(isSafari?"1":"0");
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"ISCHROME\"]");
if(_570.length>0){
_570[0].text=(isChrome?"1":"0");
_570[0].firstChild.nodeValue=(isChrome?"1":"0");
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"RTL\"]");
if(_570.length>0){
_570[0].text=(cuesXslLocale=="ar"?"1":"0");
_570[0].firstChild.nodeValue=(cuesXslLocale=="ar"?"1":"0");
}
}
var _570=cuesXpath(cuesXslDom,"//*[@name=\"PROCESSSUPPORTFILES\"]");
if(_570.length>0){
_570[0].text=(_55f?"1":"0");
_570[0].firstChild.nodeValue=(_55f?"1":"0");
}
if(name!=null&&_55e!=null){
var _570=cuesXpath(cuesXslDom,"//*[@name=\""+name+"\"]");
if(_570.length>0){
_570[0].text=_55e;
_570[0].firstChild.nodeValue=_55e;
}
}
if(cuesDebugTransforms){
cuesLog("TRANSFORM INPUT<br/>====<br/><code>"+cuesGetXml(_563).replace(/</g,"&lt;").replace(/>/g,"&gt;")+"</code><br/>====<br/>");
}
icuesTransformT1=new Date();
_560=cuesXSLT(_563,cuesXslDom);
if(isSafari||isSafari){
_560=_560.replace(/%26/g,"&amp;");
}
icuesTransformT2=new Date();
_561=_560;
if(cuesDebugTransforms){
cuesLog("TRANSFORM REPLY<br/>====<br/><code>"+_560.replace(/</g,"&lt;").replace(/>/g,"&gt;")+"</code><br/>====<br/>");
}
if(_562!=null){
var head=document.getElementsByTagName("head");
if(head.length>0&&_55f){
try{
var from=_560.indexOf("<head>");
var to=_560.indexOf("</head>");
if(from!=-1&&to!=-1){
var _571=cuesGetXmlDoc(null,_560.substring(from,to+7));
var _572=cuesXpath(_571,"//link");
for(var cnt=0;cnt<_572.length;cnt++){
var _573=document.createElement("link");
head[0].appendChild(_573);
_573.rel="stylesheet";
_573.type="text/css";
_573.href=_572[cnt].getAttribute("href");
if(_572[cnt].getAttribute("id")){
_573.id=_572[cnt].getAttribute("id");
}
if(cuesDebugTransforms){
cuesLog("load css "+_572[cnt].getAttribute("href"));
}
}
var _574=cuesXpath(_571,"//script");
for(var cnt=0;cnt<_574.length;cnt++){
var src=_574[cnt].getAttribute("src");
if(src==null||src==""||src.indexOf("cues_taglib.js")!=-1){
continue;
}
var _575=document.createElement("script");
head[0].appendChild(_575);
_575.src=_574[cnt].getAttribute("src");
icuesSleep(100);
if(cuesDebugTransforms){
cuesLog("load js "+_574[cnt].getAttribute("src"));
}
}
}
}
catch(e){
}
}
icuesTransformT3=new Date();
if(!_55f){
_562.innerHTML=_560;
}
icuesTransformT4=new Date();
var head=document.getElementsByTagName("head");
if(cuesDebugTransforms){
cuesLog("TRANSFORM #head="+head.length);
}
if(head.length>0){
var from=_560.indexOf("<script>");
var _576=0;
while(from!=-1&&_576<40){
_576++;
_560=_560.substring(from+8);
var to=_560.indexOf("</script>");
if(to!=-1){
var code=_560.substring(0,to);
if(cuesDebugTransforms){
cuesLog("<br><br>**1** code is ("+code.length+" bytes)<br>"+code);
}
var _575=document.createElement("script");
head[0].appendChild(_575);
_575.text=code;
head[0].removeChild(_575);
_560=_560.substring(to+9);
from=_560.indexOf("<script>");
}else{
break;
}
}
_560=_561;
var from=_560.indexOf("<SCRIPT>");
var _576=0;
while(from!=-1&&_576<40){
_576++;
_560=_560.substring(from+8);
var to=_560.indexOf("</SCRIPT>");
if(to!=-1){
var code=_560.substring(0,to);
if(cuesDebugTransforms){
cuesLog("<br><br>**2** code is ("+code.length+" bytes)<br>"+code);
}
var _575=document.createElement("script");
head[0].appendChild(_575);
_575.text=code;
head[0].removeChild(_575);
_560=_560.substring(to+9);
from=_560.indexOf("<SCRIPT>");
}else{
break;
}
}
}
}
}
catch(e){
var err=e.message;
if(err==null){
err=e;
}
if(cuesDebugTransforms){
cuesLog("Transform error="+err);
}
throw err;
}
if(bInsideBootstrap){
bInsideBootstrap=false;
try{
if(typeof callbackBootstrapComplete=="function"){
callbackBootstrapComplete();
}
}
catch(e){
}
}
icuesTransformT5=new Date();
return _561;
};
var xsltProcessor=null;
function cuesXSLT(_577,_578,_579){
if(isIE){
return _577.transformNode(_578.documentElement);
}else{
var _57a=new XSLTProcessor();
_57a.importStylesheet(_578);
var _57b=_57a.transformToDocument(_577);
var _57c=new XMLSerializer();
_57b=_57c.serializeToString(_57b.documentElement);
if(_57b.indexOf("<transformiix:result")>-1){
_57b=_57b.substring(_57b.indexOf(">")+1,_57b.lastIndexOf("<"));
}
if(_579==null||!_579){
_57b=_57b.replace(/&amp;lt;/g,"<");
_57b=_57b.replace(/&amp;gt;/g,">");
}
return _57b;
}
};
function icuesInnerXml(el){
var _57d=el.innerHTML;
if(_57d.indexOf("<?xml")==0){
var at=_57d.indexOf("/>");
_57d=_57d.substring(at+2);
}
return _57d;
};
function icuesInnerXml2(el,_57e,_57f){
if(isIE&&_57f&&el.nodeName.indexOf("/")>-1){
if(el.scopeName!="HTML"){
return ("<"+el.scopeName+":"+el.nodeName.toLowerCase()+">");
}else{
return ("<"+el.nodeName.toLowerCase()+">");
}
}
var txt=new Array(),i=0;
if(_57e&&el.nodeName.toLowerCase()!="#text"){
if(isIE&&el.scopeName!="HTML"){
txt.push("<"+el.scopeName+":"+el.nodeName.toLowerCase());
}else{
txt.push("<"+el.nodeName.toLowerCase());
}
var _580=el.attributes?el.attributes.length:0;
for(var j=0;j<_580;j++){
if(el.attributes[j].specified&&el.attributes[j].value!=""&&el.attributes[j].value!=null&&el.attributes[j].value.length>0){
txt.push(" "+el.attributes[j].name+"=\""+el.attributes[j].value+"\"");
}
}
txt.push(">");
}
if(el.nodeType==3){
txt.push(el.nodeValue);
}else{
while(el.childNodes[i]){
txt.push(icuesInnerXml2(el.childNodes[i],true,_57f));
i++;
}
}
if((isFF||isSafari||isChrome)&&_57e&&el.nodeName.toLowerCase()!="#text"){
txt.push("</"+el.nodeName.toLowerCase()+">");
}else{
if(isIE&&el.scopeName!="HTML"&&_57e&&!_57f&&el.nodeName.toLowerCase()!="#text"&&el.nodeName.toLowerCase()!="/#text"){
txt.push("</"+el.scopeName+":"+el.nodeName.toLowerCase()+">");
}else{
if(isIE&&_57e&&!_57f&&el.nodeName.toLowerCase()!="#text"&&el.nodeName.toLowerCase()!="/#text"){
txt.push("</"+el.nodeName.toLowerCase()+">");
}else{
if(isIE&&_57e&&_57f&&el.nodeName.toLowerCase()!="#text"&&el.nodeName.toLowerCase()!="/#text"&&el.nodeName.indexOf(":")==-1){
txt.push("</"+el.nodeName.toLowerCase()+">");
}
}
}
}
return txt.join("");
};
function cuesCloneTransformEnv(){
cuesKnownLocation=top.cuesKnownLocation;
cuesImageFolder=top.cuesImageFolder;
cuesIconFolder=top.cuesIconFolder;
cuesVersion=top.cuesVersion;
cuesXslSkin=top.cuesXslSkin;
cuesImageSuffix=top.cuesImageSuffix;
icuesBackgroundImage=top.icuesBackgroundImage;
try{
var head=document.getElementsByTagName("head");
if(head.length>0){
var _581=document.createElement("link");
head[0].appendChild(_581);
_581.rel="stylesheet";
_581.type="text/css";
_581.href=cuesKnownLocation+"/cues_utility/"+top.cuesCSSFile;
}
}
catch(e){
}
cuesMsg=top.cuesMsg;
cuesAlt=top.cuesAlt;
cuesACP=top.cuesACP;
cuesMaskeditFormatError=top.cuesMaskeditFormatError;
cuesXslDom=top.cuesXslDom;
};
var cuesDateObj=null;
var cuesDateObjId=null;
var cuesDatePickerSpecial=null;
var cuesDatePickerBlocked=null;
var cuesDatePickerDisabled=null;
var cuesDatePickerDisabledBefore=null;
var cuesDatePickerDisabledAfter=null;
var cuesDatePickerBlockedBefore=null;
var cuesDatePickerBlockedAfter=null;
var bcuesDatePickerShowLegendSpecial=false;
var bcuesDatePickerShowLegendBlocked=false;
function icuesDatePickerHookHandler(evt){
if(evt==null){
evt=window.event;
}
var obj=(isIE)?evt.srcElement:evt.target;
var _582=document.getElementById("cuesDatePicker");
while(obj!=null){
if(obj==_582){
return;
}
obj=obj.parentNode;
}
icuesHideDatePicker();
};
function icuesHideDatePicker(){
document.getElementById("cuesDatePicker").style.display="none";
if(document.removeEventListener){
document.removeEventListener("click",icuesDatePickerHookHandler,false);
}else{
if(document.detachEvent){
document.detachEvent("onclick",icuesDatePickerHookHandler);
}
}
};
function icuesDatePickerDayOnFocus(obj){
try{
obj.className=obj.className+" cuesCalFocused";
}
catch(e){
}
};
function icuesDatePickerDayOnBlur(obj){
try{
obj.className=obj.className.replace(" cuesCalFocused","");
}
catch(e){
}
};
function cuesShowDatePicker(_583,_584,_585,id,_586,_587,_588,_589,_58a,_58b,_58c,_58d){
icuesHideDatePicker();
cuesDatePickerSpecial=_58b;
cuesDatePickerBlocked=_58c;
cuesDatePickerBlockedBefore=_589;
cuesDatePickerBlockedAfter=_58a;
cuesDateObjId=id;
cuesDateObj=new Date();
cuesDateObj.setDate(1);
cuesDateObj.setFullYear(_584.getFullYear());
cuesDateObj.setMonth(_584.getMonth());
cuesDateObj.setDate(_584.getDate());
cuesDateObj.setHours(0);
cuesDateObj.setMinutes(0);
cuesDateObj.setSeconds(0);
cuesDateObj.setMilliseconds(0);
var day=_584.getDate();
var _58e=_584.getMonth();
document.getElementById("cuesDatePickerMonth").selectedIndex=_58e;
document.getElementById("cuesDatePickerYear").value=_584.getFullYear();
var _58f=document.getElementById("cuesDatePickerToday");
if(_58f!=null){
if(_586==false||_586==0){
_58f.className="cuesCalTodayLinkDisabled";
_58f.removeAttribute("href");
}else{
_58f.className="cuesCalTodayLink";
_58f.setAttribute("href",_58f.getAttribute("savehref"));
}
}
cuesDatePickerPopulate();
var _590=icuesPhysicalLeft(_583);
var _591=icuesPhysicalTop2(_583)*1;
var _592=document.getElementById("cuesDatePicker");
_592.style.top=_591+(_583.offsetHeight*1)+"px";
_592.style.left=_590+"px";
_592.style.display="";
var _593=_592.getElementsByTagName("iframe");
if(_593.length>0){
_593[0].style.height=_592.offsetHeight+"px";
_593[0].style.width=_592.offsetWidth+"px";
}
if(_592.getAttribute("aligned")==null){
_592.setAttribute("aligned","true");
var _594=document.getElementById("cuesDatePickerWeekdays");
var _595=document.getElementById("cuesDatePickerCal");
var _596=new Array();
for(var i=0;i<7;i++){
_596[i]=_595.rows[0].cells[i].clientWidth;
}
_594.style.tableLayout="fixed";
_595.style.tableLayout="fixed";
var _597=_594.getElementsByTagName("col");
var _598=_595.getElementsByTagName("col");
for(var i=0;i<7;i++){
_598[i].width=_597[i].width=_596[i];
}
}
document.getElementById("cuesDatePickerMonth").focus();
setTimeout("icuesDatePickerHook()",250);
};
function icuesDatePickerHook(){
if(document.addEventListener){
document.addEventListener("click",icuesDatePickerHookHandler,false);
}else{
if(document.attachEvent){
document.attachEvent("onclick",icuesDatePickerHookHandler);
}
}
};
function cuesDatePickerPopulate(){
bcuesDatePickerShowLegendSpecial=false;
bcuesDatePickerShowLegendBlocked=false;
var _599;
var _59a=document.getElementById("cuesDatePickerMonth").selectedIndex;
var _59b=document.getElementById("cuesDatePickerYear").value;
var _59c=new Date();
_59c.setDate(1);
_59c.setMonth(_59a);
_59c.setYear(_59b);
var _59d=1;
var _59e=_59c.getDay();
var cal=document.getElementById("cuesDatePickerCal");
var _59f=28;
while(_59f<33){
try{
_59c.setDate(_59f);
if(_59c.getDate()==_59f){
_59f++;
}else{
_59f--;
break;
}
}
catch(e){
break;
}
}
var _5a0;
var _5a1;
_59c.setDate(1);
if(_59a>0){
_59c.setMonth(_59a-1);
_5a0=_59a-1;
_5a1=_59b;
}else{
_59c.setMonth(11);
var _5a2=_59c.getYear();
_59c.setYear(_5a2-1);
_5a0=11;
_5a1=_59b-1;
}
var _5a3;
var _5a4;
if(_59a==11){
_5a3=0;
_5a4=(1*_59b)+1;
}else{
_5a3=(1*_59a)+1;
_5a4=_59b;
}
var _5a5=28;
while(_5a5<33){
try{
_59c.setDate(_5a5);
if(_59c.getDate()==_5a5){
_5a5++;
}else{
_5a5--;
break;
}
}
catch(e){
break;
}
}
var _5a6=new Date();
var _5a7=new Date();
_5a7.setHours(0);
_5a7.setMinutes(0);
_5a7.setSeconds(0);
_5a7.setMilliseconds(0);
_5a7.setDate(1);
_5a7.setFullYear(_5a1);
_5a7.setMonth(_5a0);
for(var i=0;i<_59e;i++){
_5a7.setDate(_5a5-_59e+i+1);
_599=cal.rows[0].cells[i];
_599.innerHTML=_5a5-_59e+i+1;
icuesAssignDateCellClass(_599,"cuesCalPrior",_5a7,_5a6);
}
_5a7.setDate(1);
_5a7.setMonth(_59a);
_5a7.setFullYear(_59b);
var _59d=1;
for(var i=_59e;i<7;i++){
_5a7.setDate(_59d);
_599=cal.rows[0].cells[i];
_599.innerHTML=_59d++;
icuesAssignDateCellClass(_599,"cuesCalCurrent",_5a7,_5a6);
}
while(_59d<=_59f){
_5a7.setDate(_59d);
_599=cal.rows[Math.floor(((_59d+_59e-1)/7))].cells[(_59d+_59e-1)%7];
_599.innerHTML=_59d;
icuesAssignDateCellClass(_599,"cuesCalCurrent",_5a7,_5a6);
_59d++;
}
_5a7.setDate(1);
_5a7.setMonth(_5a3);
_5a7.setFullYear(_5a4);
var _5a8=1;
try{
while(_5a8<15){
_599=cal.rows[Math.floor(((_59d+_59e-1)/7))].cells[(_59d+_59e-1)%7];
_599.innerHTML=_5a8;
_5a7.setDate(_5a8);
icuesAssignDateCellClass(_599,"cuesCalFuture",_5a7,_5a6);
_59d++;
_5a8++;
}
}
catch(e){
}
document.getElementById("cuesDatePickerLegendSpecial").style.display=(bcuesDatePickerShowLegendSpecial?"inline":"none");
document.getElementById("cuesDatePickerLegendBlocked").style.display=(bcuesDatePickerShowLegendBlocked?"inline":"none");
};
function icuesAssignDateCellClass(_5a9,_5aa,_5ab,_5ac){
var _5ad=_5aa;
if(icuesDatePickerCompare(_5ab,_5ac)){
_5ad+=" cuesCalToday";
}
if(icuesDatePickerCompare(_5ab,cuesDateObj)){
_5ad+=" cuesCalSelected";
}
if(cuesDatePickerSpecial!=null){
for(var idx=0;idx<cuesDatePickerSpecial.length;idx++){
if(icuesDatePickerCompare(_5ab,cuesDatePickerSpecial[idx])){
bcuesDatePickerShowLegendSpecial=true;
_5ad+=" cuesCalSpecial";
break;
}
}
}
if((cuesDatePickerBlockedBefore!=null||cuesDatePickerBlockedAfter!=null)&&icuesDatePickerCompare(_5ab,cuesDatePickerBlockedBefore,cuesDatePickerBlockedAfter,true)){
bcuesDatePickerShowLegendBlocked=true;
_5ad+=" cuesCalBlocked";
_5ad=_5ad.replace(" cuesCalSelected","");
}else{
if(cuesDatePickerBlocked!=null){
for(var idx=0;idx<cuesDatePickerBlocked.length;idx++){
if(icuesDatePickerCompare(_5ab,cuesDatePickerBlocked[idx])){
bcuesDatePickerShowLegendBlocked=true;
_5ad+=" cuesCalBlocked";
_5ad=_5ad.replace(" cuesCalSelected","");
break;
}
}
}
}
if((cuesDatePickerDisabledBefore!=null||cuesDatePickerDisabledAfter!=null)&&icuesDatePickerCompare(_5ab,cuesDatePickerDisabledBefore,cuesDatePickerDisabledAfter,true)){
_5ad+=" cuesCalDisabled";
}else{
if(cuesDatePickerDisabled!=null){
for(var idx=0;idx<cuesDatePickerDisabled.length;idx++){
if(icuesDatePickerCompare(_5ab,cuesDatePickerDisabled[idx])){
_5ad+=" cuesCalDisabled";
break;
}
}
}
}
_5a9.className=_5ad;
};
function cuesDatePickerNavigate(_5ae){
var _5af=document.getElementById("cuesDatePickerMonth");
var _5b0=_5af.selectedIndex;
if(_5b0>0&&_5ae==-1){
_5af.selectedIndex--;
}else{
if(_5b0<11&&_5ae==1){
_5af.selectedIndex++;
}else{
if(_5b0==0&&_5ae==-1){
_5af.selectedIndex=11;
document.getElementById("cuesDatePickerYear").value--;
}else{
if(_5b0==11&&_5ae==1){
_5af.selectedIndex=0;
document.getElementById("cuesDatePickerYear").value++;
}
}
}
}
cuesDatePickerPopulate();
};
function cuesDatePickerSelect(obj,evt){
var _5b1=new Date();
var tgt=(isIE)?evt.srcElement:evt.target;
if(tgt.tagName.toLowerCase()!="td"||tgt.className.indexOf("cuesCalDisabled")!=-1||tgt.className.indexOf("cuesCalBlocked")!=-1){
cuesStopEventBubble(evt);
return;
}
var year=document.getElementById("cuesDatePickerYear").value;
var _5b2=document.getElementById("cuesDatePickerMonth").selectedIndex;
if(tgt.className.indexOf("cuesCalPrior")!=-1){
if(_5b2==0){
_5b2=11;
year--;
}else{
_5b2--;
}
}else{
if(tgt.className.indexOf("cuesCalFuture")!=-1){
if(_5b2==11){
_5b2=0;
year++;
}else{
_5b2++;
}
}
}
_5b1.setDate(1);
_5b1.setYear(year);
_5b1.setMonth(_5b2);
_5b1.setDate(tgt.innerHTML);
document.getElementById("cuesDatePicker").style.display="none";
if(typeof cuesDateSelectedCallback=="function"){
cuesDateSelectedCallback(cuesDateObjId,_5b1);
}
};
function cuesDatePickerSelectToday(){
document.getElementById("cuesDatePicker").style.display="none";
if(typeof cuesDateSelectedCallback=="function"){
cuesDateSelectedCallback(cuesDateObjId,new Date());
}
};
function icuesDatePickerCompare(d1,d2,d3,_5b3){
if(_5b3==null||!_5b3){
return d1.getMonth()==d2.getMonth()&&d1.getDate()==d2.getDate()&&d1.getFullYear()==d2.getFullYear();
}else{
return (d2==null?false:d1.valueOf()<d2.valueOf())||(d3==null?false:d1.valueOf()>d3.valueOf());
}
};
function cuesDatePickerSpin(id,_5b4){
icuesSpin(id,_5b4);
cuesDatePickerPopulate();
};
function icuesSpin(id,_5b5){
try{
var _5b6=document.getElementById(id);
if(!_5b6.disabled){
var _5b7=_5b6.value*1+_5b5;
if(!isNaN(_5b7)){
_5b6.value=_5b7;
}
}
}
catch(e){
}
};
function cuesEnableSpinner(id){
try{
var _5b8=document.getElementById(id);
if(_5b8.disabled){
_5b8.disabled=false;
var _5b9=document.getElementById(id+".spinner");
_5b9.src=_5b9.src.replace("Disabled","");
}
}
catch(e){
}
};
function cuesDisableSpinner(id){
try{
var _5ba=document.getElementById(id);
if(!_5ba.disabled){
_5ba.disabled=true;
var _5bb=document.getElementById(id+".spinner");
_5bb.src=_5bb.src.replace(".","Disabled.");
}
}
catch(e){
}
};
function cuesSetSortColumnState(id,_5bc){
try{
var _5bd=document.getElementById(id+"_sortlink");
var _5be=document.getElementById(id+"_sorticon");
var _5bf=" cuesSortableColumnReserve";
if(_5bc=="none"){
try{
if(_5bd.getAttribute("reservespace")=="false"){
_5bf="";
}
}
catch(e){
}
}
_5bd.className="cuesSortableColumn cuesSorted"+_5bc+_5bf;
if(_5bc=="none"){
_5be.style.display="none";
}else{
_5be.src=cuesKnownLocation+cuesImageFolder+"/table-sort-"+_5bc.replace("ing","")+cuesImageSuffix+".gif";
_5be.style.display="";
}
}
catch(e){
}
};
function cuesGetSortColumnState(id){
try{
var _5c0=document.getElementById(id+"_sortlink");
var _5c1=_5c0.className;
if(_5c1.indexOf("Sortedascending")!=-1){
return "ascending";
}
if(_5c1.indexOf("Sorteddescending")!=-1){
return "descending";
}
}
catch(e){
}
return "none";
};
function cuesSortColumn(id,_5c2,_5c3,evt,_5c4){
try{
if(cuesUsage=="webapp"){
if(typeof callbackSortTableColumn=="function"){
callbackSortTableColumn(id,_5c2,_5c3,evt,_5c4);
}
}else{
window[icuesGetPortletId(_5c4,null,true)+"_callbackSortTableColumn"](id,_5c2,_5c3,evt,_5c4);
}
}
catch(e){
}
cuesStopEventBubble(evt);
return false;
};
var TableRowSelectionRules=new Array();
var icuesFilteredTable=new Array();
function cuesManageTableRowSelectionRules(_5c5,_5c6){
if(TableRowSelectionRules[_5c5]==null){
return;
}
if(_5c6==null){
var _5c7=cuesGetSelectedTableRowNumbers(_5c5);
if(_5c7.length==0){
cuesManageTableRowSelectionRules(_5c5,"none");
}else{
if(_5c7.length==1){
cuesManageTableRowSelectionRules(_5c5,"one");
if(cuesGetSelectableTableRowNumbers(_5c5).length==1){
cuesManageTableRowSelectionRules(_5c5,"only");
}
if(cuesIsSelectedTableRowLeftmost(_5c5,_5c7)){
cuesManageTableRowSelectionRules(_5c5,"leftmost");
}
if(cuesIsSelectedTableRowIndented(_5c5,_5c7)){
cuesManageTableRowSelectionRules(_5c5,"indented");
}
}else{
cuesManageTableRowSelectionRules(_5c5,"multiple");
if(cuesAreSelectedTableRowsContiguous(_5c5)){
cuesManageTableRowSelectionRules(_5c5,"contiguous");
}else{
cuesManageTableRowSelectionRules(_5c5,"noncontiguous");
}
}
if(!cuesAreTableRowsMoveableUp(_5c5)){
cuesManageTableRowSelectionRules(_5c5,"first");
}
if(!cuesAreTableRowsMoveableDown(_5c5)){
cuesManageTableRowSelectionRules(_5c5,"last");
}
}
return;
}
var ids;
try{
ids=TableRowSelectionRules[_5c5][_5c6+".disable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],true);
}else{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="table"&&document.getElementById(ids[i]+"link")!=null){
cuesDisableToolbarItem(ids[i]);
}else{
cuesDisableButtonmenuItem(ids[i]);
}
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=TableRowSelectionRules[_5c5][_5c6+".enable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],false);
}else{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="table"&&document.getElementById(ids[i]+"link")!=null){
cuesEnableToolbarItem(ids[i]);
}else{
cuesEnableButtonmenuItem(ids[i]);
}
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=TableRowSelectionRules[_5c5][_5c6+".check"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=true;
}
}
catch(e){
}
try{
ids=TableRowSelectionRules[_5c5][_5c6+".uncheck"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=false;
}
}
catch(e){
}
try{
ids=TableRowSelectionRules[_5c5][_5c6+".clear"].split(",");
for(var i=0;i<ids.length;i++){
try{
var obj=document.getElementById(ids[i]);
switch(obj.tagName.toLowerCase()){
case "input":
if(obj.type.toLowerCase()=="text"){
obj.value="";
}
break;
case "select":
obj.selectedIndex=-1;
break;
}
}
catch(e){
}
}
}
catch(e){
}
if(icuesFilteredTable[_5c5]&&(_5c6=="one"||_5c6=="contiguous")){
cuesManageTableRowSelectionRules(_5c5,"filtered");
}
};
var TransferboxSelectionRules=new Array();
function cuesManageTransferboxSelectionRules(_5c8,_5c9){
if(TransferboxSelectionRules[_5c8]==null){
return;
}
if(_5c9==null){
try{
var _5ca=document.getElementById(_5c8+"choices");
var _5cb=document.getElementById(_5c8+"chosen");
var _5cc=_5ca.options.length;
var _5cd=_5cb.options.length;
var _5ce=0;
var _5cf=0;
if(_5cc>0){
for(var i=0;i<_5cc;i++){
if(_5ca.options[i].selected){
_5ce++;
}
}
}
if(_5cd>0){
for(var i=0;i<_5cd;i++){
if(_5cb.options[i].selected){
_5cf++;
}
}
}
if(_5ce+_5cf==0){
cuesManageTransferboxSelectionRules(_5c8,"none");
cuesManageTransferboxSelectionRules(_5c8,"nonechoices");
cuesManageTransferboxSelectionRules(_5c8,"nonechosen");
}else{
if(_5ce+_5cf==1){
cuesManageTransferboxSelectionRules(_5c8,"one");
if(_5ce==1){
cuesManageTransferboxSelectionRules(_5c8,"onechoices");
cuesManageTransferboxSelectionRules(_5c8,"nonechosen");
}else{
cuesManageTransferboxSelectionRules(_5c8,"onechosen");
cuesManageTransferboxSelectionRules(_5c8,"nonechoices");
}
}else{
cuesManageTransferboxSelectionRules(_5c8,"multiple");
if(_5ce>1){
cuesManageTransferboxSelectionRules(_5c8,"multiplechoices");
}else{
if(_5ce==1){
cuesManageTransferboxSelectionRules(_5c8,"onechoices");
}else{
cuesManageTransferboxSelectionRules(_5c8,"nonechoices");
}
}
if(_5cf>1){
cuesManageTransferboxSelectionRules(_5c8,"multiplechosen");
}else{
if(_5cf==1){
cuesManageTransferboxSelectionRules(_5c8,"onechosen");
}else{
cuesManageTransferboxSelectionRules(_5c8,"nonechosen");
}
}
}
}
}
catch(e){
}
return;
}
var ids;
try{
ids=TransferboxSelectionRules[_5c8][_5c9+".disable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],true);
}else{
cuesDisableButtonmenuItem(ids[i]);
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=TransferboxSelectionRules[_5c8][_5c9+".enable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],false);
}else{
cuesEnableButtonmenuItem(ids[i]);
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=TransferboxSelectionRules[_5c8][_5c9+".check"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=true;
}
}
catch(e){
}
try{
ids=TransferboxSelectionRules[_5c8][_5c9+".uncheck"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=false;
}
}
catch(e){
}
try{
ids=TransferboxSelectionRules[_5c8][_5c9+".clear"].split(",");
for(var i=0;i<ids.length;i++){
try{
var obj=document.getElementById(ids[i]);
switch(obj.tagName.toLowerCase()){
case "input":
if(obj.type.toLowerCase()=="text"){
obj.value="";
}
break;
case "select":
obj.selectedIndex=-1;
break;
}
}
catch(e){
}
}
}
catch(e){
}
};
function cuesResizeMCLB(id,_5d0){
cuesBestfitMCLB(id,_5d0);
return;
try{
var _5d1=document.getElementById(id).rows[0];
var _5d2=document.getElementById(id+"div");
var _5d3=_5d2.getElementsByTagName("select");
var _5d4=new Array();
var _5d5=_5d1.cells.length;
for(var i=0;i<_5d5;i++){
_5d3[i].style.width="";
_5d1.cells[i].width="";
_5d4[i]=Math.max(_5d3[i].clientWidth,_5d1.cells[i].clientWidth);
}
cuesAlignMCLB(id,_5d4);
}
catch(e){
}
};
function cuesBestfitMCLB(id,_5d6){
try{
var _5d7=document.getElementById(id);
var _5d8=_5d7.rows[0];
var _5d9=document.getElementById(id+"content");
var _5da=_5d9.rows[0];
var _5db=_5d8.cells.length;
var _5dc=document.getElementById(id+"div");
var _5dd=_5dc.getElementsByTagName("select");
var w,_5de,at,_5df;
var _5e0=new Array();
_5d7.style.tableLayout="auto";
_5d9.style.tableLayout="auto";
for(var i=0;i<_5db;i++){
_5df=_5dd[i].getAttribute("fixedwidth");
if(_5df==null){
_5df="false";
}
_5dd[i].style.width="";
_5de=_5dd[i].getAttribute("suggestedwidth");
if(_5de==null||_5de==""){
_5de=0;
}else{
at=_5de.indexOf("%");
if(at!=-1){
try{
_5de=Math.floor(_5d7.parentNode.offsetWidth*(_5de.substring(0,at)/100));
}
catch(e){
_5de=0;
}
}
}
_5d8.cells[i].width="";
_5da.cells[i].width="";
if(_5df=="true"){
w=Math.max(_5de,_5d8.cells[i].clientWidth);
}else{
w=Math.max(_5dd[i].offsetWidth,_5d8.cells[i].clientWidth);
}
if(w==0){
return;
}
_5e0[i]=Math.max(w+8,_5de);
}
cuesAlignMCLB(id,_5e0);
if(_5d6!=null){
var _5e1=document.getElementById(_5d6);
if(_5e1!=null){
var _5e2=_5e1.getElementsByTagName("input");
var _5e3=Math.min(_5e2.length,_5e0.length);
for(var i=0;i<_5e3;i++){
_5e2[i].style.width=_5e0[i]-4;
}
}
}
}
catch(e){
}
};
function cuesFixMCLB(id){
if(isFF2004){
var _5e4=document.getElementById(id+"div");
var _5e5=_5e4.getElementsByTagName("select");
var obj=_5e5[0];
if(obj.options.length==0){
var _5e6=_5e5.length;
for(var i=0;i<_5e6;i++){
var obj=_5e5[i];
obj.appendChild(document.createElement("option"));
obj.options[0]=null;
}
}
}
var h=0;
var _5e4=document.getElementById(id+"div");
var _5e5=_5e4.getElementsByTagName("select");
var _5e6=_5e5.length;
for(var i=0;i<_5e6;i++){
var obj=_5e5[i];
var _5e7=obj.options.length;
for(var j=0;j<_5e7;j++){
if(obj.options[j].text==null||obj.options[j].text==""||obj.options[j].firstChild==null){
try{
if(h==0){
obj.options[j].text="x";
h=document.defaultView.getComputedStyle(obj.options[j],"").height;
obj.options[j].text="";
}
obj.options[j].style.height=h;
}
catch(e){
obj.options[j].text="";
}
}
}
}
};
function cuesAlignMCLB(id,_5e8){
try{
if(_5e8==null){
cuesBestfitMCLB(id);
return;
}
var _5e9=document.getElementById(id);
var _5ea=_5e9.rows[0];
var _5eb=document.getElementById(id+"div");
var _5ec=document.getElementById(id+"hdrdiv");
var _5ed=document.getElementById(id+"content");
var _5ee=_5ed.rows[0];
var _5ef=_5ea.cells.length;
_5e9.style.tableLayout="fixed";
_5ed.style.tableLayout="fixed";
var _5f0=0;
for(var i=0;i<_5ef;i++){
_5f0+=_5e8[i];
}
_5ed.style.width=_5f0;
var pad=0;
if(isFF||isSafari||isChrome){
pad=parseInt(icuesGetStyleProperty(_5ea.cells[0],"paddingLeft"))+parseInt(icuesGetStyleProperty(_5ea.cells[0],"paddingRight"))+2;
if(isNaN(pad)){
pad=2;
}
}
for(var i=0;i<_5ef;i++){
_5ea.cells[i].width=_5e8[i]-pad;
_5ee.cells[i].width=_5e8[i];
if(isIE){
_5ee.cells[i].getElementsByTagName("select")[0].style.width=_5e8[i];
}
}
_5eb.style.width=_5ed.offsetWidth+18;
if(_5ec!=null){
_5ec.style.width=_5ed.offsetWidth+18;
}
var _5f1=_5eb.getElementsByTagName("select");
var _5f2=_5f1.length;
var obj=_5f1[0];
var _5f3=obj.clientWidth-obj.offsetWidth;
var grow=-1*_5f3;
var _5f4;
if(_5f3!=0){
for(var i=0;i<_5f2;i++){
var obj=_5f1[i];
_5f4=_5ea.cells[i];
obj.style.width=_5ed.offsetWidth+20;
}
}
if(isFF||isSafari||isChrome){
setTimeout("cuesFixMCLB('"+id+"')",50);
}
}
catch(e){
}
};
function cuesAdjustMCLBHeight(id,_5f5,_5f6){
try{
var _5f7=document.getElementById(id+"div");
if(_5f5==null){
_5f5=_5f7.getAttribute("minSize");
}
if(isFF10x){
_5f5++;
}
var _5f8=_5f7.getElementsByTagName("select");
var _5f9=_5f8.length;
var now=_5f8[0].options.length;
var cnt=_5f8[0].size;
if(_5f6&&now==1&&isFF&&cnt==_5f5){
return;
}
var _5fa=18;
if(cnt>0){
_5fa=_5f8[0].offsetHeight/cnt;
}
if(cnt<_5f5){
for(var i=0;i<_5f9;i++){
_5f8[i].size=_5f5;
}
_5fa=_5f8[0].offsetHeight/_5f5;
}
var _5fb=_5fa*_5f5;
_5f7.style.height=_5fb;
_5f7.style.overflowX="hidden";
_5f7.style.overflowY="scroll";
}
catch(e){
}
};
function cuesMCLBondblclickHandler(obj,_5fc,id){
try{
var _5fd=document.getElementById(_5fc);
var _5fe=_5fd.getElementsByTagName("select");
var _5ff=_5fe.length;
var _600=new Array();
for(var i=0;i<_5ff;i++){
_600.push(_5fe[i].getAttribute("field")+"="+_5fe[i].options[obj.selectedIndex].text);
}
if(typeof callbackMCLBDoubleClick=="function"){
callbackMCLBDoubleClick(id,obj.selectedIndex,_600);
}
}
catch(e){
}
};
function cuesMCLBonclickHandler(obj,_601,id){
var obj2;
var _602=document.getElementById(_601);
var _603=_602.getElementsByTagName("select");
var _604=_603.length;
var cnt=obj.options.length;
var solo=null;
var _605=0;
var _606=0;
var _607;
for(var i=0;i<cnt;i++){
_607=obj.options[i].selected;
if(_607){
if(solo==null){
solo=obj.options[i];
_606=i;
}
_605++;
}
for(var j=0;j<_604;j++){
obj2=_603[j];
if(obj2==obj){
continue;
}
obj2.options[i].selected=_607;
}
}
if(_605==1){
icuesScrollMCLBRowIntoView(_602,obj,solo,_606);
}
var _608="";
if(_605==0){
_608="none";
}else{
if(_605==1){
_608="one";
}else{
_608="multiple";
}
}
cuesManageMCLBSelectionRules(id,_608);
icuesDetermineReorderMCLBStates(id);
if(transferMCLB[id]!=null&&transferMCLB[id]!="none"){
var _609=transferMCLB[id].replace(".choices","");
var _609=_609.replace(".chosen","");
var _60a=transferMCLB[id].indexOf(".choices")==-1?"Left":"Right";
icuesDetermineTransferMCLBStates(_609,_60a,_605);
icuesDetermineTransferMCLBAllStates(_609);
}
};
function icuesDetermineTransferMCLBStates(id,_60b,_60c){
var _60d=parseInt(cuesVersion)>=60?12:16;
if(_60c==0){
document.getElementById(id+_60b.toLowerCase()).disabled=true;
document.getElementById(id+_60b.toLowerCase()+"img").src=cuesKnownLocation+cuesImageFolder+"/Move"+_60b+_60d+"T-D.gif";
}else{
document.getElementById(id+_60b.toLowerCase()).disabled=false;
document.getElementById(id+_60b.toLowerCase()+"img").src=cuesKnownLocation+cuesImageFolder+"/Move"+_60b+_60d+"T.gif";
}
};
function icuesDetermineTransferMCLBAllStates(id){
try{
var _60e=document.getElementById(id);
var _60f=_60e.rows[1];
var _610=0;
try{
_610=_60f.getAttribute("extracount")/1;
}
catch(e){
}
var _611=_60f.cells[0].getElementsByTagName("select");
var _612=_60f.cells[2+_610].getElementsByTagName("select");
icuesDetermineTransferAllStates(id,_611.length>0?_611[0]:null,_612.length>0?_612[0]:null);
}
catch(e){
}
};
function icuesScrollMCLBRowIntoView(_613,_614,_615,_616){
var _617;
var _618=_615.clientHeight;
if(_618==0){
_618=Math.floor(_614.offsetHeight/_614.size);
_617=_616*_618;
}else{
_617=_615.offsetTop;
}
if(_617<_613.scrollTop){
_613.scrollTop=_617;
}else{
if(_617+_618>_613.scrollTop+_613.offsetHeight){
_613.scrollTop=_617-_613.offsetHeight+(_618*1.5);
}
}
};
function cuesGetSelectedMCLBRowNumbers(id){
var _619=new Array();
var _61a=document.getElementById(id+"div");
var _61b=_61a.getElementsByTagName("select");
var obj=_61b[0];
var cnt=obj.options.length;
var _61c;
for(var i=0;i<cnt;i++){
_61c=obj.options[i].selected;
if(_61c){
_619.push(i);
}
}
return _619;
};
function cuesGetAllMCLBRowNumbers(id){
var _61d=new Array();
var _61e=document.getElementById(id+"div");
var _61f=_61e.getElementsByTagName("select");
var obj=_61f[0];
var cnt=obj.options.length;
for(var i=0;i<cnt;i++){
_61d.push(i);
}
return _61d;
};
function cuesSetMCLBState(id,_620){
try{
var _621=document.getElementById(id+"div");
var _622=_621.getElementsByTagName("select");
var _623=_622.length;
_620=_620.toLowerCase();
for(var i=0;i<_623;i++){
_622[i].disabled=(_620=="disabled");
}
_621.scrollTop=1000;
_621.scrollTop=0;
cuesManageMCLBSelectionRules(id);
}
catch(e){
}
};
function cuesGetMCLBState(id){
try{
var _624=document.getElementById(id+"div");
var _625=_624.getElementsByTagName("select");
if(_625[0].disabled){
return "disabled";
}
}
catch(e){
}
return "enabled";
};
var MCLBSelectionRules=new Array();
function cuesManageMCLBSelectionRules(id,_626){
if(MCLBSelectionRules[id]==null){
return;
}
if(_626==null){
if(cuesGetMCLBState(id)=="disabled"){
cuesManageMCLBSelectionRules(id,"disabled");
return;
}else{
cuesManageMCLBSelectionRules(id,"enabled");
}
var _627=cuesGetSelectedMCLBRowNumbers(id);
if(_627.length==0){
cuesManageMCLBSelectionRules(id,"none");
}else{
if(_627.length==1){
cuesManageMCLBSelectionRules(id,"one");
}else{
cuesManageMCLBSelectionRules(id,"multiple");
}
}
icuesDetermineReorderMCLBStates(id);
return;
}
var ids;
try{
ids=MCLBSelectionRules[id][_626+".disable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],true);
}else{
cuesDisableButtonmenuItem(ids[i]);
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=MCLBSelectionRules[id][_626+".enable"].split(",");
for(var i=0;i<ids.length;i++){
try{
if(document.getElementById(ids[i]).tagName.toLowerCase()=="button"){
cuesManageButtonState(ids[i],false);
}else{
cuesEnableButtonmenuItem(ids[i]);
}
}
catch(e){
}
}
}
catch(e){
}
try{
ids=MCLBSelectionRules[id][_626+".check"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=true;
}
}
catch(e){
}
try{
ids=MCLBSelectionRules[id][_626+".uncheck"].split(",");
for(var i=0;i<ids.length;i++){
document.getElementById(ids[i]).checked=false;
}
}
catch(e){
}
try{
ids=MCLBSelectionRules[id][_626+".clear"].split(",");
for(var i=0;i<ids.length;i++){
try{
var obj=document.getElementById(ids[i]);
switch(obj.tagName.toLowerCase()){
case "input":
if(obj.type.toLowerCase()=="text"){
obj.value="";
}
break;
case "select":
obj.selectedIndex=-1;
break;
}
}
catch(e){
}
}
}
catch(e){
}
try{
if(typeof callbackMCLBRulesProcessed=="function"){
callbackMCLBRulesProcessed(id);
}
}
catch(e){
}
};
function cuesInsertMCLBRow(id,_628){
if(_628==null){
_628=true;
}
var idx=-1;
try{
var _629=document.getElementById(id+"div");
var _62a=_629.getAttribute("minSize");
var _62b=_629.getElementsByTagName("select");
var _62c=_62b.length;
var _62d;
var cnt;
for(var i=0;i<_62c;i++){
_62b[i].selectedIndex=-1;
_62d=document.createElement("option");
_62d.text=" ";
_62d.selected=_628;
_62b[i].options.add(_62d);
cnt=_62b[i].options.length;
_62b[i].size=Math.max(_62a,cnt);
}
if(isFF){
cuesAdjustMCLBHeight(id,null,true);
}
var _62e=_62b[0].options.length;
icuesScrollMCLBRowIntoView(_629,_62b[0],_62b[0].options[_62e-1],_62e);
idx=_62e-1;
}
catch(e){
}
cuesManageMCLBSelectionRules(id);
return (idx);
};
function cuesRemoveMCLBRow(id,_62f){
try{
if(_62f==null){
_62f=cuesGetSelectedMCLBRowNumbers(id);
}
var _630=document.getElementById(id+"div");
var _631=_630.getElementsByTagName("select");
var _632=_631.length;
var _633;
var rows=new Array();
if(isArray(_62f)){
rows=_62f;
}else{
rows.push(_62f);
}
var _634=rows.length;
for(var i=_634-1;i>=0;i--){
for(var j=0;j<_632;j++){
if(isIE){
_631[j].options.remove(rows[i]);
}else{
_631[j].options[rows[i]]=null;
}
}
}
}
catch(e){
}
cuesManageMCLBSelectionRules(id);
};
function cuesDuplicateMCLBRow(id,_635){
try{
if(_635==null){
_635=cuesGetSelectedMCLBRowNumbers(id);
}
var _636=document.getElementById(id+"div");
var _637=_636.getElementsByTagName("select");
var _638=_637.length;
var _639;
var rows=new Array();
if(isArray(_635)){
rows=_635;
}else{
rows.push(_635);
}
var _63a=rows.length;
for(var i=0;i<_63a;i++){
var _63b=cuesInsertMCLBRow(id);
if(_63b!=-1){
for(var j=0;j<_638;j++){
cuesSetMCLBField(id,_63b,j,cuesGetMCLBField(id,rows[i],j));
cuesSetMCLBFieldValue(id,_63b,j,cuesGetMCLBFieldValue(id,rows[i],j));
}
}
}
}
catch(e){
}
cuesManageMCLBSelectionRules(id);
};
function cuesGetMCLBField(id,_63c,_63d){
try{
var _63e=document.getElementById(id+"div");
var _63f=_63e.getElementsByTagName("select");
return _63f[_63d].options[_63c].text;
}
catch(e){
}
return null;
};
function cuesGetMCLBFieldValue(id,_640,_641){
try{
var _642=document.getElementById(id+"div");
var _643=_642.getElementsByTagName("select");
return _643[_641].options[_640].value;
}
catch(e){
}
return null;
};
function cuesSetMCLBField(id,_644,_645,_646){
try{
var _647=document.getElementById(id+"div");
var _648=_647.getElementsByTagName("select");
var _649=_648[_645].options[_644].selected;
_648[_645].options[_644].text=_646;
_648[_645].options[_644].selected=_649;
}
catch(e){
}
};
function cuesSetMCLBFieldValue(id,_64a,_64b,_64c){
try{
var _64d=document.getElementById(id+"div");
var _64e=_64d.getElementsByTagName("select");
var _64f=_64e[_64b].options[_64a].selected;
_64e[_64b].options[_64a].value=_64c;
_64e[_64b].options[_64a].selected=_64f;
}
catch(e){
}
};
function cuesBuildMCLBPost(id){
try{
var obj=document.getElementById(id+"data");
if(obj!=null){
obj.value=cuesExtractMCLBData(id);
}
}
catch(e){
}
};
var replaceAmpersand=null;
var replaceDoubleQuote=null;
function icuesMakeXMLCompliant(txt){
if(replaceAmpersand==null){
replaceAmpersand=new RegExp("&","gi");
}
if(replaceDoubleQuote==null){
replaceDoubleQuote=new RegExp("\"","gi");
}
return txt.replace(replaceAmpersand,"&amp;").replace(replaceDoubleQuote,"&quot;");
};
function cuesExtractMCLBData(id){
var xml="<mclb id=\""+id+"\">";
try{
var _650=document.getElementById(id+"div");
var _651=_650.getElementsByTagName("select");
var _652=_651.length;
var _653=_651[0].options.length;
var _654=new Array();
var _655=new Array();
for(var i=0;i<_652;i++){
_654.push(_651[i].getAttribute("field"));
_655.push(_651[i].getAttribute("valueid"));
}
for(var i=0;i<_653;i++){
xml+="<row ";
for(var j=0;j<_652;j++){
xml+=_654[j]+"=\""+icuesMakeXMLCompliant(_651[j].options[i].text)+"\" ";
if(_655[j]!=""){
xml+=_655[j]+"=\""+icuesMakeXMLCompliant(_651[j].options[i].value)+"\" ";
}
}
xml+="/>";
}
}
catch(e){
}
xml+="</mclb>";
return xml;
};
function cuesPopulateMCLB(id,_656,_657){
try{
var _658=document.getElementById(id+"div");
var _659=_658.getElementsByTagName("select");
var _65a=_659.length;
var _65b=new Array();
var _65c=new Array();
for(var i=0;i<_65a;i++){
_65b.push(_659[i].getAttribute("field"));
_65c.push(_659[i].getAttribute("valueid"));
}
var root=_656.documentElement;
var _65d=cuesXpath(_656,"/"+root.nodeName+"/"+root.firstChild.nodeName);
var _65e=_65d.length;
var op;
for(var i=0;i<_65a;i++){
if(_657){
_659[i].options.length=0;
}
for(var j=0;j<_65e;j++){
opt=document.createElement("option");
opt.text=_65d[j].getAttribute(_65b[i]);
try{
opt.value=_65d[j].getAttribute(_65c[i]);
}
catch(e){
}
_659[i].options.add(opt);
}
}
cuesRemoveMCLBRow(id,cuesInsertMCLBRow(id));
cuesBestfitMCLB(id);
}
catch(e){
}
};
function cuesLocateMCLBRow(id,_65f,_660){
try{
var _661=document.getElementById(id+"div");
var _662=_661.getElementsByTagName("select");
var _663=_662.length;
for(var i=0;i<_663;i++){
if(_65f==_662[i].getAttribute("field")){
return cuesLocateMCLBRowByFieldIndex(id,i,_660,_662[i]);
}
}
}
catch(e){
}
return -1;
};
function cuesLocateMCLBRowByFieldIndex(id,_664,_665,_666){
try{
if(_666==null){
var _667=document.getElementById(id+"div");
var _668=_667.getElementsByTagName("select");
_666=_668[_664];
}
var _669=_666.options.length;
for(var i=0;i<_669;i++){
if(_666.options[i].value==_665){
return i;
}
}
}
catch(e){
}
return -1;
};
function cuesSetMCLBExtraField(id,_66a,txt,_66b){
try{
var _66c=transferMCLB[id+".chosen"];
for(var i=0;i<20;i++){
if(_66a==cuesGetMCLBFieldId(_66c,i)){
var _66d=cuesGetSelectedMCLBRowNumbers(_66c);
for(j=0;j<_66d.length;j++){
cuesSetMCLBField(_66c,_66d[j],i,txt);
cuesSetMCLBFieldValue(_66c,_66d[j],i,_66b);
}
break;
}
}
cuesBestfitMCLB(_66c);
cuesButtonMenuDelayedHide();
}
catch(e){
}
};
function cuesGetMCLBFieldId(id,_66e){
try{
var _66f=document.getElementById(id+"div");
var _670=_66f.getElementsByTagName("select");
return _670[_66e].getAttribute("field");
}
catch(e){
return null;
}
};
function cuesMoveMCLBRow(id,_671,_672,_673){
try{
if(_673==null){
_673=false;
}
var _674=document.getElementById(id+"div");
var _675=_674.getElementsByTagName("select");
var _676=_675.length;
var _677;
for(var i=0;i<_676;i++){
if(!_673){
_675[i].selectedIndex=-1;
}
_677=document.createElement("option");
_677.text=_675[i].options[_671].text;
_677.value=_675[i].options[_671].value;
if(isIE){
_675[i].options.remove(_671);
}else{
_675[i].options[_671]=null;
}
_677.selected=_673;
_675[i].options.add(_677,_672);
}
try{
if(typeof callbackMCLBRowMoved=="function"){
callbackMCLBRowMoved(id);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesReorderMCLB(id,_678){
try{
var _679=cuesGetSelectedMCLBRowNumbers(id);
var _67a=_679.length;
switch(_678){
case "top":
for(var i=0;i<_67a;i++){
cuesMoveMCLBRow(id,_679[i],i,true);
}
break;
case "up":
var _67b=_679[0]-1;
for(var i=0;i<_67a;i++){
cuesMoveMCLBRow(id,_679[i],_67b+i,true);
}
break;
case "down":
var _67c=_679[_67a-1]+1;
for(var i=_67a-1;i>=0;i--){
cuesMoveMCLBRow(id,_679[i],_67c--,true);
}
break;
case "bottom":
var _67d=cuesGetAllMCLBRowNumbers(id);
var _67c=_67d.length-1;
for(var i=_67a-1;i>=0;i--){
cuesMoveMCLBRow(id,_679[i],_67c--,true);
}
break;
}
cuesFixMCLB(id);
icuesDetermineReorderMCLBStates(id);
}
catch(e){
}
};
function icuesDetermineReorderMCLBStates(id){
try{
if(document.getElementById(id+"upimg")==null){
return;
}
var _67e=true;
var _67f=cuesGetSelectedMCLBRowNumbers(id);
var _680=_67f.length;
for(var i=1;i<_680;i++){
if(_67f[i-1]+1!=_67f[i]){
_67e=false;
break;
}
}
if(_680==0||_67f[0]==0||!_67e){
document.getElementById(id+"up").disabled=true;
document.getElementById(id+"upimg").src=cuesKnownLocation+cuesImageFolder+"/MoveUp12T-D.gif";
document.getElementById(id+"top").disabled=true;
document.getElementById(id+"topimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToTop12T-D.gif";
}else{
document.getElementById(id+"up").disabled=false;
document.getElementById(id+"upimg").src=cuesKnownLocation+cuesImageFolder+"/MoveUp12T.gif";
document.getElementById(id+"top").disabled=false;
document.getElementById(id+"topimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToTop12T.gif";
}
var _681=cuesGetAllMCLBRowNumbers(id);
if(_680==0||_67f[_680-1]==_681[_681.length-1]||!_67e){
document.getElementById(id+"down").disabled=true;
document.getElementById(id+"downimg").src=cuesKnownLocation+cuesImageFolder+"/MoveDown12T-D.gif";
document.getElementById(id+"bottom").disabled=true;
document.getElementById(id+"bottomimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToBottom12T-D.gif";
}else{
document.getElementById(id+"down").disabled=false;
document.getElementById(id+"downimg").src=cuesKnownLocation+cuesImageFolder+"/MoveDown12T.gif";
document.getElementById(id+"bottom").disabled=false;
document.getElementById(id+"bottomimg").src=cuesKnownLocation+cuesImageFolder+"/MoveToBottom12T.gif";
}
}
catch(e){
}
};
var cuesContentAreaWidth=0;
var cuesContentAreaHeight=0;
function cuesIsContentHeightScrolling(id){
try{
if(id==null){
id="cuesContentArea";
}
var obj=document.getElementById(id);
return (obj.scrollHeight>obj.offsetHeight);
}
catch(e){
}
return false;
};
function cuesIsContentWidthScrolling(id){
try{
if(id==null){
id="cuesContentArea";
}
var obj=document.getElementById(id);
return (obj.scrollWidth>obj.offsetWidth);
}
catch(e){
}
return false;
};
function cuesExpandContentArea(id,_682,gap,_683,h){
try{
var obj=document.getElementById(id);
if(obj==null){
return;
}
if(_682==null){
_682=parseInt(cuesVersion)>=60?10:6;
}
if(gap==null){
gap=0;
}
var _684=icuesFindObjectByTagnameId(obj,"td","cuesLayoutContentArea");
_683=(_684==null)?true:false;
if(!_683){
try{
gap+=document.body.clientHeight-obj.parentNode.clientHeight-icuesPhysicalTop(obj.parentNode);
}
catch(e){
}
}
cuesContentAreaHeight=(document.body.clientHeight-icuesPhysicalTop(obj)-gap);
var _685=isIE?1:2;
var _686=Math.max(obj.parentNode.clientWidth,obj.parentNode.offsetWidth);
var _687=0;
if(isIE&&_682==0){
var node=obj.parentNode;
while(node!=null&&node!=document.body){
_687+=Math.max(parseInt(icuesGetStyleProperty(node,"paddingRight")),parseInt(icuesGetStyleProperty(node,"marginRight")));
node=node.parentNode;
}
if(isNaN(_687)){
_687=10;
}
}
var _688=(document.body.clientWidth-icuesPhysicalLeft(obj)-_687);
if(_686>0){
cuesContentAreaWidth=Math.min((_686-_685*_682),_688);
}else{
cuesContentAreaWidth=_688;
}
if(cuesContentAreaWidth==0&&_688==0){
return;
}
if(obj.style!=null){
if(_683){
obj.style.height=cuesContentAreaHeight+"px";
obj.style.width=cuesContentAreaWidth+"px";
obj.style.marginLeft=_682+"px";
obj.style.paddingRight=_682+"px";
}else{
if(_684!=null&&_684.clientHeight>0){
obj.style.height=_684.clientHeight+"px";
}else{
obj.style.height=cuesContentAreaHeight+"px";
}
if(_684!=null&&_684.clientWidth>0){
if(isIE){
obj.style.width=_684.clientWidth+"px";
}else{
obj.style.width=_684.clientWidth-(2*_682)+"px";
}
}else{
obj.style.width=cuesContentAreaWidth+"px";
}
obj.style.paddingLeft=_682+"px";
obj.style.marginLeft=0;
obj.style.paddingRight=_682+"px";
}
}else{
obj.height=cuesContentAreaHeight+"px";
if(_683){
obj.width=cuesContentAreaWidth+"px";
}else{
obj.width=_686+"px";
}
}
if(obj.clientWidth!=obj.offsetWidth){
cuesScrollerWidth=Math.max(19,Math.min(25,obj.offsetWidth-obj.clientWidth));
}else{
if(obj.clientHeight!=obj.offsetHeight){
cuesScrollerWidth=Math.max(19,Math.min(25,obj.offsetWidth-obj.clientWidth));
}
}
}
catch(e){
}
};
function cuesGetContentAreaWidth(){
var w=document.body.offsetWidth-200-10;
try{
var _689=document.getElementById("cuesLayout");
if(_689!=null){
var _68a=_689.rows[0].cells[1];
var _68b=_689.rows[0].cells[3];
var _68c=_68a.offsetWidth;
var _68d=_68b.offsetWidth;
var w1=_689.offsetWidth-_68c-10;
w=Math.min(w1,_68d);
}else{
var _68b=document.getElementById("cuesContentArea");
w=_68b.offsetWidth;
}
}
catch(e){
}
return w;
};
var cuesLastContentIndent=null;
function cuesCreateContentLayer(id){
try{
if(parseInt(cuesVersion)>=60&&parent.window!=null&&parent.window!=window&&document.getElementById("icuesContentLayer")==null){
if(parent.window.document.getElementsByTagName("iframe").length>0||parent.window.document.getElementsByTagName("frame").length>0){
var _68e;
try{
_68e=parent.window.document.getElementsByTagName("iframe");
var _68f=_68e.length;
for(var i=0;i<_68f;i++){
var _690=(_68e[i].contentWindow||_68e[i].contentDocument);
if(_690.document){
_690=_690.document;
}
if((document.location.href==_68e[i].src||document.location.href==_690.location.href)&&_68e[i].id=="cuesTaskPanel"){
return;
}
}
}
catch(e){
}
try{
_68e=parent.window.document.getElementsByTagName("frame");
var _68f=_68e.length;
for(var i=0;i<_68f;i++){
var _690=(_68e[i].contentWindow||_68e[i].contentDocument);
if(_690.document){
_690=_690.document;
}
if((document.location.href==_68e[i].src||document.location.href==_690.location.href)&&_68e[i].id=="cuesTaskPanel"){
return;
}
}
}
catch(e){
}
var _691=document.createElement("div");
_691.id="icuesContentLayer";
_691.className="cuesContentLayer";
_691.innerHTML="&nbsp;";
document.body.appendChild(_691);
}
}else{
if(parseInt(cuesVersion)>=60&&parent.window==window&&document.getElementById("icuesContentLayer")==null){
var _692=document.getElementById(id);
if(_692!=null){
var _691=document.createElement("div");
_691.id="icuesContentLayer";
_691.className="cuesContentLayer";
_691.innerHTML="&nbsp;";
_692.style.position="relative";
_692.appendChild(_691);
cuesExpandContentLayer();
}
}
}
}
catch(e){
}
};
function cuesExpandContentLayer(){
try{
var obj=document.getElementById("icuesContentLayer");
var _693=obj.parentNode;
var cell=_693.parentNode;
obj.style.display="none";
if(_693.tagName.toLowerCase()=="div"&&cell.tagName.toLowerCase()=="td"){
_693.style.width=cell.clientWidth;
_693.style.height=cell.clientHeight;
obj.style.height=Math.max(_693.scrollHeight,cell.clientHeight);
obj.style.width=Math.max(_693.scrollWidth,cell.clientWidth);
}else{
obj.style.height=Math.max(_693.scrollHeight,_693.clientHeight);
var _694=0;
try{
_694=parseInt(icuesGetStyleProperty(obj.parentNode,"marginLeft"));
if(isNaN(_694)){
_694=10;
}
}
catch(e){
}
obj.style.width=Math.max(_693.scrollWidth,_693.clientWidth)-_694;
}
obj.style.display="";
}
catch(e){
}
};
function cuesResizeContentArea(){
try{
var id="cuesContentArea";
var obj=document.getElementById(id);
obj.style.width="auto";
cuesExpandHeight(id);
}
catch(e){
}
};
function cuesResizeContent(_695){
icuesResizeContent(_695,false);
};
function icuesResizeContent(_696,_697){
if(_696!=null){
cuesLastContentIndent=_696;
}
cuesExpandContentArea("cuesContentArea",cuesLastContentIndent);
if(false&&parseInt(cuesVersion)>=60){
try{
if(parent.window!=null&&parent.window!=window){
var _698=parent.window.document.getElementsByTagName("iframe")[0];
var t=-1*icuesPhysicalTop(_698);
var l=-1*icuesPhysicalLeft(_698);
document.body.style.backgroundPosition=l+" "+t;
}
}
catch(e){
}
}
if(_697==null){
icuesFixButtonHover();
}
try{
var _699=cuesIsContentHeightScrolling();
if(typeof callbackContentAreaResized=="function"){
callbackContentAreaResized(cuesContentAreaHeight,cuesContentAreaWidth);
}
var _69a=cuesIsContentHeightScrolling();
if(_699!=_69a){
if(typeof callbackContentAreaResized=="function"){
callbackContentAreaResized(cuesContentAreaHeight,cuesContentAreaWidth);
}
}
}
catch(e){
}
};
var icuesOnresizeTimer=null;
function icuesOnresizeHandler(){
if(icuesOnresizeTimer!=null){
clearTimeout(icuesOnresizeTimer);
}
icuesOnresizeTimer=setTimeout("icuesResizeContent(null,false)",150);
};
var cuesDialog=new icuesDialog();
function icuesDialog(){
this.open=_69b;
this.close=_69c;
this.isOpen=_69d;
this.getOpener=_69e;
this.reload=_69f;
this.resizeToContent=_6a0;
this.parentEventHandler=_6a1;
this.onunloadHandler=_6a2;
var _6a3=null;
var _6a4=null;
var _6a5=306;
var _6a6=87;
var _6a7=false;
function _69d(){
return (_6a3!=null);
};
function _69f(url){
try{
if(url==null){
url=window.location.href;
}
if(isFF){
window.location.href=url;
}else{
var link=document.createElement("a");
if(window.name==null||window.name==""){
window.name="cuesSecondaryWindow";
}
link.setAttribute("target",window.name);
link.setAttribute("href",url);
document.getElementsByTagName("body")[0].appendChild(link);
link.click();
}
}
catch(e){
}
};
function _69e(){
var _6a8=null;
try{
if(window.dialogArguments){
_6a8=window.dialogArguments.window;
}else{
if(window.opener){
_6a8=window.opener;
}
}
}
catch(e){
}
return _6a8;
};
function _69c(){
_6a3.close();
};
function _69b(url,_6a9,h,w,_6aa){
try{
if(h==null){
h=_6a6;
}else{
h=Math.max(h,_6a6);
}
if(w==null){
w=_6a5;
}else{
w=Math.max(w,_6a5);
}
if(_6aa==null){
_6aa="";
}
if(isIE){
h+=33;
var _6ab=showModalDialog(url,window,"help:no;status:no;dialogHeight:"+h+"px;dialogWidth:"+w+"px;center:yes;resizable:yes;");
if(_6a9){
_6a9(_6ab);
}
}else{
if(isFF3||isSafari||isChrome){
var _6ab=showModalDialog(url,window,"help:no;status:no;dialogHeight:"+h+"px;dialogWidth:"+w+"px;center:yes;resizable:no;");
if(_6a9){
_6a9(_6ab);
}
}else{
if(_6a7){
return;
}
_6a7=true;
_6a4=_6a9;
_6ac(url,h,w,_6aa);
_6a7=false;
}
}
}
catch(e){
return null;
}
};
function _6ac(url,h,w,_6ad){
var _6ae="";
if(isIE){
var _6af=window.screenLeft+((window.document.body.offsetWidth-w)/2);
var _6b0=window.screenTop+((window.document.body.offsetHeight-h)/2);
_6ae=",left="+_6af+",top="+_6b0;
}else{
var _6af=window.screenX+((window.outerWidth-w)/2);
var _6b0=window.screenY+((window.outerHeight-h)/2);
_6ae=",screenX="+_6af+",screenY="+_6b0;
}
_6a3=window.open(url,_6ad,"dialog=yes,location=no,toolbar=no,menubar=no,personalbar=no,dependent=yes,z-lock=yes,height="+h+"px,width="+w+"px"+_6ae);
if(_6a3==null){
return;
}
_6b1(window);
try{
for(var i=0;i<window.frames.length;_6b1(window.frames[i++])){
}
}
catch(e){
}
try{
if(window.opener){
for(var i=0;i<window.opener.frames.length;_6b1(window.opener.frames[i++])){
}
_6b1(window.opener);
}else{
for(var i=0;i<top.frames.length;_6b1(top.frames[i++])){
}
_6b1(top.window);
}
}
catch(e){
}
if(document.addEventListener){
_6a3.addEventListener("unload",cuesDialog.onunloadHandler,true);
}else{
_6a3.attachEvent("onunload",cuesDialog.onunloadHandler);
}
_6a3.focus();
};
function _6a1(evt){
if(evt==null&&isIE){
evt=window.event;
}
if(_6a3&&!_6a3.closed){
_6a3.focus();
if(evt.stopPropagation){
evt.stopPropagation();
}
if(evt.preventDefault){
evt.preventDefault();
}
evt.cancelBubble=true;
evt.returnValue=false;
}
};
function _6b1(w){
if(document.attachEvent){
var obj=w.document;
obj.attachEvent("onmousedown",cuesDialog.parentEventHandler);
obj.attachEvent("onclick",cuesDialog.parentEventHandler);
obj.attachEvent("onkeypress",cuesDialog.parentEventHandler);
}else{
w.addEventListener("click",cuesDialog.parentEventHandler,true);
w.addEventListener("mousedown",cuesDialog.parentEventHandler,true);
w.addEventListener("keypress",cuesDialog.parentEventHandler,true);
}
};
function _6b2(w){
if(document.detachEvent){
var obj=w.document;
obj.detachEvent("onmousedown",cuesDialog.parentEventHandler);
obj.detachEvent("onclick",cuesDialog.parentEventHandler);
obj.detachEvent("onkeypress",cuesDialog.parentEventHandler);
}else{
w.removeEventListener("mousedown",cuesDialog.parentEventHandler,true);
w.removeEventListener("click",cuesDialog.parentEventHandler,true);
w.removeEventListener("keypress",cuesDialog.parentEventHandler,true);
}
};
function _6a2(ev){
if((isFF||isSafari||isChrome)&&!_6a3.closed){
return;
}
_6b2(window);
try{
for(var i=0;i<window.frames.length;_6b2(window.frames[i++])){
}
}
catch(e){
}
try{
if(window.opener){
for(var i=0;i<window.opener.frames.length;_6b2(window.opener.frames[i++])){
}
_6b2(window.opener);
}else{
for(var i=0;i<top.frames.length;_6b2(top.frames[i++])){
}
_6b2(top.window);
}
}
catch(e){
}
if(_6a4){
_6a4(_6a3.returnValue);
}
_6a3=null;
};
function _6a0(_6b3){
try{
var obj=null;
if(_6b3){
obj=window.document.getElementById("cuesContentArea");
}
if(obj==null){
obj=window.document.body;
}
var _6b4=Math.max(0,obj.scrollHeight-obj.offsetHeight);
var _6b5=Math.max(0,obj.scrollWidth-obj.offsetWidth);
if(isIE){
if(_6b4!=0){
if(_6b3){
_6b4+=16;
}
_6b4=Math.min(_6b4,(screen.height*0.8)-parseFloat(window.dialogHeight));
window.dialogHeight=parseFloat(window.dialogHeight)+_6b4+"px";
window.dialogTop=Math.max(screen.height*0.1,parseFloat(window.dialogTop)-(_6b4/2))+"px";
}
if(_6b5!=0){
if(_6b3){
_6b5+=26;
}
_6b5=Math.min(_6b5,(screen.width*0.8)-parseFloat(window.dialogWidth));
window.dialogWidth=parseFloat(window.dialogWidth)+_6b5+"px";
window.dialogLeft=Math.max(screen.width*0.1,parseFloat(window.dialogLeft)-(_6b5/2))+"px";
}
}else{
_6b4=Math.min(_6b4,(screen.height*0.8)-obj.offsetHeight);
_6b5=Math.min(_6b5,(screen.width*0.8)-obj.offsetWidth);
if(_6b3){
_6b5+=16;
}
window.resizeBy(_6b5,_6b4);
window.moveBy(-1*_6b5/2,-1*_6b4/2);
}
}
catch(e){
}
};
};
function cuesMakeFieldRequired(id,_6b6){
try{
var obj=document.getElementById(id+"RequiredHint");
if(obj!=null&&obj.tagName.toLowerCase()=="img"){
obj.style.visibility=_6b6?"visible":"hidden";
}
}
catch(e){
}
};
function cuesEnableTableSearch(_6b7,_6b8,_6b9,_6ba,_6bb){
try{
document.getElementById(_6b7+".Saction").disabled=!_6b8;
if(!_6b9&&!_6ba){
return;
}
var _6bc=0;
var _6bd=icuesFindObjectByTagname(_6bb,"tr");
var tbl=document.getElementById(_6b7+".searchitems");
var _6be=tbl.rows.length;
if(_6be>1){
for(var i=0;i<_6be;i++){
if(tbl.rows[i]==_6bd){
_6bc=i;
break;
}
}
}
if(_6b9){
var _6bf=icuesFindChildByTagnameId(_6bd,"select",_6b7+".SColumn");
var _6c0=_6bf.options[_6bf.selectedIndex];
if(typeof callbackTableSearchFieldChanged=="function"){
callbackTableSearchFieldChanged(_6b7,_6c0.text,_6c0.value,_6bc);
}
}else{
if(_6ba&&_6bb!=null){
icuesManageTableSearchTextState(_6b7,_6bb,_6bc);
}
}
}
catch(e){
}
};
function icuesManageTableSearchTextState(_6c1,_6c2,_6c3){
try{
if(_6c2==null){
_6c2=icuesGetActiveTableSearchModifer(_6c1,_6c3);
}
var _6c4;
if(_6c3==null){
_6c4=document.getElementById(_6c1+".Stext");
}else{
_6c4=icuesFindChildByTagnameId(document.getElementById(_6c1+".searchitems").rows[_6c3],"input",_6c1+".Stext");
}
if(_6c2.id==_6c1+".Modifiersenum"){
_6c4.style.display="none";
}else{
var _6c5=_6c2.options[_6c2.selectedIndex];
_6c4.style.display=(_6c5.value=="empty"||_6c5.value=="notempty"||_6c5.value=="istrue"||_6c5.value=="isfalse")?"none":"inline";
}
}
catch(e){
}
};
function cuesSetTableSearchColumn(_6c6,_6c7,_6c8){
try{
var obj;
if(_6c8==null){
obj=document.getElementById(_6c6+".SColumn");
}else{
obj=icuesFindChildByTagnameId(document.getElementById(_6c6+".searchitems").rows[_6c8],"select",_6c6+".SColumn");
}
for(var i=0;i<obj.options.length;i++){
if(obj.options[i].text==_6c7){
obj.options[i].selected=true;
break;
}
}
}
catch(e){
}
};
function icuesGetActiveTableSearchModifer(_6c9,_6ca){
var obj=null;
try{
if(_6ca==null){
_6ca=0;
}
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiers");
if(obj==null){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersstring");
}
if(obj.style.display=="none"){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersnumeric");
}
if(obj.style.display=="none"){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersalphanumeric");
}
if(obj.style.display=="none"){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersboolean");
}
if(obj.style.display=="none"){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersdate");
}
if(obj.style.display=="none"){
obj=icuesFindChildByTagnameId(document.getElementById(_6c9+".searchitems").rows[_6ca],"*",_6c9+".Modifiersenum");
}
}
catch(e){
}
return obj;
};
function cuesSetTableSearchModifier(_6cb,_6cc,_6cd){
try{
if(_6cd==null){
_6cd=0;
}
var obj=icuesGetActiveTableSearchModifer(_6cb,_6cd);
for(var i=0;i<obj.options.length;i++){
if(obj.options[i].value==_6cc){
obj.options[i].selected=true;
icuesManageTableSearchTextState(_6cb,obj,_6cd);
break;
}
}
}
catch(e){
}
};
function cuesSetTableSearchEnum(_6ce,_6cf,_6d0,_6d1){
try{
var tgt=icuesGetActiveTableSearchModifer(_6ce,_6d0);
icuesCloneListbox(document.getElementById(_6ce+"."+_6cf),tgt);
if(_6d1!=null){
var _6d2=tgt.options.length;
for(var i=0;i<_6d2;i++){
if(tgt.options[i].value==_6d1||tgt.options[i].text==_6d1){
tgt.options[i].selected=true;
break;
}
}
}
}
catch(e){
}
};
function cuesSetTableSearchColumnType(_6d3,_6d4,_6d5){
try{
var obj;
if(_6d5==null){
_6d5=0;
}
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersnumeric");
obj.style.display="none";
obj.name="Modifiersnumeric";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersalphanumeric");
obj.style.display="none";
obj.name="Modifiersalphanumeric";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersstring");
obj.style.display="none";
obj.name="Modifiersstring";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersboolean");
obj.style.display="none";
obj.name="Modifiersboolean";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersdate");
obj.style.display="none";
obj.name="Modifiersdate";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiersenum");
obj.style.display="none";
obj.name="Modifiersenum";
obj=icuesFindChildByTagnameId(document.getElementById(_6d3+".searchitems").rows[_6d5],"*",_6d3+".Modifiers"+_6d4);
obj.style.display="inline";
obj.name="Modifiers";
icuesManageTableSearchTextState(_6d3,obj,_6d5);
}
catch(e){
}
};
function cuesGetTableSearchColumnType(_6d6,_6d7){
try{
return icuesGetActiveTableSearchModifer(_6d6,_6d7).id.replace(_6d6+".Modifiers","");
}
catch(e){
}
return "";
};
function cuesSetTableSearchText(_6d8,_6d9,_6da){
try{
if(_6da==null){
document.getElementById(_6d8+".Stext").value=_6d9;
}else{
icuesFindChildByTagnameId(document.getElementById(_6d8+".searchitems").rows[_6da],"input",_6d8+".Stext").value=_6d9;
}
}
catch(e){
}
};
function cuesGetTableSearchColumn(_6db,_6dc){
var _6dd="";
try{
var obj;
if(_6dc==null){
obj=document.getElementById(_6db+".SColumn");
}else{
obj=icuesFindChildByTagnameId(document.getElementById(_6db+".searchitems").rows[_6dc],"select",_6db+".SColumn");
}
_6dd=obj.options[obj.selectedIndex].text;
}
catch(e){
}
return _6dd;
};
function cuesGetTableSearchModifier(_6de,_6df){
var _6e0="";
try{
var obj=icuesGetActiveTableSearchModifer(_6de,_6df);
_6e0=obj.options[obj.selectedIndex].value;
}
catch(e){
}
return _6e0;
};
function cuesGetTableSearchText(_6e1,_6e2){
var _6e3="";
try{
if(_6e2==null){
_6e3=document.getElementById(_6e1+".Stext").value;
}else{
_6e3=icuesFindChildByTagnameId(document.getElementById(_6e1+".searchitems").rows[_6e2],"input",_6e1+".Stext").value;
}
}
catch(e){
}
return _6e3;
};
function cuesGetTableSearchRelop(_6e4){
try{
return document.getElementById(_6e4+".Srelop").value;
}
catch(e){
}
return "and";
};
var CUESNUMTABLESEARCHCOLS=6;
var CUESTABLESEARCHFILTERCOL=0;
var CUESTABLESEARCHRELOPCOL=1;
var CUESTABLESEARCHADDCOL=4;
var CUESTABLESEARCHDELCOL=3;
function icuesAddTableSearch(_6e5,obj){
try{
var row;
var tbl=document.getElementById(_6e5+".searchitems");
if(obj==null){
row=tbl.rows[0];
}else{
row=icuesFindObjectByTagname(obj,"TR");
}
var _6e6=null;
var _6e7=tbl.rows.length;
if(_6e7>1&&obj!=null){
for(var i=0;i<_6e7;i++){
if(tbl.rows[i]==row){
_6e6=tbl.insertRow(i+1);
break;
}
}
}
if(_6e6==null){
_6e6=tbl.insertRow(tbl.rows.length);
}
for(var i=0;i<CUESNUMTABLESEARCHCOLS-1;i++){
icuesCloneContents(row.cells[i],_6e6.insertCell(i));
_6e6.cells[i].vAlign=row.cells[i].vAlign;
}
icuesFixButtonHover(_6e6);
_6e6.cells[CUESTABLESEARCHFILTERCOL].style.display="none";
_6e6.cells[CUESTABLESEARCHRELOPCOL].style.display="";
try{
_6e6.cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=true;
}
catch(e){
}
try{
tbl.rows[0].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=true;
}
catch(e){
}
try{
tbl.rows[1].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=false;
}
catch(e){
}
try{
tbl.rows[2].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=true;
}
catch(e){
}
try{
row.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("button")[0].disabled=false;
}
catch(e){
}
try{
row.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src=row.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src.replace("FilterT_disabled.gif","Filter.png");
}
catch(e){
}
try{
_6e6.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("button")[0].disabled=false;
}
catch(e){
}
try{
_6e6.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src=_6e6.cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src.replace("FilterT_disabled.gif","Filter.png");
}
catch(e){
}
if(isIE){
try{
icuesClearButtonHover(row.cells[CUESTABLESEARCHADDCOL].getElementsByTagName("button")[0]);
}
catch(e){
}
}
if(isIE){
try{
icuesClearButtonHover(_6e6.cells[CUESTABLESEARCHADDCOL].getElementsByTagName("button")[0]);
}
catch(e){
}
}
document.getElementById(_6e5+".Saction").disabled=false;
icuesManageTableSearchMultiFilters(_6e5,"show");
}
catch(e){
}
};
function icuesCloneContents(src,tgt){
try{
tgt.innerHTML=src.innerHTML;
if(!isIE){
var _6e8=src.getElementsByTagName("input");
var _6e9=tgt.getElementsByTagName("input");
for(var j=0;j<_6e9.length;j++){
try{
_6e9[j].value=_6e8[j].value;
}
catch(e){
}
}
var _6ea=src.getElementsByTagName("select");
var _6eb=tgt.getElementsByTagName("select");
for(var j=0;j<_6eb.length;j++){
try{
_6eb[j].selectedIndex=_6ea[j].selectedIndex;
}
catch(e){
}
}
}else{
var _6ea=src.getElementsByTagName("select");
var _6eb=tgt.getElementsByTagName("select");
for(var j=0;j<_6eb.length;j++){
try{
_6eb[j].name=_6ea[j].name;
}
catch(e){
}
}
}
}
catch(e){
}
};
function icuesChangeTableSearchRelop(_6ec,obj){
try{
var tbl=document.getElementById(_6ec+".searchitems");
var _6ed=tbl.rows.length;
for(var i=2;i<_6ed;i++){
try{
tbl.rows[i].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].selectedIndex=obj.selectedIndex;
}
catch(e){
}
}
try{
tbl.rows[0].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].selectedIndex=obj.selectedIndex;
}
catch(e){
}
document.getElementById(_6ec+".Saction").disabled=false;
}
catch(e){
}
};
function icuesRemoveTableSearch(_6ee,obj){
try{
var row=icuesFindObjectByTagname(obj,"TR");
var tbl=document.getElementById(_6ee+".searchitems");
var _6ef=tbl.rows.length;
if(_6ef==1){
return;
}
for(var i=0;i<_6ef;i++){
if(tbl.rows[i]==row){
if(i==0){
for(var j=0;j<CUESNUMTABLESEARCHCOLS-1;j++){
icuesCloneContents(tbl.rows[1].cells[j],tbl.rows[0].cells[j]);
}
tbl.deleteRow(1);
}else{
tbl.deleteRow(i);
}
break;
}
}
try{
tbl.rows[0].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=true;
}
catch(e){
}
try{
tbl.rows[1].cells[CUESTABLESEARCHRELOPCOL].getElementsByTagName("select")[0].disabled=false;
}
catch(e){
}
if(tbl.rows.length==1){
try{
tbl.rows[0].cells[CUESTABLESEARCHDELCOL].getElementsByTagName("button")[0].disabled=true;
}
catch(e){
}
try{
tbl.rows[0].cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src=tbl.rows[0].cells[CUESTABLESEARCHDELCOL].getElementsByTagName("img")[0].src.replace("Filter.png","FilterT_disabled.gif");
}
catch(e){
}
}
document.getElementById(_6ee+".Saction").disabled=false;
icuesManageTableSearchMultiFilters(_6ee,"show");
}
catch(e){
}
};
function icuesManageTableSearchMultiFilters(id,_6f0,_6f1){
try{
if(_6f1==null){
_6f1=document.getElementById(id+".searchtoggler");
}
if(_6f1==null){
return;
}
var tbl=document.getElementById(id+".searchitems");
var _6f2=tbl.rows.length;
if(_6f2>1){
if(_6f0==null){
_6f0=_6f1.getAttribute("state")=="shown"?"hide":"show";
}
_6f1.disabled=false;
if(_6f0=="show"){
for(var i=1;i<_6f2;i++){
tbl.rows[i].style.display="";
}
_6f1.setAttribute("state","shown");
_6f1.className="cuesTableMultiFilterTogglerShown";
}else{
if(_6f0=="hide"){
for(var i=1;i<_6f2;i++){
tbl.rows[i].style.display="none";
}
_6f1.setAttribute("state","hidden");
_6f1.className="cuesTableMultiFilterTogglerHidden";
}
}
}else{
_6f1.className="cuesTableMultiFilterTogglerDisabled";
_6f1.disabled=true;
}
}
catch(e){
}
};
function icuesPrepTableSearch(_6f3,cnt){
try{
for(var i=1;i<cnt;i++){
icuesAddTableSearch(_6f3);
}
}
catch(e){
}
};
function cuesGetTableSearchCount(_6f4){
try{
return document.getElementById(_6f4+".searchitems").rows.length;
}
catch(e){
return 0;
}
};
function icuesInitTableSearch(id,_6f5,_6f6,_6f7,_6f8,_6f9){
if(_6f5=="true"){
var cnt=0;
if(_6f6!=null&&_6f6!=""){
var len=_6f6.length;
if(_6f6.substring(0,1)=="["&&_6f6.substring(len-1)=="]"){
_6f6=_6f6.substring(1,len-1).split(",");
cnt=Math.max(cnt,_6f6.length);
}
}
if(_6f7!=null&&_6f7!=""){
var len=_6f7.length;
if(_6f7.substring(0,1)=="["&&_6f7.substring(len-1)=="]"){
_6f7=_6f7.substring(1,len-1).split(",");
cnt=Math.max(cnt,_6f7.length);
}
}
if(_6f8!=null&&_6f8!=""){
var len=_6f8.length;
if(_6f8.substring(0,1)=="["&&_6f8.substring(len-1)=="]"){
_6f8=_6f8.substring(1,len-1).split(",");
cnt=Math.max(cnt,_6f8.length);
}
}
if(_6f9!=null&&_6f9!=""){
var len=_6f9.length;
if(_6f9.substring(0,1)=="["&&_6f9.substring(len-1)=="]"){
_6f9=_6f9.substring(1,len-1).split(",");
cnt=Math.max(cnt,_6f9.length);
}
}
if(cnt>1){
icuesPrepTableSearch(id,cnt);
for(var i=0;i<cnt;i++){
try{
cuesSetTableSearchColumnType(id,_6f6[i].trim(),i);
}
catch(e){
}
try{
cuesSetTableSearchColumn(id,_6f7[i].trim(),i);
}
catch(e){
}
try{
cuesSetTableSearchModifier(id,_6f8[i].trim(),i);
}
catch(e){
}
try{
cuesSetTableSearchText(id,_6f9[i].trim(),i);
}
catch(e){
}
}
return;
}
}
if(_6f6!=null){
cuesSetTableSearchColumnType(id,_6f6);
}
if(_6f7!=null){
cuesSetTableSearchColumn(id,_6f7);
}
if(_6f8!=null){
cuesSetTableSearchModifier(id,_6f8);
}
if(_6f9!=null){
cuesSetTableSearchText(id,_6f9);
}
};
function icuesPopulateTableSearchEnum(_6fa,id){
try{
var tbl=document.getElementById(_6fa+".searchitems");
var _6fb=tbl.rows.length;
for(var i=0;i<_6fb;i++){
var txt=cuesGetTableSearchText(_6fa,i).split(":");
if(txt.length>1&&txt[0]==id){
cuesSetTableSearchEnum(_6fa,id,i,txt[1]);
}
}
}
catch(e){
}
};
function cuesSetStatusLevel(id,_6fc){
try{
var obj=document.getElementById(id);
var _6fd=document.getElementById(id+".content");
var img=obj.getElementsByTagName("img")[0];
switch(_6fc){
case "critical":
if(parseInt(cuesVersion)>=60){
img.src=cuesKnownLocation+cuesIconFolder+"/Status_criticalerror_icon.png";
}else{
img.src=cuesKnownLocation+cuesIconFolder+"/AlertCritical16Wht.gif";
}
try{
img.alt=img.title=cuesAlt["CriticalErrorMessage"];
}
catch(e){
}
obj.className="cuesStatusBoxError";
_6fd.className="cuesStatusTextError";
break;
case "error":
if(parseInt(cuesVersion)>=60){
img.src=cuesKnownLocation+cuesIconFolder+"/Status_error_icon.png";
}else{
img.src=cuesKnownLocation+cuesIconFolder+"/AlertError16Wht.gif";
}
try{
img.alt=img.title=cuesAlt["ErrorMessage"];
}
catch(e){
}
obj.className="cuesStatusBoxError";
_6fd.className="cuesStatusTextError";
break;
case "success":
if(parseInt(cuesVersion)>=60){
img.src=cuesKnownLocation+cuesIconFolder+"/Status_success_icon.png";
}else{
img.src=cuesKnownLocation+cuesIconFolder+"/AlertSuccess16Wht.gif";
}
try{
img.alt=img.title=cuesAlt["SuccessMessage"];
}
catch(e){
}
obj.className="cuesStatusBox";
_6fd.className="cuesStatusText";
break;
case "warning":
if(parseInt(cuesVersion)>=60){
img.src=cuesKnownLocation+cuesIconFolder+"/Status_warning_icon.png";
}else{
img.src=cuesKnownLocation+cuesIconFolder+"/Warning16Wht.gif";
}
try{
img.alt=img.title=cuesAlt["WarningMessage"];
}
catch(e){
}
obj.className="cuesStatusBox";
_6fd.className="cuesStatusText";
break;
case "info":
if(parseInt(cuesVersion)>=60){
img.src=cuesKnownLocation+cuesIconFolder+"/Status_information_icon.png";
}else{
img.src=cuesKnownLocation+cuesIconFolder+"/AlertInformation16Wht.gif";
}
try{
img.alt=img.title=cuesAlt["InformationalMessage"];
}
catch(e){
}
obj.className="cuesStatusBox";
_6fd.className="cuesStatusText";
break;
}
}
catch(e){
}
};
function cuesSetStatusContent(id,_6fe){
try{
document.getElementById(id+".content").innerHTML=_6fe;
}
catch(e){
}
};
function cuesSetStatusVisible(id,_6ff){
try{
document.getElementById(id).style.display=_6ff?"":"none";
}
catch(e){
}
};
function cuesToggleHideShow(id){
try{
var _700=document.getElementById(id);
var _701=document.getElementById(id+".Content");
var _702=document.getElementById(id+"Toggler");
var _703=_700.getAttribute("state");
var _704,_705,_706;
if(_703=="hidden"){
_703="shown";
_704="";
_705=cuesKnownLocation+cuesImageFolder+"/drawerTriangleOpen.gif";
_706=cuesAlt["ExpandDrawer"];
}else{
_703="hidden";
_704="none";
_705=cuesKnownLocation+cuesImageFolder+"/drawerTriangleCollapsed.gif";
_706=cuesAlt["CollapseDrawer"];
}
_701.style.display=_704;
_700.setAttribute("state",_703);
_702.src=_705;
_702.title=_706;
try{
if(typeof callbackHideShowToggled=="function"){
callbackHideShowToggled(id,_703);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesShowMore(id){
try{
var _707=document.getElementById(id+".More");
var _708=document.getElementById(id+".Less");
var _709=document.getElementById(id+".LessAction");
_707.style.display="none";
_708.style.display="inline";
if(_709!=null){
_709.focus();
}
try{
if(typeof callbackShowingMore=="function"){
callbackShowingMore(id);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesShowLess(id){
try{
var _70a=document.getElementById(id+".More");
var _70b=document.getElementById(id+".Less");
var _70c=document.getElementById(id+".MoreAction");
_70a.style.display="inline";
_70b.style.display="none";
if(_70c!=null){
_70c.focus();
}
try{
if(typeof callbackShowingLess=="function"){
callbackShowingLess(id);
}
}
catch(e){
}
}
catch(e){
}
};
function cuesAutofitMoreContent(id){
try{
var _70d=document.getElementById(id+".More");
var _70e=document.getElementById(id+".MoreLink");
var _70f=_70d.style.display;
_70d.style.display="inline";
var h=_70d.offsetHeight;
if(h!=0){
var _710=_70e.innerHTML;
_70d.innerHTML=_710;
h=_70d.offsetHeight;
var _711=document.getElementById(id+".Less");
var _712=_711.innerHTML;
var at=_712.lastIndexOf("&lt;");
_712=_712.substring(0,at);
_70d.innerHTML=_712;
if(h<_70d.offsetHeight){
var _713=false;
var _714=_712.split(" ");
var _715=_714.length;
var _716="";
for(var i=0;i<_715;i++){
_70d.innerHTML=_716+_714[i]+" "+_710;
if(h<_70d.offsetHeight){
_713=true;
break;
}
_716+=_714[i]+" ";
}
if(_713){
_70d.innerHTML=_716+_710;
}else{
_70d.innerHTML=_716;
}
}
}
}
catch(e){
}
try{
_70d.style.display=_70f;
}
catch(e){
}
};
function icuesSetClipTooltip(obj,id){
try{
if(id==null){
obj.title="";
}else{
obj.title=isIE?document.getElementById(id).innerText:document.getElementById(id).textContent;
}
}
catch(e){
}
};
function cuesAutoclipContent(id){
try{
var _717=document.getElementById(id+".Partial");
_717.style.display="";
_717.innerHTML="...";
var h=_717.offsetHeight;
if(h!=0){
var _718=document.getElementById(id+".Full");
_718.style.display="";
var _719=_718.innerHTML;
_717.innerHTML=_719;
if(h<_718.offsetHeight){
var _71a=false;
var _71b=_719.split(" ");
var _71c=_71b.length;
var _71d="";
for(var i=0;i<_71c;i++){
_717.innerHTML=_71d+_71b[i]+"&nbsp;...&nbsp;";
if(h<_717.offsetHeight){
_71a=true;
break;
}
_71d+=_71b[i]+" ";
}
if(_71a){
_717.innerHTML=_71d+" ...";
}else{
_717.innerHTML=_71d;
}
}
_718.style.display="none";
}
}
catch(e){
}
};
function cuesWrapContent(id,_71e){
try{
var _71f,_720,_721,_722,_723;
var obj=document.getElementById(id);
obj.style.position="absolute";
var _724=obj.parentNode;
var _725=_724.offsetWidth;
var _726=_725;
if(obj.scrollWidth>obj.offsetWidth||obj.scrollWidth>_725){
obj.style.position="relative";
_71f=new Array(obj.innerHTML);
_721=_71f.length;
if(typeof _71e=="string"){
_71e=new Array(_71e);
}
_71e.push(" ");
_723=_71e.length;
for(var i=0;i<_723;i++){
var temp=new Array();
for(var j=0;j<_721;j++){
var _720=_71f[j].split(_71e[i]);
var _722=_720.length;
for(var k=0;k<_722-1;k++){
_720[k]+=_71e[i];
temp.push(_720[k]);
}
temp.push(_720[_722-1]);
}
_71f=temp;
_721=_71f.length;
}
var _727="";
for(var i=0;i<_721-1;i++){
obj.innerHTML=_727+_71f[i];
if((obj.scrollWidth>obj.offsetWidth||obj.scrollWidth>_725)&&i>0){
_727+="<br/>";
}
_727+=_71f[i];
obj.innerHTML=_727;
if(obj.scrollWidth>_725){
_725=obj.scrollWidth;
}
}
_727+=_71f[_721-1];
obj.innerHTML=_727;
obj.style.width=_726;
}
obj.style.position="relative";
}
catch(e){
}
};
function cuesHideAbout(evt){
try{
var _728=top.window.document.getElementById("icuesAboutContainer");
if(_728!=null){
_728.style.display="none";
if(document.removeEventListener){
_728.removeEventListener("click",cuesHideAbout,false);
_728.removeEventListener("keypress",cuesHideAbout,false);
_728.removeEventListener("keydown",cuesHideAbout,false);
}else{
if(document.detachEvent){
_728.detachEvent("onclick",cuesHideAbout);
_728.detachEvent("onkeypress",cuesHideAbout);
_728.detachEvent("onkeydown",cuesHideAbout);
}
}
}
}
catch(e){
}
if(evt!=null){
try{
cuesStopEventBubble(evt);
}
catch(e){
}
}
return false;
};
function cuesOpenAbout(url){
var _729=parseInt(cuesVersion);
if(_729>=62){
try{
var _72a=top.window.document.getElementById("icuesAboutContainer");
if(_72a==null){
_72a=top.window.document.createElement("div");
_72a.id="icuesAboutContainer";
_72a.style.width="100%";
_72a.style.height="100%";
_72a.style.position="absolute";
_72a.style.overflow="hidden";
_72a.style.zIndex=999;
_72a.style.top="0px";
_72a.style.left="0px";
_72a.setAttribute("role","region");
_72a.setAttribute("aria-live","polite");
_72a.setAttribute("aria-atomic","true");
_72a.innerHTML="<div style='position:absolute;top:0;left:0;z-index:-1;width:3000px;height:2000px;background-color:white;opacity:.01;filter:alpha(opacity=1);'>&nbsp;</div>";
_72a.tabIndex=0;
}
if(document.addEventListener){
_72a.addEventListener("click",cuesHideAbout,false);
_72a.addEventListener("keypress",cuesHideAbout,false);
_72a.addEventListener("keydown",cuesHideAbout,false);
}else{
if(document.attachEvent){
_72a.attachEvent("onclick",cuesHideAbout);
_72a.attachEvent("onkeypress",cuesHideAbout);
_72a.attachEvent("onkeydown",cuesHideAbout);
}
}
top.window.document.body.appendChild(_72a);
var _72b=top.window.document.getElementById("icuesAboutWindow");
if(_72b==null){
_72b=top.window.document.createElement("iframe");
_72b.id="icuesAboutWindow";
if(!isIE6){
_72b.allowTransparency=true;
}
_72b.setAttribute("firstuse","true");
_72b.frameBorder=0;
_72b.border=0;
icuesSetOpacity(_72b,1);
_72a.appendChild(_72b);
}
icuesSetOpacity(_72b,1);
_72a.style.display="";
if(!isFF30){
_72a.focus();
}
_72b.src=url;
}
catch(e){
}
}else{
var w=_729=60?480:460;
var _72c=parseInt(cuesVersion)>=60?"yes":"no";
var _72d=window.open(url,"cuesAboutWindow","height="+CUESABOUTHEIGHT+"px,status=no,scrollbars=no,resizable="+_72c+",width="+w+"px");
}
};
function cuesResizeCopyright(){
if(parseInt(cuesVersion)>=60){
return;
}
cuesExpandHeight("cuesAboutCopyright",isIE?0:20);
};
function cuesXpath(_72e,_72f){
try{
if(isIE){
return _72e.selectNodes(_72f);
}else{
var _730=_72e.evaluate(_72f,_72e,null,XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,null);
var _731=new Array();
for(var i=0;i<_730.snapshotLength;i++){
_731[i]=_730.snapshotItem(i);
}
return _731;
}
}
catch(e){
}
return null;
};
function cuesGetNodeChildren(node,_732){
var _733=new Array();
try{
var _734=node.childNodes.length;
for(var i=0;i<_734;i++){
if(node.childNodes[i].nodeName==_732){
_733.push(node.childNodes[i]);
}
}
}
catch(e){
}
return _733;
};
function cuesGetXmlDoc(id,_735){
var _736=null;
try{
if(isIE){
if(_735==null){
_736=document.getElementById(id);
}else{
_736=new ActiveXObject("Msxml2.DOMDocument");
_736.loadXML(_735);
}
try{
_736.setProperty("SelectionLanguage","XPath");
}
catch(e){
}
}else{
if(isFF||isSafari||isChrome){
var _737=new DOMParser();
if(_735==null){
_736=_737.parseFromString(document.getElementById(id).innerHTML,"text/xml");
}else{
_736=_737.parseFromString(_735,"text/xml");
}
}
}
}
catch(e){
}
return _736;
};
function icuesSerializeNode(node){
var _738="<"+node.nodeName;
for(var i=0;i<node.attributes.length;i++){
var attr=node.attributes.item(i);
_738+=" "+attr.nodeName+"=\""+attr.nodeValue+"\"";
}
_738+=">";
for(var i=0;i<node.childNodes.length;i++){
_738+=icuesSerializeNode(node.childNodes.item(i));
}
return _738+"</"+node.nodeName+">";
};
function cuesGetNodeContents(node){
var _739="";
try{
for(var i=0;i<node.childNodes.length;i++){
switch(node.childNodes[i].nodeType){
case 1:
_739+=cuesGetXml(node.childNodes[i]);
break;
case 3:
default:
_739+=node.childNodes[i].nodeValue;
break;
}
}
}
catch(e){
}
return _739;
};
function cuesGetXml(_73a){
var _73b=null;
try{
if(isIE){
_73b=_73a.xml;
}else{
var _73c=new XMLSerializer();
if(_73a.documentElement==null||_73a.constructor.toString().toLowerCase()=="element"){
_73b=_73c.serializeToString(_73a);
}else{
_73b=_73c.serializeToString(_73a.documentElement);
}
}
}
catch(e){
}
return _73b;
};
function cuesBuildSelectedXmlDoc(_73d){
var _73e=cuesGetXmlDoc(null,"<data/>");
try{
var _73f=_73e.documentElement;
var rows=cuesXpath(_73d,"//*[@selected='true']");
var _740=rows.length;
for(var i=0;i<_740;i++){
_73f.appendChild(rows[i].cloneNode(true));
}
}
catch(e){
}
return _73e;
};
function cuesClearSelectedInXmlDoc(_741){
try{
var rows=cuesXpath(_741,"//*[@selected='true']");
var _742=rows.length;
for(var i=0;i<_742;i++){
rows[i].removeAttribute("selected");
}
}
catch(e){
}
};
function cuesBuildSortedXmlDoc(_743,_744,_745,_746){
try{
if(_746==null){
_746="text";
}
var _747="<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">"+"<xsl:output method=\"xml\"/>"+"<xsl:template match=\"/*\">"+"<xsl:copy>"+"<xsl:apply-templates>"+"<xsl:sort select=\"@"+_744+"\" order=\""+_745+"\" data-type=\""+_746+"\"/>"+"</xsl:apply-templates>"+"</xsl:copy>"+"</xsl:template>"+"<xsl:template match=\"*\">"+"<xsl:copy-of select=\".\"/>"+"</xsl:template>"+"</xsl:stylesheet>";
return (cuesGetXmlDoc(null,cuesXSLT(_743,cuesGetXmlDoc(null,_747),true)));
}
catch(e){
return null;
}
};
var icuesClientTableJoinValue=new Array();
function cuesInsertClientTableRow(_748,_749,_74a,_74b,_74c,_74d){
try{
icuesRemoveEmptyClientTableRow(_748);
var _74e=cuesGetXmlDoc(null,_74b);
var _74f=_74e.documentElement;
var node=_749.createElement(_74f.nodeName);
if(_74c==null){
_749.documentElement.appendChild(node);
}else{
var _750=icuesFindTableObj(_748);
var _751=_750.rows[_74d].id;
var _752=cuesXpath(_749,"/*/*[@key='"+_751+"']");
if(_752.length==0){
_74c=null;
}
if(_74c=="after"){
var _753=_752[0];
if(_753.nextSibling==null){
_749.documentElement.appendChild(node);
}else{
_753.parentNode.insertBefore(node,_753.nextSibling);
}
}else{
if(_74c=="before"){
var _753=_752[0];
_753.parentNode.insertBefore(node,_753);
}else{
_749.documentElement.appendChild(node);
}
}
}
for(var i=0;i<_74f.attributes.length;i++){
var attr=_74f.attributes.item(i);
node.setAttribute(attr.nodeName,attr.nodeValue);
}
node.setAttribute("key",_74a);
for(var i=0;i<_74f.childNodes.length;i++){
var _754=_74f.childNodes.item(i);
var _755=_749.createElement(_754.nodeName);
for(var j=0;j<_754.attributes.length;j++){
var attr=_754.attributes.item(j);
_755.setAttribute(attr.nodeName,attr.nodeValue);
}
node.appendChild(_755);
}
_74e=null;
var _756=null;
if(_74c!=null){
if(_74c=="after"){
_74d++;
}
var _757=cuesInsertTableRow(_748,_74a,_74d);
if(_757!=null){
_756=_74a;
}
}
node.setAttribute("origposition",icuesLocateMaxClienttableRowPosition(_749)+1);
cuesRenderClientTableRow(_748,_749,_756,node);
}
catch(e){
}
};
function cuesRemoveClientTableRows(_758,_759,_75a){
try{
var _75b=0;
if(isArray(_75a)){
_75b=_75a.length;
}else{
var temp=_75a;
if(temp==null){
return;
}
_75a=new Array();
_75a.push(temp);
_75b=1;
}
for(var i=0;i<_75b;i++){
var node=cuesXpath(_759,"/*/*[@key='"+_75a[i]+"']")[0];
if(node!=null){
node.parentNode.removeChild(node);
}
}
cuesRemoveTableRows(_758,_75a);
var _75c=icuesFindTableObj(_758);
var _75d=_75c.rows.length;
if(_75d==0){
icuesAddEmptyClientTableRow(_758);
}
}
catch(e){
}
};
function icuesRemoveEmptyClientTableRow(_75e){
try{
var _75f=icuesFindTableObj(_75e);
var _760=_75f.rows.length;
if(_760==1&&_75f.rows[0].className=="cuesTableRowEmpty"){
_75f.deleteRow(0);
}
if(_760==2&&_75f.rows[1].className=="cuesTableRowEmpty"){
_75f.deleteRow(1);
}
if(tablesWithColgroup[_75e]){
_75f=document.getElementById(_75f.id.replace("_CG1.","_CG2."));
var _760=_75f.rows.length;
if(_760==1&&_75f.rows[0].className=="cuesTableRowEmpty"){
_75f.deleteRow(0);
}
if(_760==2&&_75f.rows[1].className=="cuesTableRowEmpty"){
_75f.deleteRow(1);
}
}
}
catch(e){
}
};
function icuesAddEmptyClientTableRow(_761){
var _762=cuesInsertTableRow(_761);
if(_762!=null){
if(tablesWithColgroup[_761]){
var _763=icuesFindTableObj(_761);
var _764=_762[0].cells.length;
var _765=0;
for(var i=0;i<_764;i++){
if(_762[0].cells[i].getAttribute("xpath")!=null){
_765++;
}
}
var _766=_764-_765;
if(_765==0){
_766=0;
_765=_764;
}
for(var i=_764-1;i>_766;i--){
_762[0].deleteCell(i);
}
for(var i=0;i<_766;i++){
_762[0].cells[i].innerHTML="&nbsp;";
}
_762[0].cells[_766].innerHTML="&nbsp;";
_762[0].cells[_766].setAttribute("colSpan",_765);
_762[0].className="cuesTableRowEmpty";
var _763=icuesFindSecondaryTableObj(_761);
var _764=_762[1].cells.length;
var _765=0;
for(var i=0;i<_764;i++){
if(_762[1].cells[i].getAttribute("xpath")!=null){
_765++;
}
}
var _766=_764-_765;
if(_765==0){
_766=0;
_765=_764;
}
for(var i=_764-1;i>_766;i--){
_762[1].deleteCell(i);
}
for(var i=0;i<_766;i++){
_762[1].cells[i].innerHTML="&nbsp;";
}
_762[1].cells[_766].innerHTML=cuesMsg["EmptyRow"];
_762[1].cells[_766].setAttribute("colSpan",_765);
_762[1].className="cuesTableRowEmpty";
}else{
var _764=_762.cells.length;
var _765=0;
for(var i=0;i<_764;i++){
if(_762.cells[i].getAttribute("xpath")!=null){
_765++;
}
}
var _766=_764-_765;
if(_765==0){
_766=0;
var _767=cuesModelRow[_761];
if(_767!=null){
if(_767.substring(0,1)=="T"){
_766++;
}
if(_767.substring(2,3)=="M"||_767.substring(2,3)=="S"){
_766++;
}
}
_765=_764-_766;
}
for(var i=_764-1;i>_766;i--){
_762.deleteCell(i);
}
for(var i=0;i<_766;i++){
_762.cells[i].innerHTML="&nbsp;";
}
_762.cells[_766].innerHTML=cuesMsg["EmptyRow"];
_762.cells[_766].setAttribute("colSpan",_765);
_762.className="cuesTableRowEmpty";
}
}
};
function cuesUpdateClientTableRow(_768,_769,_76a,_76b){
try{
var node=cuesXpath(_769,"/*/*[@key='"+_76a+"']")[0];
for(var i=0;i<node.attributes.length;i++){
node.removeAttribute(node.attributes.item(i).nodeName);
}
for(var i=node.childNodes.length-1;i>=0;i--){
node.removeChild(node.childNodes.item(i));
}
var _76c=cuesGetXmlDoc(null,_76b);
var _76d=_76c.documentElement;
for(var i=0;i<_76d.attributes.length;i++){
var attr=_76d.attributes.item(i);
node.setAttribute(attr.nodeName,attr.nodeValue);
}
node.setAttribute("key",_76a);
for(var i=0;i<_76d.childNodes.length;i++){
var _76e=_76d.childNodes.item(i);
var _76f=_769.createElement(_76e.nodeName);
for(var j=0;j<_76e.attributes.length;j++){
var attr=_76e.attributes.item(j);
_76f.setAttribute(attr.nodeName,attr.nodeValue);
}
node.appendChild(_76f);
}
cuesRenderClientTableRow(_768,_769,_76a,node);
}
catch(e){
}
};
function icuesLocateMaxClienttableRowPosition(_770){
var _771=0;
try{
var _772=cuesXpath(_770,"/*/*[@key]");
var _773;
for(var i=0;i<_772.length;i++){
_773=_772[i].getAttribute("origposition");
if(_773==null||_773==""){
_771=Math.max(_771,i);
}else{
try{
_771=Math.max(_771,_773);
}
catch(e){
}
}
}
}
catch(e){
}
return _771;
};
function icuesLocateMaxTableRowPosition(_774){
var _775=0;
try{
var _776=icuesFindTableObj(_774);
var _777=_776.rows.length;
for(var i=0;i<_777;i++){
var _778=_776.rows[i].getAttribute("origposition");
if(_778==null||_778==""){
_778=i+1;
}
_775=Math.max(_775,_778);
}
}
catch(e){
}
return _775;
};
function cuesDuplicateClientTableRow(_779,_77a,_77b,_77c,_77d,_77e){
try{
var node=cuesXpath(_77a,"/*/*[@key='"+_77b+"']")[0];
cuesInsertClientTableRow(_779,_77a,_77c,icuesSerializeNode(node),_77d,_77e);
}
catch(e){
}
};
function icuesPopulateClientTableRow(_77f,_780,_781,_782,_783,_784,_785,_786,_787,_788,_789,_78a){
if(_786==null){
_786=true;
}
var _78b=_77f.getAttribute("key");
_780.id=_78b;
if(_781){
var _78c=_77f.getAttribute("origposition");
if(_78c==null||_78c==""){
_78c=_785+1;
}
_780.cells[0].innerHTML=_78c;
_780.setAttribute("origposition",_78c);
}
var _78d,_78e,_78f;
if(_78a){
_78f=_77f.getAttribute("selectiontooltip");
if(_78f!=""&&_78f!=null){
try{
if(_781){
_780.cells[1].getElementsByTagName("input")[0].title=_78f;
}else{
_780.cells[0].getElementsByTagName("input")[0].title=_78f;
}
}
catch(e){
}
}
_78f=_77f.getAttribute("selectionValue");
if(_78f!=""){
try{
if(_781){
_780.cells[1].getElementsByTagName("input")[0].value=_78f;
}else{
_780.cells[0].getElementsByTagName("input")[0].value=_78f;
}
}
catch(e){
}
}
}
for(var j=0;j<_782;j++){
_78e=_780.cells[j];
_78d=_783[j];
if(_78d==null||_78d==""){
continue;
}
if(_784[j]){
if(_786){
try{
if(cuesUsage=="webapp"){
_78e.innerHTML=callbackRenderClientTableCell(_78d,_77f.getAttribute(_78d),_787,_788,_77f.getAttribute("key"));
}else{
_78e.innerHTML=window[icuesGetPortletId(_788,_780,true)+"_callbackRenderClientTableCell"](_78d,_77f.getAttribute(_78d),_787,_788,_77f.getAttribute("key"));
}
}
catch(e){
_78e.innerHTML=_77f.getAttribute(_78d);
}
}else{
_78e.innerHTML=_77f.getAttribute(_78d);
}
}else{
var _790=new Array();
var _791=cuesGetNodeChildren(_77f,_78d.replace("[@name]",""));
var _792=_791.length;
var _793;
if(_792==0){
_790="&nbsp;";
}else{
for(var k=0;k<_792;k++){
if(_786){
try{
if(cuesUsage=="webapp"){
_793=callbackRenderClientTableCell(_78d,_791[k].getAttribute("name"),_787,_788,_77f.getAttribute("key"),_791[k].getAttribute("value"));
}else{
_793=window[icuesGetPortletId(_788,_780,true)+"_callbackRenderClientTableCell"](_78d,_791[k].getAttribute("name"),_787,_788,_77f.getAttribute("key"),_791[k].getAttribute("value"));
}
}
catch(e){
_793=_791[k].getAttribute("name");
}
}else{
_793=_791[k].getAttribute("name");
}
_790.push(_793);
}
}
_78e.innerHTML=_790.join(_789);
}
}
};
function cuesRenderClientTable(_794,_795,_796,_797,_798,_799,_79a){
try{
var _79b;
if(_79a==null){
_79a=false;
}
icuesFilteredTable[_794]=!(_799==null);
if(_796!=null){
var _79c=_796.length;
_79b=_79c;
if(_79c==0){
icuesAddEmptyClientTableRow(_794);
icuesUpdateClientTablePagingControls(_794,-1,_79c,_79b,_798);
return;
}
if(_797==null){
_797=0;
}
if(_798!=null&&_797>_79c){
_797=_79c-_798;
}
if(_798!=null){
if(_797+_798>_79c){
_79c=_79c-_797;
}
_79c=Math.min(_798,_79c);
}
for(var i=0;i<_79c;i++){
cuesRenderClientTableRow(_794,_795,_796[i+_797]);
}
var _79d=icuesFindTableObj(_794);
var _79e=icuesTableHasAccessibilityRow(_794);
if((_79d.rows.length==0&&!_79e)||(_79d.rows.length==1&&_79e)){
icuesAddEmptyClientTableRow(_794);
}
}else{
var _79f;
if(_799==null){
if(_79a){
_79f=cuesXpath(_795,"//*[@key]");
}else{
_79f=cuesXpath(_795,"/*/*[@key]");
}
}else{
_79f=cuesXpath(_795,"/*/*[@key][@"+_799+"='true']");
}
var _79c=_79f.length;
if(_79c==0){
icuesAddEmptyClientTableRow(_794);
icuesUpdateClientTablePagingControls(_794,-1,0,0,_798);
return;
}
_79b=_79c;
var _7a0=false;
if(_79a){
var _7a1=cuesXpath(_795,"//*[@detailkey]");
_7a0=_7a1.length>0;
_79c+=_7a1.length;
}
var _79e=icuesTableHasAccessibilityRow(_794);
icuesRemoveEmptyClientTableRow(_794);
var _79d=icuesFindTableObj(_794);
if((_79d.rows.length==0&&!_79e)||(_79d.rows.length==1&&_79e)){
var _7a2=(_79e?1:0);
var _7a3=cuesModelRow[_794].substr(0,1)=="T";
var _7a4=cuesModelRow[_794].substring(2,3)=="M"||cuesModelRow[_794].substring(2,3)=="S"?true:false;
if(_799==null&&_7a3){
for(var loop=0;loop<_79f.length;loop++){
if(_79f[loop].getAttribute("origposition")==null){
_79f[loop].setAttribute("origposition",loop+1);
}
}
}
var _7a5=new Array();
if(isIE){
var div=_79d.parentNode;
var _7a6=div.innerHTML;
var at=_7a6.indexOf(">");
_7a5.push(_7a6.substring(0,at+1));
var _7a7=document.getElementById(_794+".th");
if(_7a7!=null){
cols=_7a7.getElementsByTagName("col");
var _7a8=cols.length;
var _7a9=icuesComputeSpannedTableColumWidths(_7a7);
for(var i=0;i<_7a9.length;i++){
var idx=Math.min(i,_7a8-1);
suggestedWidth=cols[idx].getAttribute("suggested");
_7a5.push("<col width=\""+_7a9[i]+"\" class=\""+cols[idx].className+"\""+(suggestedWidth!=null?" suggested=\""+suggestedWidth+"\"":"")+"/>");
}
}
_7a5.push("<tbody>");
}else{
if(isChrome||isSafari){
}else{
var _7a7=document.getElementById(_794+".th");
if(_7a7!=null){
cols=_7a7.getElementsByTagName("col");
var _7a8=cols.length;
var _7a9=icuesComputeSpannedTableColumWidths(_7a7);
for(var i=0;i<_7a9.length;i++){
var idx=Math.min(i,_7a8-1);
suggestedWidth=cols[idx].getAttribute("suggested");
_7a5.push("<col width=\""+_7a9[i]+"\" class=\""+cols[idx].className+"\""+(suggestedWidth!=null?" suggested=\""+suggestedWidth+"\"":"")+"/>");
}
}
}
}
if(_79e){
try{
var _7aa=icuesGetTableAccessibilityRow(_794);
_7a5.push((_7aa.outerHTML?_7aa.outerHTML:(new XMLSerializer).serializeToString(_7aa)));
}
catch(e){
}
}
var _7ab=icuesGetModelRowHTML(_794);
if(_797==null){
_797=0;
}
if(!_79a){
if(_797>_79f.length&&_798!=null){
_797=_79f.length-_798;
}
if(_798!=null){
_79c=Math.min(_798,_79c);
}
if(_797+_79c>_79f.length){
_79c=_79f.length-_797;
}
}
for(var i=0;i<_79c;i++){
_7a5.push(_7ab);
}
if(isIE){
_7a5.push("</tbody></table>");
_79d.parentNode.innerHTML=_7a5.join("");
_79d=icuesFindTableObj(_794);
}else{
if(isChrome||isSafari){
if(_79d.getElementsByTagName("tbody").length==0){
_79d.appendChild(document.createElement("tbody"));
}
_79d.getElementsByTagName("tbody")[0].innerHTML=_7a5.join("");
}else{
_79d.innerHTML=_7a5.join("");
}
}
var _7ac=_79d.rows[_7a2];
var _7ad=_7ac.cells.length;
var _7ae=new Array();
var _7af=icuesGetNumFixedTableCells(_794);
var _7b0=new Array();
var _7b1;
for(var j=0;j<_7ad;j++){
_7b1=_7ac.cells[j].getAttribute("xpath");
try{
_7b0.push(_7b1.indexOf("[@name]")==-1);
}
catch(e){
_7b0.push(false);
}
_7ae.push(_7b1);
}
var _7b2,_7b3,_7b4,_7b5;
var _7b6=false;
var _7b7=0;
var _7b8=0;
var _7b9=new Array();
var _7ba=0;
try{
if(callbackRenderClientTableCell){
_7b6=true;
}
}
catch(e){
}
var _7bb=_7a2;
for(var i=0;i<_79b;i++){
_7b2=_79d.rows[_7bb];
if(_7b2==null){
break;
}
try{
icuesPopulateClientTableRow(_79f[_797+i],_7b2,_7a3,_7ad,_7ae,_7b0,i,_7b6,_795,_794,icuesGetClientTableJoinValue(_794),_7a4);
if(_79a){
try{
_7b3=icuesDetermineTreenodeDepth(_79f[_797+i]);
if(_7b9[_7b3]==null){
_7b9[_7b3]=1;
}else{
_7b9[_7b3]++;
}
_7b9.length=_7b3+1;
_7b4="K"+_7b9.join(".")+".";
_7b2.setAttribute("treeid",_7b4);
_7b2.setAttribute("treeexpanded","true");
_7b2.setAttribute("treelevel",_7b3);
_7b2.setAttribute("id2",_794+".R"+_7bb);
_7b2.setAttribute("treelevel",_7b3);
_7b2.cells[_7af].style.paddingLeft=_7b3*TREETABLEINDENTATION;
_7b5=true;
if(i<_79c-1){
if(_7b3<icuesDetermineTreenodeDepth(_79f[_797+i+1])){
_7b5=false;
}
}
if(_7b5){
if(_79f[_797+i].getAttribute("lod")=="true"){
_7b2.cells[_7af].innerHTML="<button class=\"cuesTreetableNodeCollapsed\" onclick=\"cuesToggleTreeTable(this)\" title=\""+cuesAlt["ExpandTree"]+"\" alt=\""+cuesAlt["ExpandTree"]+"\" type=\"button\"><span>&nbsp;</span></button>"+_7b2.cells[_7af].innerHTML;
_7b2.setAttribute("treeexpanded","false");
}else{
_7b2.cells[_7af].innerHTML="<img class=\"cuesTreetableNodeLeaf\" src=\""+cuesKnownLocation+cuesImageFolder+"/treeBullet.gif\" alt=\""+cuesAlt["LeafTree"]+"\" title=\""+cuesAlt["LeafTree"]+"\"/>"+_7b2.cells[_7af].innerHTML;
}
}else{
_7b2.cells[_7af].innerHTML="<button class=\"cuesTreetableNodeExpanded\" onclick=\"cuesToggleTreeTable(this)\" title=\""+cuesAlt["CollapseTree"]+"\" alt=\""+cuesAlt["CollapseTree"]+"\" type=\"button\"><span>&nbsp;</span></button>"+_7b2.cells[_7af].innerHTML;
}
if(_7b3==0){
_7b7++;
_7b8=0;
_7b2.className="cuesTableTreeRowTop"+(_7b7%2==0?"Odd":"Even");
}else{
_7b8++;
_7b2.className="cuesTableTreeRowChild"+((_7b8+_7b7)%2==0?"Odd":"Even");
}
}
catch(e){
}
}
}
catch(e){
}
try{
if(_79f[_797+i].getAttribute("selected")=="true"){
icuesMarkTableRowAsSelected(_794,_7b2);
}
}
catch(e){
}
_7bb++;
if(_7a0){
var key=_79f[_797+i].getAttribute("key");
var _7a1=cuesXpath(_795,"//*[@key='"+key+"']/*[@detailkey]");
var _7bc=_7a1.length;
for(var j=0;j<_7bc;j++){
_7b2=_79d.rows[_7bb];
if(_7b2!=null){
try{
icuesPopulateClientTableRow(_7a1[j],_7b2,_7a3,_7ad,_7ae,_7b0,i,_7b6,_795,_794,icuesGetClientTableJoinValue(_794),_7a4);
_7b2.id=_7a1[j].getAttribute("detailkey");
_7b2.setAttribute("detailrow","true");
_7b2.setAttribute("treeid",_7b4);
_7b2.setAttribute("treelevel",_7b3);
_7b2.setAttribute("id2",_794+".R"+_7bb);
_7b2.setAttribute("treelevel",_7b3);
_7b2.cells[_7af].style.paddingLeft=(1+_7b3)*TREETABLEINDENTATION;
_7b8++;
_7b2.className="cuesTableTreeRowChild"+((_7b8+_7b7)%2==0?"Odd":"Even");
}
catch(e){
}
}
_7bb++;
}
}
}
cuesManageTableRowSelectionRules(_794);
}else{
for(var i=0;i<_79c;i++){
cuesRenderClientTableRow(_794,_795,null,_79f[i],false);
}
}
if(!_79a){
icuesRestripeTableRows(_79d);
}
}
icuesUpdateClientTablePagingControls(_794,_797,_79c,_79b,_798);
}
catch(e){
}
};
function cuesAppendClientTableTree(_7bd,_7be,_7bf,_7c0){
try{
var _7c1=cuesXpath(_7c0,"/*/*/*");
if(_7c1.length>0){
cuesAppendClientTableTreeHier(_7bd,_7be,_7bf,_7c0);
return;
}
var _7c2=icuesFindTableObj(_7bd);
var _7c3=document.getElementById(_7be);
var _7c4=_7c3.nextSibling;
var _7c5=_7c3.cells.length;
var _7c6=_7c3.parentNode;
var _7c7=cuesXpath(_7bf,"//*[@key='"+_7be+"']")[0];
var _7c8=icuesGetNumFixedTableCells(_7bd);
var _7c9=parseInt(_7c3.getAttribute("treelevel"));
var _7ca=_7c3.getAttribute("treeid");
var _7cb=cuesXpath(_7c0,"/*/*");
var _7cc=_7cb.length;
var _7cd;
var _7ce;
var _7cf;
var _7d0;
var _7d1;
for(var i=0;i<_7cc;i++){
_7cd=_7cb[i];
_7c7.appendChild(_7cd.cloneNode(true));
_7ce=_7c3.cloneNode(true);
_7ce.id=_7cd.getAttribute("key");
_7ce.setAttribute("treelevel",_7c9+1);
_7ce.setAttribute("treeexpanded","false");
_7ce.setAttribute("treeid",_7ca+(i+1)+".");
_7d0=_7ce.getElementsByTagName("td");
for(var j=0;j<_7c5;j++){
_7cf=_7d0[j];
_7d1=_7cf.getAttribute("xpath");
if(_7d1==null){
continue;
}
_7cf.innerHTML=_7cd.getAttribute(_7d1);
}
_7d0[_7c8].style.paddingLeft=TREETABLEINDENTATION*(_7c9+1);
if(_7cd.getAttribute("lod")=="true"){
_7d0[_7c8].innerHTML="<button class=\"cuesTreetableNodeCollapsed\" onclick=\"cuesToggleTreeTable(this)\" title=\""+cuesAlt["ExpandTree"]+"\" alt=\""+cuesAlt["ExpandTree"]+"\" type=\"button\"><span>&nbsp;</span></button>"+_7d0[_7c8].innerHTML;
}else{
_7d0[_7c8].innerHTML="<img class=\"cuesTreetableNodeLeaf\" src=\""+cuesKnownLocation+cuesImageFolder+"/treeBullet.gif\" alt=\""+cuesAlt["LeafTree"]+"\" title=\""+cuesAlt["LeafTree"]+"\"/>"+_7d0[_7c8].innerHTML;
}
if(_7c4!=null){
_7c6.insertBefore(_7ce,_7c4);
}else{
_7c6.appendChild(_7ce);
}
}
_7c7.setAttribute("lod","loaded");
cuesRestripeTableBlock(_7be,_7c3);
}
catch(e){
}
};
function icuesAppendClientTableTreeHier(_7d2,_7d3,_7d4,_7d5,_7d6,_7d7,_7d8,_7d9,_7da,_7db,_7dc){
var _7dd=cuesXpath(_7d6,_7d7);
var _7de=_7dd.length;
var _7df;
var _7e0;
var _7e1;
var _7e2;
var _7e3;
var _7e4;
var _7e5;
if(_7de>0&&_7d2!=null){
_7d2.setAttribute("lod","loaded");
}
for(var i=0;i<_7de;i++){
_7df=_7dd[i];
if(_7dc){
_7d2.appendChild(_7df.cloneNode(true));
}
_7e0=_7d3.cloneNode(true);
_7e5=_7e0.id=_7df.getAttribute("key");
_7e0.setAttribute("treelevel",_7d8+1);
_7e0.setAttribute("treeexpanded","false");
_7e0.setAttribute("treeid",_7d9+(i+1)+".");
_7e2=_7e0.getElementsByTagName("td");
for(var j=0;j<_7da;j++){
_7e1=_7e2[j];
_7e3=_7e1.getAttribute("xpath");
if(_7e3==null){
continue;
}
_7e1.innerHTML=_7df.getAttribute(_7e3);
}
_7e2[_7db].style.paddingLeft=TREETABLEINDENTATION*(_7d8+1);
_7e4=cuesXpath(_7d6,"//*[@key='"+_7e0.id+"']/*[@key]");
if(_7df.getAttribute("lod")=="true"||_7e4.length>0){
_7e2[_7db].innerHTML="<button class=\"cuesTreetableNodeCollapsed\" onclick=\"cuesToggleTreeTable(this)\" title=\""+cuesAlt["ExpandTree"]+"\" alt=\""+cuesAlt["ExpandTree"]+"\" type=\"button\"><span>&nbsp;</span></button>"+_7e2[_7db].innerHTML;
}else{
_7e2[_7db].innerHTML="<img class=\"cuesTreetableNodeLeaf\" src=\""+cuesKnownLocation+cuesImageFolder+"/treeBullet.gif\" alt=\""+cuesAlt["LeafTree"]+"\" title=\""+cuesAlt["LeafTree"]+"\"/>"+_7e2[_7db].innerHTML;
}
if(_7d5!=null){
_7d4.insertBefore(_7e0,_7d5);
}else{
_7d4.appendChild(_7e0);
}
if(!_7dc){
_7e0.style.display="none";
}
var _7e6=cuesXpath(_7d6,"//*[@key='"+_7e5+"']/*[@detailkey]");
var _7e7=_7e6.length;
for(var j=0;j<_7e7;j++){
_7e0=_7d3.cloneNode(true);
_7e0.id=_7df.getAttribute("detailkey");
_7e0.setAttribute("treelevel",_7d8+1);
_7e0.setAttribute("treeid",_7d9+(i+1)+".");
_7e2=_7e0.getElementsByTagName("td");
for(var k=0;k<_7da;k++){
_7e1=_7e2[k];
_7e3=_7e1.getAttribute("xpath");
if(_7e3==null){
continue;
}
_7e1.innerHTML=_7e6[j].getAttribute(_7e3);
}
_7e0.setAttribute("detailrow","true");
_7e2[_7db].style.paddingLeft=TREETABLEINDENTATION*(_7d8+2);
if(_7d5!=null){
_7d4.insertBefore(_7e0,_7d5);
}else{
_7d4.appendChild(_7e0);
}
if(!_7dc){
_7e0.style.display="none";
}
}
icuesAppendClientTableTreeHier(null,_7d3,_7d4,_7d5,_7d6,"//*[@key='"+_7e5+"']/*[@key]",_7d8+1,_7d9+(i+1)+".",_7da,_7db,false);
}
};
function cuesAppendClientTableTreeHier(_7e8,_7e9,_7ea,_7eb){
try{
var _7ec=icuesFindTableObj(_7e8);
var _7ed=document.getElementById(_7e9);
var _7ee=_7ed.nextSibling;
var _7ef=_7ed.getAttribute("treeid");
while(_7ee!=null&&_7ee.getAttribute("treeid")==_7ef){
_7ee=_7ee.nextSibling;
}
var _7f0=_7ed.cells.length;
var _7f1=_7ed.parentNode;
var _7f2=cuesXpath(_7ea,"//*[@key='"+_7e9+"']")[0];
var _7f3=icuesGetNumFixedTableCells(_7e8);
var _7f4=parseInt(_7ed.getAttribute("treelevel"));
var _7ef=_7ed.getAttribute("treeid");
icuesAppendClientTableTreeHier(_7f2,_7ed,_7f1,_7ee,_7eb,"/*/*[@key]",_7f4,_7ef,_7f0,_7f3,true);
cuesRestripeTableBlock(_7e9,_7ed);
}
catch(e){
}
};
function cuesRestripeTableBlock(_7f5,_7f6){
try{
if(_7f6==null){
_7f6=document.getElementById(_7f5);
}
var _7f7=parseInt(_7f6.getAttribute("treelevel"));
while(_7f7>0){
_7f6=_7f6.previousSibling;
if(_7f6==null){
return;
}
_7f7=parseInt(_7f6.getAttribute("treelevel"));
}
var _7f8=_7f6.className.indexOf("Odd")?1:0;
_7f6=_7f6.nextSibling;
var _7f9=0;
while(_7f6!=null){
if(parseInt(_7f6.getAttribute("treelevel"))==0){
break;
}
_7f6.className="cuesTableTreeRowChild"+((_7f9+_7f8)%2==0?"Odd":"Even");
_7f6=_7f6.nextSibling;
_7f9++;
}
}
catch(e){
}
};
function icuesDetermineTreenodeDepth(node){
var _7fa=0;
try{
_7fa=node.getAttribute("depth");
if(_7fa==null||_7fa==""){
var _7fb=node.parentNode;
while(_7fb!=null){
_7fa++;
_7fb=_7fb.parentNode;
}
_7fa=Math.max(0,_7fa-2);
node.setAttribute("depth",_7fa);
}
_7fa=_7fa*1;
}
catch(e){
}
return _7fa;
};
function icuesUpdateClientTablePagingControls(_7fc,_7fd,_7fe,_7ff,_800){
try{
var _801=icuesTableHasEmptyRow(_7fc);
var info;
info=document.getElementById("firstitem_"+_7fc);
if(info!=null){
info.innerHTML=(_7fd==-1)?0:(_7fd+1);
}
info=document.getElementById("lastitem_"+_7fc);
if(info!=null){
info.innerHTML=(_7fd==-1)?0:(_7fd+_7fe);
}
info=document.getElementById("totalitems_"+_7fc);
if(info!=null){
info.innerHTML=(_7fd==-1)?0:_7ff;
}
info=document.getElementById("activepage_"+_7fc);
if(info!=null){
info.value=(_7fd==-1)?0:Math.floor(_7fd/_800)+1;
}
info=document.getElementById("totalpages_"+_7fc);
if(info!=null){
info.innerHTML=(_7fd==-1)?0:Math.ceil(_7ff/_800);
}
var _802,imgs;
if(_7fd>0&&!_801){
_802=document.getElementById("firstpage_"+_7fc);
if(_802!=null){
_802.disabled=false;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/First.gif";
}
}
_802=document.getElementById("prevpage_"+_7fc);
if(_802!=null){
_802.disabled=false;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Previous.gif";
}
}
}else{
_802=document.getElementById("firstpage_"+_7fc);
if(_802!=null){
_802.disabled=true;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/First-D.gif";
}
}
_802=document.getElementById("prevpage_"+_7fc);
if(_802!=null){
_802.disabled=true;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Previous-D.gif";
}
}
}
if(_7ff>_7fd+_7fe&&!_801){
_802=document.getElementById("nextpage_"+_7fc);
if(_802!=null){
_802.disabled=false;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Next.gif";
}
}
_802=document.getElementById("lastpage_"+_7fc);
if(_802!=null){
_802.disabled=false;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Last.gif";
}
}
}else{
_802=document.getElementById("nextpage_"+_7fc);
if(_802!=null){
_802.disabled=true;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Next-D.gif";
}
}
_802=document.getElementById("lastpage_"+_7fc);
if(_802!=null){
_802.disabled=true;
imgs=_802.getElementsByTagName("img");
if(imgs.length!=0){
imgs[0].src=cuesKnownLocation+cuesImageFolder+"/Last-D.gif";
}
}
}
}
catch(e){
}
};
function cuesRenderClientTableRow(_803,_804,_805,_806,_807,_808){
try{
var _809=icuesGetClientTableJoinValue(_803);
if(_806==null){
_806=cuesXpath(_804,"/*/*[@key='"+_805+"']")[0];
}
if(_805==null){
_805=_806.getAttribute("key");
}
if(_808==null){
_808=cuesGetTableRow(_803,_805);
}
var _80a=false;
if(_808==null){
_808=cuesInsertTableRow(_803,_805,null,_806.getAttribute("origposition"),_807);
_80a=true;
}
if(tablesWithColgroup[_803]){
_808=_808[0];
}
var _80b=_806.getAttribute("selected");
if(_80b=="true"){
icuesMarkTableRowAsSelected(_803,_808);
}
var _80c=_808.cells.length;
var _80d,_80e;
for(var i=0;i<_80c;i++){
_80e=_808.cells[i];
_80d=_80e.getAttribute("xpath");
if(_80d==null||_80d==""){
continue;
}
var at=_80d.indexOf("[@name]");
if(at==-1){
try{
if(cuesUsage=="webapp"){
_80e.innerHTML=callbackRenderClientTableCell(_80d,_806.getAttribute(_80d),_804,_803,_806.getAttribute("key"));
}else{
_80e.innerHTML=window[icuesGetPortletId(_803,_808,true)+"_callbackRenderClientTableCell"](_80d,_806.getAttribute(_80d),_804,_803,_806.getAttribute("key"));
}
}
catch(e){
_80e.innerHTML=_806.getAttribute(_80d);
}
}else{
var _80f=new Array();
var _810=cuesGetNodeChildren(_806,_80d.replace("[@name]",""));
var _811=_810.length;
var _812;
if(_811==0){
_80f="&nbsp;";
}else{
for(var j=0;j<_811;j++){
try{
if(cuesUsage=="webapp"){
_812=callbackRenderClientTableCell(_80d,_810[j].getAttribute("name"),_810[j].getAttribute("value"),_804,_803,_806.getAttribute("key"));
}else{
_812=window[icuesGetPortletId(_803,_808,true)+"_callbackRenderClientTableCell"](_80d,_810[j].getAttribute("name"),_810[j].getAttribute("value"),_804,_803,_806.getAttribute("key"));
}
}
catch(e){
_812=_810[j].getAttribute("name");
}
_80f.push(_812);
}
}
_80e.innerHTML=_80f.join(_809);
}
}
if(tablesWithColgroup[_803]){
icuesRenderClientSecondaryTableRow(_803,_804,_805,_806,_807,_80a?_808[1]:null);
}
return _808.getAttribute("origposition");
}
catch(e){
return 0;
}
};
function icuesRenderClientSecondaryTableRow(_813,_814,_815,_816,_817,_818){
try{
if(_818==null){
_818=cuesGetTableRow(_813,_815+".2");
}
var _819=_818.cells.length;
var _81a,_81b;
for(var i=0;i<_819;i++){
_81b=_818.cells[i];
_81a=_81b.getAttribute("xpath");
if(_81a==null||_81a==""){
continue;
}
var at=_81a.indexOf("[@name]");
if(at==-1){
try{
if(cuesUsage=="webapp"){
_81b.innerHTML=callbackRenderClientTableCell(_81a,_816.getAttribute(_81a),_814,_813,_816.getAttribute("key"));
}else{
_81b.innerHTML=window[icuesGetPortletId(_813,_818,true)+"_callbackRenderClientTableCell"](_81a,_816.getAttribute(_81a),_814,_813,_816.getAttribute("key"));
}
}
catch(e){
_81b.innerHTML=_816.getAttribute(_81a);
}
}else{
var _81c=new Array();
var _81d=cuesGetNodeChildren(_816,_81a.replace("[@name]",""));
var _81e=_81d.length;
var _81f;
if(_81e==0){
_81c="&nbsp;";
}else{
for(var j=0;j<_81e;j++){
try{
if(cuesUsage=="webapp"){
_81f=callbackRenderClientTableCell(_81a,_81d[j].getAttribute("name"),_81d[j].getAttribute("value"),_814,_813,_816.getAttribute("key"));
}else{
_81f=window[icuesGetPortletId(_813,_818,true)+"_callbackRenderClientTableCell"](_81a,_81d[j].getAttribute("name"),_81d[j].getAttribute("value"),_814,_813,_816.getAttribute("key"));
}
}
catch(e){
_81f=_81d[j].getAttribute("name");
}
_81c.push(_81f);
}
}
_81b.innerHTML=_81c;
}
}
}
catch(e){
}
};
function cuesUpdateClientTablePositionInfo(_820,_821,_822){
try{
if(_822==null){
_822="position";
}
var _823=cuesGetAllTableRowIds(_820);
var _824=_823.length;
for(var i=0;i<_824;i++){
var _825=cuesXpath(_821,"/*/*[@key='"+_823[i]+"']");
if(_825!=null&&_825.length==1){
_825[0].setAttribute(_822,i);
}
}
}
catch(e){
}
};
function cuesSetClientTableJoinValue(_826,_827){
try{
icuesClientTableJoinValue[_826]=_827;
}
catch(e){
}
};
function icuesGetClientTableJoinValue(_828){
var _829=",";
try{
_829=icuesClientTableJoinValue[_828];
if(_829==null){
_829=",";
}
}
catch(e){
}
return _829;
};
function cuesApplyClientTableOrderToData(_82a,_82b){
try{
var _82c=_82b.documentElement;
var _82d=cuesGetAllTableRowIds(_82a);
var _82e=_82d.length;
for(var i=0;i<_82e;i++){
var _82f=cuesXpath(_82b,"/"+_82c.nodeName+"/*[@key='"+_82d[i]+"']");
if(_82f!=null&&_82f.length==1){
_82c.appendChild(_82f[0]);
}
}
}
catch(e){
}
};
function cuesReorderClientTableData(_830,attr,_831){
try{
var _832=_831.length;
for(var i=0;i<_832;i++){
var _833=cuesXpath(_830,"/*/*[@"+attr+"='"+_831[i]+"']");
if(_833!=null&&_833.length==1){
_833[0].parentNode.appendChild(_833[0]);
}
}
}
catch(e){
}
};
function icuesPage(_834,_835,_836){
try{
if(typeof callbackPagination=="function"){
callbackPagination(_834,_835,_836);
}
}
catch(e){
}
};
function cuesShowPageLoading(_837,_838,_839){
if(_837==0){
icuesShowPageLoading(_838,_839);
}else{
if(_837==null){
_837=2000;
}
cuesLoadingBoxTimer=setTimeout("icuesShowPageLoading("+_838+","+_839+")",_837);
}
};
function cuesClearPageLoading(){
try{
clearTimeout(cuesLoadingBoxTimer);
}
catch(e){
}
try{
if(cuesLoadingBox!=null){
cuesLoadingBox.style.display="none";
}
if(cuesLoadingLayer!=null){
cuesLoadingLayer.style.display="none";
}
}
catch(e){
}
};
var cuesLoadingBoxTimer=null;
var cuesLoadingBox=null;
var cuesLoadingLayer=null;
function icuesLocalizePageLoading(){
try{
var _83a=(cuesLoadingBox.contentWindow||cuesLoadingBox.contentDocument);
if(_83a.document){
_83a=_83a.document;
}
var msg=_83a.getElementById("cuesLoadingMessage");
var _83b="<html xmlns:cues=\"http://www.cisco.com\"><head><cues:supportfiles menu=\"false\" tree=\"false\" cssalone=\"true\"/></head><body>"+msg.innerHTML.toLowerCase()+"</body></html>";
var _83c=cuesTransform(_83b,null,null,null,true);
var head=_83a.getElementsByTagName("head");
if(head.length>0){
try{
var from=_83c.indexOf("<head>");
var to=_83c.indexOf("</head>");
if(from!=-1&&to!=-1){
var _83d=cuesGetXmlDoc(null,_83c.substring(from,to+7));
var _83e=cuesXpath(_83d,"//link");
for(var cnt=0;cnt<_83e.length;cnt++){
var _83f=_83a.createElement("link");
head[0].appendChild(_83f);
_83f.rel="stylesheet";
_83f.type="text/css";
_83f.href=_83e[cnt].getAttribute("href");
}
}
}
catch(e){
}
}
msg.innerHTML=_83c;
_83a.body.className="cuesLoadingBody";
}
catch(e){
}
};
function icuesShowPageLoading(_840,_841){
try{
if(_840){
if(cuesLoadingLayer==null){
cuesLoadingLayer=document.createElement("div");
cuesLoadingLayer.className="cuesPageLoadingLayer";
cuesLoadingLayer.innerHTML="&nbsp;";
document.body.appendChild(cuesLoadingLayer);
}else{
cuesLoadingLayer.style.display="";
}
cuesLoadingLayer.focus();
}
if(cuesLoadingBox==null||cuesLoadingBox.tagName.toLowerCase()!="iframe"){
cuesLoadingBox=document.createElement("iframe");
cuesLoadingBox.className="cuesLoadingBox";
cuesLoadingBox.allowTransparency=true;
if(_841){
cuesLoadingBox.style.height=80;
cuesLoadingBox.src=cuesKnownLocation+"/cues_utility/cues_loading.html";
}else{
cuesLoadingBox.src=cuesKnownLocation+"/cues_utility/cues_loading.jsp?version="+cuesVersion;
}
document.body.appendChild(cuesLoadingBox);
cuesLoadingBox.style.left=Math.max(10,((document.body.clientWidth-cuesLoadingBox.offsetWidth)/2)+document.body.scrollLeft)+"px";
cuesLoadingBox.style.top=Math.max(10,((document.body.clientHeight-cuesLoadingBox.offsetHeight)/2)+document.body.scrollTop)+"px";
}else{
document.body.appendChild(cuesLoadingBox);
cuesLoadingBox.style.display="";
cuesLoadingBox.style.left=Math.max(10,((document.body.clientWidth-cuesLoadingBox.offsetWidth)/2)+document.body.scrollLeft)+"px";
cuesLoadingBox.style.top=Math.max(10,((document.body.clientHeight-cuesLoadingBox.offsetHeight)/2)+document.body.scrollTop)+"px";
}
cuesLoadingBox.focus();
}
catch(e){
}
};
var loginLoop=0;
function cuesShowLoginMessage(_842){
try{
if(parseInt(cuesVersion)>=60){
document.getElementById("cuesLoginProgress").style.visibility="visible";
document.getElementById("cuesLoginProgress").style.display="";
return;
}
if(_842==null){
loginLoop=0;
}
var obj=document.getElementById("cuesLoginMessage");
var msg=cuesMsg["VerifyingLogin"]+" ";
for(var i=0;i<loginLoop;i++){
msg+=".";
}
obj.innerHTML=msg;
loginLoop++;
setTimeout("cuesShowLoginMessage(true)",1500);
}
catch(e){
}
};
var icuesLoginProgressTimer=null;
function cuesShowLoginProgressMessage(msg,freq,_843){
try{
if(parseInt(cuesVersion)>=60){
document.getElementById("cuesLoginProgress").style.visibility="visible";
return;
}
clearTimeout(icuesLoginProgressTimer);
document.getElementById("cuesLoginMessage").innerHTML=msg;
if(freq!=null){
icuesLoginProgressTimer=setTimeout("icuesShowLoginProgressMessage('"+msg+"',"+freq+","+0+","+_843+")",freq);
}
}
catch(e){
}
};
function icuesShowLoginProgressMessage(msg,freq,_844,_845){
try{
clearTimeout(icuesLoginProgressTimer);
if(_845!=null&&_844>=_845){
_844=1;
}
var _846=msg;
for(var i=0;i<_844;i++){
_846+=".";
}
document.getElementById("cuesLoginMessage").innerHTML=_846;
icuesLoginProgressTimer=setTimeout("icuesShowLoginProgressMessage('"+msg+"',"+freq+","+(_844+1)+","+_845+")",freq);
}
catch(e){
}
};
function cuesGetLoginData(){
var _847=new Array();
_847.push("<login>");
try{
var _848=document.getElementById("cuesLoginForm");
var _849=_848.elements.length;
var _84a;
for(var i=0;i<_849;i++){
_84a=_848.elements[i];
switch(_84a.tagName.toLowerCase()){
case "input":
switch(_84a.type.toLowerCase()){
case "text":
case "password":
case "hidden":
_847.push("<"+_84a.id+" value=\""+_84a.value+"\"/>");
break;
case "radio":
case "checkbox":
if(_84a.checked){
_847.push("<"+_84a.id+" value=\"on\"/>");
}
break;
}
break;
case "select":
_847.push("<"+_84a.id+" text=\""+_84a.options[_84a.selectedIndex].text+"\" value=\""+_84a.options[_84a.selectedIndex].value+"\"/>");
break;
}
}
}
catch(e){
}
_847.push("</login>");
return _847.join("");
};
function cuesGetPasswordChangeData(){
var _84b=new Array();
_84b.push("<passwordchange>");
try{
var _84c=document.getElementById("cuesPasswordChangeForm");
var _84d=_84c.elements.length;
var _84e;
for(var i=0;i<_84d;i++){
_84e=_84c.elements[i];
switch(_84e.tagName.toLowerCase()){
case "input":
switch(_84e.type.toLowerCase()){
case "text":
case "password":
case "hidden":
_84b.push("<"+_84e.id+" value=\""+_84e.value+"\"/>");
break;
case "radio":
case "checkbox":
if(_84e.checked){
_84b.push("<"+_84e.id+" value=\"on\"/>");
}
break;
}
break;
case "select":
_84b.push("<"+_84e.id+" text=\""+_84e.options[_84e.selectedIndex].text+"\" value=\""+_84e.options[_84e.selectedIndex].value+"\"/>");
break;
}
}
}
catch(e){
}
_84b.push("</passwordchange>");
return _84b.join("");
};
function icuesLoginLayout(){
try{
var _84f=document.body;
var box1=document.getElementById("cuesLoginProductSection");
var box2=document.getElementById("cuesLoginFieldsSection");
var box3=document.getElementById("cuesLoginInfoSection");
var box4=document.getElementById("cuesLoginStatus");
var _850=Math.max(20,Math.min(100,((_84f.offsetWidth-box1.offsetWidth-box2.offsetWidth-80)/2)));
var bRTL=cuesFindDirection(_84f).toLowerCase()=="rtl";
try{
if(isIE7||(isIE&&document.documentMode==7)){
icuesFindObjectByTagname(box1,"tr").style.height="auto";
}
}
catch(e){
}
var _851=_84f.offsetWidth-box1.offsetWidth-box2.offsetWidth-(2*_850);
if(_851>CUESMAXLOGINGAP){
_850+=(_851-CUESMAXLOGINGAP)/2;
}
if(bRTL){
box1.style.right=_850+"px";
box2.style.left=_850+"px";
box3.style.right=_850+"px";
}else{
box1.style.left=_850+"px";
box2.style.right=_850+"px";
box3.style.left=_850+"px";
}
box3.style.width=(_84f.offsetWidth-(2*_850))+"px";
var _852=Math.max(20,Math.min(235,_84f.offsetHeight-Math.max(box1.offsetHeight,box2.offsetHeight)-box3.offsetHeight-20-40));
box1.style.top=_852+"px";
box2.style.top=_852+"px";
if(box4!=null){
var box5=box4.getElementsByTagName("table");
if(box5.length>0){
document.body.appendChild(box4);
var w=Math.min(Math.max(498,box5[0].offsetWidth+30),_84f.offsetWidth-40);
if(isFF){
w-=parseInt(icuesGetStyleProperty(box4,"paddingLeft"));
w-=parseInt(icuesGetStyleProperty(box4,"paddingRight"));
}
box4.style.width=w+"px";
if(bRTL){
box4.style.right=((_84f.offsetWidth-w)/2)+"px";
}else{
box4.style.left=((_84f.offsetWidth-w)/2)+"px";
}
box4.style.top=Math.max(0,_852-box4.offsetHeight-18)+"px";
var _853=document.getElementById("cuesLoginStatus.layer");
if(_853!=null){
_853.style.width=w+"px";
}
}
}
if(isIE){
document.getElementById("cuesLoginProgress").style.visibility="visible";
document.getElementById("cuesLoginProgress").style.visibility="hidden";
if(bRTL){
box1.style.visibility="hidden";
box1.style.visibility="visible";
}
}
}
catch(e){
}
};
function cuesSetLoginErrorMessage(id,txt){
try{
var obj=document.getElementById(id+"_err");
obj.innerHTML=txt;
cuesDrawnShape.makeContainer(id+"_err","#ffffff","67%");
}
catch(e){
}
};
function cuesDisableLogin(){
cuesManageButtonState("cuesLoginSubmitButton",true);
};
function cuesEnableLogin(){
cuesManageButtonState("cuesLoginSubmitButton",false);
};
function cuesResizeBreadcrumbs(){
try{
var _854=document.getElementById("cuesBreadcrumbTable");
var _855=_854.rows[0];
var _856=_854.parentNode;
_856.style.width="100%";
var _857=0;
var _858=document.getElementById("cuesContentTitleHelpLink");
if(_858!=null&&(_858.parentNode==_856||_858.parentNode==_856.parentNode)){
_857=_858.offsetWidth+4;
}
var _859=2;
var _85a=_855.cells.length;
var _85b=":";
while(_854.offsetWidth>=_856.offsetWidth-_857&&_859<_85a-1){
_855.cells[1].style.display="inline";
_855.cells[_859].style.display="none";
_85b+=" "+_855.cells[_859].title+" >";
_859++;
}
_855.cells[1].title=_85b;
_856.style.width=_855.offsetWidth+4;
}
catch(e){
}
};
var cuesBreadcrumb=new icuesBreadcrumb();
function icuesBreadcrumb(){
this.clear=_85c;
this.setStatic=_85d;
this.getStatic=_85e;
this.add=_85f;
this.remove=_860;
this.removeLast=_861;
this.locate=_862;
this.getItemNames=_863;
this.getItemURLs=_864;
this.getItemCount=_865;
this.render=_866;
var _867="";
var _868=new Array();
var _869=new Array();
function _85c(){
_868=new Array();
_869=new Array();
};
function _85d(_86a){
_867=_86a;
};
function _85e(){
return _867;
};
function _85f(name,url){
if(url==null){
url="";
}
_868.push(name);
_869.push(url);
};
function _860(_86b){
if(isNaN(_86b)){
var at=_862(_86b);
if(at!=-1){
_860(at+1);
}
}else{
var _86c=_865();
for(var i=_86c-1;i>=_86b;i--){
_861();
}
}
};
function _861(){
if(_865()>0){
_868.pop();
_869.pop();
}
};
function _862(_86d){
var _86e=_865();
for(var i=0;i<_86e;i++){
if(_868[i]==_86d){
return i;
}
}
return -1;
};
function _863(){
return _868;
};
function _864(){
return _869;
};
function _865(){
return _868.length;
};
function _866(){
if(isIE){
_86f();
}
_870();
};
function _86f(){
var _871=document.getElementById("cuesBreadcrumbTable");
var _872=_871.rows[0];
var _873=_872.cells.length;
for(var i=1;i<_873;i++){
_872.cells[i].style.display="";
}
};
function _870(){
var _874=_865();
var _875=document.getElementById("cuesBreadcrumbTable");
var _876=_875.rows[0];
var _877=_876.cells.length;
var _878=document.getElementById("cuesBreadcrumbStatic");
if(parseInt(cuesVersion)>=60){
_878.innerHTML=_867+((_874>0)?" >":"");
}else{
_878.innerHTML=_867+((_874>0)?":":"");
}
for(var i=0;i<_877-2;i++){
_876.deleteCell(2);
}
var _879;
for(var i=0;i<_874-1;i++){
_879=_876.insertCell(i+2);
_879.setAttribute("nowrap","yes");
_879.setAttribute("title",_868[i]);
if(_869[i]==""){
_879.innerHTML="<span class=\"cuesBreadcrumbStatic\">"+_868[i]+"</span>&nbsp;>&nbsp;";
}else{
_879.innerHTML="<a class=\"cuesBreadcrumbLink\" href=\""+_869[i]+"\">"+_868[i]+"</a>&nbsp;>&nbsp;";
}
}
if(_874>0){
_879=_876.insertCell(_874+1);
_879.setAttribute("nowrap","yes");
_879.setAttribute("title",_868[i]);
_879.innerHTML="<span class=\"cuesBreadcrumbLast\">"+_868[i]+"</span>";
}
_876.cells[1].style.display="none";
cuesResizeBreadcrumbs();
};
};
var icuesTabularGrid=new Array();
var icuesTabularGridRowCount=new Array();
var icuesTabularGridColCount=new Array();
function icuesTabularGridOnclick(evt,obj){
try{
if(evt==null&&isIE){
evt=window.event;
}
if(obj==null){
var _87a=(isIE)?evt.srcElement:evt.target;
var tag=_87a.tagName.toLowerCase();
if(tag!="td"){
return;
}
obj=_87a.getElementsByTagName("a")[0];
obj.focus();
}
if(typeof callbackTabularGridStartAction=="function"){
callbackTabularGridStartAction(obj,obj.parentNode,icuesFindObjectByTagname(obj,"TABLE").getAttribute("baseid"));
}
}
catch(e){
}
cuesStopEventBubble(evt);
return false;
};
function icuesTabularGridGetDims(_87b){
try{
var _87c=icuesFindTableObj(_87b);
var _87d=Math.max(1,cuesGetAllTableRowIds(_87b).length);
var _87e=document.getElementById(_87b+"_"+_87d+"_1");
while(_87e==null&&_87d>0){
_87d--;
_87e=document.getElementById(_87b+"_"+_87d+"_1");
}
icuesTabularGridRowCount[_87b]=_87d;
var _87f=_87c.rows[_87d-1].cells.length;
var _87e=document.getElementById(_87b+"_"+_87d+"_"+_87f);
while(_87e==null&&_87f>0){
_87f--;
_87e=document.getElementById(_87b+"_"+_87d+"_"+_87f);
}
icuesTabularGridColCount[_87b]=_87f;
}
catch(e){
}
};
function icuesRenumTabularGrid(_880){
try{
var _881=icuesFindTableObj(_880);
var _882=_881.rows.length;
var _883=false;
var _884=0;
for(var i=0;i<_882;i++){
bNewRow=true;
var _885=_881.rows[i];
var _886=_885.cells.length;
for(var j=0;j<_886;j++){
var _887=_885.cells[j];
var _888=_887.firstChild;
if(_888!=null&&_888.tagName!=null&&_888.tagName.toLowerCase()=="a"&&_888.id.indexOf(_880+"_")==0){
if(bNewRow){
_884++;
bNewRow=false;
}
var _889=_888.getAttribute("id").split("_");
_888.id=_880+"_"+_884+"_"+_889[2];
}
}
}
icuesTabularGridGetDims(_880);
}
catch(e){
}
};
function icuesTabularGridOnkey(evt,obj,_88a){
if(evt==null&&isIE){
evt=window.event;
}
var _88b=(isIE)?evt.srcElement:evt.target;
var tag=_88b.tagName.toLowerCase();
var _88c=null;
if(evt.type=="keypress"||evt.type=="keydown"){
if(window.event){
_88c=evt.keyCode;
}else{
_88c=evt.which;
}
}
if(obj==null){
if(tag!="table"){
obj=icuesFindObjectByTagname(_88b,"TABLE");
_88a=obj.getAttribute("baseid");
}
}
if(icuesTabularGrid[_88a]==null){
return;
}
if(obj.tagName.toLowerCase()=="table"){
if(_88c==13&&tag!="a"){
try{
var cell=_88b.parentNode;
var _88d=cell.getElementsByTagName("a");
_88d[0].style.display="";
_88d[0].focus();
_88b.style.display="none";
cuesStopEventBubble(evt);
return true;
}
catch(e){
}
}
return true;
}
if(tag=="a"){
var _88e=icuesTabularGridColCount[_88a];
var _88f=icuesTabularGridRowCount[_88a];
if(_88e==null||_88f==null){
icuesTabularGridGetDims(_88a);
_88e=icuesTabularGridColCount[_88a];
_88f=icuesTabularGridRowCount[_88a];
}
var _890=obj.getAttribute("id").split("_");
var row=_890[_890.length-2];
var col=_890[_890.length-1];
var _891=false;
for(var loop=0;loop<3;loop++){
switch(_88c){
case 37:
_891=true;
if(col>1){
col--;
}else{
if(row>1){
row--;
col=_88e;
}else{
row=_88f;
col=_88e;
}
}
break;
case 39:
_891=true;
if(col<_88e){
col++;
}else{
if(row<_88f){
row++;
col=1;
}else{
row=1;
col=1;
}
}
break;
case 38:
_891=true;
if(row>1){
row--;
}else{
row=_88f;
}
break;
case 40:
_891=true;
if(row<_88f){
row++;
}else{
row=1;
}
break;
default:
loop=3;
return true;
break;
}
if(_891&&icuesTabularGridSetfocus(_88a,row,col)){
cuesStopEventBubble(evt);
return false;
break;
}
}
}
return true;
};
function icuesTabularGridSetfocus(_892,row,col){
var tgt=document.getElementById(_892+"_"+row+"_"+col);
if(tgt!=null){
tgt.focus();
}
return (tgt!=null);
};
function icuesTabularGridOnfocus(evt,obj){
cuesTabularGridHighlight(obj.parentNode,true);
};
function icuesTabularGridOnblur(evt,obj){
try{
if(evt==null&&isIE){
evt=window.event;
}
var _893=(isIE)?evt.srcElement:evt.target;
if(_893.tagName.toLowerCase()=="a"&&_893.style.display=="none"){
return;
}
cuesTabularGridHighlight(_893.parentNode,false);
}
catch(e){
}
};
function cuesTabularGridHighlight(_894,flag){
if(flag){
_894.style.backgroundColor="#33ccff";
}else{
_894.style.backgroundColor="";
if(isIE){
cuesRepaint(null,_894);
}
}
};
function cuesLoadTaskPanel(url){
try{
if(url==null||url==""){
return;
}
if(cuesTaskPanelWindow!=null){
try{
cuesTaskPanelWindow.focus();
cuesTaskPanelWindow.location=url;
return;
}
catch(e){
cuesTaskPanelWindow=null;
}
}
var cell=document.getElementById("cuesLayoutTaskPanelArea");
cell.width=CUESTASKPANELWIDTH;
cell.style.display="";
var _895=document.getElementById("cuesLayoutTaskPanelResizer");
_895.style.display="";
var _896=cell.getElementsByTagName("iframe");
if(_896.length==0){
var _897=cell;
if(parseInt(cuesVersion)>=61){
_897=document.getElementById("cuesLayoutTaskPanelContainer");
if(_897==null){
_897=cell;
}
}else{
_897.innerHTML="";
}
_896=document.createElement("iframe");
_896.id="cuesTaskPanel";
_896.className="cuesTaskPanelContent";
_896.width="100%";
_896.height="100%";
_896.frameBorder="0";
_896.allowTransparency=true;
_896.src=url;
_897.appendChild(_896);
if(document.addEventListener){
window.addEventListener("resize",cuesResizeTaskPanel,false);
}else{
if(document.attachEvent){
window.attachEvent("onresize",cuesResizeTaskPanel);
}
}
}else{
_896[0].src=url;
}
cuesResizeTaskPanel();
try{
if(typeof callbackTaskPanelResized=="function"){
callbackTaskPanelResized();
}
}
catch(e){
}
}
catch(e){
}
};
function cuesResizeTaskPanel(){
try{
if(document.getElementById("cuesLayoutTaskPanelArea").style.display=="none"){
return;
}
}
catch(e){
}
cuesExpandHeight("cuesLayoutTaskPanelContainer");
cuesExpandHeight("cuesTaskPanel");
};
function cuesCloseTaskPanel(){
try{
var cell=document.getElementById("cuesLayoutTaskPanelArea");
cell.width="1px";
cell.style.display="none";
var _898=document.getElementById("cuesLayoutTaskPanelResizer");
_898.style.display="none";
try{
if(typeof callbackTaskPanelResized=="function"){
callbackTaskPanelResized();
}
}
catch(e){
}
}
catch(e){
}
};
var cuesTaskPanelWindow=null;
function cuesTearoffTaskPanel(){
try{
var _899=document.getElementById("cuesLayoutTaskPanelArea").getElementsByTagName("iframe");
if(_899.length==1){
var x=(window.screenX!=null?window.screenX:window.screenLeft)+document.body.offsetWidth-parseInt(CUESTASKPANELWIDTHEXT);
var y=window.screenY!=null?window.screenY:window.screenTop;
cuesTaskPanelWindow=window.open(_899[0].src,"cuesTaskPanel","status=no,scrollbars=yes,resizable=yes,height:"+CUESTASKPANELHEIGHTEXT+",width="+CUESTASKPANELWIDTHEXT+",screenX="+x+"px,screenY="+y+"px");
cuesTaskPanelWindow.moveTo(x,y);
cuesTaskPanelWindow.focus();
cuesCloseTaskPanel();
}
}
catch(e){
}
};
function cuesSetTaskPanelState(){
try{
if(window.opener!=null){
if(parseInt(cuesVersion)>=60){
try{
document.getElementById("cuesTaskPanelTitle").style.display="none";
}
catch(e){
}
}else{
try{
document.getElementById("cuesTaskPanelTearoff").style.display="none";
}
catch(e){
}
try{
document.getElementById("cuesTaskPanelCloser").style.display="none";
}
catch(e){
}
}
}else{
if(parseInt(cuesVersion)>=60){
var _89a=document.getElementById("cuesTaskPanelTitle");
var _89b=Math.min(_89a.offsetWidth,_89a.parentNode.offsetWidth);
var _89c=document.getElementById("cuesTaskPanelCloser");
_89c.style.position="absolute";
_89c.style.right="4px";
var _89d=document.getElementById("cuesTaskPanelTearoff");
_89d.style.position="absolute";
_89d.style.right=(_89d.offsetWidth+4)+"px";
}
}
}
catch(e){
}
};
function cuesAutoSizeGroupboxes(_89e){
try{
var _89f=document.getElementById(_89e);
var _8a0=_89f.getElementsByTagName("fieldset");
var _8a1=_8a0.length;
var _8a2=0;
for(var i=0;i<_8a1;i++){
_8a2=Math.max(_8a2,_8a0[i].offsetHeight);
}
for(var i=0;i<_8a1;i++){
_8a0[i].style.height=_8a2+"px";
}
}
catch(e){
}
};
function icuesRenderTab(_8a3,_8a4,_8a5,_8a6,_8a7,_8a8){
if(_8a8==null){
_8a8=false;
}
if(_8a7==null){
_8a7=false;
}
var _8a9="NonActive";
if(_8a4){
if(_8a7){
if(_8a6){
_8a9="ActiveNavTree";
}else{
_8a9="ActiveNavDrawers";
}
}else{
_8a9="ActiveContent";
}
}else{
if(_8a7){
_8a9="NonActive";
}else{
_8a9="NonActiveContent";
}
}
var _8aa=_8a3.getElementsByTagName("table")[0];
var _8ab=_8aa.rows[0];
var _8ac=_8ab.cells[0].getElementsByTagName("img")[0];
if(_8ac.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
_8ac.src=cuesKnownLocation+cuesImageFolder+"/tabLeft"+_8a9+cuesImageSuffix+cuesImageRTLSuffix+".gif";
_8ac=_8ab.cells[2].getElementsByTagName("img")[0];
if(cuesVersion=="50"&&_8a4&&_8a8){
_8ac.src=cuesKnownLocation+cuesImageFolder+"/tabRight"+_8a9+"Last"+cuesImageSuffix+cuesImageRTLSuffix+".gif";
}else{
_8ac.src=cuesKnownLocation+cuesImageFolder+"/tabRight"+_8a9+cuesImageSuffix+cuesImageRTLSuffix+".gif";
}
_8ab.cells[1].className="cuesTabBg"+_8a9;
if(_8a4&&_8a5){
var _8ad=_8a3.getElementsByTagName("a");
if(_8ad.length>0){
_8ad[0].focus();
}
}
};
function icuesRenderNextNonactiveTab(_8ae,_8af){
try{
var _8b0=_8ae.getElementsByTagName("table")[0];
var _8b1=_8b0.rows[0].cells[0].getElementsByTagName("img")[0];
if(cuesVersion=="50"){
_8b1.style.display=_8af;
}else{
if(_8b1.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
if(_8af=="none"){
_8b1.src=cuesKnownLocation+cuesImageFolder+"/tabLeftNonActiveAdjacent"+cuesImageRTLSuffix+".gif";
}else{
_8b1.src=cuesKnownLocation+cuesImageFolder+"/tabLeftNonActive"+cuesImageRTLSuffix+".gif";
}
}
}
catch(e){
}
};
function icuesRenderPriorNonactiveTab(_8b2,_8b3){
try{
if(cuesVersion=="50"){
return;
}
var _8b4=_8b2.getElementsByTagName("table")[0];
var _8b5=_8b4.rows[0].cells[2].getElementsByTagName("img")[0];
if(_8b5.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
if(_8b3){
_8b5.src=cuesKnownLocation+cuesImageFolder+"/tabRightNonActiveAdjacent"+cuesImageRTLSuffix+".gif";
}else{
_8b5.src=cuesKnownLocation+cuesImageFolder+"/tabRightNonActive"+cuesImageRTLSuffix+".gif";
}
}
catch(e){
}
};
function cuesToggleTab(_8b6,_8b7,_8b8,_8b9){
try{
var _8ba;
if(parseInt(cuesVersion)>=60){
var _8bb=cuesDrawnShape.toggleTab(_8b6,_8b7);
if(_8bb!=-1){
_8ba=document.getElementById(_8b6+"_"+_8bb);
_8ba.style.display="none";
_8ba=document.getElementById(_8b6+"_"+_8b7);
_8ba.style.display="";
}
if(typeof cuesTabCallback=="function"){
cuesTabCallback(_8b6,_8b7);
}
return;
}
if(_8b8==null){
_8b8=false;
}
if(_8b9==null){
_8b9=false;
}
var _8bc=document.getElementById(_8b6);
var _8bd=_8bc.rows[0];
var _8be=_8bd.cells.length;
var _8bb=-1;
for(var i=0;i<_8be;i++){
if(_8bd.cells[i].attributes["active"].value=="true"){
_8bb=i;
break;
}
}
if(_8bb==_8b7){
return;
}
var _8bf=_8bd.cells[_8b7];
var _8c0=_8bd.cells[_8bb];
_8c0.attributes["active"].value="false";
_8bf.attributes["active"].value="true";
_8ba=document.getElementById(_8b6+"_"+_8bb);
_8ba.style.display="none";
_8ba=document.getElementById(_8b6+"_"+_8b7);
_8ba.style.display="";
if(_8bb+1<_8be){
icuesRenderNextNonactiveTab(_8bd.cells[_8bb+1],"inline");
}
if(_8bb>0){
icuesRenderPriorNonactiveTab(_8bd.cells[_8bb-1],false);
}
icuesRenderTab(_8bf,true,true,_8b9,_8b8,_8b7==_8be-1);
icuesRenderTab(_8c0,false,false,_8b9,_8b8);
if(_8b7+1<_8be){
icuesRenderNextNonactiveTab(_8bd.cells[_8b7+1],"none");
}
if(_8b7>0){
icuesRenderPriorNonactiveTab(_8bd.cells[_8b7-1],true);
}
icuesSetTabsStyle(_8bc.parentNode,false,_8b8,_8b9);
if(typeof cuesTabCallback=="function"){
cuesTabCallback(_8b6,_8b7);
}
}
catch(e){
}
};
function icuesPreTabCallback(_8c1,_8c2,evt){
try{
if(typeof cuesPreTabCallback=="function"){
return cuesPreTabCallback(_8c1,_8c2,evt);
}
}
catch(e){
}
return true;
};
function cuesInvokeTab(evt,_8c3,_8c4){
try{
if(evt==null&&isIE){
evt=window.event;
}
var _8c5="";
var _8c6="";
var tag="";
if(evt!=null){
var _8c7=(isIE)?evt.srcElement:evt.target;
tag=_8c7.tagName.toLowerCase();
_8c5=evt.type;
}
if(_8c5=="keypress"){
if(window.event){
_8c6=evt.keyCode;
}else{
_8c6=evt.which;
}
}
if((tag!="a"&&tag!="nobr"&&_8c5=="click")||(tag=="a"&&_8c5=="keypress"&&_8c6==32)||(_8c4)){
var _8c8=_8c3.getElementsByTagName("a")[0];
var href=_8c8.href;
if(href.indexOf("javascript:")==0){
eval(href);
}else{
if(_8c8.target==null||_8c8.target==""){
document.location.href=href;
}else{
document.getElementById(_8c8.target).src=href;
}
}
cuesStopEventBubble(evt);
}
}
catch(e){
}
return false;
};
function cuesSetTabError(id,_8c9,_8ca,_8cb){
var _8cc=document.getElementById("cuesid_"+id+"_"+_8c9);
var _8cd=_8cc.parentNode;
var img=_8cd.getElementsByTagName("img");
var _8ce=0;
if(_8ca){
if(img.length==0){
var html=_8cd.innerHTML;
_8cd.innerHTML="<img style=\"display:none\" height=\"11\" src=\""+cuesKnownLocation+cuesIconFolder+"/statuserror_12.gif\" title=\""+cuesAlt["TabErrorState"]+"\" alt=\""+cuesAlt["TabErrorState"]+"\"/>"+html;
img=_8cd.getElementsByTagName("img");
_8ce=11;
}else{
if(img[0].style.display=="none"){
_8ce=11;
}
}
}else{
if(img.length!=0){
if(img[0].style.display==""){
_8ce=-11;
}
}
}
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.adjustTab(id,_8c9,_8ce);
}
if(img.length!=0){
img[0].style.display=(_8ca?"":"none");
}
if(_8cb){
cuesTileTabs(id);
}
};
function cuesRenderTabset(_8cf){
try{
if(parseInt(cuesVersion)>=60){
cuesDrawnShape.renderTabset(_8cf);
}
}
catch(e){
}
};
function cuesTileTabs(_8d0,_8d1){
var tbl=document.getElementById(_8d0);
if(tbl==null){
return;
}
tbl.style.display="";
var _8d2=icuesFindObjectByTagname(tbl,"DIV");
if(_8d2==null){
return;
}
var _8d3=_8d2.offsetWidth*1;
var temp=_8d2.parentNode;
while(temp!=null){
try{
if(temp.offsetWidth!=undefined&&temp.offsetWidth>0){
_8d3=Math.min(_8d3,temp.offsetWidth);
}
temp=temp.parentNode;
}
catch(e){
break;
}
}
var _8d4=0;
if(isFF||isSafari||isChrome){
_8d4=1*document.defaultView.getComputedStyle(document.getElementById(_8d0+"_0").parentNode,"").paddingLeft.replace("px","")+1*document.defaultView.getComputedStyle(document.getElementById(_8d0+"_0").parentNode,"").paddingRight.replace("px","");
}else{
_8d4=1*document.getElementById(_8d0+"_0").parentNode.currentStyle.paddingLeft.replace("px","")+1*document.getElementById(_8d0+"_0").parentNode.currentStyle.paddingRight.replace("px","");
}
var _8d5=_8d3-_8d4;
_8d2.className="";
var _8d6=tbl.rows[0].cells.length;
var _8d7=null;
for(var i=1;i<=_8d6;i++){
_8d7=document.getElementById(_8d0+"_r"+i);
if(_8d7==null){
break;
}
_8d7.parentNode.removeChild(_8d7);
_8d7=null;
}
var row=1;
var _8d8=0;
var _8d9=null;
var _8da=0;
var _8db=0;
var _8dc=0;
var html;
var _8dd;
_8d7=document.createElement("table");
_8d7.id=_8d0+"_r"+row;
_8d7.border=0;
_8d7.cellPadding=0;
_8d7.cellSpacing=0;
_8d7.insertRow(0);
if(_8d2.firstChild!=null){
_8d2.insertBefore(_8d7,_8d2.firstChild);
}else{
_8d2.appendChild(_8d7);
}
var w=0;
if(_8d1!=null&&isIE){
var _8de=document.getElementById(_8d1+"_r1").offsetWidth;
_8d5=_8de-_8d4-2;
}
for(var i=0;i<_8d6;i++){
if(tbl.rows[0].cells[i].offsetWidth+w>_8d5){
if(isIE){
if(_8d1!=null){
_8d7.width=_8d5;
}else{
_8d7.width="100%";
}
}else{
_8d7.width=_8d3-_8d4;
}
icuesSpreadTabs(_8d7,_8d0);
row++;
_8d8=0;
w=0;
_8d7=document.createElement("table");
_8d7.id=_8d0+"_r"+row;
_8d7.border=0;
_8d7.cellPadding=0;
_8d7.cellSpacing=0;
_8d7.insertRow(0);
if(_8d2.firstChild!=null){
_8d2.insertBefore(_8d7,_8d2.firstChild);
}else{
_8d2.appendChild(_8d7);
}
}
_8dd=_8d7.rows[0].insertCell(_8d8);
if(parseInt(cuesVersion)>=60){
var fc=tbl.rows[0].cells[i].firstChild;
if(fc!=null){
_8dd.appendChild(fc.cloneNode(true));
}
}else{
html=tbl.rows[0].cells[i].innerHTML;
html=html.replace("cuesToggleTab('"+_8d0+"'","cuesToggleStackedTab('"+_8d0+"',"+row+","+_8d8);
_8dd.innerHTML=html;
}
if(tbl.rows[0].cells[i].getAttribute("active")!=null){
_8dd.setAttribute("active",tbl.rows[0].cells[i].attributes["active"].value);
}
_8dd.setAttribute("index",i);
_8dd.vAlign="bottom";
if(_8d2.attributes["activeData"]!=undefined&&_8d2.attributes["activeData"].value==i){
_8d2.setAttribute("activeRow",row);
_8d2.setAttribute("activeIndex",_8d8);
_8d9=_8d7;
}
w=_8d7.offsetWidth;
if(tbl.rows[0].cells[i].getAttribute("active")!=null&&tbl.rows[0].cells[i].attributes["active"].value=="true"){
_8da=i;
_8db=row;
_8dc=_8d8;
if(_8d2.attributes["activeData"]==undefined){
_8d2.setAttribute("activeData",i);
_8d2.setAttribute("activeRow",row);
_8d2.setAttribute("activeIndex",_8d8);
_8d9=_8d7;
}
}
_8d8++;
}
if(isIE){
if(_8d1!=null){
_8d7.width=_8d5;
}else{
_8d7.width="100%";
}
}else{
_8d7.width=_8d3-_8d4;
}
icuesSpreadTabs(_8d7,_8d0);
tbl.style.display="none";
var _8df=null;
try{
_8df=document.getElementById(_8d0+"_"+_8d2.attributes["activeData"].value);
}
catch(e){
}
if(_8df!=null){
_8df.style.display="";
}
if(_8d2.getAttribute("activeData")!=null&&_8da!=_8d2.attributes["activeData"].value){
icuesRenderStackedTab(_8d0,_8db,_8dc,false);
icuesRenderStackedTab(_8d0,_8d2.attributes["activeRow"].value,_8d2.attributes["activeIndex"].value,true,false);
}
if(_8d9!=null){
_8d2.removeChild(_8d9);
var _8e0=document.getElementById(_8d0+"_ContentsHeader");
if(_8e0==null){
_8d2.appendChild(_8d9);
}else{
_8d2.insertBefore(_8d9,_8e0);
}
}
if((isFF||isSafari||isChrome)&&_8df!=null){
var _8e1;
for(var i=0;i<_8d6;i++){
_8e1=document.getElementById(_8d0+"_"+i);
if(_8e1!=null){
_8e1.style.width=_8d5-10;
}
}
}
icuesSetTabsStyle(_8d2,true,false,false);
};
function icuesSpreadTabs(tbl,id){
tbl.style.tableLayout="auto";
var _8e2=tbl.rows[0].cells.length;
if(_8e2==0){
return;
}
var _8e3=0;
var _8e4=new Array();
var w;
var _8e5=0;
for(var i=0;i<_8e2;i++){
w=tbl.rows[0].cells[i].offsetWidth*1;
if(parseInt(cuesVersion)>=60){
try{
if(tbl.rows[0].cells[i].firstChild.id!=null){
_8e5++;
}
}
catch(e){
}
}else{
_8e5++;
}
_8e3+=w;
_8e4.push(w);
}
var _8e6=Math.floor((tbl.offsetWidth-_8e3)/_8e5);
if(_8e6<0){
return;
}
for(var i=0;i<_8e2;i++){
if(parseInt(cuesVersion)>=60){
var fc=tbl.rows[0].cells[i].firstChild;
if(fc!=null&&fc.offsetWidth!=null&&fc.id!=null){
var _8e7=fc.id.split("_");
if(_8e7.length>2){
cuesDrawnShape.adjustTab(id,_8e7[_8e7.length-2],null,_8e4[i]);
}else{
_8e4[i]=4;
}
}else{
_8e4[i]=4;
}
}
tbl.rows[0].cells[i].style.width=_8e4[i]+_8e6;
}
tbl.style.tableLayout="fixed";
cuesRepaint(null,tbl);
};
function cuesToggleStackedTab(_8e8,_8e9,_8ea,_8eb){
try{
var tbl=document.getElementById(_8e8);
var _8ec=document.getElementById(_8e8+"_r"+_8e9);
var _8ed=icuesFindObjectByTagname(tbl,"DIV");
var _8ee=_8ed.attributes["activeRow"].value;
var _8ef=_8ed.attributes["activeIndex"].value;
if(_8ee!=_8e9||_8ef!=_8ea){
_8ed.removeChild(_8ec);
_8ed.appendChild(_8ec);
icuesRenderStackedTab(_8e8,_8ee,_8ef,false);
icuesRenderStackedTab(_8e8,_8e9,_8ea,true,true);
_8ed.setAttribute("activeRow",_8e9);
_8ed.setAttribute("activeIndex",_8ea);
_8ed.setAttribute("activeData",_8eb);
icuesSetTabsStyle(_8ed,true,false,false);
}
if(typeof cuesTabCallback=="function"){
cuesTabCallback(_8e8,_8eb);
}
}
catch(e){
}
};
function icuesSetTabsStyle(_8f0,_8f1,_8f2,_8f3){
try{
var _8f4=new Array();
var tbls=_8f0.getElementsByTagName("table");
if(_8f1==false&&tbls.length>0){
_8f4.push(tbls[0]);
}else{
for(var i=1;i<tbls.length;i++){
if(tbls[i].parentNode==_8f0){
_8f4.push(tbls[i]);
}
}
}
var row;
var _8f5;
var _8f6;
var _8f7;
var _8f8;
var cnt=_8f4.length;
for(var i=0;i<cnt-1;i++){
_8f8=_8f4[i].rows[0].cells.length;
_8f5=_8f4[i].rows[0].cells[0];
_8f7=_8f5.getElementsByTagName("img")[0];
if(i==0){
if(_8f7.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
}
_8f7.src=cuesKnownLocation+cuesImageFolder+"/tabLeftNonActiveLeftmost"+cuesImageSuffix+cuesImageRTLSuffix+".gif";
_8f5=_8f4[i].rows[0].cells[_8f8-1];
_8f6=_8f5.getElementsByTagName("img");
_8f7=_8f6[_8f6.length-1];
_8f7.src=cuesKnownLocation+cuesImageFolder+"/tabRightNonActiveRightmost"+cuesImageSuffix+cuesImageRTLSuffix+".gif";
for(var j=0;j<_8f8;j++){
_8f5=_8f4[i].rows[0].cells[j];
_8f5.firstChild.className="cuesNonactiveTabNonBottom";
}
}
_8f8=_8f4[cnt-1].rows[0].cells.length;
for(var j=0;j<_8f8;j++){
_8f5=_8f4[cnt-1].rows[0].cells[j];
_8f5.firstChild.style.marginTop="0px";
_8f5.firstChild.style.marginLeft="0px";
if(_8f5.getAttribute("active")=="true"){
_8f5.firstChild.className="cuesActiveTab"+(_8f2?"Nav":"");
if(cnt>1){
_8f5.firstChild.style.marginTop="-2px";
}
if(j==0&&_8f2){
_8f5.firstChild.style.marginLeft="-1px";
}
}else{
_8f5.firstChild.className="cuesNonactiveTab"+(_8f2?"Nav":"");
if(j==0){
_8f7=_8f5.getElementsByTagName("img")[0];
if(_8f7.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
_8f7.src=cuesKnownLocation+cuesImageFolder+"/tabLeftNonActiveLeftmost"+cuesImageSuffix+cuesImageRTLSuffix+".gif";
}else{
if(cnt>1&&j==_8f8-1){
_8f6=_8f5.getElementsByTagName("img");
_8f7=_8f6[_8f6.length-1];
if(_8f7.src.toLowerCase().indexOf("rtl.gif")==-1){
cuesImageRTLSuffix="";
}else{
cuesImageRTLSuffix="RTL";
}
_8f7.src=cuesKnownLocation+cuesImageFolder+"/tabRightNonActiveRightmost"+cuesImageSuffix+cuesImageRTLSuffix+".gif";
}
}
}
}
}
catch(e){
}
};
function icuesRenderStackedTab(_8f9,_8fa,_8fb,_8fc,_8fd){
var _8fe,_8ff,_900,_901;
try{
_8fe=document.getElementById(_8f9+"_r"+_8fa);
_8ff=_8fe.rows[0];
_901=_8ff.cells.length;
_900=_8ff.cells[_8fb];
}
catch(e){
return;
}
try{
_900.attributes["active"].value=_8fc?"true":"false";
}
catch(e){
_900.setAttribute("active",_8fc?"true":"false");
}
try{
_8fb=_8fb*1;
var _902=_900.attributes["index"].value;
document.getElementById(_8f9+"_"+_902).style.display=_8fc?"":"none";
if(_8fc){
icuesRenderTab(_900,true,_8fd,false,false);
if(_8fb+1<_901){
try{
icuesRenderNextNonactiveTab(_8ff.cells[_8fb+1],"none");
}
catch(e){
}
}
if(_8fb>0){
try{
icuesRenderPriorNonactiveTab(_8ff.cells[_8fb-1],true);
}
catch(e){
}
}
}else{
if(_8fb+1<_901){
try{
icuesRenderNextNonactiveTab(_8ff.cells[_8fb+1],"inline");
}
catch(e){
}
}
if(_8fb>0){
try{
icuesRenderPriorNonactiveTab(_8ff.cells[_8fb-1],false);
}
catch(e){
}
}
icuesRenderTab(_900,false,false,false,false);
}
}
catch(e){
}
};
function cuesSetTabFocus(_903,_904,_905){
try{
if(_905==null){
_905=false;
}
var tbl=document.getElementById(_903);
var _906=tbl.rows[0].cells.length;
if(_905){
var _907,_908,_909,_90a;
for(var i=1;i<=_906;i++){
_90a=document.getElementById(_903+"_r"+i);
if(_90a==null){
break;
}
_908=_90a.rows[0];
_909=_908.cells.length;
for(var j=0;j<_909;j++){
_907=_908.cells[j];
if(_907.getAttribute("index")==_904){
var _90b=_907.getElementsByTagName("a");
if(_90b.length>0){
_90b[0].focus();
}
return;
}
}
}
}else{
_907=tbl.rows[0].cells[_904];
var _90b=_907.getElementsByTagName("a");
if(_90b.length>0){
_90b[0].focus();
}
}
}
catch(e){
}
};
function cuesTabOnFocusHandler(evt,_90c,_90d){
try{
if(typeof cuesTabFocusCallback=="function"){
cuesTabFocusCallback(_90c,_90d);
}
}
catch(e){
}
cuesStopEventBubble(evt);
};
var icuesActiveMsgBox=null;
function icuesDynamicMessageBoxHook(evt){
try{
var _90e=(isIE)?evt.srcElement:evt.target;
if(_90e!=null&&_90e.id!="icuesDynMsgBox"&&_90e.id!="icuesDynMsgBoxBlock"&&_90e.tagName.toLowerCase()!="html"){
var _90f=icuesFindObjectByTagnameId(_90e,"div","icuesDynMsgBox");
if(_90f==null){
cuesStopEventBubble(evt);
if(icuesActiveMsgBox!=null){
icuesActiveMsgBox.focus();
}
}
return true;
}
return true;
}
catch(e){
}
return false;
};
function cuesDynamicMessageBox(_910,_911,_912,_913){
this.show=_914;
this.hide=_915;
this.close=_916;
this.assign=_917;
var _918=_910;
var _919=null;
var _91a=null;
var _91b=null;
var _91c=null;
_91a=document.createElement("iframe");
_91a.className="cuesDynamicMessageBox";
_91a.id="icuesDynMsgBoxBlock";
_91a.src="about:blank";
document.body.appendChild(_91a);
_91b=document.createElement("div");
_91b.className="cuesDynamicMessageLayer";
document.body.appendChild(_91b);
_919=document.createElement("div");
_919.id="icuesDynMsgBox";
_919.setAttribute("role","region");
_919.setAttribute("aria-live","polite");
_919.setAttribute("aria-atomic","true");
_919.setAttribute("aria-relevant","additions");
_919.className="cuesDynamicMessageBox";
if(isFF){
_919.style.overflow="auto";
}
if(_912!=null){
_919.style.height=_912;
}
if(_913!=null){
_919.style.width=_913;
}
document.body.appendChild(_919);
_917(_910,_911);
_914();
function _914(){
try{
_919.style.display="";
}
catch(e){
}
try{
_91a.style.display="";
}
catch(e){
}
try{
_91b.style.display="";
}
catch(e){
}
_91d();
_91e();
if(_91c!=null){
if(isIE){
icuesActiveMsgBox=_91c;
}
_91c.focus();
}
};
function _915(){
try{
_919.style.display="none";
}
catch(e){
}
try{
_91a.style.display="none";
}
catch(e){
}
try{
_91b.style.display="none";
}
catch(e){
}
_91f();
};
function _917(_920,_921){
try{
_919.innerHTML=_920;
_91e();
_91c=null;
if(_921!=null){
var _922=document.getElementById(_921);
if(_922!=null){
_91c=_922;
}
}
}
catch(e){
}
};
function _91e(){
try{
if(_919.style.display==""&&_91a.style.display==""){
var t=Math.floor(Math.max(10,(document.body.offsetHeight-_919.offsetHeight)/3));
_919.style.top=t+"px";
_91a.style.top=t+"px";
var l=Math.floor(Math.max(10,(document.body.offsetWidth-_919.offsetWidth)/2));
_919.style.left=l+"px";
_91a.style.left=l+"px";
var h=Math.max(_919.offsetHeight,_919.scrollHeight);
if(isFF){
h-=parseInt(icuesGetStyleProperty(_919,"paddingTop"));
h-=parseInt(icuesGetStyleProperty(_919,"paddingBottom"));
}
_919.style.height=h+"px";
_91a.style.height=h+"px";
}
}
catch(e){
}
};
function _916(){
_915();
try{
_919.innerHTML="";
}
catch(e){
}
try{
_919.parentNode.removeChild(_919);
}
catch(e){
}
try{
_91a.parentNode.removeChild(_91a);
}
catch(e){
}
try{
_91b.parentNode.removeChild(_91b);
}
catch(e){
}
};
function _91d(){
try{
if(document.addEventListener){
document.addEventListener("keydown",icuesDynamicMessageBoxHook,false);
}else{
if(document.attachEvent){
document.attachEvent("onkeydown",icuesDynamicMessageBoxHook);
document.attachEvent("onactivate",icuesDynamicMessageBoxHook);
}
}
icuesActiveMsgBox=_91a;
}
catch(e){
}
};
function _91f(){
icuesActiveMsgBox=null;
try{
if(document.removeEventListener){
document.removeEventListener("keydown",icuesDynamicMessageBoxHook,false);
}else{
if(document.detachEvent){
document.detachEvent("onkeydown",icuesDynamicMessageBoxHook);
document.detachEvent("onactivate",icuesDynamicMessageBoxHook);
}
}
}
catch(e){
}
};
};
function icuesGetPortletId(id,obj,_923){
var ret=null;
try{
if(obj==null){
obj=document.getElementById(id);
}
var _924=icuesFindObjectByTagnameClass(obj,"div","portlet");
if(_923){
ret=_924.id.replace(/-/g,"_");
}else{
ret=_924.id;
}
}
catch(e){
}
return ret;
};
function icuesConvertCallbacks(_925){
try{
if(_925==null){
return;
}
var _926=0;
var _927=document.getElementById(_925);
var _928=_927.getElementsByTagName("script");
var _929=_928.length;
for(var i=0;i<_929;i++){
if(_928[i].src!=""&&_928[i].src!=null){
_926++;
}else{
icuesUpdateCallbacks(_927,_925,_928[i].innerHTML);
}
}
if(_926>0){
icuesUpdateCallbacks(_927,_925);
}
}
catch(e){
}
};
function icuesUpdateCallbacks(_92a,id,code){
try{
id=id.replace(/-/g,"_");
code=icuesMakeCallbacksUnique(id,code);
if(code.indexOf("function "+id+"_")!=-1){
var _92b=document.createElement("script");
_92a.appendChild(_92b);
_92b.text=code;
_92a.removeChild(_92b);
}
}
catch(e){
}
};
function icuesMakeCallbacksUnique(id,code){
try{
var _92c=["callbackTableRowSelected","appPagingTableCallback","callbackSortTableColumn","callbackRenderClientTableCell","callbackContentAreaResized"];
var _92d=_92c.length;
if(code==null){
var _92e=new Array();
for(var i=0;i<_92d;i++){
_92e.push(window[_92c[i]]+" ");
}
code=_92e.join("");
}
for(var i=0;i<_92d;i++){
code=code.replace("function "+_92c[i],"function "+id+"_"+_92c[i]);
}
}
catch(e){
}
return code;
};
var cuesResizeColumnDebug=false;
var icuesResizeColumn=null;
var icuesResizeColumnX=null;
var icuesResizeColumnEventX=null;
var icuesResizeColumnLayer=null;
var icuesResizeColumnBox=null;
var icuesResizeColumnTable=null;
var icuesResizeColumnDir="LTR";
function cuesMakeTableColumnsResizable(id){
try{
if(icuesResizeColumnLayer==null){
icuesResizeColumnLayer=document.createElement("div");
icuesResizeColumnLayer.id="icuesResizeColumnLayer";
icuesResizeColumnLayer.className="cuesResizeColumnLayer";
icuesResizeColumnLayer.innerHTML="<div id=\"cuesResizeColumnBox\">&#160;</div>&#160;";
document.body.appendChild(icuesResizeColumnLayer);
}
var tbl1=document.getElementById(id+".th");
if(tbl1!=null){
tbl1.className=tbl1.className+" cuesResizableTable";
}
var tbl2=document.getElementById(id+".td");
if(tbl2!=null){
tbl2.className=tbl2.className+" cuesResizableTable";
}
var tbl3=document.getElementById(id+".ts");
if(tbl3!=null){
tbl3.className=tbl3.className+" cuesResizableTable";
}
icuesResizeColumnHook(tbl1!=null?tbl1:tbl2,true);
}
catch(e){
}
};
function icuesResizeColumnHook(tbl,_92f){
try{
var _930=tbl.rows[0];
var _931=_930.cells.length;
var _932=0;
icuesResizeColumnDir=cuesFindDirection(tbl).toLowerCase();
if(icuesResizeColumnDir==""){
icuesResizeColumnDir="ltr";
}
if(_932<_931&&(_930.cells[_932].getAttribute("selectable")=="true"||_930.cells[_932].className=="cuesTableReorderColumn"||_930.cells[_932].className=="cuesTableSelectionColumn")){
_932++;
}
if(_932<_931&&(_930.cells[_932].getAttribute("selectable")=="true"||_930.cells[_932].className=="cuesTableReorderColumn"||_930.cells[_932].className=="cuesTableSelectionColumn")){
_932++;
}
for(var i=_932;i<_931-1;i++){
if(_92f){
if(document.addEventListener){
_930.cells[i].addEventListener("mouseover",icuesResizeColumnMouseover,false);
_930.cells[i].addEventListener("mousemove",icuesResizeColumnMousemove,false);
_930.cells[i].addEventListener("mousedown",icuesResizeColumnMousedown,false);
}else{
if(document.attachEvent){
_930.cells[i].attachEvent("onmouseover",icuesResizeColumnMouseover);
_930.cells[i].attachEvent("onmousemove",icuesResizeColumnMousemove);
_930.cells[i].attachEvent("onmousedown",icuesResizeColumnMousedown);
}
}
}else{
if(document.removeEventListener){
_930.cells[i].removeEventListener("mouseover",icuesResizeColumnMouseover,false);
_930.cells[i].removeEventListener("mousemove",icuesResizeColumnMousemove,false);
_930.cells[i].removeEventListener("mousedown",icuesResizeColumnMousedown,false);
}else{
if(document.detachEvent){
_930.cells[i].detachEvent("onmouseover",icuesResizeColumnMouseover);
_930.cells[i].detachEvent("onmousemove",icuesResizeColumnMousemove);
_930.cells[i].detachEvent("onmousedown",icuesResizeColumnMousedown);
}
}
}
}
}
catch(e){
}
};
function icuesResizeColumnMouseover(evt){
try{
if(icuesResizeColumn!=null){
cuesStopEventBubble(evt);
cuesSchedulerNoop();
return true;
}
if(evt==null){
evt=window.event;
}
var _933=(isIE)?evt.srcElement:evt.target;
if(_933.tagName.toLowerCase()!="td"&&_933.tagName.toLowerCase()!="th"){
return false;
}
if(isIE&&icuesResizeColumnEventX!=null){
if(icuesResizeColumnEventX==evt.clientX){
return false;
}
}
var ox=(isIE)?evt.offsetX:(evt.pageX-icuesPhysicalLocation(_933,"left"));
icuesResizeColumnEventX=evt.clientX;
if((ox>_933.offsetWidth-5&&icuesResizeColumnDir=="ltr")||(ox<5&&icuesResizeColumnDir=="rtl")){
_933.style.cursor="col-resize";
}else{
_933.style.cursor="default";
}
}
catch(e){
}
return false;
};
function icuesResizeColumnMousemove(evt){
try{
return icuesResizeColumnMouseover(evt);
}
catch(e){
}
return false;
};
function icuesResizeColumnMousedown(evt){
try{
if(evt==null){
evt=window.event;
}
var _934=(isIE)?evt.srcElement:evt.target;
if(_934.style.cursor=="col-resize"){
icuesResizeColumnLayer.style.display="block";
icuesResizeColumnLayer.style.width=document.body.scrollWidth;
icuesResizeColumnLayer.style.height=document.body.scrollHeight;
document.body.appendChild(icuesResizeColumnLayer);
icuesResizeColumnLayer.style.cursor="col-resize";
icuesResizeColumn=_934;
icuesResizeColumnX=evt.clientX;
icuesResizeColumnTable=icuesFindObjectByTagname(_934,"table");
icuesResizeColumnTable.style.cursor="col-resize";
if(isFF){
icuesResizeColumnTable.style.MozUserSelect="none";
}
icuesResizeColumnBox=document.getElementById("cuesResizeColumnBox");
icuesResizeColumnBox.style.top=icuesPhysicalLocation(_934,"top")+"px";
if(icuesResizeColumnDir=="rtl"){
icuesResizeColumnBox.style.left=icuesPhysicalLocation(_934,"left")+"px";
}else{
icuesResizeColumnBox.style.left=icuesPhysicalLocation(_934,"left")+"px";
}
icuesResizeColumnBox.style.width=_934.offsetWidth+"px";
icuesResizeColumnBox.style.height=icuesResizeColumnGetBoxHeight(icuesResizeColumnTable,_934)+"px";
icuesResizeColumnBox.style.cursor="col-resize";
icuesResizeColumnHandlers(true);
icuesResizeColumnHook(icuesResizeColumnTable,false);
}
cuesStopEventBubble(evt);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeColumnLayerMousemove(evt){
try{
if(evt==null){
evt=window.event;
}
var _935=evt.clientX-icuesResizeColumnX;
var w=Math.max(20,icuesResizeColumn.offsetWidth+evt.clientX-icuesResizeColumnX);
icuesResizeColumnBox.style.width=w;
cuesStopEventBubble(evt);
cuesSchedulerNoop();
var w=icuesResizeColumnBox.offsetWidth;
document.selection.empty();
}
catch(e){
}
return false;
};
function icuesResizeColumnMouseup(evt){
try{
icuesResizeColumnHook(icuesResizeColumnTable,true);
icuesResizeColumnLayer.style.display="none";
if(icuesResizeColumn!=null){
if(evt==null){
evt=window.event;
}
var _936=evt.clientX-icuesResizeColumnX;
var _937=icuesResizeColumn.parentNode;
var _938=_937.cells.length;
for(var i=0;i<_938;i++){
if(_937.cells[i]==icuesResizeColumn){
var w=Math.max(20,icuesResizeColumn.offsetWidth+_936);
var _939=icuesResizeColumnTable.getAttribute("baseid");
var _93a=document.getElementById(_939+".td");
if(_93a==icuesResizeColumnTable){
if(isIE){
icuesResizeColumn.style.width=w;
icuesResizeColumnTable.style.tableLayout="fixed";
}else{
icuesResizeColumnTable.style.tableLayout="auto";
var _93b=icuesResizeColumnTable.offsetWidth;
var _93c=document.getElementById(_939);
if(_93c!=null){
if(_93c.offsetWidth>_93b){
_93b=_93c.offsetWidth;
}
}
icuesResizeColumnTable.style.width=_93b;
icuesResizeColumnTable.style.tableLayout="fixed";
icuesResizeColumn.style.width=w;
}
}else{
var _93d=icuesResizeColumnTable.getElementsByTagName("col");
if(_93d.length>0){
_93d[i].width=w;
}
var _93e=_93a.getElementsByTagName("col");
if(_93e.length>0){
_93e[i].width=w;
}
if(_93d.length>0){
_93d[i].setAttribute("userassigned",w);
}
if(_93e.length>0){
_93e[i].setAttribute("userassigned",w);
}
var _93f=document.getElementById(_939+".ts");
if(_93f!=null){
var _940=_93f.getElementsByTagName("col");
if(_940.length>0){
_940[i].width=w;
_940[i].setAttribute("userassigned",w);
}
}
}
if(typeof callbackTableColumnResized=="function"){
callbackTableColumnResized(_939,i);
}
break;
}
}
icuesResizeColumn=null;
icuesResizeColumnTable.style.cursor="default";
if(isFF){
icuesResizeColumnTable.style.MozUserSelect="";
}
icuesResizeColumnTable=null;
icuesResizeColumnHandlers(false);
}
}
catch(e){
}
};
function icuesResizeColumnMouseout(evt){
try{
if(evt==null){
evt=window.event;
}
if(icuesResizeColumn==null||evt.clientY<0||evt.clientX<0||evt.clientY>document.body.offsetHeight||evt.clientX>document.body.offsetWidth){
var _941=(isIE)?evt.srcElement:evt.target;
icuesResizeColumnLayer.style.display="none";
icuesResizeColumn=null;
icuesResizeColumnTable.style.cursor="default";
if(isFF){
icuesResizeColumnTable.style.MozUserSelect="";
}
icuesResizeColumnTable=null;
icuesResizeColumnHook(icuesResizeColumnTable,true);
icuesResizeColumnHandlers(false);
}
cuesStopEventBubble(evt);
return cuesSchedulerNoop();
}
catch(e){
}
return false;
};
function icuesResizeColumnGetBoxHeight(tbl,cell){
var h=cell.offsetHeight;
try{
var _942=tbl.getAttribute("baseid");
if(!icuesTableHasEmptyRow(_942)){
h=tbl.offsetHeight;
var _943=document.getElementById(_942+".td");
if(_943!=tbl){
h+=_943.offsetHeight;
}
}
}
catch(e){
}
return h;
};
function icuesResizeColumnHandlers(_944){
try{
if(_944){
if(document.addEventListener){
document.addEventListener("mousemove",icuesResizeColumnLayerMousemove,false);
document.addEventListener("mouseup",icuesResizeColumnMouseup,false);
document.addEventListener("mouseout",icuesResizeColumnMouseout,false);
}else{
if(document.attachEvent){
document.attachEvent("onmousemove",icuesResizeColumnLayerMousemove);
document.attachEvent("onmouseup",icuesResizeColumnMouseup);
document.attachEvent("onmouseout",icuesResizeColumnMouseout);
}
}
}else{
if(document.removeEventListener){
document.removeEventListener("mousemove",icuesResizeColumnLayerMousemove,false);
document.removeEventListener("mouseup",icuesResizeColumnMouseup,false);
document.removeEventListener("mouseout",icuesResizeColumnMouseout,false);
}else{
if(document.detachEvent){
document.detachEvent("onmousemove",icuesResizeColumnLayerMousemove);
document.detachEvent("onmouseup",icuesResizeColumnMouseup);
document.detachEvent("onmouseout",icuesResizeColumnMouseout);
}
}
}
}
catch(e){
}
};
var cuesFilteredListboxTimer=null;
var cuesFilteredListbox;
var cuesFilteredListboxChoices;
function cuesSetFilteredListboxState(id,_945){
try{
document.getElementById(id).disabled=(_945=="disabled");
}
catch(e){
}
};
function cuesOnblurFilteredListboxHandler(obj,evt){
obj.setAttribute("find","");
};
function cuesOnfocusFilteredListboxHandler(obj,evt){
obj.setAttribute("find","");
cuesFilteredListbox=obj;
cuesFilteredListboxChoices=document.getElementById(obj.id+"_choices");
};
function cuesOnkeydownFilteredListboxHandler(obj,evt){
var rc=true;
if(evt==null){
evt=window.event;
}
var _946,_947;
if(window.event){
_946=evt.keyCode;
}else{
_946=evt.which;
}
if(_946!=0){
var find=obj.getAttribute("find");
if(_946==8){
find=find.substr(0,find.length-1);
obj.setAttribute("find",find);
cuesFilteredListboxShowHint(find);
cuesStopEventBubble(evt);
rc=false;
}
}
return rc;
};
function cuesOnkeypressFilteredListboxHandler(obj,evt){
var rc=false;
if(evt==null){
evt=window.event;
}
var _948,_949;
if(window.event){
_948=evt.keyCode;
}else{
_948=evt.which;
}
if(_948!=0&&_948!=13){
if(_948!=8){
_949=String.fromCharCode(_948);
var find=obj.getAttribute("find");
find+=_949;
obj.setAttribute("find",find);
cuesFilteredListboxShowHint(find);
rc=false;
}
}else{
rc=true;
}
if(!rc){
cuesStopEventBubble(evt);
}
return rc;
};
function cuesFilteredListboxShowHint(_94a){
cuesFilteredListbox.options.length=1;
cuesFilteredListbox.options[0].text=_94a;
cuesFilteredListboxTimer=setTimeout(cuesFilteredListboxTimerHandler,500);
};
function cuesFilteredListboxInit(id){
cuesFilteredListbox=document.getElementById(id);
cuesFilteredListboxChoices=document.getElementById(id+"_choices");
cuesFilteredListboxTimerHandler(true);
};
function cuesFilteredListboxTimerHandler(_94b){
if(cuesFilteredListboxTimer!=null){
clearTimeout(cuesFilteredListboxTimer);
cuesFilteredListboxTimer=null;
}
if(_94b==null){
_94b=false;
}
var _94c=cuesFilteredListbox.getAttribute("find");
if(_94c==null){
_94c="";
}
cuesFilteredListbox.options.length=0;
var len,_94d;
var cnt=0;
var url=cuesFilteredListbox.getAttribute("ajaxurl");
if(_94b&&_94c==""){
url="";
}
try{
if(url!=null&&url!=""){
url=url.replace("%pattern%",_94c.toLowerCase());
var _94e=cuesHTTP(url,"GET",null,"xml");
var _94f="/choices/choice";
var _950=cuesXpath(_94e,_94f);
len=_950.length;
var txt;
for(var i=0;i<len;i++){
cuesFilteredListbox.options.length++;
txt=isIE?_950[i].text:_950[i].textContent;
cuesFilteredListbox.options[cnt].text=txt;
_94d=_950[i].getAttribute("value");
if(_94d!=null){
cuesFilteredListbox.options[cnt].value=_94d;
}
cnt++;
}
}else{
if(isIE){
_94c=_94c.toLowerCase();
var _94f="/choices/choice[starts-with(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'"+_94c+"')]";
cuesFilteredListboxChoices.setProperty("SelectionLanguage","XPath");
var _950=cuesFilteredListboxChoices.selectNodes(_94f);
len=_950.length;
for(var i=0;i<len;i++){
cuesFilteredListbox.options.length++;
cuesFilteredListbox.options[cnt].text=_950[i].text;
_94d=_950[i].getAttribute("value");
if(_94d!=null){
cuesFilteredListbox.options[cnt].value=chocieValue;
}
cnt++;
}
}else{
var _951=_94c.replace("*",".+");
var _952=new RegExp("^"+_951,"i");
var _953,_954="";
var _955=null;
len=cuesFilteredListboxChoices.childNodes.length;
for(var i=0;i<len;i++){
_953=cuesFilteredListboxChoices.childNodes[i];
if(_953.nodeType!=3){
_955=cuesFilteredListboxChoices.childNodes[i];
}
}
if(_955!=null&&_955.hasChildNodes()){
var i=0;
while(_955.childNodes[i]){
_953=_955.childNodes[i];
if(_953.nodeType!=3){
_954=_953.textContent;
if(_952.test(_954)){
cuesFilteredListbox.options.length++;
cuesFilteredListbox.options[cnt].text=_954;
_94d=_955.childNodes[i].getAttribute("value");
if(_94d!=null){
cuesFilteredListbox.options[cnt].value=chocieValue;
}
cnt++;
}
}
i++;
}
}
}
}
if(_94b&&cnt==0){
cuesFilteredListbox.options.length=1;
cuesFilteredListbox.options[0].text="";
}
}
catch(e){
}
};
function cuesSetInsideAction(flag){
cuesIsInsideAction=flag;
if(flag){
setTimeout("cuesSetInsideAction(false)",100);
}
};
function cuesSetSecondaryTabActive(id){
try{
for(var _956=0;_956<30;_956++){
var tab=document.getElementById("cuesSecondaryTabset_"+_956+"_tab");
if(tab==null){
break;
}
if(tab.getAttribute("appid")==id){
cuesDrawnShape.toggleSecondaryTab("cuesSecondaryTabset",_956,false,null);
break;
}
}
}
catch(e){
}
};
function cuesInvokeSecondaryTab(id){
try{
for(var _957=0;_957<30;_957++){
var tab=document.getElementById("cuesSecondaryTabset_"+_957+"_tab");
if(tab==null){
break;
}
if(tab.getAttribute("appid")==id){
cuesDrawnShape.toggleSecondryTab("cuesSecondaryTabset",_957,true,null);
break;
}
}
}
catch(e){
}
};
function cuesSetPrimaryTabActive(id){
try{
for(var _958=0;_958<30;_958++){
var tab=document.getElementById("cuesPrimaryTabset_"+_958+"_tab");
if(tab==null){
break;
}
if(tab.getAttribute("appid")==id){
cuesDrawnShape.togglePrimaryTab("cuesPrimaryTabset",_958,false,null);
break;
}
}
}
catch(e){
}
};
function cuesInvokePrimaryTab(id){
try{
for(var _959=0;_959<30;_959++){
var tab=document.getElementById("cuesPrimaryTabset_"+_959+"_tab");
if(tab==null){
break;
}
if(tab.getAttribute("appid")==id){
cuesDrawnShape.togglePrimaryTab("cuesPrimaryTabset",_959,true,null);
break;
}
}
}
catch(e){
}
};
function icuesTilePrimaryTabs(evt){
try{
var pt=document.getElementById("cuesPrimaryTabset");
var _95a=document.getElementById("cuesPrimaryTabsetClip");
var tabs=pt.getElementsByTagName("td");
var _95b=tabs.length;
if(_95a){
_95b--;
}
var _95c=document.body.offsetWidth;
if(document.body.scrollWidth>document.body.offsetWidth){
_95c-=document.body.scrollWidth-document.body.offsetWidth;
}
_95c=Math.min(_95c,pt.offsetWidth);
for(var i=0;i<_95b;i++){
tabs[i].style.display="";
}
if(_95a!=null){
_95a.style.display="none";
}
var _95d;
for(var i=0;i<_95b;i++){
_95d=tabs[i].offsetLeft+tabs[i].offsetWidth;
if(_95d>_95c){
if(_95a){
_95a.style.display="";
}
for(var j=i;j<_95b;j++){
tabs[j].style.display="none";
}
break;
}
}
if(evt==null){
if(document.addEventListener){
window.addEventListener("resize",icuesTilePrimaryTabs,false);
}else{
if(document.attachEvent){
window.attachEvent("onresize",icuesTilePrimaryTabs);
}
}
}
}
catch(e){
}
};
function cuesUpdateProgressBar(id,_95e){
try{
_95e=Math.max(0,Math.min(100,_95e));
try{
document.getElementById(id+".percent").innerHTML=_95e+"%";
}
catch(e){
}
document.getElementById(id+".bar").style.display=(_95e>0)?"inline":"none";
document.getElementById(id+".bar").style.width=parseInt(270*(_95e/100));
}
catch(e){
}
};
function cuesAlert(_95f,text,_960,_961){
icuesAlertConfirmPrompt("Alert",_95f,text,_960,_961);
};
function cuesConfirm(_962,text,_963,_964,_965){
if(_965==null||_965==true){
return icuesAlertConfirmPrompt("Confirm",_962,text,_963,_964);
}else{
return icuesAlertConfirmPrompt("Confirm2",_962,text,_963,_964);
}
};
function cuesPrompt(_966,text,_967,_968){
return icuesAlertConfirmPrompt("Prompt",_966,text,_967,_968);
};
function icuesAlertConfirmPrompt(_969,_96a,text,_96b,_96c){
var _96d="center:yes;help:no;status:no;dialogHeight:87px;dialogWidth:306px;";
var _96e="";
if(window.screenX){
_96e="dialogTop:"+(window.screenY+((window.outerHeight-100)/2))+"px;dialogLeft:"+(window.screenX+((window.outerWidth-300)/2))+"px;";
}
var icon="";
switch(_96a){
case "info":
icon="/Status_information_icon."+(isIE6?"gif":"png");
break;
case "warn":
icon="/Status_warning_icon."+(isIE6?"gif":"png");
break;
case "error":
icon="/Status_error_icon."+(isIE6?"gif":"png");
break;
case "critical":
icon="/Status_crticalerror_icon."+(isIE6?"gif":"png");
break;
}
try{
return showModalDialog(cuesKnownLocation+"cues_utility/cues_alert.html",new Array(window,_969,text,cuesKnownLocation+cuesIconFolder+icon,new Array(cuesACP["Alert"],cuesACP["Confirm"],cuesACP["Prompt"],cuesACP["OK"],cuesACP["Cancel"],cuesACP["Yes"],cuesACP["No"],cuesACP["MessageNumber"],_96b),_96c),_96d+_96e);
}
catch(e){
return null;
}
};

