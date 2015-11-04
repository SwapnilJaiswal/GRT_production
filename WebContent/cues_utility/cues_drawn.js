var cuesDrawnShape=null;
function icuesDrawnShape(){
var _1=navigator.userAgent.indexOf("MSIE")!=-1;
var _2=navigator.userAgent.indexOf("Firefox/")!=-1;
var _3=navigator.userAgent.indexOf("Safari")!=-1&&navigator.userAgent.indexOf("Chrome")==-1;
var _4=navigator.userAgent.indexOf("Chrome")!=-1;
if(_1&&!_3){
this.makeTab=_5;
this.adjustTab=_6;
this.makeTabActive=_7;
this.makeTabInactive=_8;
this.tabMouseover=_9;
this.tabMouseout=_a;
this.renderTabset=_b;
this.makePrimaryTabset=_c;
this.makePrimaryTab=_d;
this.makePrimaryTabActive=_e;
this.makePrimaryTabInactive=_f;
this.primarytabMouseover=_10;
this.primarytabMouseout=_11;
this.makeSecondaryTab=_12;
this.makeSecondaryTabActive=_13;
this.makeSecondaryTabInactive=_14;
this.secondarytabMouseover=_15;
this.secondarytabMouseout=_16;
this.makeDrawer=_17;
this.adjustDrawer=_18;
this.makeDrawerActive=_19;
this.makeDrawerInactive=_1a;
this.drawerMouseover=_1b;
this.drawerMouseout=_1c;
this.makeDashboard=_1d;
this.makePanel=_1e;
this.makeToolbar=_1f;
this.makeContainer=_20;
this.makeShadowedContainer=_21;
this.makeProgressBar=_22;
this.updateProgressBar=_23;
this.makeGradientBox=_24;
if(document.documentMode==null||document.documentMode<8){
try{
document.namespaces.add("cues_vml","urn:schemas-microsoft-com:vml");
}
catch(e){
}
}else{
try{
document.namespaces.add("cues_vml","urn:schemas-microsoft-com:vml","#default#VML");
}
catch(e){
}
}
}else{
this.makeTab=_25;
this.adjustTab=_26;
this.makeTabActive=_27;
this.makeTabInactive=_28;
this.tabMouseover=_29;
this.tabMouseout=_2a;
this.renderTabset=_2b;
this.makePrimaryTabset=_2c;
this.makePrimaryTab=_2d;
this.makePrimaryTabActive=_2e;
this.makePrimaryTabInactive=_2f;
this.primarytabMouseover=_30;
this.primarytabMouseout=_31;
this.makeSecondaryTab=_32;
this.makeSecondaryTabActive=_33;
this.makeSecondaryTabInactive=_34;
this.secondarytabMouseover=_35;
this.secondarytabMouseout=_36;
this.makeDrawer=_37;
this.adjustDrawer=_38;
this.makeDrawerActive=_39;
this.makeDrawerInactive=_3a;
this.drawerMouseover=_3b;
this.drawerMouseout=_3c;
this.makeDashboard=_3d;
this.makePanel=_3e;
this.makeToolbar=_3f;
this.makeContainer=_40;
this.makeShadowedContainer=_41;
this.makeProgressBar=_42;
this.updateProgressBar=_43;
this.makeGradientBox=_44;
}
this.toggleTab=_45;
this.togglePrimaryTab=_46;
this.toggleSecondaryTab=_47;
this.onresizePrimaryTabsetHandler=_48;
this.onresizeDashboardHandler=_49;
this.resizeDashboard=_4a;
var _4b=null;
var _4c=null;
var _4d=null;
var _4e=null;
var _4f=null;
var _50=null;
var _51=null;
var _52=null;
var _53=null;
var _54=null;
var _55=null;
var _56=null;
var _57="http://www.w3.org/2000/svg";
var _58=null;
var _59="20%";
var _5a="21%";
var _5b="50%";
var _5c="51%";
var _5d="50%";
var _5e="51%";
var _5f="25%";
var _60="25.1%";
_61();
function _48(id){
try{
var _62=document.getElementById(id).getElementsByTagName("svg");
for(var i=0;i<_62.length;i++){
cuesRepaint(null,_62[i]);
}
}
catch(e){
}
};
var _63=null;
function _49(){
if(_63!=null){
clearTimeout(_63);
}
_63=setTimeout("cuesDrawnShape.resizeDashboard()",200);
};
function _4a(){
try{
var _64=document.getElementById("cuesDashboard").getElementsByTagName("rect");
for(var i=0;i<_64.length;i++){
_64[i].setAttributeNS(null,"width","100%");
}
}
catch(e){
}
};
function _45(id,_65){
var _66=-1;
var obj=document.getElementById(id);
if(obj==null){
return;
}
var _67=Math.ceil(obj.rows[0].cells.length/2);
for(var i=0;i<_67;i++){
if(i==_65){
continue;
}
var obj=document.getElementById(id+"_"+i+"_tab");
if(obj==null){
break;
}
if(obj.active=="true"){
_66=i;
cuesDrawnShape.makeTabInactive(id,i);
break;
}
}
cuesDrawnShape.makeTabActive(id,_65);
return _66;
};
function _46(id,_68,_69,evt){
var _6a=-1;
var obj=document.getElementById(id).getElementsByTagName("table")[0];
if(obj==null){
return;
}
var _6b=Math.ceil(obj.rows[0].cells.length);
for(var i=0;i<_6b;i++){
if(i==_68){
continue;
}
var obj=document.getElementById(id+"_"+i+"_tab");
if(obj==null){
break;
}
if(obj.active=="true"){
_6a=i;
cuesDrawnShape.makePrimaryTabInactive(id,i);
break;
}
}
cuesDrawnShape.makePrimaryTabActive(id,_68);
if(_69){
cuesInvokeTab(evt,document.getElementById(id+"_"+_68+"_tab"),true);
}
return _6a;
};
function _47(id,_6c,_6d,evt){
var _6e=-1;
var obj=document.getElementById(id).getElementsByTagName("table")[0];
if(obj==null){
return;
}
var _6f=Math.ceil(obj.rows[0].cells.length);
for(var i=0;i<_6f;i++){
if(i==_6c){
continue;
}
var obj=document.getElementById(id+"_"+i+"_tab");
if(obj==null){
break;
}
if(obj.active=="true"){
_6e=i;
cuesDrawnShape.makeSecondaryTabInactive(id,i);
break;
}
}
cuesDrawnShape.makeSecondaryTabActive(id,_6c);
if(_6d){
cuesInvokeTab(evt,document.getElementById(id+"_"+_6c+"_tab"));
}
return _6e;
};
function _7(id,_70){
var obj=document.getElementById(id+"_"+_70+"_fill");
obj.color=_58["cuesTabActiveStartGradient"];
obj.color2=_58["cuesTabActiveStopGradient"];
if(cuesCSSMode+""=="highcontrast"){
obj.opacity=1;
}else{
obj.opacity=0.4;
}
obj.angle=-180;
obj.colors.value="";
var _71=document.getElementById("cuesid_"+id+"_"+_70);
var _72=_71.offsetWidth;
_71.style.color="";
var obj=document.getElementById(id+"_"+_70+"_tab");
var pre=obj.offsetWidth;
obj.className="cuesTab cuesTabCaptionActive";
obj.active="true";
var _73=document.getElementById(id+"_"+_70+"_base");
if(_73!=null){
_73.style.display="none";
}
var _74=document.getElementById(id+"_"+_70+"_stroke");
if(_74!=null){
_74.color=_58["cuesTabActiveStroke"];
}
var _75=obj.offsetWidth;
var _76=_71.offsetWidth;
_6(id,_70,_75-pre);
};
function _27(id,_77){
var obj=document.getElementById(id+"_"+_77+"_tab");
var pre=obj.offsetWidth;
var _78=document.getElementById("cuesid_"+id+"_"+_77);
var _79=_78.offsetWidth;
obj.className="cuesTab cuesTabCaptionActive";
obj.active="true";
_78.style.color="";
var _7a=obj.getElementsByTagName("rect");
_7a[1].style.cssText=_7a[1].style.cssText.replace("#inactivetab_grad","#activetab_grad");
_7a[1].style.cssText=_7a[1].style.cssText.replace("#hovertab_grad","#activetab_grad");
_7a[1].setAttributeNS(null,"stroke",_58["cuesTabActiveStroke"]);
var _7b=obj.getElementsByTagName("line");
_7b[0].style.display="none";
var _7c=obj.offsetWidth;
var _7d=_78.offsetWidth;
_26(id,_77,_7d-_79);
};
function _8(id,_7e){
var obj=document.getElementById(id+"_"+_7e+"_fill");
obj.color=_58["cuesTabInactiveStartGradient"];
obj.color2=_58["cuesTabInactiveStopGradient"];
obj.opacity="100%";
obj.angle=180;
obj.colors.value=obj.inactivecolors;
var obj=document.getElementById(id+"_"+_7e+"_tab");
var pre=obj.offsetWidth;
var _7f=document.getElementById("cuesid_"+id+"_"+_7e);
var _80=_7f.offsetWidth;
obj.className="cuesTab cuesTabCaptionInactive";
obj.active="false";
var _81=document.getElementById(id+"_"+_7e+"_base");
if(_81!=null){
_81.style.display="";
}
var _82=document.getElementById(id+"_"+_7e+"_stroke");
if(_82!=null){
_82.color=_58["cuesTabInactiveStroke"];
}
var _83=obj.offsetWidth;
var _84=_7f.offsetWidth;
_6(id,_7e,_84-_80);
};
function _28(id,_85){
var obj=document.getElementById(id+"_"+_85+"_tab");
var pre=obj.offsetWidth;
var _86=document.getElementById("cuesid_"+id+"_"+_85);
var _87=_86.offsetWidth;
obj.className="cuesTab cuesTabCaptionInactive";
obj.active="false";
var _88=obj.getElementsByTagName("rect");
_88[1].style.cssText=_88[1].style.cssText.replace("#activetab_grad","#inactivetab_grad");
_88[1].setAttributeNS(null,"stroke",_58["cuesTabInactiveStroke"]);
var _89=obj.getElementsByTagName("line");
_89[0].style.display="";
var _8a=obj.offsetWidth;
var _8b=_86.offsetWidth;
_26(id,_85,_8b-_87);
};
function _6(id,_8c,_8d,_8e){
var _8f=document.getElementById(id+"_"+_8c+"_tab");
if(_8f==null){
return;
}
var _90=_8f.getElementsByTagName("roundrect");
if(_90.length==0){
return;
}
var w=_8f.offsetWidth;
if(_8d!=null){
_8f.style.width=w+_8d;
_90[0].style.width=w+_8d;
}
if(_8e!=null){
_8f.style.width=_8e;
_90[0].style.width=_8e;
}
var _91=document.getElementById(id+"_"+_8c+"_base");
if(_91.offsetWidth>0){
var _92=_91.to.y/parseInt(_91.getAttribute("tabHeight"));
_91.to.x=_92*(w+_8d);
}
};
function _26(id,_93,_94,_95){
var _96=document.getElementById(id+"_"+_93+"_tab");
if(_96==null){
return;
}
var _97=_96.getElementsByTagName("rect");
if(_97.length==0){
return;
}
if(_94!=null){
_96.style.width=_96.offsetWidth+_94;
}
if(_95!=null){
_96.style.width=_95;
}
};
function _b(id){
for(var _98=0;_98<20;_98++){
var _99=document.getElementById(id+"_"+_98+"_tab");
if(_99==null){
return;
}
_99.style.width="auto";
var _9a=_99.getElementsByTagName("roundrect");
if(_9a.length==0){
return;
}
_9a[0].style.width=_99.offsetWidth+"px";
var h=_99.offsetHeight;
var w=_99.offsetWidth;
_9a[0].style.height=Math.ceil(h*1.2)+"px";
_9a[0].style.clip="rect(0px,auto,"+(h+1)+"px,auto)";
var _9b=document.getElementById(id+"_"+_98+"_base");
if(_9b==null){
return;
}
_9b.setAttribute("from","0,"+(h-1));
_9b.setAttribute("to",w+","+(h-1));
}
};
function _2b(id){
for(var _9c=0;_9c<20;_9c++){
var _9d=document.getElementById(id+"_"+_9c+"_tab");
if(_9d==null){
return;
}
_9d.style.width="auto";
var svg=_9d.getElementsByTagName("svg");
if(svg.length==0){
return;
}
svg[0].setAttributeNS(null,"height",(_9d.offsetHeight-2)+"px");
}
};
function _5(id,_9e,_9f,_a0,cnt){
var _a1=document.getElementById(id+"_"+_9e+"_tab");
if(_a1==null){
return;
}
if(cnt==null){
cnt=1;
}
var h=_a1.offsetHeight;
if(h==0&&_a0==null&&cnt<10){
var _a2=10;
try{
if(_a1.parentNode.offsetHeight==0){
_a2=100;
}
}
catch(e){
}
setTimeout("cuesDrawnShape.makeTab('"+id+"',"+_9e+","+_9f+",null,"+(cnt+1)+")",_a2);
return;
}
var w1=_a1.offsetWidth;
if(h==0){
h=20;
}
if(w1==0){
w1=100;
}
_a1.style.height=h+"px";
_a1.style.width=w1+"px";
var w=_a1.offsetWidth;
if(w==0){
w="100%";
}
if(w>_a1.scrollWidth&&w>1000){
w=_a1.scrollWidth;
}
_a1.style.width=w;
var _a3=document.createElement("div");
_a3.style.position="absolute";
_a3.style.top="0px";
_a3.style.left="0px";
_a3.style.zIndex="-1";
_a1.appendChild(_a3);
var _a4=_9f?"Active":"Inactive";
_a1.active=_9f?"true":"false";
var _a5="";
_a5+="<cues_vml:roundrect style=\"height:"+Math.ceil(h*1.2)+"px;width:"+w+"px;position:absolute;padding:0px;top:1px;left:0px;margin:0px;padding:0px;clip:rect(0px,auto,"+h+"px,auto);\" arcsize=\"0.1\">";
_a5+="<cues_vml:stroke id=\""+id+"_"+_9e+"_stroke\" dashstyle=\"solid\" color=\""+_58["cuesTab"+_a4+"Stroke"]+"\"/>";
_a5+="<cues_vml:fill id=\""+id+"_"+_9e+"_fill\" type=\"gradient\"";
if(!_9f){
_a5+=" angle=\"180\" colors=\"33% "+_58["cuesTabInactiveStopGradient1"]+", 34% "+_58["cuesTabInactiveStartGradient2"]+", 49% "+_58["cuesTabInactiveStopGradient2"]+", 50% "+_58["cuesTabInactiveStartGradient3"]+"\"";
}else{
if(cuesCSSMode+""=="highcontrast"){
_a5+=" angle=\"-180\" ";
}else{
_a5+=" angle=\"-180\" opacity=\"40%\" ";
}
}
_a5+=" inactivecolors=\"16% "+_58["cuesTabInactiveStopGradient1"]+", 17% "+_58["cuesTabInactiveStartGradient2"]+", 42% "+_58["cuesTabInactiveStopGradient2"]+", 43% "+_58["cuesTabInactiveStartGradient3"]+"\"";
_a5+=" hovercolors=\"42% "+_58["cuesTabHoverStopGradient1"]+", 43% "+_58["cuesTabHoverStartGradient2"]+"\"";
_a5+=" color=\""+_58["cuesTab"+_a4+"StartGradient"]+"\"";
_a5+=" color2=\""+_58["cuesTab"+_a4+"StopGradient"]+"\"/>";
_a5+="</cues_vml:roundrect>";
_a5+="<cues_vml:line tabHeight=\""+(h-1)+"\" id=\""+id+"_"+_9e+"_base\" from=\"0,"+(h-1)+"\" to=\""+w+","+(h-1)+"\" strokecolor=\""+_58["cuesTabStroke"]+"\" strokeweight=\"1px\"/>";
_a3.innerHTML=_a5;
if(_9f){
var _a6=document.getElementById(id+"_"+_9e+"_base");
if(_a6!=null){
_a6.style.display="none";
}
}
};
function _25(id,_a7,_a8){
var _a9=document.getElementById(id+"_"+_a7+"_tab");
if(_a9==null){
return;
}
var h=_a9.offsetHeight;
var w=_a9.offsetWidth;
_a9.style.width=w;
var _aa=_a8?"Active":"Inactive";
_a9.active=_a8?"true":"false";
var _ab=document.createElementNS(_57,"svg");
_ab.setAttributeNS(null,"style","position:absolute;top:2px;left:0px;z-index:-1;");
_ab.setAttributeNS(null,"height",(_a9.offsetHeight-2)+"px");
_a9.appendChild(_ab);
if(_4c==null){
var _ac="";
_ac+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_ac+="<defs>";
_ac+="<linearGradient id=\"activetab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_ac+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesTabActiveStartGradient"]+";stop-opacity:1;\"/>";
if(cuesCSSMode+""=="highcontrast"){
_ac+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesTabActiveStartGradient"]+";stop-opacity:1;\"/>";
}else{
_ac+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesTabActiveStartGradient"]+";stop-opacity:.4;\"/>";
}
_ac+="</linearGradient>";
_ac+="<linearGradient id=\"hovertab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_ac+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesTabHoverStartGradient"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"25%\" style=\"stop-color:"+_58["cuesTabHoverStopGradient1"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"26%\" style=\"stop-color:"+_58["cuesTabHoverStartGradient2"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesTabHoverStopGradient"]+";stop-opacity:1;\"/>";
_ac+="</linearGradient>";
_ac+="<clipPath id=\"activetab_clip\">";
_ac+="<rect x=\"0\" y=\"0\" width=\"100%\" height=\"100%\"/>";
_ac+="</clipPath>";
_ac+="</defs>";
_ac+="<rect rx=\"5\" ry=\"5\" x=\"0\" y=\"0\" width=\"100%\" height=\"200%\" stroke=\""+_58["cuesTabActiveStroke"]+"\" style=\"fill:url(#activetab_grad);stroke-width:1.5px;\"/>";
_ac+="<line x1=\"0\" y1=\""+(h-2)+"\" x2=\"500\" y2=\""+(h+1)+"\" style=\"display:none;stroke:"+_58["cuesTabStroke"]+";stroke-width:1px;stroke-opacity:1;\"/>";
_ac+="</svg>";
var _ad=new DOMParser();
_4c=_ad.parseFromString(_ac,"text/xml");
}
if(_4d==null){
var _ac="";
_ac+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_ac+="<defs>";
_ac+="<linearGradient id=\"inactivetab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_ac+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesTabInactiveStartGradient"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"10%\" style=\"stop-color:"+_58["cuesTabInactiveStopGradient1"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"25%\" style=\"stop-color:"+_58["cuesTabInactiveStartGradient2"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"26%\" style=\"stop-color:"+_58["cuesTabInactiveStopGradient2"]+";stop-opacity:1;\"/>";
_ac+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesTabInactiveStopGradient"]+";stop-opacity:1;\"/>";
_ac+="</linearGradient>";
_ac+="<clipPath id=\"inactivetab_clip\">";
_ac+="<rect x=\"0\" y=\"0\" width=\"100%\" height=\"100%\"/>";
_ac+="</clipPath>";
_ac+="</defs>";
_ac+="<rect rx=\"5\" ry=\"5\" x=\"0\" y=\"0\" width=\"100%\" height=\"200%\" stroke=\""+_58["cuesTabInactiveStroke"]+"\" style=\"fill:url(#inactivetab_grad);stroke-width:1.5px;\"/>";
_ac+="<line x1=\"0\" y1=\""+(h-2)+"\" x2=\"500\" y2=\""+(h-2)+"\" style=\"z-index:1;fill:"+_58["cuesTabStroke"]+";stroke:"+_58["cuesTabStroke"]+";stroke-width:2px;stroke-opacity:1\"/>";
_ac+="</svg>";
var _ad=new DOMParser();
_4d=_ad.parseFromString(_ac,"text/xml");
}
var _ae;
if(_a8){
_ae=_4c.documentElement;
}else{
_ae=_4d.documentElement;
}
var len=_ae.childNodes.length;
for(var i=0;i<len;++i){
_ab.appendChild(document.importNode(_ae.childNodes[i],true));
}
};
function _9(id,_af){
var _b0=document.getElementById(id+"_"+_af+"_tab");
if(_b0==null){
return;
}
if(_b0.active=="true"){
return;
}
var _b1=document.getElementById("cuesid_"+id+"_"+_af);
_b1.style.color=_58["cuesTabCaptionHover"];
var _b0=document.getElementById(id+"_"+_af+"_fill");
if(_b0!=null){
_b0.color=_58["cuesTabHoverStartGradient"];
_b0.color2=_58["cuesTabHoverStopGradient"];
_b0.colors.value=_b0.hovercolors;
_b0.colors.value="42% "+_58["cuesTabHoverStopGradient1"]+", 43% "+_58["cuesTabHoverStartGradient2"];
}
var _b0=document.getElementById(id+"_"+_af+"_stroke");
if(_b0!=null){
_b0.color=_58["cuesTabHoverStroke"];
}
};
function _a(id,_b2){
var _b3=document.getElementById(id+"_"+_b2+"_tab");
if(_b3==null){
return;
}
if(_b3.active=="true"){
return;
}
var _b4=document.getElementById("cuesid_"+id+"_"+_b2);
_b4.style.color=_58["cuesTabCaptionInactive"];
var _b3=document.getElementById(id+"_"+_b2+"_fill");
if(_b3!=null){
_b3.color=_58["cuesTabInactiveStartGradient"];
_b3.color2=_58["cuesTabInactiveStopGradient"];
_b3.colors.value=_b3.inactivecolors;
}
var _b3=document.getElementById(id+"_"+_b2+"_stroke");
if(_b3!=null){
_b3.color=_58["cuesTabInactiveStroke"];
}
};
function _29(id,_b5){
var _b6=document.getElementById(id+"_"+_b5+"_tab");
if(_b6==null){
return;
}
if(_b6.active=="true"){
return;
}
var _b7=document.getElementById("cuesid_"+id+"_"+_b5);
_b7.style.color=_58["cuesTabCaptionHover"];
var _b8=_b6.getElementsByTagName("rect")[1];
_b8.style.cssText=_b8.style.cssText.replace("#inactivetab_grad","#hovertab_grad");
_b8.setAttributeNS(null,"stroke",_58["cuesTabHoverStroke"]);
};
function _2a(id,_b9){
var _ba=document.getElementById(id+"_"+_b9+"_tab");
if(_ba==null){
return;
}
if(_ba.active=="true"){
return;
}
var _bb=document.getElementById("cuesid_"+id+"_"+_b9);
_bb.style.color=_58["cuesTabCaptionInactive"];
var _bc=_ba.getElementsByTagName("rect")[1];
_bc.style.cssText=_bc.style.cssText.replace("#hovertab_grad","#inactivetab_grad");
_bc.setAttributeNS(null,"stroke",_58["cuesTabInactiveStroke"]);
};
function _c(id,_bd,cnt){
var _be=document.getElementById(id);
if(_be==null){
return;
}
var h=_be.offsetHeight;
if(cnt==null){
cnt=1;
}
if(h==0&&_bd==null&&cnt<10){
var _bf=100;
try{
if(_be.parentNode.offsetHeight==0){
_bf=250;
}
}
catch(e){
}
setTimeout("cuesDrawnShape.makePrimaryTabset('"+id+"',null,"+(cnt+1)+")",_bf);
return;
}
var _c0=_be.getElementsByTagName("table")[0];
var _c1=_c0.rows.length;
var _c2=_c0.rows[0].offsetHeight;
var _c3=Math.floor(_c2/2);
if(cuesCSSMode+""=="highcontrast"){
_c3=Math.floor(_c2);
}
var _c4=h-_c2-2;
_be.style.height=h;
var _c5=document.createElement("div");
_c5.style.position="absolute";
_c5.style.top="0px";
_c5.style.left="0px";
_c5.style.height=_c2+"px";
_c5.style.width="100%";
_c5.style.zIndex="-1";
_be.appendChild(_c5);
var _c6="";
_c6+="<cues_vml:roundrect style=\"position:absolute;top:0px;left:0px;height:"+_c2+"px;width:100%;\" arcsize=\"0.05\" filled=\"f\" strokecolor=\""+_58["cuesPrimaryTabsetStroke"]+"\">";
if(cuesCSSMode+""=="highcontrast"){
_c6+="<cues_vml:stroke opacity=\"1\"/>";
}else{
_c6+="<cues_vml:stroke opacity=\".5\"/>";
}
_c6+="</cues_vml:roundrect>";
if(cuesCSSMode+""=="highcontrast"){
_c6+="<div style=\"padding:0px;\">";
}else{
_c6+="<div style=\"padding:2px 2px 0px 2px;\">";
}
_c6+="<div style=\"position:relative;height:"+(_c3+1)+"px;\">";
_c6+="<cues_vml:roundrect style=\"position:absolute;top:0px;left:0px;height:"+_c3+"px;width:100%;\" arcsize=\"0.05\" fillcolor=\""+_58["cuesPrimaryTabsetStartGradient"]+"\" stroked=\"f\">";
if(cuesCSSMode+""=="highcontrast"){
_c6+="<cues_vml:fill color2=\""+_58["cuesPrimaryTabsetStopGradient"]+"\" angle=\"-180\"/>";
}else{
_c6+="<cues_vml:fill color2=\""+_58["cuesPrimaryTabsetStopGradient"]+"\" opacity=\"0.30\" angle=\"-180\"/>";
}
_c6+="</cues_vml:roundrect>";
_c6+="</div>";
_c6+="</div>";
if(cuesUsage+""=="portal"&&_c1>1){
var _c7=2/_c4;
_c6+="<cues_vml:roundrect style=\"position:absolute;top:"+(_c2+1)+"px;height:"+_c4+"px;width:100%;\" arcsize=\""+_c7+"\" fillcolor=\"#ffffff;\" stroked=\"f\">";
_c6+="<cues_vml:fill color2=\"#ffffff\" opacity=\"0.67\" angle=\"-180\"/>";
_c6+="</cues_vml:roundrect>";
var _c8=5;
var _c9=0.6;
var _ca=_c9/_c8;
_c6+="<div style=\"overflow:hidden;position:absolute;top:"+(_c2+1)+"px;height:"+_c8+"px;width:100%;\">";
for(var i=0;i<_c8;i++){
_c6+="<cues_vml:line from=\"-2,"+i+"\" to=\"4000,"+i+"\">";
_c6+="<cues_vml:stroke color=\"#000000\" opacity=\""+_c9+"\"/>";
_c6+="</cues_vml:line>";
_c9-=_ca;
}
_c6+="</div>";
}
_c5.innerHTML=_c6;
};
function _2c(id,_cb){
var _cc=document.getElementById(id);
if(_cc==null){
return;
}
var _cd=document.createElementNS(_57,"svg");
_cd.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_cd.setAttributeNS(null,"height","31px");
_cd.setAttributeNS(null,"width","100%");
if(_3||_4){
_cd.setAttributeNS(null,"onresize","cuesDrawnShape.onresizePrimaryTabsetHandler('"+id+"')");
}
_cc.appendChild(_cd);
var _ce=_cc.getElementsByTagName("table")[0];
var _cf=_ce.rows.length;
var h=parseInt(_cc.offsetHeight);
if(cuesUsage+""=="portal"&&_cf>1){
h+=1;
}
var _d0=_ce.rows[0].offsetHeight;
var _d1=Math.floor(_d0/2);
if(cuesCSSMode+""=="highcontrast"){
_d1=Math.floor(_d0);
}
var _d2=h-_d0;
_cd.setAttributeNS(null,"height",(h+1)+"px");
if(_4e==null){
var _d3="";
_d3+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_d3+="<defs>";
_d3+="<linearGradient id=\"primarytabset_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
if(cuesCSSMode+""=="highcontrast"){
_d3+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesPrimaryTabsetStartGradient"]+";\"/>";
_d3+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesPrimaryTabsetStopGradient"]+";\"/>";
}else{
_d3+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesPrimaryTabsetStartGradient"]+";stop-opacity:.3;\"/>";
_d3+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesPrimaryTabsetStopGradient"]+";stop-opacity:.07;\"/>";
}
_d3+="</linearGradient>";
_d3+="<clipPath id=\"primarytabset_left_clip\">";
if(cuesCSSMode+""=="highcontrast"){
_d3+="<rect x=\"0\" y=\"0\" width=\"60%\" height=\""+_d0+"\"/>";
}else{
_d3+="<rect x=\"0\" y=\"0\" width=\"50%\" height=\""+_d0+"\"/>";
}
_d3+="</clipPath>";
_d3+="<clipPath id=\"primarytabset_right_clip\">";
_d3+="<rect x=\"50%\" y=\"0\" width=\"100%\" height=\""+_d0+"\"/>";
_d3+="</clipPath>";
if(cuesUsage+""=="portal"&&_cf>1){
_d3+="<linearGradient id=\"primarytabset_shadow_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"5\">";
_d3+="<stop offset=\"0%\" style=\"stop-color:#000000;stop-opacity:.78;\"/>";
_d3+="<stop offset=\"20%\" style=\"stop-color:#000000;stop-opacity:0;\"/>";
_d3+="</linearGradient>";
}
_d3+="</defs>";
_d3+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\""+_d0+"\" style=\"fill:none;stroke:"+_58["cuesPrimaryTabsetStroke"]+";stroke-width:1.5px;stroke-opacity:.5;\"/>";
if(cuesCSSMode+""=="highcontrast"){
_d3+="<rect rx=\"2\" ry=\"2\" x=\"1\" y=\"1\" width=\"100%\" height=\""+(_d1-1)+"\" style=\"fill:url(#primarytabset_grad);\" clip-path=\"url(#primarytabset_left_clip)\"/>";
_d3+="<rect rx=\"2\" ry=\"2\" x=\"-1\" y=\"1\" width=\"100%\" height=\""+(_d1-1)+"\" style=\"fill:url(#primarytabset_grad);\" clip-path=\"url(#primarytabset_right_clip)\"/>";
}else{
_d3+="<rect rx=\"2\" ry=\"2\" x=\"2\" y=\"2\" width=\"100%\" height=\""+_d1+"\" style=\"fill:url(#primarytabset_grad);\" clip-path=\"url(#primarytabset_left_clip)\"/>";
_d3+="<rect rx=\"2\" ry=\"2\" x=\"-2\" y=\"2\" width=\"100%\" height=\""+_d1+"\" style=\"fill:url(#primarytabset_grad);\" clip-path=\"url(#primarytabset_right_clip)\"/>";
}
if(cuesUsage+""=="portal"&&_cf>1){
_d3+="<rect rx=\"2\" ry=\"2\" x=\"0\" y=\""+_d0+"\" width=\"100%\" height=\""+_d2+"px\" style=\"opacity:.67;fill:#ffffff;\"/>";
_d3+="<rect rx=\"2\" ry=\"2\" x=\"0\"  y=\""+_d0+"\" width=\"100%\" height=\"5px\" style=\"fill:url(#primarytabset_shadow_grad);\" />";
}
_d3+="</svg>";
var _d4=new DOMParser();
_4e=_d4.parseFromString(_d3,"text/xml");
}
var _d5=_4e.documentElement;
var len=_d5.childNodes.length;
for(var i=0;i<len;++i){
_cd.appendChild(document.importNode(_d5.childNodes[i],true));
}
};
function _e(id,_d6){
var obj=document.getElementById(id+"_"+_d6+"_fill");
obj.color=_58["cuesPrimaryTabActiveStartGradient"];
obj.color2=_58["cuesPrimaryTabActiveStopGradient"];
obj.opacity=1;
obj.opacity2=1;
obj.angle=180;
var _d7=document.getElementById("cuesid_"+id+"_"+_d6);
_d7.className="cuesPrimaryTabLink cuesShadowIE";
_d7.style.color="";
var obj=document.getElementById(id+"_"+_d6+"_tab");
obj.className="cuesPrimaryTab cuesPrimaryTabCaptionActive";
obj.active="true";
var obj=document.getElementById(id+"_"+_d6+"_outline");
obj.color=_58["cuesPrimaryTabActiveStroke"];
var obj=document.getElementById(id+"_"+_d6+"_shape");
if(obj!=null){
obj.style.display="";
}
};
function _2e(id,_d8){
var obj=document.getElementById(id+"_"+_d8+"_tab");
obj.className="cuesPrimaryTab cuesPrimaryTabCaptionActive";
obj.active="true";
var _d9=document.getElementById("cuesid_"+id+"_"+_d8);
_d9.className="cuesPrimaryTabLink cuesShadowFF";
_d9.style.color="";
var _da=obj.getElementsByTagName("rect");
_da[0].style.cssText=_da[0].style.cssText.replace("#hoverprimarytab_grad","#activeprimarytab_grad");
_da[0].style.display="";
_da[0].setAttributeNS(null,"stroke",_58["cuesPrimaryTabActiveStroke"]);
};
function _f(id,_db){
var obj=document.getElementById(id+"_"+_db+"_tab");
obj.className="cuesPrimaryTab cuesPrimaryTabCaptionInactive";
obj.opacity=0.3;
obj.opacity2=0.07;
obj.active="false";
var obj=document.getElementById(id+"_"+_db+"_shape");
obj.style.display="none";
};
function _2f(id,_dc){
var obj=document.getElementById(id+"_"+_dc+"_tab");
obj.className="cuesPrimaryTab cuesPrimaryTabCaptionInactive";
obj.active="false";
var _dd=obj.getElementsByTagName("rect");
_dd[0].style.display="none";
_dd[0].setAttributeNS(null,"stroke",_58["cuesPrimaryTabHoverStroke"]);
};
function _d(id,_de,_df,_e0,cnt){
var _e1=document.getElementById(id+"_"+_de+"_tab");
if(_e1==null){
return;
}
var h=_e1.offsetHeight;
if(cnt==null){
cnt=1;
}
if(h==0&&_e0==null){
if(cnt<10){
var _e2=100;
try{
if(_e1.parentNode.offsetHeight==0){
_e2=250;
}
}
catch(e){
}
setTimeout("cuesDrawnShape.makePrimaryTab('"+id+"',"+_de+","+_df+",null,"+(cnt+1)+")",_e2);
}
return;
}
var w1=_e1.offsetWidth;
if(h==0){
h=20;
}
if(w1==0){
w1=100;
}
_e1.style.height=h+1;
_e1.style.width=w1;
var w=_e1.offsetWidth;
if(w==0){
w="100%";
}
if(w>_e1.scrollWidth&&w>1000){
w=_e1.scrollWidth;
}
_e1.style.width=w;
_e1.active=_df?"true":"false";
var _e3=document.createElement("div");
_e3.style.position="absolute";
_e3.style.top="0px";
_e3.style.left="0px";
_e3.style.zIndex="-1";
_e1.appendChild(_e3);
var _e4="";
_e4+="<cues_vml:roundrect id=\""+id+"_"+_de+"_shape\" style=\""+(_df?"":"display:none;")+"height:"+h+"px;width:"+w+"px;position:absolute;padding:0px;top:0px;left:0px;margin:0px;\" arcsize=\"0.1\">";
_e4+="<cues_vml:stroke id=\""+id+"_"+_de+"_outline\" dashstyle=\"solid\" color=\""+_58["cuesPrimaryTabActiveStroke"]+"\"/>";
_e4+="<cues_vml:fill id=\""+id+"_"+_de+"_fill\" type=\"gradient\"";
_e4+=" angle=\"180\" ";
_e4+=" color=\""+_58["cuesPrimaryTabActiveStartGradient"]+"\"";
_e4+=" color2=\""+_58["cuesPrimaryTabActiveStopGradient"]+"\"/>";
_e4+="</cues_vml:roundrect>";
_e3.innerHTML=_e4;
var _e5=document.getElementById("cuesid_"+id+"_"+_de);
_e5.className="cuesPrimaryTabLink cuesShadowIE";
};
function _2d(id,_e6,_e7){
var _e8=document.getElementById(id+"_"+_e6+"_tab");
if(_e8==null){
return;
}
var h=_e8.offsetHeight;
var w=_e8.offsetWidth;
_e8.style.width=w;
_e8.active=_e7?"true":"false";
var _e9=document.createElementNS(_57,"svg");
_e9.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_e9.setAttributeNS(null,"height",h+"px");
_e8.appendChild(_e9);
if(_4f==null){
var _ea="";
_ea+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_ea+="<defs>";
_ea+="<linearGradient id=\"activeprimarytab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_ea+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesPrimaryTabActiveStartGradient"]+";stop-opacity:1;\"/>";
_ea+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesPrimaryTabActiveStopGradient"]+";stop-opacity:1;\"/>";
_ea+="</linearGradient>";
_ea+="</defs>";
_ea+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" stroke=\""+_58["cuesPrimaryTabActiveStroke"]+"\" style=\"fill:url(#activeprimarytab_grad);stroke-width:1px;stroke-opacity:1;\"/>";
_ea+="</svg>";
var _eb=new DOMParser();
_4f=_eb.parseFromString(_ea,"text/xml");
}
if(_50==null){
var _ea="";
_ea+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_ea+="<defs>";
_ea+="<linearGradient id=\"hoverprimarytab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_ea+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesPrimaryTabHoverStartGradient"]+";stop-opacity:1;\"/>";
_ea+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesPrimaryTabHoverStopGradient"]+";stop-opacity:1;\"/>";
_ea+="</linearGradient>";
_ea+="</defs>";
_ea+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" stroke=\""+_58["cuesPrimaryTabHoverStroke"]+"\" style=\"display:none;fill:url(#hoverprimarytab_grad);stroke-width:1px;stroke-opacity:1;\"/>";
_ea+="</svg>";
var _eb=new DOMParser();
_50=_eb.parseFromString(_ea,"text/xml");
}
var _ec;
if(_e7){
_ec=_4f.documentElement;
}else{
_ec=_50.documentElement;
}
var len=_ec.childNodes.length;
for(var i=0;i<len;++i){
_e9.appendChild(document.importNode(_ec.childNodes[i],true));
}
var _ed=document.getElementById("cuesid_"+id+"_"+_e6);
var _ee=_ed.getElementsByTagName("span")[0].textContent;
_ed.setAttribute("shadowText",_ee);
_ed.className="cuesPrimaryTabLink cuesShadowFF";
};
function _10(id,_ef){
var _f0=document.getElementById(id+"_"+_ef+"_tab");
if(_f0==null){
return;
}
if(_f0.active=="true"){
return;
}
var _f1=document.getElementById("cuesid_"+id+"_"+_ef);
_f1.className="cuesPrimaryTabLink";
_f1.style.color=_58["cuesPrimaryTabCaptionHover"];
var _f0=document.getElementById(id+"_"+_ef+"_fill");
if(_f0==null){
return;
}
_f0.color=_58["cuesPrimaryTabHoverStartGradient"];
_f0.color2=_58["cuesPrimaryTabHoverStopGradient"];
var _f0=document.getElementById(id+"_"+_ef+"_outline");
_f0.color=_58["cuesPrimaryTabHoverStroke"];
var _f0=document.getElementById(id+"_"+_ef+"_shape");
if(_f0==null){
return;
}
_f0.style.display="";
};
function _11(id,_f2){
var _f3=document.getElementById(id+"_"+_f2+"_tab");
if(_f3==null){
return;
}
if(_f3.active=="true"){
return;
}
var _f4=document.getElementById("cuesid_"+id+"_"+_f2);
_f4.className="cuesPrimaryTabLink cuesShadowIE";
_f4.style.color=_58["cuesPrimaryTabCaptionInactive"];
var _f3=document.getElementById(id+"_"+_f2+"_shape");
if(_f3==null){
return;
}
_f3.style.display="none";
};
function _30(id,_f5){
var _f6=document.getElementById(id+"_"+_f5+"_tab");
if(_f6==null){
return;
}
if(_f6.active=="true"){
return;
}
var _f7=document.getElementById("cuesid_"+id+"_"+_f5);
_f7.className="cuesPrimaryTabLink";
_f7.style.color=_58["cuesPrimaryTabCaptionHover"];
var _f8=_f6.getElementsByTagName("rect")[0];
_f8.style.cssText=_f8.style.cssText.replace("#activeprimarytab_grad","#hoverprimarytab_grad");
_f8.style.display="";
};
function _31(id,_f9){
var _fa=document.getElementById(id+"_"+_f9+"_tab");
if(_fa==null){
return;
}
if(_fa.active=="true"){
return;
}
var _fb=document.getElementById("cuesid_"+id+"_"+_f9);
_fb.className="cuesPrimaryTabLink cuesShadowFF";
_fb.style.color=_58["cuesPrimaryTabCaptionInactive"];
var _fc=_fa.getElementsByTagName("rect")[0];
_fc.style.display="none";
};
function _13(id,_fd){
var obj=document.getElementById(id+"_"+_fd+"_fill");
obj.colors.value=obj.activecolors;
obj.color=_58["cuesSecondaryTabActiveStartGradient"];
obj.color2=_58["cuesSecondaryTabActiveStopGradient"];
var _fe=document.getElementById("cuesid_"+id+"_"+_fd);
_fe.style.color="";
var obj=document.getElementById(id+"_"+_fd+"_tab");
obj.className="cuesSecondaryTab cuesSecondaryTabCaptionActive";
obj.active="true";
var obj=document.getElementById(id+"_"+_fd+"_outline");
obj.color=_58["cuesSecondaryTabActiveStroke"];
};
function _33(id,_ff){
var obj=document.getElementById(id+"_"+_ff+"_tab");
obj.className="cuesSecondaryTab cuesSecondaryTabCaptionActive";
obj.active="true";
var _100=document.getElementById("cuesid_"+id+"_"+_ff);
_100.style.color="";
var rect=obj.getElementsByTagName("rect");
rect[0].style.cssText=rect[0].style.cssText.replace("#inactivesecondarytab_grad","#activesecondarytab_grad");
rect[0].style.cssText=rect[0].style.cssText.replace("#hoversecondarytab_grad","#activesecondarytab_grad");
rect[0].setAttributeNS(null,"stroke",_58["cuesSecondaryTabActiveStroke"]);
};
function _14(id,_101){
var obj=document.getElementById(id+"_"+_101+"_fill");
obj.color=_58["cuesSecondaryTabInactiveStartGradient"];
obj.color2=_58["cuesSecondaryTabInactiveStopGradient"];
obj.colors.value=obj.inactivecolors;
var _102=document.getElementById("cuesid_"+id+"_"+_101);
_102.style.color="";
var obj=document.getElementById(id+"_"+_101+"_tab");
obj.className="cuesSecondaryTab cuesSecondaryTabCaptionInactive";
obj.active="false";
var obj=document.getElementById(id+"_"+_101+"_outline");
obj.color=_58["cuesSecondaryTabInactiveStroke"];
};
function _34(id,_103){
var obj=document.getElementById(id+"_"+_103+"_tab");
obj.className="cuesSecondaryTab cuesSecondaryTabCaptionInactive";
obj.active="false";
var rect=obj.getElementsByTagName("rect");
rect[0].style.cssText=rect[0].style.cssText.replace("#activesecondarytab_grad","#inactivesecondarytab_grad");
rect[0].setAttributeNS(null,"stroke",_58["cuesSecondaryTabInactiveStroke"]);
};
function _12(id,_104,_105,_106,cnt){
var _107=document.getElementById(id+"_"+_104+"_tab");
if(_107==null){
return;
}
var h=_107.offsetHeight;
if(cnt==null){
cnt=1;
}
if(h==0&&_106==null&&cnt<10){
var _108=100;
try{
if(_107.parentNode.offsetHeight==0){
_108=250;
}
}
catch(e){
}
setTimeout("cuesDrawnShape.makeSecondaryTab('"+id+"',"+_104+","+_105+",null,"+(cnt+1)+")",_108);
return;
}
var w1=_107.offsetWidth;
if(h==0){
h=20;
}
if(w1==0){
w1=100;
}
_107.style.height=h+1;
_107.style.width=w1;
var w=_107.offsetWidth;
if(w==0){
w="100%";
}
if(w>_107.scrollWidth&&w>1000){
w=_107.scrollWidth;
}
_107.style.width=w;
_107.active=_105?"true":"false";
var _109=document.createElement("div");
_109.style.position="absolute";
_109.style.top="0px";
_109.style.left="0px";
_109.style.zIndex="-1";
_107.appendChild(_109);
var _10a=_105?"Active":"Inactive";
var _10b="";
_10b+="<cues_vml:roundrect id=\""+id+"_"+_104+"_shape\" style=\"height:"+(2*h)+"px;width:"+w+"px;position:absolute;padding:0;top:0px;left:0px;margin:0;padding:0px;clip:rect(0px,auto,"+(h+2)+"px,auto);\" arcsize=\"0.05\">";
_10b+="<cues_vml:stroke id=\""+id+"_"+_104+"_outline\" dashstyle=\"solid\" color=\""+_58["cuesSecondaryTab"+_10a+"Stroke"]+"\"/>";
_10b+="<cues_vml:fill id=\""+id+"_"+_104+"_fill\" type=\"gradient\"";
_10b+=" angle=\"180\"";
_10b+=" activecolors=\"50% "+_58["cuesSecondaryTabActiveStopGradient"]+"\"";
_10b+=" inactivecolors=\"25% "+_58["cuesSecondaryTabInactiveStopGradient1"]+", 26% "+_58["cuesSecondaryTabInactiveStartGradient2"]+"\"";
_10b+=" hovercolors=\"25% "+_58["cuesSecondaryTabHoverStopGradient1"]+", 26% "+_58["cuesSecondaryTabHoverStartGradient2"]+"\"";
if(_105){
_10b+=" colors=\"50% "+_58["cuesSecondaryTabActiveStopGradient"]+"\"";
}else{
_10b+=" colors=\"25% "+_58["cuesSecondaryTabInactiveStopGradient1"]+", 26% "+_58["cuesSecondaryTabInactiveStartGradient2"]+"\"";
}
_10b+=" color=\""+_58["cuesSecondaryTab"+_10a+"StartGradient"]+"\"";
_10b+=" color2=\""+_58["cuesSecondaryTab"+_10a+"StopGradient"]+"\"/>";
_10b+="</cues_vml:roundrect>";
_109.innerHTML=_10b;
};
function _32(id,_10c,_10d){
var _10e=document.getElementById(id+"_"+_10c+"_tab");
if(_10e==null){
return;
}
var h=_10e.offsetHeight;
var w=_10e.offsetWidth;
_10e.style.width=w;
_10e.active=_10d?"true":"false";
var _10f=document.createElementNS(_57,"svg");
_10f.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_10f.setAttributeNS(null,"height",h+"px");
_10e.appendChild(_10f);
if(_52==null){
var _110="";
_110+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_110+="<defs>";
_110+="<linearGradient id=\"activesecondarytab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_110+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesSecondaryTabActiveStartGradient"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesSecondaryTabActiveStopGradient"]+";stop-opacity:1;\"/>";
_110+="</linearGradient>";
_110+="</defs>";
_110+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"200%\" stroke=\""+_58["cuesSecondaryTabActiveStroke"]+"\" style=\"fill:url(#activesecondarytab_grad);stroke-width:1px;stroke-opacity:1;\"/>";
_110+="</svg>";
var _111=new DOMParser();
_52=_111.parseFromString(_110,"text/xml");
}
if(_53==null){
var _110="";
_110+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_110+="<defs>";
_110+="<linearGradient id=\"hoversecondarytab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_110+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesSecondaryTabHoverStartGradient"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"25%\" style=\"stop-color:"+_58["cuesSecondaryTabHoverStopGradient1"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"26%\" style=\"stop-color:"+_58["cuesSecondaryTabHoverStartGradient2"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesSecondaryTabHoverStopGradient"]+";stop-opacity:1;\"/>";
_110+="</linearGradient>";
_110+="<linearGradient id=\"inactivesecondarytab_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_110+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesSecondaryTabInactiveStartGradient"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"25%\" style=\"stop-color:"+_58["cuesSecondaryTabInactiveStopGradient1"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"26%\" style=\"stop-color:"+_58["cuesSecondaryTabInactiveStartGradient2"]+";stop-opacity:1;\"/>";
_110+="<stop offset=\"50%\" style=\"stop-color:"+_58["cuesSecondaryTabInactiveStopGradient"]+";stop-opacity:1;\"/>";
_110+="</linearGradient>";
_110+="</defs>";
_110+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"200%\" stroke=\""+_58["cuesSecondaryTabInactiveStroke"]+"\" style=\"fill:url(#inactivesecondarytab_grad);stroke-width:1.5px;stroke-opacity:1;\"/>";
_110+="</svg>";
var _111=new DOMParser();
_53=_111.parseFromString(_110,"text/xml");
}
var root;
if(_10d){
root=_52.documentElement;
}else{
root=_53.documentElement;
}
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_10f.appendChild(document.importNode(root.childNodes[i],true));
}
};
function _15(id,_112){
var _113=document.getElementById(id+"_"+_112+"_tab");
if(_113==null){
return;
}
if(_113.active=="true"){
return;
}
var _114=document.getElementById("cuesid_"+id+"_"+_112);
_114.style.color=_58["cuesSecondaryTabCaptionHover"];
var _113=document.getElementById(id+"_"+_112+"_fill");
if(_113==null){
return;
}
_113.color=_58["cuesSecondaryTabHoverStartGradient"];
_113.color2=_58["cuesSecondaryTabHoverStopGradient"];
_113.colors.value=_113.hovercolors;
var _113=document.getElementById(id+"_"+_112+"_outline");
_113.color=_58["cuesSecondaryTabHoverStroke"];
};
function _16(id,_115){
var _116=document.getElementById(id+"_"+_115+"_tab");
if(_116==null){
return;
}
if(_116.active=="true"){
return;
}
var _117=document.getElementById("cuesid_"+id+"_"+_115);
_117.style.color=_58["cuesSecondaryTabCaptionInactive"];
var _116=document.getElementById(id+"_"+_115+"_fill");
if(_116==null){
return;
}
_116.color=_58["cuesSecondaryTabInactiveStartGradient"];
_116.color2=_58["cuesSecondaryTabInactiveStopGradient"];
_116.colors.value=_116.inactivecolors;
var _116=document.getElementById(id+"_"+_115+"_outline");
_116.color=_58["cuesSecondaryTabInactiveStroke"];
};
function _35(id,_118){
var _119=document.getElementById(id+"_"+_118+"_tab");
if(_119==null){
return;
}
if(_119.active=="true"){
return;
}
var _11a=document.getElementById("cuesid_"+id+"_"+_118);
_11a.style.color=_58["cuesSecondaryTabCaptionHover"];
var rect=_119.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#inactivesecondarytab_grad","#hoversecondarytab_grad");
rect.setAttributeNS(null,"stroke",_58["cuesSecondaryTabHoverStroke"]);
};
function _36(id,_11b){
var _11c=document.getElementById(id+"_"+_11b+"_tab");
if(_11c==null){
return;
}
if(_11c.active=="true"){
return;
}
var _11d=document.getElementById("cuesid_"+id+"_"+_11b);
_11d.style.color=_58["cuesSecondaryTabCaptionInactive"];
var rect=_11c.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#hoversecondarytab_grad","#inactivesecondarytab_grad");
rect.setAttributeNS(null,"stroke",_58["cuesSecondaryTabInactiveStroke"]);
};
function _19(_11e,_11f){
var _120=false;
try{
var obj=document.getElementById(_11e);
if(obj!=null){
obj.className="cuesDrawer cuesDrawerCaptionActive";
obj.active="true";
var obj=document.getElementById(_11e+"_fill");
if(obj!=null){
_120=true;
obj.color=_58["cuesDrawerActiveStartGradient"];
obj.color2=_58["cuesDrawerActiveStopGradient"];
obj.colors.value="";
}
}
}
catch(e){
}
return _120;
};
function _39(_121){
try{
var obj=document.getElementById(_121);
obj.className="cuesDrawer cuesDrawerCaptionActive";
obj.setAttribute("active","true");
var rect=obj.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#inactivedrawer_grad","#activedrawer_grad");
rect.style.cssText=rect.style.cssText.replace("#hoverdrawer_grad","#activedrawer_grad");
return true;
}
catch(e){
}
return false;
};
function _1a(_122,_123){
try{
var obj=document.getElementById(_122);
if(obj!=null){
obj.className="cuesDrawer cuesDrawerCaptionInactive";
obj.active="false";
var obj=document.getElementById(_122+"_fill");
if(obj!=null){
obj.color=_58["cuesDrawerInactiveStartGradient"];
obj.color2=_58["cuesDrawerInactiveStopGradient"];
obj.colors.value=obj.inactivecolors;
}else{
if(_123==null){
setTimeout("cuesDrawnShape.makeDrawerInactive('"+_122+"',true)",10);
}
}
}
}
catch(e){
}
};
function _3a(_124){
var obj=document.getElementById(_124);
obj.className="cuesDrawer cuesDrawerCaptionInactive";
obj.setAttribute("active","false");
var rect=obj.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#activedrawer_grad","#inactivedrawer_grad");
};
function _18(_125,w){
var _126=document.getElementById(_125);
if(_126==null){
return;
}
if(w!=null){
_126.style.width=(w-1)+"px";
}else{
_126.style.width=(_126.parentNode.parentNode.clientWidth-1)+"px";
}
var rect=_126.getElementsByTagName("rect");
if(rect.length==0){
return;
}
rect[0].style.width=_126.offsetWidth+"px";
var h=(document.documentMode==null||document.documentMode<8)?_126.offsetHeight:_126.clientHeight;
rect[0].style.height=h+"px";
if(_126.active=="true"){
cuesDrawnShape.makeDrawerActive(_125);
}
};
function _38(_127,w){
var _128=document.getElementById(_127);
if(_128==null){
return;
}
if(w!=null){
_128.style.width=w+"px";
}else{
_128.style.width=_128.parentNode.offsetWidth+"px";
}
var _129=document.getElementById(_127+"_svg");
if(_129==null){
return;
}
_129.setAttributeNS(null,"height",_128.offsetHeight+"px");
_129.setAttributeNS(null,"width",_128.offsetWidth+"px");
};
function _17(_12a,_12b){
var _12c=document.getElementById(_12a);
if(_12c==null){
return;
}
var h=_12c.offsetHeight;
var w=_12c.offsetWidth;
if(w==0){
var pn=_12c.parentNode;
while(pn!=null&&w==0){
try{
if(pn.currentStyle.width!="auto"){
w=parseInt(pn.currentStyle.width+" ");
}
}
catch(e){
}
pn=pn.parentNode;
}
if(w>1){
w--;
}
}
_12c.active="false";
if(h==0){
h=30;
}
if(w==0){
w=200;
}
var _12d=document.createElement("div");
_12d.style.position="absolute";
_12d.style.top="0px";
_12d.style.left="0px";
_12d.style.width="600px";
_12d.style.height="300px";
_12d.style.zIndex="-1";
_12d.style.overflow="hidden";
_12c.appendChild(_12d);
var _12e="";
_12e+="<cues_vml:rect style=\"height:"+h+"px;width:"+w+"px;position:absolute;top:0px;left:0px;margin:0;padding:0px;\">";
_12e+="<cues_vml:stroke id=\""+_12a+"_stroke\" dashstyle=\"solid\" color=\""+_58["cuesDrawerInactiveStroke"]+"\"/>";
_12e+="<cues_vml:fill id=\""+_12a+"_fill\" type=\"gradient\" angle=\"180\"";
_12e+=" colors=\""+_59+" "+_58["cuesDrawerInactiveStopGradient1"]+", "+_5a+" "+_58["cuesDrawerInactiveStartGradient2"]+", "+_5b+" "+_58["cuesDrawerInactiveStopGradient2"]+", "+_5c+" "+_58["cuesDrawerInactiveStartGradient3"]+"\"";
_12e+=" inactivecolors=\""+_59+" "+_58["cuesDrawerInactiveStopGradient1"]+", "+_5a+" "+_58["cuesDrawerInactiveStartGradient2"]+", "+_5b+" "+_58["cuesDrawerInactiveStopGradient2"]+", "+_5c+" "+_58["cuesDrawerInactiveStartGradient3"]+"\"";
_12e+=" hovercolors=\""+_5d+" "+_58["cuesDrawerHoverStopGradient1"]+", "+_5e+" "+_58["cuesDrawerHoverStartGradient2"]+"\"";
_12e+=" color=\""+_58["cuesDrawerInactiveStartGradient"]+"\"";
_12e+=" color2=\""+_58["cuesDrawerInactiveStopGradient"]+"\"/>";
_12e+="</cues_vml:rect>";
_12d.innerHTML=_12e;
};
function _37(_12f){
var _130=document.getElementById(_12f);
if(_130==null){
return;
}
var h=_130.offsetHeight;
var w=_130.offsetWidth;
_130.style.width=w;
_130.setAttribute("active","false");
var _131=document.createElementNS(_57,"svg");
_131.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_131.setAttributeNS(null,"height",_130.offsetHeight+"px");
_131.setAttributeNS(null,"id",_12f+"_svg");
_131.setAttributeNS(null,"shape-rendering","geometric-precision");
_130.appendChild(_131);
if(_4b==null){
var _132="";
_132+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_132+="<defs>";
_132+="<linearGradient id=\"activedrawer_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_132+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesDrawerActiveStartGradient"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesDrawerActiveStopGradient"]+";stop-opacity:1;\"/>";
_132+="</linearGradient>";
_132+="<linearGradient id=\"hoverdrawer_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_132+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesDrawerHoverStartGradient"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_5d+"\" style=\"stop-color:"+_58["cuesDrawerHoverStopGradient1"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_5e+"\" style=\"stop-color:"+_58["cuesDrawerHoverStartGradient2"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesDrawerHoverStopGradient"]+";stop-opacity:1;\"/>";
_132+="</linearGradient>";
_132+="<linearGradient id=\"inactivedrawer_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_132+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesDrawerInactiveStartGradient"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_59+"\" style=\"stop-color:"+_58["cuesDrawerInactiveStopGradient1"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_5a+"\" style=\"stop-color:"+_58["cuesDrawerInactiveStartGradient2"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_5b+"\" style=\"stop-color:"+_58["cuesDrawerInactiveStopGradient2"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\""+_5c+"\" style=\"stop-color:"+_58["cuesDrawerInactiveStartGradient3"]+";stop-opacity:1;\"/>";
_132+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesDrawerInactiveStopGradient"]+";stop-opacity:1;\"/>";
_132+="</linearGradient>";
_132+="</defs>";
_132+="<rect x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" style=\"fill:url(#inactivedrawer_grad);stroke:"+_58["cuesDrawerInactiveStroke"]+";stroke-width:2px;stroke-opacity:.5;\"/>";
_132+="</svg>";
var _133=new DOMParser();
_4b=_133.parseFromString(_132,"text/xml");
}
var root=_4b.documentElement;
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_131.appendChild(document.importNode(root.childNodes[i],true));
}
};
function _1b(_134){
try{
var _135=document.getElementById(_134);
if(_135==null){
return;
}
if(_135.active=="true"){
return;
}
var _135=document.getElementById(_134+"_fill");
if(_135==null){
return;
}
_135.color=_58["cuesDrawerHoverStartGradient"];
_135.color2=_58["cuesDrawerHoverStopGradient"];
_135.colors.value=_135.hovercolors;
}
catch(e){
}
};
function _1c(_136){
var _137=document.getElementById(_136);
if(_137==null){
return;
}
if(_137.active=="true"){
return;
}
var _137=document.getElementById(_136+"_fill");
if(_137==null){
return;
}
_137.color=_58["cuesDrawerInactiveStartGradient"];
_137.color2=_58["cuesDrawerInactiveStopGradient"];
_137.colors.value=_137.inactivecolors;
};
function _3b(_138){
try{
var _139=document.getElementById(_138);
if(_139==null){
return;
}
if(_139.getAttribute("active")=="true"){
return;
}
var rect=_139.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#inactivedrawer_grad","#hoverdrawer_grad");
}
catch(e){
}
};
function _3c(_13a){
try{
var _13b=document.getElementById(_13a);
if(_13b==null){
return;
}
if(_13b.getAttribute("active")=="true"){
return;
}
var rect=_13b.getElementsByTagName("rect")[0];
rect.style.cssText=rect.style.cssText.replace("#hoverdrawer_grad","#inactivedrawer_grad");
}
catch(e){
}
};
function _1d(id,_13c){
var _13d=document.getElementById(id);
if(_13d==null){
return;
}
var h=_13d.offsetHeight;
if(h==0&&_13c==null){
setTimeout("cuesDrawnShape.makeDashboard('"+id+"',true)",250);
return;
}
h=Math.max(h,23);
var _13e=document.getElementById(id+".graphic");
if(_13e==null){
_13e=document.createElement("div");
_13e.id=id+".graphic";
_13e.style.position="absolute";
_13e.style.top="0px";
_13e.style.left="0px";
_13e.style.width="100%";
_13e.style.height=Math.max(1,h-1)+"px";
_13e.style.zIndex="-2";
_13e.style.overflow="hidden";
_13e.style.paddingRight=1+"px";
}
_13d.appendChild(_13e);
var _13f="";
_13f+="<div style=\"position:relative;\">";
_13f+="<cues_vml:roundrect style=\"height:"+Math.ceil(h*2)+"px;width:100%;position:absolute;padding:0px;top:0px;left:0px;margin:0px;\" arcsize=\"0.05\" strokecolor=\""+_58["cuesDashboardStroke"]+"\">";
_13f+="<cues_vml:fill type=\"gradient\" angle=\"180\"";
_13f+=" colors=\"0 "+_58["cuesDashboardStartGradient"]+", "+_5f+" "+_58["cuesDashboardStopGradient1"]+", "+_60+" "+_58["cuesDashboardStartGradient2"]+"\"";
_13f+=" color2=\""+_58["cuesDashboardStopGradient"]+"\"/>";
_13f+="</cues_vml:roundrect>";
_13f+="<cues_vml:rect style=\"height:"+(h/2)+"px;width:100%;position:absolute;padding:0px;top:"+Math.ceil(h/2)+"px;left:0px;margin:0px;padding:0px;\" stroked=\"false\">";
_13f+="<cues_vml:fill type=\"gradient\" angle=\"180\"";
_13f+=" colors=\"0 "+_58["cuesDashboardStartGradient2"]+"\"";
_13f+=" color2=\""+_58["cuesDashboardStopGradient"]+"\"/>";
_13f+="</cues_vml:rect>";
_13f+="</div>";
_13e.innerHTML=_13f;
};
function _3d(id,_140){
if(document.getElementById(id+".graphic")!=null){
return;
}
var _141=document.getElementById(id);
if(_141==null){
return;
}
var _142=document.createElementNS(_57,"svg");
_142.setAttributeNS(null,"id",id+".graphic");
_142.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_142.setAttributeNS(null,"height","22px");
_142.setAttributeNS(null,"width","100%");
if(_3||_4){
_142.setAttributeNS(null,"onresize","cuesDrawnShape.onresizeDashboardHandler()");
}
_141.appendChild(_142);
var _143=_141.getElementsByTagName("table")[0];
var h=Math.max(22,parseInt(_143.offsetHeight));
_142.setAttributeNS(null,"height",h+"px");
if(_54==null){
var _144="";
_144+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_144+="<defs>";
_144+="<linearGradient id=\"dashboard_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_144+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesDashboardStartGradient"]+";stop-opacity:1;\"/>";
_144+="<stop offset=\""+_5f+"\" style=\"stop-color:"+_58["cuesDashboardStopGradient1"]+";stop-opacity:1;\"/>";
_144+="<stop offset=\""+_60+"\" style=\"stop-color:"+_58["cuesDashboardStartGradient2"]+";stop-opacity:1;\"/>";
_144+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesDashboardStopGradient"]+";stop-opacity:1;\"/>";
_144+="</linearGradient>";
_144+="<clipPath id=\"dashboard_clip\">";
_144+="<rect x=\"0\" y=\"0\" width=\"99.999%\" height=\"100%\"/>";
_144+="</clipPath>";
_144+="</defs>";
_144+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"220%\" style=\"fill:url(#dashboard_grad);stroke:"+_58["cuesDashboardStroke"]+";stroke-width:1.7px;stroke-opacity:1;\"/>";
_144+="</svg>";
var _145=new DOMParser();
_54=_145.parseFromString(_144,"text/xml");
}
var root=_54.documentElement;
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_142.appendChild(document.importNode(root.childNodes[i],true));
}
};
function _1e(id,_146){
var _147=document.getElementById(id);
if(_147==null){
return;
}
var h=_147.offsetHeight;
if(h==0&&_146==null){
setTimeout("cuesDrawnShape.makePanel('"+id+"',true)",250);
return;
}
var _148=document.createElement("div");
_148.style.position="absolute";
_148.style.top="0px";
_148.style.left="-20px";
_148.style.width="200%";
_148.style.height=Math.max(0,h-1)+"px";
_148.style.zIndex="-2";
_148.style.overflow="hidden";
_147.appendChild(_148);
var _149="";
_149+="<cues_vml:roundrect style=\"height:"+Math.ceil(h*2)+"px;width:100%;position:absolute;padding:0px;top:0px;left:0px;margin:0px;clip:rect(0px,auto,"+(h+1)+"px,auto);\" arcsize=\"0.05\" strokecolor=\""+_58["cuesDashboardStroke"]+"\">";
_149+="<cues_vml:fill type=\"gradient\" angle=\"180\"";
_149+=" colors=\"0 "+_58["cuesDashboardStartGradient"]+", "+_5f+" "+_58["cuesDashboardStopGradient1"]+", "+_60+" "+_58["cuesDashboardStartGradient2"]+"\"";
_149+=" color2=\""+_58["cuesDashboardStopGradient"]+"\"/>";
_149+="</cues_vml:roundrect>";
_148.innerHTML=_149;
};
function _3e(id,_14a){
var _14b=document.getElementById(id);
if(_14b==null){
return;
}
var _14c=document.createElementNS(_57,"svg");
_14c.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1");
_14c.setAttributeNS(null,"height","31px");
_14c.setAttributeNS(null,"width","100%");
_14b.appendChild(_14c);
var h=parseInt(_14b.offsetHeight);
_14c.setAttributeNS(null,"height",h+"px");
if(_54==null){
var _14d="";
_14d+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_14d+="<defs>";
_14d+="<linearGradient id=\"dashboard_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
_14d+="<stop offset=\"0%\" style=\"stop-color:"+_58["cuesDashboardStartGradient"]+";stop-opacity:1;\"/>";
_14d+="<stop offset=\""+_5f+"\" style=\"stop-color:"+_58["cuesDashboardStopGradient1"]+";stop-opacity:1;\"/>";
_14d+="<stop offset=\""+_60+"\" style=\"stop-color:"+_58["cuesDashboardStartGradient2"]+";stop-opacity:1;\"/>";
_14d+="<stop offset=\"100%\" style=\"stop-color:"+_58["cuesDashboardStopGradient"]+";stop-opacity:1;\"/>";
_14d+="</linearGradient>";
_14d+="</defs>";
_14d+="<rect rx=\"4\" ry=\"4\" x=\"0\" y=\"0\" width=\"100%\" height=\"200%\" style=\"fill:url(#dashboard_grad);stroke:"+_58["cuesDashboardStroke"]+";stroke-width:1px;stroke-opacity:1;\"/>";
_14d+="</svg>";
var _14e=new DOMParser();
_54=_14e.parseFromString(_14d,"text/xml");
}
var root=_54.documentElement;
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_14c.appendChild(document.importNode(root.childNodes[i],true));
}
};
function _20(id,_14f,_150,_151){
var _152=document.getElementById(id);
if(_152==null){
return;
}
var h=_152.offsetHeight;
if(h==0&&_151==null){
setTimeout("cuesDrawnShape.makeContainer('"+id+"','"+_14f+"','"+_150+"',true)",100);
return;
}
var _153=id+".layer";
var _154=document.getElementById(_153);
if(_154==null){
_154=document.createElement("div");
_154.id=_153;
_154.style.zIndex=-2;
_154.style.position="absolute";
_154.style.width=_152.offsetWidth+"px";
_154.style.height=h+"px";
_154.style.top="0px";
_154.style.left="0px";
_152.appendChild(_154);
var _155="";
_155+="<cues_vml:roundrect style=\"height:100%;width:100%;padding:0px;top:0px;left:0px;margin:0px;\" arcsize=\"0.05\">";
_155+="<cues_vml:stroke opacity=\""+_150+"\" color=\""+_14f+"\"/>";
_155+="<cues_vml:fill color=\""+_14f+"\" opacity=\""+_150+"\"/>";
_155+="</cues_vml:roundrect>";
_154.innerHTML=_155;
}else{
_154.style.width=_152.offsetWidth;
_154.style.height=h;
}
};
function _40(id,_156,_157,_158){
var _159=document.getElementById(id);
if(_159==null){
return;
}
if(_158==null){
setTimeout("cuesDrawnShape.makeContainer('"+id+"','"+_156+"','"+_157+"',true)",100);
return;
}
if(_157.indexOf("%")!=-1){
_157=_157.replace("%","");
if(_157==100){
_157=1;
}else{
_157="."+_157;
}
}
var _15a=id+".layer";
var _15b=document.getElementById(_15a);
if(_15b==null){
_15b=document.createElementNS(_57,"svg");
_15b.setAttributeNS(null,"id",_15a);
_15b.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1");
_15b.setAttributeNS(null,"height",_159.offsetHeight);
_15b.setAttributeNS(null,"width",_159.offsetWidth);
_159.appendChild(_15b);
var rect=document.createElementNS(_57,"rect");
rect.setAttributeNS(null,"rx",4);
rect.setAttributeNS(null,"ry",4);
rect.setAttributeNS(null,"x",0);
rect.setAttributeNS(null,"y",0);
rect.setAttributeNS(null,"width","100%");
rect.setAttributeNS(null,"height","100%");
rect.setAttributeNS(null,"style","fill:"+_156+";stroke:"+_156+";opacity:"+_157+";stroke-width:1px;stroke-opacity:"+_157+";");
_15b.appendChild(rect);
}else{
_15b.setAttributeNS(null,"height",_159.offsetHeight);
_15b.setAttributeNS(null,"width",_159.offsetWidth);
}
};
function _15c(_15d,_15e,dist){
var red=parseInt(_15d.substring(1,3),16);
var _15f=(_15e*red)+((1-_15e)*255);
var _160=255-_15f;
var _161=_160/(dist-1);
var each=_161/red;
var _162=each*_15e;
return _162;
};
function _21(id,_163,_164,_165,_166,_167,_168,_169,_16a,_16b){
var _16c=document.getElementById(id);
if(_16c==null){
return;
}
var h=_16c.offsetHeight;
var w=_16c.offsetWidth;
if(h==0||w==0){
if(_16b==null){
setTimeout("cuesDrawnShape.makeShadowedContainer('"+id+"','"+_163+"',"+_164+","+_165+","+_166+","+_167+","+_168+",'"+_169+"',"+_16a+",true)",100);
}
return;
}
h-=1;
w-=1;
if(_16a==null){
_16a=0;
}
var _16d=_16a/Math.min(_16c.offsetWidth,_16c.offsetHeight);
var _16e=id+".layer";
var _16f=document.getElementById(_16e);
if(_16f==null){
var _170=document.createElement("div");
_170.style.zIndex=-20;
_170.style.position="absolute";
_170.style.top=0;
_170.style.left=0;
_170.style.width="100%";
_170.style.height="100%";
_170.style.margin=0;
_170.style.padding=0;
_170.style.backgroundColor="#000000";
icuesSetOpacity(_170,0.1);
_16c.appendChild(_170);
_16f=document.createElement("div");
_16f.id=_16e;
_16f.style.zIndex=-10;
_16f.style.position="absolute";
_16f.style.top=0;
_16f.style.left=0;
_16f.style.width="100%";
_16f.style.height="100%";
_16f.style.margin=0;
_16f.style.padding=0;
_16c.appendChild(_16f);
}
if(_165==null){
_165=1;
}
if(_166==null){
_166=1;
}
if(_167==null){
_167=1;
}
if(_168==null){
_168=1;
}
var _171,_172,_173,_174;
var _175,_176,_177;
var _178="";
var _179=Math.max(_165,Math.max(_168,Math.max(_167,_166)));
var _177=100*_15c(_163,_164,_179);
for(var i=0;i<_179;i++){
_171=Math.round(i*(_165/_179));
_172=Math.round(i*(_168/_179));
_173=Math.round(i*(_167/_179));
_174=Math.round(i*(_166/_179));
_175=w-_172-_174;
_176=h-_171-_173;
_178+="<cues_vml:roundrect style=\"filter:alpha(opacity="+_177+");position:absolute;top:"+_171+"px;left:"+_172+"px;height:"+_176+"px;width:"+_175+"px;\" arcsize=\""+_16d+"\" fillcolor=\""+_163+"\" strokecolor=\""+_163+"\"/>";
}
if(_169!=null&&_169!=""){
_175=w-_168-_166;
_176=h-_165-_167;
_178+="<cues_vml:roundrect style=\"position:absolute;top:"+_165+"px;left:"+_168+"px;width:"+_175+"px;height:"+_176+"px;\" stroked=\"f\" arcsize=\""+_16d+"\">";
_178+="<cues_vml:fill type=\"tile\" src=\""+_169+"\"/>";
_178+="</cues_vml:roundrect>";
}
_16f.innerHTML=_178;
};
function _41(id,_17a,_17b,_17c,_17d,_17e,_17f,_180,_181,_182){
var _183=document.getElementById(id);
if(_183==null){
return;
}
var h=_183.offsetHeight;
var w=_183.offsetWidth;
if(h==0||w==0){
if(_182==null){
setTimeout("cuesDrawnShape.makeShadowedContainer('"+id+"','"+_17a+"',"+_17b+","+_17c+","+_17d+","+_17e+","+_17f+",'"+_180+"',"+_181+",true)",100);
}
return;
}
if(_181==null){
_181=0;
}
var _184=id+".layer";
var _185=document.getElementById(_184);
if(_185==null){
_185=document.createElement("div");
_185.id=_184;
_185.style.zIndex=-10;
_185.style.position="absolute";
_185.style.top=0;
_185.style.left=0;
_185.style.width=w;
_185.style.height=h;
_185.style.margin=0;
_185.style.padding=0;
_183.appendChild(_185);
}
if(_17c==null){
_17c=1;
}
if(_17d==null){
_17d=1;
}
if(_17e==null){
_17e=1;
}
if(_17f==null){
_17f=1;
}
var _186,_187,_188,_189;
var _18a,_18b,_18c;
var _18d="";
var _18e=Math.max(_17c,Math.max(_17f,Math.max(_17e,_17d)));
var _18c=_15c(_17a,_17b,_18e);
for(var i=0;i<_18e;i++){
_186=Math.round(i*(_17c/_18e));
_187=Math.round(i*(_17f/_18e));
_188=Math.round(i*(_17e/_18e));
_189=Math.round(i*(_17d/_18e));
_18a=w-_187-_189;
_18b=h-_186-_188;
_18d+="<div class=\"cuesRadius"+_181+"\" style=\"position:absolute;top:"+_186+"px"+";left:"+_187+"px"+";width:"+_18a+"px"+";height:"+_18b+"px"+";opacity:"+_18c+";background-color:"+_17a+";\"></div>";
}
if(_180!=null&&_180!=""){
_18a=w-_17f-_17d;
_18b=h-_17c-_17e;
_18d+="<div class=\"cuesRadius"+_181+"\" style=\"position:absolute;top:"+_17c+"px"+";left:"+_17f+"px"+";width:"+_18a+"px"+";height:"+_18b+"px"+";background-image:url("+_180+");\">&#160;</div>";
}
_185.innerHTML=_18d;
};
function _22(id){
var _18f=document.getElementById(id);
if(_18f==null){
return;
}
var _190="";
_190+="<cues_vml:rect id=\""+id+".bar1\" style=\"height:17px;width:0px;padding:0px;top:0px;left:0px;margin:0px;position:absolute;\" stroked=\"f\">";
_190+="<cues_vml:stroke color=\""+_58["cuesProgressBarTop"]+"\"/>";
_190+="<cues_vml:fill color=\""+_58["cuesProgressBarTop"]+"\"/>";
_190+="</cues_vml:rect>";
_190+="<cues_vml:rect id=\""+id+".bar2\" style=\"height:9px;width:0px;padding:0;top:8px;left:0px;margin:0;position:absolute;\" stroked=\"f\">";
_190+="<cues_vml:stroke color=\""+_58["cuesProgressBarBottom"]+"\"/>";
_190+="<cues_vml:fill color=\""+_58["cuesProgressBarBottom"]+"\"/>";
_190+="</cues_vml:rect>";
_18f.innerHTML=_190;
};
function _42(id){
var _191=document.getElementById(id);
if(_191==null){
return;
}
var _192=document.createElementNS(_57,"svg");
_192.setAttributeNS(null,"height","17px");
_192.setAttributeNS(null,"width","270px");
_192.setAttributeNS(null,"style","position:absolute;top:0;left:0;");
_191.appendChild(_192);
var rect=document.createElementNS(_57,"rect");
rect.setAttributeNS(null,"id",id+".bar1");
rect.setAttributeNS(null,"x",0);
rect.setAttributeNS(null,"y",0);
rect.setAttributeNS(null,"width","0px");
rect.setAttributeNS(null,"height","17px");
rect.setAttributeNS(null,"style","fill:"+_58["cuesProgressBarTop"]+";");
_192.appendChild(rect);
var rect=document.createElementNS(_57,"rect");
rect.setAttributeNS(null,"id",id+".bar2");
rect.setAttributeNS(null,"x",0);
rect.setAttributeNS(null,"y",8);
rect.setAttributeNS(null,"width","0px");
rect.setAttributeNS(null,"height","9px");
rect.setAttributeNS(null,"style","fill:"+_58["cuesProgressBarBottom"]+";");
_192.appendChild(rect);
};
function _23(id,_193){
_193=Math.min(100,_193);
_193=Math.max(0,_193);
var w=270*(_193/100);
var rect=document.getElementById(id+".bar1");
if(rect!=null){
rect.stroked="t";
rect.style.width=w+"px";
}
var rect=document.getElementById(id+".bar2");
if(rect!=null){
rect.stroked="t";
rect.style.width=w+"px";
}
var _194=document.getElementById(id+".percent");
if(_194!=null){
_194.innerHTML=_193+"%";
}
};
function _43(id,_195){
_195=Math.min(100,_195);
_195=Math.max(0,_195);
var w=271*(_195/100);
var rect=document.getElementById(id+".bar1");
if(rect!=null){
rect.setAttributeNS(null,"width",w+"px");
}
var rect=document.getElementById(id+".bar2");
if(rect!=null){
rect.setAttributeNS(null,"width",w+"px");
}
var _196=document.getElementById(id+".percent");
if(_196!=null){
_196.innerHTML=_195+"%";
}
};
function _1f(id,_197,_198){
var _199=document.getElementById(id);
if(_199==null){
return;
}
var h=_199.offsetHeight;
if(h==0&&_198==null){
setTimeout("cuesDrawnShape.makeToolbar('"+id+"','"+_197+"',true)",250);
return;
}
var _19a=100;
if(_197=="main"){
_19a="67";
}else{
if(_197=="content"){
_19a="40";
}
}
try{
h=Math.max(h,_199.firstChild.offsetHeight);
}
catch(e){
}
var _19b=document.createElement("div");
_19b.style.zIndex=-2;
_19b.style.position="absolute";
_19b.style.width="100%";
_199.insertBefore(_19b,_199.firstChild);
var _19c="";
_19c+="<cues_vml:roundrect style=\"filter:alpha(opacity="+_19a+");height:"+(h-1)+"px;width:100%;padding:0px;top:0px;left:0px;margin:0px;\" arcsize=\"0.08\" ";
if(_197=="main"){
_19c+="strokecolor=\""+_58["cuesToolbarFill"]+"\">";
}else{
_19c+="strokecolor=\""+_58["cuesToolbarStroke"]+"\">";
}
_19c+="<cues_vml:fill color=\""+_58["cuesToolbarFill"]+"\" opacity=\""+_19a+"\"/>";
_19c+="</cues_vml:roundrect>";
_19b.innerHTML=_19c;
_199.style.height=h+"px";
};
function _3f(id,_19d){
var _19e=document.getElementById(id);
if(_19e==null){
return;
}
var _19f=document.createElementNS(_57,"svg");
_19f.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1");
_19f.setAttributeNS(null,"height","31px");
_19f.setAttributeNS(null,"width","100%");
_19e.appendChild(_19f);
var h=parseInt(_19e.offsetHeight);
try{
var fc=_19e.getElementsByTagName("table")[0];
h=Math.max(h,parseInt(fc.offsetHeight));
}
catch(e){
}
_19f.setAttributeNS(null,"height",h+"px");
if(_55==null&&_19d=="main"){
var _1a0="";
_1a0+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_1a0+="<rect rx=\"3\" ry=\"3\" x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" style=\"fill:"+_58["cuesToolbarFill"]+";stroke:"+_58["cuesToolbarStroke"]+";stroke-width:0px;stroke-opacity:0;opacity:.67;\"/>";
_1a0+="</svg>";
var _1a1=new DOMParser();
_55=_1a1.parseFromString(_1a0,"text/xml");
}
if(_56==null&&_19d=="content"){
var _1a0="";
_1a0+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_1a0+="<rect rx=\"3.3\" ry=\"3.3\" x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" style=\"fill:"+_58["cuesToolbarFill"]+";stroke:"+_58["cuesToolbarStroke"]+";stroke-width:.9px;stroke-opacity:1;opacity:.4;\"/>";
_1a0+="</svg>";
var _1a1=new DOMParser();
_56=_1a1.parseFromString(_1a0,"text/xml");
}
var root=(_19d=="main"?_55.documentElement:_56.documentElement);
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_19f.appendChild(document.importNode(root.childNodes[i],true));
}
_19e.style.height=h;
};
function _24(id,_1a2,_1a3,_1a4,_1a5,_1a6,_1a7,cnt){
try{
var _1a8=document.getElementById(id);
if(_1a8==null){
return;
}
if(cnt==null){
cnt=1;
}
var h=_1a8.offsetHeight;
if(h==0&&_1a7==null&&cnt<10){
var _1a9=10;
try{
if(_1a8.parentNode.offsetHeight==0){
_1a9=100;
}
}
catch(e){
}
setTimeout("cuesDrawnShape.makeGradientBox('"+id+"','"+_1a2+"','"+_1a3+"',"+_1a4+",'"+_1a5+"',"+_1a6+",null,"+(cnt+1)+")",_1a9);
return;
}
var w=_1a8.offsetWidth;
var _1aa=document.createElement("div");
_1aa.style.position="absolute";
_1aa.style.top="0px";
_1aa.style.left="0px";
_1aa.style.zIndex="-1";
_1a8.appendChild(_1aa);
var _1ab="";
_1ab+="<cues_vml:rect style=\"height:"+h+"px;width:"+w+"px;position:absolute;top:0px;left:0px;margin:0px;padding:0px;\" stroked=\"false\">";
_1ab+="<cues_vml:fill id=\""+id+"_fill\" type=\"gradient\"";
if(_1a2=="leftright"){
_1ab+=" angle=\"270\" ";
}else{
if(_1a2=="bottomup"){
_1ab+=" angle=\"-180\" ";
}else{
if(_1a2=="rightleft"){
_1ab+=" angle=\"90\" ";
}else{
_1ab+=" angle=\"180\"";
}
}
}
_1ab+=" color=\""+_1a3+"\" opacity=\""+_1a4+"\"";
_1ab+=" color2=\""+_1a5+"\" o:opacity2=\""+_1a6+"\"/>";
_1ab+="</cues_vml:rect>";
_1aa.innerHTML=_1ab;
}
catch(e){
}
};
function _44(id,_1ac,_1ad,_1ae,_1af,_1b0){
try{
var _1b1=document.getElementById(id);
if(_1b1==null){
return;
}
var h=_1b1.offsetHeight;
var w=_1b1.offsetWidth;
var _1b2=document.createElementNS(_57,"svg");
_1b2.setAttributeNS(null,"style","position:absolute;top:0px;left:0px;z-index:-1;");
_1b2.setAttributeNS(null,"height",h+"px");
_1b2.setAttributeNS(null,"width",w+"px");
_1b1.appendChild(_1b2);
var _1b3="";
_1b3+="<svg xmlns=\"http://www.w3.org/2000/svg\">";
_1b3+="<defs>";
if(_1ac=="leftright"){
_1b3+="<linearGradient id=\""+id+"_grad\" x1=\"0\" y1=\"0\" x2=\"100%\" y2=\"0\">";
}else{
if(_1ac=="bottomup"){
_1b3+="<linearGradient id=\""+id+"_grad\" x1=\"0\" y1=\"100%\" x2=\"0\" y2=\"0\">";
}else{
if(_1ac=="rightleft"){
_1b3+="<linearGradient id=\""+id+"_grad\" x1=\"100%\" y1=\"0\" x2=\"0\" y2=\"0\">";
}else{
_1b3+="<linearGradient id=\""+id+"_grad\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"100%\">";
}
}
}
_1b3+="<stop offset=\"0%\" style=\"stop-color:"+_1ad+";stop-opacity:"+_1ae+";\"/>";
_1b3+="<stop offset=\"100%\" style=\"stop-color:"+_1af+";stop-opacity:"+_1b0+";\"/>";
_1b3+="</linearGradient>";
_1b3+="</defs>";
_1b3+="<rect x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" style=\"fill:url(#"+id+"_grad);\"/>";
_1b3+="</svg>";
var _1b4=new DOMParser();
var _1b5=_1b4.parseFromString(_1b3,"text/xml");
var root=_1b5.documentElement;
var len=root.childNodes.length;
for(var i=0;i<len;++i){
_1b2.appendChild(document.importNode(root.childNodes[i],true));
}
}
catch(e){
}
};
function _61(){
try{
if(_58!=null){
return;
}
_58=new Array();
_58["cuesTabStroke"]="#8499a2";
_58["cuesTabActiveStartGradient"]="#f1f5fa";
_58["cuesTabActiveStopGradient"]="#f1f5fa";
_58["cuesTabActiveStroke"]="#8499a2";
_58["cuesTabInactiveStartGradient"]="#feffff";
_58["cuesTabInactiveStopGradient1"]="#dae4ea";
_58["cuesTabInactiveStartGradient2"]="#cbd8e1";
_58["cuesTabInactiveStopGradient2"]="#b4c7d4";
_58["cuesTabInactiveStopGradient"]="#c1d0db";
_58["cuesTabInactiveStroke"]="#8499a2";
_58["cuesTabCaptionInactive"]="#000000";
_58["cuesTabHoverStartGradient"]="#e8f6fb";
_58["cuesTabHoverStopGradient1"]="#8ad8ef";
_58["cuesTabHoverStartGradient2"]="#64ccec";
_58["cuesTabHoverStopGradient"]="#c6f5fe";
_58["cuesTabHoverStroke"]="#1fa0d5";
_58["cuesTabCaptionHover"]="#000000";
_58["cuesDrawerActiveStartGradient"]="#add050";
_58["cuesDrawerActiveStopGradient"]="#8db71f";
_58["cuesDrawerActiveStroke"]="#8499a2";
_58["cuesDrawerCaptionActive"]="#ffffff";
_58["cuesDrawerInactiveStartGradient"]="#feffff";
_58["cuesDrawerInactiveStopGradient1"]="#dae4ea";
_58["cuesDrawerInactiveStartGradient2"]="#dae4ea";
_58["cuesDrawerInactiveStopGradient2"]="#cbd8e1";
_58["cuesDrawerInactiveStartGradient3"]="#b4c7d4";
_58["cuesDrawerInactiveStopGradient"]="#c1d0db";
_58["cuesDrawerInactiveStroke"]="#53636a";
_58["cuesDrawerCaptionInactive"]="#000000";
_58["cuesDrawerHoverStartGradient"]="#e8f6fb";
_58["cuesDrawerHoverStopGradient1"]="#8ad8ef";
_58["cuesDrawerHoverStartGradient2"]="#64ccec";
_58["cuesDrawerHoverStopGradient"]="#c6f5fe";
_58["cuesDrawerCaptionHover"]="#333333";
_58["cuesPrimaryTabsetStartGradient"]="#ffffff";
_58["cuesPrimaryTabsetStopGradient"]="#ffffff";
_58["cuesPrimaryTabsetStroke"]="#ffffff";
_58["cuesPrimaryTabStroke"]="#1fa0d5";
_58["cuesPrimaryTabActiveStartGradient"]="#add050";
_58["cuesPrimaryTabActiveStopGradient"]="#8db71f";
_58["cuesPrimaryTabActiveStroke"]="#8499a2";
_58["cuesPrimaryTabCaptionInactive"]="#ffffff";
_58["cuesPrimaryTabHoverStartGradient"]="#22a2d6";
_58["cuesPrimaryTabHoverStopGradient"]="#95edfd";
_58["cuesPrimaryTabHoverStroke"]="#1fa0d5";
_58["cuesPrimaryTabCaptionHover"]="#000000";
_58["cuesSecondaryTabActiveStartGradient"]="#add050";
_58["cuesSecondaryTabActiveStopGradient"]="#8db71f";
_58["cuesSecondaryTabActiveStroke"]="#8499a2";
_58["cuesSecondaryTabCaptionInactive"]="#ffffff";
_58["cuesSecondaryTabInactiveStartGradient"]="#84939a";
_58["cuesSecondaryTabInactiveStopGradient1"]="#687b85";
_58["cuesSecondaryTabInactiveStartGradient2"]="#314c5a";
_58["cuesSecondaryTabInactiveStopGradient"]="#355261";
_58["cuesSecondaryTabInactiveStroke"]="#2f4955";
_58["cuesSecondaryTabHoverStartGradient"]="#e8f6fb";
_58["cuesSecondaryTabHoverStopGradient1"]="#8ad8ef";
_58["cuesSecondaryTabHoverStartGradient2"]="#64ccec";
_58["cuesSecondaryTabHoverStopGradient"]="#c6f5fe";
_58["cuesSecondaryTabHoverStroke"]="#1fa0d5";
_58["cuesSecondaryTabCaptionHover"]="#000000";
_58["cuesDashboardStartGradient"]="#84939a";
_58["cuesDashboardStopGradient1"]="#687b85";
_58["cuesDashboardStartGradient2"]="#314c5a";
_58["cuesDashboardStopGradient"]="#355261";
_58["cuesDashboardStroke"]="#2f4955";
_58["cuesToolbarFill"]="#ffffff";
_58["cuesToolbarStroke"]="#8499a2";
_58["cuesProgressBarTop"]="#8aa54a";
_58["cuesProgressBarBottom"]="#689b01";
try{
if(cuesCSSMode+""=="highcontrast"){
_58["cuesTabActiveStartGradient"]="#ffffff";
_58["cuesTabActiveStopGradient"]="#ffffff";
_58["cuesTabInactiveStartGradient"]="#ebf1f6";
_58["cuesTabInactiveStopGradient1"]="#dde6ed";
_58["cuesTabInactiveStartGradient2"]="#cfdbe4";
_58["cuesTabInactiveStopGradient2"]="#cfdbe4";
_58["cuesTabInactiveStopGradient"]="#c1d0db";
_58["cuesTabHoverStartGradient"]="#89d9f1";
_58["cuesTabHoverStopGradient1"]="#a5e1f3";
_58["cuesTabHoverStartGradient2"]="#a5e1f3";
_58["cuesTabHoverStopGradient"]="#c2eaf6";
_58["cuesDrawerInactiveStartGradient"]="#ebf1f6";
_58["cuesDrawerInactiveStopGradient1"]="#e3ebf1";
_58["cuesDrawerInactiveStartGradient2"]="#e3ebf1";
_58["cuesDrawerInactiveStopGradient2"]="#d6e0e8";
_58["cuesDrawerInactiveStartGradient3"]="#d6e0e8";
_58["cuesDrawerInactiveStopGradient"]="#c1d0db";
_58["cuesDrawerHoverStartGradient"]="#89d9f1";
_58["cuesDrawerHoverStopGradient1"]="#a5e1f3";
_58["cuesDrawerHoverStartGradient2"]="#a5e1f3";
_58["cuesDrawerHoverStopGradient"]="#c2eaf6";
_58["cuesDrawerCaptionActive"]="#000000";
_58["cuesPrimaryTabsetStartGradient"]="#293b44";
_58["cuesPrimaryTabsetStopGradient"]="#56656d";
_58["cuesPrimaryTabsetStroke"]="#2d4754";
_58["cuesPrimaryTabHoverStartGradient"]="#22a2d6";
_58["cuesPrimaryTabHoverStopGradient"]="#86d6e4";
_58["cuesSecondaryTabInactiveStartGradient"]="#293b44";
_58["cuesSecondaryTabInactiveStopGradient1"]="#293b44";
_58["cuesSecondaryTabInactiveStartGradient2"]="#293b44";
_58["cuesSecondaryTabInactiveStopGradient"]="#56656d";
_58["cuesSecondaryTabHoverStartGradient"]="#89d9f1";
_58["cuesSecondaryTabHoverStopGradient1"]="#a5e1f3";
_58["cuesSecondaryTabHoverStartGradient2"]="#a5e1f3";
_58["cuesSecondaryTabHoverStopGradient"]="#c2eaf6";
_58["cuesSecondaryTabInactiveStroke"]="#ffffff";
_58["cuesDashboardStartGradient"]="#293b44";
_58["cuesDashboardStopGradient1"]="#3f5058";
_58["cuesDashboardStartGradient2"]="#3f5058";
_58["cuesDashboardStopGradient"]="#56656d";
}
}
catch(e){
}
}
catch(e){
}
};
};

