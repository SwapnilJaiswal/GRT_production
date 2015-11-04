// UDMv4.5 // Auto-Sizing Menus extension v1.0 //
/***************************************************************\

  ULTIMATE DROP DOWN MENU Version 4.5 by Brothercake
  http://www.udm4.com/

\***************************************************************/

/***************************************************************\
* Set autosizing parameters
\***************************************************************/

um.autosizing = [
	'0', 	// leeway space ["n" pixels]
	'auto', 	// max-width ["px"|"auto"]
	'auto', 	// min-width ["px"|"auto"]
	'no', 		// size first-level submenus to parent link ["yes"|"no"]
	];

/***************************************************************\
\***************************************************************/
var ats=new Object;um.addReceiver(autoSizeMenu,'058');ats.compare=function(a,b){return b-a;};ats.getRelatedLayer=function(menuNode,menuClass){ats.node=menuNode.parentNode.lastChild;if((um.wie55&&(um.e[13]=='default'||um.e[13]=='iframe')&&menuClass=='udmS')||ats.node.nodeName=='#text'){ats.node=ats.node.previousSibling;}ats.noc=um.es(ats.node.className);if(ats.noc!=''){if(ats.noc.indexOf(menuClass)!=-1){return ats.node;}else{return null;}}else{return null;}};function autoSizeMenu(menu){menu.style.visibility='hidden';menu.layer=ats.getRelatedLayer(menu,'udmS');if(menu.layer!=null){menu.layer.style.visibility='hidden';}ats.nodes=menu.childNodes;ats.nodesLen=ats.nodes.length;ats.boxdiff=um.e[51]*2+um.e[55]*2;ats.ppc=um.es(menu.parentNode.parentNode.className);if(um.autosizing[3]=='yes'&&ats.ppc=='udm'){ats.longest=menu.parentNode.offsetWidth+um.pi(um.autosizing[0])-((um.q&&!um.mie)?0:ats.boxdiff);}else{ats.widths=[];for(var i=0;i<ats.nodesLen;i++){if(ats.nodes[i].nodeName!='#text') {ats.link=um.gc(ats.nodes[i]);if(um.wie50){ats.link.style.width='1em';ats.html=ats.link.innerHTML;ats.link.innerHTML='<nobr style="letter-spacing:0;">'+ats.html+'</nobr>';ats.widths[ats.widths.length]=ats.link.offsetWidth;ats.link.innerHTML=ats.html;ats.link.style.width='100%';}else{ats.link.style.display='inline';ats.link.style.whiteSpace='nowrap';ats.widths[ats.widths.length]=ats.link.offsetWidth;ats.link.style.display='block';ats.link.style.whiteSpace='normal';}}}ats.widths=ats.widths.sort(ats.compare);ats.longest=ats.widths[0]+um.pi(um.autosizing[0])+(um.q?ats.boxdiff:0)+um.e[61]*2+(um.e[89]!='none'?um.e[91]:0);if(um.autosizing[1]!='auto'&&(ats.longest-(um.q?0:ats.boxdiff))>um.pi(um.autosizing[1])){ats.longest=um.pi(um.autosizing[1])-(um.q?0:ats.boxdiff);}if(um.autosizing[2]!='auto'&&(ats.longest-(um.q?0:ats.boxdiff))<um.pi(um.autosizing[2])){ats.longest=um.pi(um.autosizing[2])-(um.q?0:ats.boxdiff);}}menu.style.width=ats.longest+'px';for(i=0;i<ats.nodesLen;i++){if(ats.nodes[i].nodeName!='#text') {ats.ar=(!um.mie&&typeof um.n.ga=='function')?um.n.ga(um.gc(ats.nodes[i])):null;if(ats.ar!=null){um.n.wp(ats.ar,ats.nodes[i],um.e[70],um.e[62],0);}}}menu.layers=['udmS','udmC'];for(i=0;i<2;i++){menu.layer=ats.getRelatedLayer(menu,menu.layers[i]);if(menu.layer!=null){menu.layer.style.width=menu.offsetWidth+'px';menu.layer.style.height=menu.offsetHeight+'px';menu.layer.style.visibility='visible';}}menu.style.visibility='visible';};