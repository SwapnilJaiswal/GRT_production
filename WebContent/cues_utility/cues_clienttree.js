var cuesTree=null;
var icuesBaseTree=new icuesTree();
function icuesTree(id,_1,_2,_3){
this.toggleChildren=_4;
this.buildTree=_5;
this.rebuildTree=_6;
this.activate=_7;
this.addBranch=_8;
this.remove=_9;
this.expandNode=_a;
this.expandAncestors=_b;
this.collapseNode=_c;
this.toggleNode=_d;
this.removeChildren=_e;
this.setRenderOnDemand=_f;
this.setLoadOnDemand=_10;
this.handleKeypress=_11;
this.handleClick=_12;
this.locateNode=_13;
this.getVisualId=_14;
this.handleNavigationFocus=_15;
this.handleFocus=_16;
this.handleBlur=_17;
this.getId=_18;
this.dump=_19;
var doc;
var _1a=id;
var _1b=false;
var _1c="never";
var _1d="tree";
var _1e=null;
var _1f=null;
var _20=0;
var _21="na";
var _22="na";
var _23=0;
if(cuesTree==null){
cuesTree=new Array();
}
if(id!=null){
cuesTree[id]=this;
}
if(_1!=null){
_10(_1);
}
if(_2!=null){
_f(_2);
}
if(_3!=null){
_1d=_3;
if(_1d=="navigation"){
activeTabIndex=-2;
}
}
function _18(){
return _1a;
};
function _7(id,_24,_25){
if(_1e!=null){
try{
var _26=document.getElementById(_1e+".label");
_26.tabIndex=-1;
_1e=null;
}
catch(e){
}
}
try{
if(_24==null){
_24=cuesXpath(doc,"//node[@id='"+id+"']")[0].getAttribute("nodeid");
}
var _26=document.getElementById(_24+".label");
_26.tabIndex=activeTabIndex;
if(_25==null||_25){
_26.focus();
}
_1e=_24;
}
catch(e){
}
};
function _f(_27){
_1b=_27;
};
function _10(_28){
_1c=_28;
};
function _15(evt,obj){
try{
obj.getElementsByTagName("a")[0].focus();
}
catch(e){
}
};
function _16(evt,obj){
obj.setAttribute("oldClassname",obj.className);
obj.className="cuesClienttreenodeFocus";
return true;
};
function _17(evt,obj){
obj.className=obj.getAttribute("oldClassname")+"";
return true;
};
function _12(evt,obj){
if(_18()==null){
var at=obj.id.indexOf(".");
var _29=obj.id.substr(0,at);
return cuesTree[_29].handleClick(evt,obj);
}
_7(null,obj.id.replace(".label",""));
return true;
};
function _2a(obj){
try{
if(obj.href.indexOf("javascript:")==0){
eval(obj.href);
}else{
if(obj.target==null||obj.target==""){
document.location.href=obj.href;
}else{
document.getElementById(obj.target).src=obj.href;
}
}
}
catch(e){
}
};
function _11(evt,obj){
if(_1a==null){
return cuesTree[obj.id.replace(".content","")].handleKeypress(evt,obj);
}
var _2b=window.event?evt.keyCode:evt.which;
var obj;
var _2c=true;
switch(_2b){
case 13:
case 32:
var _2d=(isIE)?evt.srcElement:evt.target;
if(_2d!=null){
var _2e=null;
if(_2d.tagName.toLowerCase()=="a"){
_2e=_2d;
}else{
_2e=_2d.getElementsByTagName("a");
if(_2e.length==1){
_2e=_2e[0];
}
}
if(_2e!=null){
try{
_2e.click();
}
catch(e){
_2a(_2e);
}
}
}
break;
case 35:
_2f();
break;
case 36:
_7(null,cuesXpath(doc,"/tree/node")[0].getAttribute("nodeid"));
break;
case 50:
case 40:
try{
_30("down");
}
catch(e){
}
break;
case 52:
case 37:
try{
obj=document.getElementById(_1e+".toggler");
_31(obj);
try{
if(_1d=="navigation"){
setTimeout("cuesTileDrawers('"+_22+"')",50);
}
}
catch(e){
}
}
catch(e){
}
break;
case 54:
case 39:
try{
obj=document.getElementById(_1e+".toggler");
_32(obj);
try{
if(_1d=="navigation"){
setTimeout("cuesTileDrawers('"+_22+"')",50);
}
}
catch(e){
}
}
catch(e){
}
break;
case 56:
case 38:
try{
_30("up");
}
catch(e){
}
break;
default:
_2c=false;
break;
}
if(_2c){
cuesStopEventBubble(evt);
return false;
}else{
return true;
}
};
function _33(_34,_35){
var _36=document.getElementById(_35+".toggler");
if(_36==null){
return;
}
if(_34.getAttribute("leaf")=="true"){
_36.src=cuesKnownLocation+cuesImageFolder+"/treeBullet.gif";
if(_1d=="navigation"){
_36.style.visibility="hidden";
}
}else{
var _37=document.getElementById(_35+".container");
if(_37==null||_37.offsetHeight==0){
_36.src=cuesKnownLocation+cuesImageFolder+"/treeTriangleExpand.gif";
}else{
if(_37&&_37.offsetHeight>0){
_36.src=cuesKnownLocation+cuesImageFolder+"/treeTriangleCollapse.gif";
}
}
}
};
function _30(_38){
for(var i=0;i<_20;i++){
if(_1f[i].tabIndex==activeTabIndex){
if(_38=="up"){
for(var j=i-1;j>=0;j--){
if(_1f[j].offsetHeight>0){
_1f[j].tabIndex=activeTabIndex;
_1f[i].tabIndex=-1;
_1f[j].focus();
_1e=_1f[j].id.replace(".label","");
_1f[j].focus();
return;
}
}
}else{
for(var j=i+1;j<_20;j++){
if(_1f[j].offsetHeight>0){
_1f[j].tabIndex=activeTabIndex;
_1f[i].tabIndex=-1;
_1f[j].focus();
_1e=_1f[j].id.replace(".label","");
_1f[j].focus();
return;
}
}
}
break;
}
}
};
function _2f(){
for(var i=0;i<_20;i++){
if(_1f[i].tabIndex==activeTabIndex){
break;
}
}
for(var j=_20-1;j>=0;j--){
if(_1f[j].offsetHeight>0){
if(i!=j){
_1f[i].tabIndex=-1;
_1f[j].tabIndex=activeTabIndex;
_1f[j].focus();
_1e=_1f[j].id.replace(".label","");
_1f[j].focus();
}
return;
}
}
};
function _4(obj,_39){
if(_18()==null&&_39==null){
var at=obj.id.indexOf(".");
var _3a=obj.id.substr(0,at);
return cuesTree[_3a].toggleChildren(obj,true);
}
if(obj.src.indexOf("Expand")!=-1){
_32(obj);
}else{
if(obj.src.indexOf("Collapse")!=-1){
_31(obj);
}
}
_7(obj.getAttribute("dataId"),obj.id.replace(".toggler",""));
try{
if(_1d=="navigation"){
setTimeout("cuesTileDrawers('"+_22+"')",50);
}
}
catch(e){
}
return true;
};
function _c(id){
try{
var _3b=cuesXpath(doc,"//node[@id='"+id+"']")[0];
var _3c=_3b.getAttribute("nodeid");
_31(document.getElementById(_3c+".toggler"));
}
catch(e){
}
};
function _31(obj){
var src=obj.src;
if(src.indexOf("Collapse")!=-1){
obj.src=src.replace("Collapse","Expand");
}else{
return;
}
try{
var id=obj.id.replace(".toggler",".container");
document.getElementById(id).style.display="none";
}
catch(e){
var _3d=obj.id.replace(".toggler","");
var len=_3e(doc,_3d);
if(_1c=="first"&&len==0){
var _3f=callbackClienttreeLOD(_1a,obj.getAttribute("dataId"));
_8(obj.getAttribute("dataId"),null,_3f,obj);
len=_3e(doc,_3d);
}else{
if(_1b){
var _40=icuesFindObjectByTagname(obj,"div");
_41(doc,_40.parentNode,_40,_3d);
}
}
if(len==0){
obj.src=cuesKnownLocation+cuesImageFolder+"/treeBullet.gif";
if(_1d=="navigation"){
obj.style.visibility="hidden";
}
}
}
};
function _b(id){
try{
var _42=cuesXpath(doc,"//node[@id='"+id+"']")[0];
if(_42==null){
_42=cuesXpath(doc,"//node[@nodeid='"+id+"']")[0];
}
while(_42.parentNode!=null){
_42=_42.parentNode;
var _43=_42.getAttribute("nodeid");
_32(document.getElementById(_43+".toggler"));
}
}
catch(e){
}
};
function _d(id){
try{
var _44=cuesXpath(doc,"//node[@id='"+id+"']")[0];
var _45=_44.getAttribute("nodeid");
var _46=document.getElementById(_45+".toggler");
if(_46.src.indexOf("Expand")!=-1){
_a(id);
}else{
_c(id);
}
}
catch(e){
}
};
function _a(id){
try{
var _47=cuesXpath(doc,"//node[@id='"+id+"']")[0];
var _48=_47.getAttribute("nodeid");
_32(document.getElementById(_48+".toggler"));
}
catch(e){
}
};
function _32(obj){
var src=obj.src;
if(src.indexOf("Expand")!=-1){
obj.src=src.replace("Expand","Collapse");
if(_1c=="every"){
var _49=obj.src;
var _4a=obj.getAttribute("dataId");
_e(_4a);
var _4b=callbackClienttreeLOD(_1a,_4a);
len=_8(_4a,null,_4b,obj);
if(len==0){
obj.src=src.replace("Collapse","Expand");
state="none";
}else{
obj.src=_49;
}
}
}else{
return;
}
try{
var id=obj.id.replace(".toggler",".container");
document.getElementById(id).style.display="";
}
catch(e){
var _4c=obj.id.replace(".toggler","");
var len=_3e(doc,_4c);
if(_1c=="first"&&len==0){
var _4b=callbackClienttreeLOD(_1a,obj.getAttribute("dataId"));
_8(obj.getAttribute("dataId"),null,_4b,obj);
len=_3e(doc,_4c);
}else{
if(_1b){
var _4d=icuesFindObjectByTagname(obj,"div");
_41(doc,_4d.parentNode,_4d,_4c);
}
}
if(len==0){
obj.src=cuesKnownLocation+cuesImageFolder+"/treeBullet.gif";
if(_1d=="navigation"){
obj.style.visibility="hidden";
}
}
}
};
function _8(_4e,_4f,_50,obj){
var _51=0;
var _52=cuesXpath(doc,"//node[@id='"+_4e+"']");
if(_52.length==1){
_52=_52[0];
var _53=_50==null?cuesGetXmlDoc(_4f):cuesGetXmlDoc(null,_50);
var _54=cuesXpath(_53,"/tree/node");
_51=_54.length;
for(var i=0;i<_51;i++){
_52.appendChild(_54[i].cloneNode(true));
}
_52.setAttribute("leaf",(_51==0?"true":"false"));
_52.setAttribute("state","open");
if(obj==null){
_55();
}else{
_56(obj,_52.getAttribute("nodeid"));
}
}
if(_51>0){
_57();
}
return _51;
};
function _57(){
_1f=document.getElementById(_1a+".content").getElementsByTagName("span");
_20=_1f.length;
};
function _e(_58){
var _59=cuesXpath(doc,"//node[@id='"+_58+"']");
if(_59.length==1){
_59=_59[0];
var _5a=_59.getAttribute("nodeid");
var _5b=false;
if(_1e==_59.getAttribute("nodeid")){
_5b=true;
}else{
var _5c=cuesXpath(doc,"//node[@id='"+_58+"']//node[@nodeid='"+_1e+"']");
if(_5c.length>0){
_5b=true;
}
}
var _5d=_59.childNodes;
for(var i=_5d.length-1;i>=0;i--){
_59.removeChild(_5d[i]);
}
_5d=null;
_59.setAttribute("leaf","true");
var _5e=document.getElementById(_5a+".container");
if(_5e){
_5e.parentNode.removeChild(_5e);
}
_33(_59,_5a);
if(_5b){
_7(null,_59.getAttribute("nodeid"));
}
_57();
}
};
function _9(_5f){
var _60=cuesXpath(doc,"//node[@id='"+_5f+"']");
if(_60.length==1){
_60=_60[0];
var _61=_60.parentNode;
var _62=_60.getAttribute("nodeid");
var _63=false;
if(_1e==_60.getAttribute("nodeid")){
_63=true;
}else{
var _64=cuesXpath(doc,"//node[@id='"+_5f+"']//node[@nodeid='"+_1e+"']");
if(_64.length>0){
_63=true;
}
}
_61.removeChild(_60);
if(_61.childNodes.length==0){
_61.setAttribute("leaf","true");
_33(_61,_61.getAttribute("nodeid"));
}
var _65=document.getElementById(_62+".container");
if(_65){
_65.parentNode.removeChild(_65);
}
var row=document.getElementById(_62+".node");
if(row){
row.parentNode.removeChild(row);
}
if(_63){
_7(null,_61.getAttribute("nodeid"));
}
_57();
}
};
function _6(xml){
var _66=document.getElementById(_1a+".content");
_66.innerHTML="";
doc=cuesGetXmlDoc(_1a,xml);
_55();
};
function _5(){
var _67=document.getElementById(_1a+".content");
_67.innerHTML="";
if(_1d=="navigation"){
var _68=icuesFindObjectByTagnameClass(_67,"div","cuesDrawerContent");
if(_68!=null){
_21=_68.id.replace("Content","");
var _69=icuesFindObjectByTagnameClass(_68,"div","cuesDrawersContainer");
if(_69!=null){
_22=_69.id;
}
}
}
doc=cuesGetXmlDoc(_1a,null,true);
_55();
};
function _55(){
_1f=null;
var _6a=document.getElementById(_1a+".content");
_6a.innerHTML="";
var _6b=cuesXpath(doc,"/tree/node");
var _6c,_6d;
for(var i=0;i<_6b.length;i++){
_6e(_1a+"."+i,_6a,_6b[i]);
_6d=_6b[i].getAttribute("state");
if(!_1b||_6d!="closed"){
_6f(doc,_6a,_6b[i],_1a+"."+i,_6d);
}
}
_57();
if(_1e==null&&_20>0){
_1f[0].tabIndex=activeTabIndex;
_1e=_1f[0].id.replace(".label","");
}
};
function _56(obj,_70){
var _71=icuesFindObjectByTagname(obj,"div");
_41(doc,_71.parentNode,_71,_70);
};
function _6e(_72,_73,_74){
try{
_74.setAttribute("nodeid",_72);
var _75=_74.getAttribute("id");
var _76=_74.getAttribute("state");
var _77=_74.getAttribute("leaf");
var _78=document.createElement("div");
_78.className="cuesNowrap";
_78.id=_72+".node";
var _79=_74.getAttribute("onclick");
var _7a=_74.getAttribute("icon");
var _7b=_74.getAttribute("tooltip");
var _7c=_74.getAttribute("contextmenu");
var tgt=_74.getAttribute("target");
var _7d="";
if(_77=="auto"){
try{
if(_74.childNodes.length==0||(_74.childNodes.length==1&&_74.childNodes[0].nodeType==3)){
_77="true";
_74.setAttribute("leaf","true");
}
}
catch(e){
}
}
if(_77=="true"){
_7d="<img alt=\"\" title=\"\" class=\"cuesClienttreeToggler\" dataId=\""+_75+"\" id=\""+_72+".toggler\" src=\""+cuesKnownLocation+cuesImageFolder+"/treeBullet.gif\" onclick=\"icuesBaseTree.toggleChildren(this)\""+(_1d=="navigation"?" style=\"visibility:hidden;\"":"")+"/>";
}else{
_7d="<img alt=\"\" title=\"\"  class=\"cuesClienttreeToggler\" dataId=\""+_75+"\" id=\""+_72+".toggler\" src=\""+cuesKnownLocation+cuesImageFolder+"/treeTriangle"+(_76=="closed"?"Expand":"Collapse")+".gif\" onmouseover=\"this.style.cursor='pointer'\" onclick=\"icuesBaseTree.toggleChildren(this)\"/>";
}
_7d+="<span onmouseover=\"this.style.cursor='pointer'\" id=\""+_72+".label\"";
if(_1d=="tree"){
_7d+=" onfocus=\"return icuesBaseTree.handleFocus(event,this)\"";
_7d+=" onblur=\"return icuesBaseTree.handleBlur(event,this)\"";
_7d+=" onclick=\"return icuesBaseTree.handleClick(event,this)\"";
_7d+=" tabindex=\""+(_72==_1e?activeTabIndex:-1)+"\"";
}else{
_7d+=" onfocus=\"return icuesBaseTree.handleNavigationFocus(event,this)\"";
_7d+=" onclick=\"return icuesBaseTree.handleClick(event,this)\"";
}
if(_79==null&&_7b!=null){
_7d+=" title=\""+_7b+"\"";
}
_7d+=">";
if(_79!=null){
if(_1d=="navigation"){
_7d+="<a id=\""+_72+".link\" class=\"cuesDrawerItemLink\" href=\"javascript:cuesInvokeDrawerURL('"+_21+"','"+_79+"','"+tgt+"','"+_72+".link')\"";
}else{
_7d+="<a href=\""+_79+"\"";
if(tgt!=null){
_7d+=" target=\""+tgt+"\"";
}
}
if(_7b!=null){
_7d+=" title=\""+_7b+"\"";
}
if(_7c!=null){
_7d+=" oncontextmenu=\""+_7c+"\"";
}
_7d+=">";
}else{
if(_1d=="navigation"){
_79="";
_7d+="<a id=\""+_72+".link\" class=\"cuesDrawerItemLink\" href=\"javascript:icuesToggleNavItem('"+_21+"','"+_75+"')\"";
if(_7b!=null){
_7d+=" title=\""+_7b+"\"";
}
if(_7c!=null){
_7d+=" oncontextmenu=\""+_7c+"\"";
}
_7d+=">";
}
}
if(_7a!=null){
_7d+="<img alt=\"\" title=\"\" border=\"0\" src=\""+_7a+"\"/>&#160;";
}
_7d+=_74.getAttribute("label");
if(_79!=null){
_7d+="</a>";
}
_7d+="</span>";
_78.innerHTML=_7d;
_73.appendChild(_78);
}
catch(e){
}
};
function _6f(doc,_7e,_7f,_80,_81){
if(_7f.getAttribute("leaf")=="true"){
return;
}
var _82=cuesXpath(doc,"//node[@nodeid='"+_80+"']/node");
if(_82.length>0){
var _83=document.createElement("div");
_83.id=_80+".container";
_83.className="cuesClienttreeChildren";
if(_81=="closed"){
_83.style.display="none";
}
_7e.appendChild(_83);
var _81;
for(var i=0;i<_82.length;i++){
_6e(_80+"."+i,_83,_82[i]);
_81=_82[i].getAttribute("state");
if(!_1b||_81!="closed"){
_6f(doc,_83,_82[i],_80+"."+i,_81);
}
}
}
};
function _3e(doc,_84){
return cuesXpath(doc,"//node[@nodeid='"+_84+"']/node").length;
};
function _41(doc,_85,_86,_87){
var _88=cuesXpath(doc,"//node[@nodeid='"+_87+"']/node");
if(_88.length>0){
var _89=_88[0].parentNode;
var _8a=document.createElement("div");
_8a.id=_87+".container";
_8a.className="cuesClienttreeChildren";
if(_8b=="closed"){
_8a.style.display="none";
}
_85.insertBefore(_8a,_86.nextSibling);
var _8b;
for(var i=0;i<_88.length;i++){
_6e(_87+"."+i,_8a,_88[i]);
_8b=_88[i].getAttribute("state");
if(!_1b||_8b!="closed"){
_6f(doc,_8a,_88[i],_87+"."+i,_88[i].getAttribute("state"));
}
}
_57();
}
return _88.length;
};
function _13(key,_8c){
var _8d=null;
try{
if(_8c==null){
_8d=cuesXpath(doc,"//node[@id='"+key+"']")[0];
if(_8d==null){
_8d=cuesXpath(doc,"//node[@nodeid='"+key+"']")[0];
}
}else{
var _8e="'"+key+"':'"+_8c+"'";
var _8f="/tree//node[contains(@appdata,\""+_8e+"\")]";
_8d=cuesXpath(doc,_8f)[0];
}
}
catch(e){
}
return _8d;
};
function _14(id){
try{
id=cuesXpath(doc,"//node[@id='"+id+"']")[0].getAttribute("nodeid");
}
catch(e){
}
return id;
};
function _19(){
alert(cuesGetXml(doc));
};
};

