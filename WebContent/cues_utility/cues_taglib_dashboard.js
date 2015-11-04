var icuesDashboardColumnLayout="";
function cuesGetDashboardPaneState(id){
var _1="unknown";
try{
var _2=document.getElementById("cuesDashboard");
var _3=document.getElementById(id+"_pane");
_1=_3.getAttribute("state");
if(_1!="maximized"&&_2.style.display=="none"){
_1="hidden";
}
}
catch(e){
}
return _1;
};
function cuesTogglePane(_4,id){
try{
var _5=document.getElementById(id+"_pane");
_4=document.getElementById(id+"Toggler");
var _6=document.getElementById(id+"Expand");
var _7="";
var _8="";
var _9=_4.src;
_9=_9.replace("Hover","");
if(_9.indexOf("Collapse")!=-1||_9.indexOf("Minimize")!=-1){
_8="minimized";
_9=_9.replace("Collapse","Expand");
_9=_9.replace("Minimize","Restore");
document.getElementById(id).style.display="none";
try{
document.getElementById(id+"_status").style.display="none";
}
catch(e){
}
try{
_7=altRestorePane;
}
catch(e){
}
try{
_6.style.display="none";
}
catch(e){
}
}else{
_8="normal";
_9=_9.replace("Expand","Collapse");
_9=_9.replace("Restore","Minimize");
document.getElementById(id).style.display="";
try{
document.getElementById(id+"_status").style.display="";
}
catch(e){
}
try{
_7=altCollapsePane;
}
catch(e){
}
try{
_6.style.display="";
}
catch(e){
}
}
_4.src=_9;
_4.title=_7;
_5.setAttribute("state",_8);
callbackDashboardPaneStateChange(id,_8);
}
catch(e){
}
};
function cuesClosePane(_a,id){
try{
var _b=document.getElementById(id+"_pane");
var _c=_b.getAttribute("state");
_b.parentNode.removeChild(_b);
if(_c=="maximized"){
var _d=document.getElementById(id+"Holder");
try{
_d.parentNode.removeChild(_d);
}
catch(e){
}
document.getElementById("cuesDashboard").style.display="";
}
icuesSetDashboardInfo();
callbackDashboardPaneStateChange(id,"closed");
}
catch(e){
}
};
function cuesExpandPane(_e,id){
try{
var _f=document.getElementById(id+"_pane");
var _10=document.getElementById(id+"Expand");
var src=_10.src.replace("Hover","");
var _11=document.getElementById(id+"Toggler");
var _12=_f.getAttribute("state");
var _13=document.getElementById("cuesDashboard");
if(_12=="maximized"){
_12="normal";
src=src.replace("Restore","Maximized");
_10.title=altExpandPane;
_11.style.display="";
var _14=document.getElementById(id+"Holder");
_14.parentNode.insertBefore(_f,_14);
_14.parentNode.removeChild(_14);
_13.style.display="";
}else{
_12="maximized";
src=src.replace("Maximized","Restore");
_10.title=altRestorePane;
_11.style.display="none";
var _14=document.createElement("div");
_14.id=id+"Holder";
_14.innerHTML="place holder";
_f.parentNode.insertBefore(_14,_f);
_13.parentNode.insertBefore(_f,_13);
_13.style.display="none";
}
_10.src=src;
_f.setAttribute("state",_12);
callbackDashboardPaneStateChange(id,_12);
}
catch(e){
}
};
var cuesDraggingObj=null;
var cuesDraggingSourceObj=null;
var cuesDraggingTargetObj=null;
var cuesDraggingMouseX=null;
var cuesDraggingMouseY=null;
var cuesDraggingFromX=null;
var cuesDraggingFromY=null;
function cuesPaneStartMove(evt,obj){
var _15=icuesFindObjectByTagname(obj,"DIV");
var id=_15.id.replace("_title","_pane");
var _16=document.getElementById(id);
if(_16.getAttribute("state")=="maximized"){
return false;
}
cuesDraggingSourceObj=cuesDraggingTargetObj=_16;
cuesDraggingObj=document.getElementById("cuesDashboardPaneMover");
if(cuesDraggingObj!=null){
cuesDraggingObj.innerHTML=_15.innerHTML;
cuesDraggingMouseX=evt.screenX;
cuesDraggingMouseY=evt.screenY;
cuesDraggingFromX=icuesPhysicalLeft(_15);
cuesDraggingFromY=icuesPhysicalTop2(_15);
if(isFF){
cuesDraggingFromY-=icuesScrolledAmount(_15);
}
cuesDraggingObj.style.height=_15.offsetHeight+"px";
cuesDraggingObj.style.width=_15.offsetWidth+"px";
cuesDraggingObj.style.top=cuesDraggingFromY+"px";
cuesDraggingObj.style.left=cuesDraggingFromX+"px";
cuesDraggingObj.style.display="inline";
icuesHookPaneMouseHandlers();
}
return false;
};
function cuesPaneOver(evt,_17,obj){
if(cuesDraggingObj==null){
return true;
}
if(_17){
cuesDraggingTargetObj=obj;
}else{
cuesDraggingTargetObj=(isIE)?evt.srcElement:evt.target;
}
return false;
};
function cuesEndDrag(){
if(cuesDraggingObj!=null){
cuesDraggingObj.style.display="none";
}
cuesDraggingObj=null;
icuesUnhookPaneMouseHandlers();
return false;
};
function cuesPaneMoving(evt,_18,obj){
if(cuesDraggingObj==null){
return true;
}
if(isIE&&evt.button==0){
return cuesEndDrag();
}
if(_18){
cuesDraggingTargetObj=obj;
}
cuesDraggingObj.style.top=cuesDraggingFromY-(cuesDraggingMouseY-evt.screenY)+"px";
cuesDraggingObj.style.left=cuesDraggingFromX-(cuesDraggingMouseX-evt.screenX)+"px";
try{
document.selection.empty();
}
catch(e){
}
return false;
};
function icuesHookPaneMouseHandlers(){
if(document.addEventListener){
document.addEventListener("mousemove",cuesPaneMoving,false);
document.addEventListener("mouseup",cuesPaneEndMove,false);
}else{
if(document.attachEvent){
document.attachEvent("onmousemove",cuesPaneMoving);
document.attachEvent("onmouseup",cuesPaneEndMove);
}
}
};
function icuesUnhookPaneMouseHandlers(){
if(document.removeEventListener){
document.removeEventListener("mousemove",cuesPaneMoving,false);
document.removeEventListener("mouseup",cuesPaneEndMove,false);
}else{
if(document.detachEvent){
document.detachEvent("onmousemove",cuesPaneMoving);
document.detachEvent("onmouseup",cuesPaneEndMove);
}
}
};
function cuesPaneEndMove(evt,_19,obj){
try{
document.selection.empty();
}
catch(e){
}
if(cuesDraggingObj!=null){
icuesUnhookPaneMouseHandlers();
try{
var _1a=icuesFindObjectByTagname(cuesDraggingSourceObj,"TABLE");
var x,y,y2,_1b,s;
var _1c=_1a.rows.length;
for(var i=0;i<_1c;i++){
var _1d=_1a.rows[i].cells.length;
for(var j=0;j<_1d;j++){
_1b=_1a.rows[i].cells[j];
x=icuesPhysicalLeft(_1b);
y=icuesPhysicalTop(_1b);
s=icuesScrolledAmount(_1b);
y-=s;
if(x<=evt.clientX&&x+_1b.offsetWidth>=evt.clientX&&y<=evt.clientY&&y+_1b.offsetHeight>=evt.clientY){
cuesDraggingTargetObj=_1b;
var _1e=_1b.getElementsByTagName("*");
for(var k=0;k<_1e.length;k++){
if(_1e[k].className=="cuesDashboardPane"){
x=icuesPhysicalLeft(_1e[k]);
y=icuesPhysicalTop(_1e[k]);
s=icuesScrolledAmount(_1e[k]);
y-=s;
if(x<=evt.clientX&&x+_1e[k].offsetWidth>=evt.clientX&&y<=evt.clientY&&y+_1e[k].offsetHeight>=evt.clientY){
cuesDraggingTargetObj=_1e[k];
break;
}
}
}
i=_1c;
break;
}
}
}
}
catch(e){
return cuesEndDrag();
}
var _1f=cuesDraggingTargetObj.className;
var _20=null;
var _21=null;
var _22=null;
switch(cuesDraggingTargetObj.className){
case "cuesDashboardPane":
_22=cuesDraggingTargetObj.id;
break;
case "cuesDashboardCell":
_20=cuesDraggingTargetObj;
break;
case "cuesDashboardPaneTitle":
_22=cuesDraggingTargetObj.id.replace("_title","_pane");
break;
case "cuesDashboardPaneStatus":
_22=cuesDraggingTargetObj.id.replace("_status","_pane");
break;
case "cuesDashboardPaneContent":
_22=cuesDraggingTargetObj.id+"_pane";
break;
default:
if(cuesDraggingTargetObj.id=="cuesDashboard"){
var x,y,_1b;
_22=null;
for(var i=0;i<cuesDraggingTargetObj.rows.length;i++){
for(var j=0;j<cuesDraggingTargetObj.rows[i].cells.length;j++){
_1b=cuesDraggingTargetObj.rows[i].cells[j];
x=icuesPhysicalLeft(_1b);
y=icuesPhysicalTop(_1b);
s=icuesScrolledAmount(_1b);
y-=s;
if(x<=evt.clientX&&x+_1b.offsetWidth>=evt.clientX&&y<=evt.clientY&&y+_1b.offsetHeight>=evt.clientY){
_20=_1b;
break;
}
}
}
}else{
icuesSetDashboardInfo();
try{
callbackDashboardLayoutChange();
}
catch(e){
}
return cuesEndDrag();
var _23=cuesDraggingTargetObj;
while(_23!=null&&_23.className!="cuesDashboardPane"){
_23=icuesFindObjectByTagname(_23,"DIV");
}
if(_23!=null){
_20=icuesFindObjectByTagname(_23,"TD");
_21=_23;
}
}
break;
}
if(_22!=null){
_21=document.getElementById(_22);
_20=icuesFindObjectByTagname(_21,"TD");
}
if(_20!=null){
if(_21!=null){
if(cuesDraggingSourceObj.id==_21.id){
return cuesEndDrag();
}
}
var _24=cuesDraggingSourceObj.parentNode;
if(_24.colSpan!=_20.colSpan){
try{
var _25=icuesFindObjectByTagname(_20,"TR");
var _26=document.createElement("tr");
_25.parentNode.insertBefore(_26,_25);
var _27=_26.insertCell(0);
_27.colSpan=_24.colSpan;
_27.className=_20.className;
_24.removeChild(cuesDraggingSourceObj);
_27.appendChild(cuesDraggingSourceObj);
for(var i=1;i<6/_24.colSpan;i++){
_27=_26.insertCell(i);
if(_24.colSpan==4){
_27.colSpan=2;
}else{
_27.colSpan=_24.colSpan;
}
_27.className=_20.className;
}
}
catch(e){
}
icuesSetDashboardInfo();
try{
callbackDashboardLayoutChange();
}
catch(e){
}
return cuesEndDrag();
}
_24.removeChild(cuesDraggingSourceObj);
if(_21==null){
_20.appendChild(cuesDraggingSourceObj);
}else{
_20.insertBefore(cuesDraggingSourceObj,_21);
}
}
cuesEndDrag();
icuesSetDashboardInfo();
try{
callbackDashboardLayoutChange();
}
catch(e){
}
return false;
}
return true;
};
function cuesGetDashboardLayout(){
if(document.getElementById("cuesDashboard")!=null){
return icuesGetDashboardLayout();
}else{
return icuesGetDashboardManagerLayout();
}
};
function cuesGetDashboardTitle(){
try{
return document.getElementById("cuestitle").value;
}
catch(e){
}
return "";
};
function cuesGetDashboardColumnLayout(){
return icuesDashboardColumnLayout;
};
function icuesGetDashboardLayout(){
var _28=new Array();
try{
var _29,row,_2a,_2b,_2c,_2d,_2e,col;
var tbl=document.getElementById("cuesDashboard");
var _2f=tbl.rows.length;
for(var i=0;i<_2f-1;i++){
row=tbl.rows[i];
_29=row.cells.length;
col=1;
for(var j=0;j<_29;j++){
_2a=row.cells[j];
_2b=_2a.getElementsByTagName("div");
_2c=_2b.length;
for(var k=0;k<_2c;k++){
if(_2b[k].className+""=="cuesDashboardPane"){
_2d=_2b[k].id.replace("_pane","");
_2e=new Array();
_2e.push(_2d);
_2e.push(j+1);
_2e.push(_2b[k].getAttribute("panetitle"));
_28.push(_2e);
}
}
col+=_2a.colSpan/2;
}
}
}
catch(e){
}
return _28;
};
function icuesTileDashboard(){
var tbl=document.getElementById("cuesDashboard");
var _30=tbl.rows.length;
var _31,row,_32,_33,_34;
var _35=0;
var _36=false;
for(var i=0;i<_30-2;i++){
if(tbl.rows[i].cells[0].colSpan==2&&tbl.rows[i].cells[0].getElementsByTagName("div").length>0&&tbl.rows[i].cells[1].colSpan==4&&tbl.rows[i+1].cells[0].getElementsByTagName("div").length==0&&(tbl.rows[i+1].cells[1].getElementsByTagName("div").length>0||tbl.rows[i+1].cells[2].getElementsByTagName("div").length>0)){
tbl.rows[i].cells[0].rowSpan=2;
tbl.rows[i+1].deleteCell(0);
i++;
_36=true;
}
}
if(!_36){
return;
}
_36=false;
for(var i=0;i<_30-1;i++){
_33=0;
row=tbl.rows[i];
_31=row.cells.length;
for(var j=0;j<_31;j++){
_32=row.cells[j];
if(_32.rowSpan==1){
_33=Math.max(_33,_32.scrollHeight);
}else{
_35+=_32.rowSpan;
_36=true;
_34=_32.offsetHeight;
}
}
if(_35>1){
row.style.height=(isIE?_33:1)+"px";
_35--;
_34-=_33;
}else{
if(_36){
row.style.height=isIE?Math.max(_34,_33)+"px":"auto";
_36=false;
}
}
}
};
function icuesSetDashboardInfo(_37,_38){
try{
if(_37!=null){
document.cookie="cuesdbcnt="+_37+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
if(_38==null||_38==""){
if(_37==1){
_38="100";
}else{
if(_37==2){
_38="50-50";
}else{
_38="33-33-33";
}
}
}
}
if(_38!=null){
document.cookie="cuesdblayout="+_38+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
}
var _39=cuesGetDashboardLayout();
document.cookie="cuesdbinfo="+escape(icuesDashboardInfoAsXml(_39))+";timeout=null;path=/"+(cuesSecureCookies?";secure":"");
}
catch(e){
}
};
function icuesDashboardInfoAsXml(_3a){
var xml="<dashboard>";
try{
var _3b=new Array("Left","Middle","Right");
for(var i=0;i<3;i++){
xml+="<"+_3b[i]+">";
for(var j=0;j<_3a.length;j++){
if(_3a[j][1]==i+1){
xml+="<pane id=\""+_3a[j][0]+"\" title=\""+_3a[j][2]+"\"/>";
}
}
xml+="</"+_3b[i]+">";
}
}
catch(e){
}
xml+="</dashboard>";
return xml;
};
function icuesGetDashboardInfo(){
var xml="<dashboard></dashboard>";
var _3c;
var _3d=document.cookie.split(";");
var _3e=_3d.length;
var _3f=false;
for(var i=0;i<_3e;i++){
_3c=_3d[i].split("=");
if(_3c[0].trim()=="cuesdbinfo"&&_3c[1]!=null){
try{
xml=unescape(_3c[1]);
}
catch(e){
}
}else{
if(_3c[0].trim()=="cuesdblayout"&&_3c[1]!=null){
try{
icuesDashboardColumnLayout=_3c[1];
document.getElementById("cuesColumnChoices"+_3c[1].replace("-","").replace("-","")).checked=true;
_3f=true;
}
catch(e){
}
}else{
if(_3c[0].trim()=="cuesdbcnt"&&_3c[1]!=null){
try{
var _40;
var _41=_3c[1];
var _42=document.getElementById("cuesDashboardLayoutBoxes").rows[0];
_40=_41<3?"none":"";
_42.cells[5].style.display=_40;
_42.cells[6].style.display=_40;
_42.cells[7].style.display=_40;
_40=_41<2?"none":"";
_42.cells[2].style.display=_40;
_42.cells[3].style.display=_40;
_42.cells[4].style.display=_40;
if(!_3f){
if(_41==3){
document.getElementById("cuesColumnChoices333333").checked=true;
}else{
if(_41==2){
document.getElementById("cuesColumnChoices5050").checked=true;
}else{
document.getElementById("cuesColumnChoices100").checked=true;
}
}
}
}
catch(e){
}
}
}
}
}
return cuesGetXmlDoc(null,xml);
};
function icuesRevertDashboardLayout(){
try{
var _43=document.getElementById("cuestitle");
_43.value=_43.getAttribute("origvalue");
var _44=new Array("Left","Middle","Right");
for(var i=0;i<3;i++){
document.getElementById("cuesDashboardLayout"+_44[i]).options.length=0;
}
icuesPopulateDashboardLayout();
icuesSetDashboardManagerDirty(false);
}
catch(e){
}
};
function icuesPopulateDashboardLayout(){
var _45=icuesGetDashboardInfo();
var _46=new Array("Left","Middle","Right");
for(var i=0;i<3;i++){
var _47=document.getElementById("cuesDashboardLayout"+_46[i]);
var _48=cuesXpath(_45,"/dashboard/"+_46[i]+"/*");
for(var j=0;j<_48.length;j++){
_47.options.add(new Option(_48[j].getAttribute("title"),_48[j].getAttribute("id")));
}
}
};
function icuesMoveDashboardModuleUp(id){
try{
var _49=document.getElementById(id);
var _4a=_49.selectedIndex;
icuesSwapListboxItems(_49.options[_4a],_49.options[_4a-1]);
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesMoveDashboardModuleDown(id){
try{
var _4b=document.getElementById(id);
var _4c=_4b.selectedIndex;
icuesSwapListboxItems(_4b.options[_4c],_4b.options[_4c+1]);
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesRemoveDashboardModule(id){
try{
var _4d=document.getElementById(id);
var _4e=_4d.selectedIndex;
if(isIE){
_4d.options.remove(_4e);
}else{
_4d.options[_4e]=null;
}
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesMoveDashboardModule(_4f,_50){
try{
var _51=document.getElementById(_4f);
var _52=_51.selectedIndex;
var _53=document.getElementById(_50);
if(_53.selectedIndex!=-1){
try{
_53.options[_53.selectedIndex].selected=false;
}
catch(e){
}
}
var _54=new Option(_51.options[_52].text,_51.options[_52].value,true,true);
_53.options.add(_54);
if(isIE){
_51.options.remove(_52);
}else{
_51.options[_52]=null;
}
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesAddDashboardModule(id,_55){
try{
var _56=document.getElementById("cuesDashboardLayoutLeft");
_56.options.add(new Option(_55,id));
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesChangeDashboardColumnLayout(obj){
try{
var _57=document.getElementById("cuesDashboardLayoutBoxes").rows[0];
var _58=3;
icuesDashboardColumnLayout=obj.value+"";
switch(obj.value+""){
case "100":
_58=1;
break;
case "30-70":
case "70-30":
case "50-50":
_58=2;
break;
case "33-33-33":
case "25-50-25":
_58=3;
break;
}
var _59,_5a,_5b;
_59=_58<3?"none":"";
_57.cells[5].style.display=_59;
_57.cells[6].style.display=_59;
_57.cells[7].style.display=_59;
if(_59=="none"){
_5a=document.getElementById("cuesDashboardLayoutRight");
_5b=document.getElementById("cuesDashboardLayoutMiddle");
var _5c=_5a.options.length;
for(var _5d=0;_5d<_5c;_5d++){
var _5e=new Option(_5a.options[_5d].text,_5a.options[_5d].value);
_5b.options.add(_5e);
}
_5a.options.length=0;
}
_59=_58<2?"none":"";
_57.cells[2].style.display=_59;
_57.cells[3].style.display=_59;
_57.cells[4].style.display=_59;
if(_59=="none"){
_5a=document.getElementById("cuesDashboardLayoutMiddle");
_5b=document.getElementById("cuesDashboardLayoutLeft");
var _5c=_5a.options.length;
for(var _5d=0;_5d<_5c;_5d++){
var _5e=new Option(_5a.options[_5d].text,_5a.options[_5d].value);
_5b.options.add(_5e);
}
_5a.options.length=0;
}
icuesSetDashboardManagerDirty(true);
}
catch(e){
}
};
function icuesGetDashboardManagerLayout(){
var _5f=new Array();
var _60;
try{
var _61=new Array("Left","Middle","Right");
for(var i=0;i<3;i++){
var _62=document.getElementById("cuesDashboardLayout"+_61[i]);
var _63=_62.options.length;
for(var j=0;j<_63;j++){
_60=new Array();
_60.push(_62.options[j].value);
_60.push(i+1);
_60.push(_62.options[j].text);
_5f.push(_60);
}
}
}
catch(e){
}
return _5f;
};
function icuesSetDashboardManagerDirty(_64){
try{
document.getElementById("cuesDashboardManagerSave").disabled=!_64;
document.getElementById("cuesDashboardManagerCancel").disabled=!_64;
}
catch(e){
}
};

