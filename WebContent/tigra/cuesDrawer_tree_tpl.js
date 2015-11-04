/*
	Feel free to use your custom icons for the tree. Make sure they are all of the same size.
	If you don't use some keys you can just remove them from this config
*/
function expiresdate() {
	var exp = new Date();
	exp.setTime(exp.getTime() + (1/*years*/ * 365/*days*/ * 24/*hours*/ * 60/*minutes*/ * 60/*seconds*/ *1000/*milliseconds*/)); // ~1 year	
	return exp.toGMTString();
}
/* this definition is without connector lines */
var cuesDrawer_tree_tpl_without = {

	// general
	'target':'_self',	// name of the frame links will be opened in
							// other possible values are:
							// _blank, _parent, _search, _self and _top
	//aditional info to save with cookies (selected & opened)
	'cookie_ext':'expires='+expiresdate()+';',
	//allow several items to be selected
	'multiselections':true,

	'b_solid':true, //if true will significantly effect appearance delay of the control on huge hierarchy

	// icons - root	
	'icon_48':'tigra/icons/spacer.gif',   // root icon normal
	'icon_52':'tigra/icons/spacer.gif',   // root icon selected
	'icon_56':'tigra/icons/spacer.gif',   // root icon opened
	'icon_60':'tigra/icons/spacer.gif',   // root icon selected opened

	// icons - node	
	'icon_16':'tigra/icons/spacer.gif', // node icon normal
	'icon_20':'tigra/icons/spacer.gif', // node icon selected
	'icon_24':'tigra/icons/spacer.gif', // node icon opened
	'icon_28':'tigra/icons/spacer.gif', // node icon selected opened

	'icon_80':'tigra/icons/spacer.gif', // mouseovered node icon normal
	'icon_88':'tigra/icons/spacer.gif',

    //swapped 0 and 4 with 2 Larry Mason to skip bogus anchor
	// icons - leaf
	//'icon_0':'tigra/icons/treeBullet.gif', // leaf icon normal
	//'icon_4':'tigra/icons/treeBullet.gif', // leaf icon selected
	'icon_0':'tigra/icons/empty.gif', // leaf icon normal
	'icon_4':'tigra/icons/empty.gif', // leaf icon selected
	//'icon_64':'tigra/icons/treeBullet.gif', // leaf icon selected
	'icon_64':'tigra/icons/empty.gif', // leaf icon selected
	
	// icons - junctions	
	'icon_2':'tigra/icons/spacer.gif', //was joinbottom // junction for leaf
	//'icon_2':'tigra/icons/treeBullet.gif', //was joinbottom // junction for leaf
	'icon_3':'tigra/icons/spacer.gif', // was join      // junction for last leaf
	'icon_18':'tigra/icons/rplus.gif', //was plusbottom // junction for closed node
	'icon_19':'tigra/icons/rplus.gif',       //was plus       // junctioin for last closed node
	'icon_26':'tigra/icons/rminus.gif',// was minusBottom // junction for opened node
	'icon_27':'tigra/icons/rminus.gif',      //was minus // junctioin for last opended node

	// icons - root junctions	------------------ comment the following block to hide root's +/- icons ----------------------
	'b_rootcollapse':true,      //                                                                                                
	'icon_50':'tigra/icons/rplus.gif',   // junction for closed root                                                                       
	'icon_51':'tigra/icons/rplus.gif',   // junctioin for last closed root                                                                 
	'icon_58':'tigra/icons/rminus.gif',  // junction for opened root                                                                       
	'icon_59':'tigra/icons/rminus.gif',  //junctioin for last opended root                                                                 
	// icons - root junctions	----------------------------------------------------------------------------------------------

	// icons - misc
	'icon_e':'tigra/icons/empty.gif', // empty image
	'icon_l':'tigra/icons/empty.gif', //was line // vertical line

/*
	// icons - junctions	
	'icon_2':'icons/empty.gif', // junction for leaf
	'icon_3':'icons/empty.gif',       // junction for last leaf
	'icon_18':'icons/plus.gif', // junction for closed node
	'icon_19':'icons/plus.gif',       // junctioin for last closed node
	'icon_26':'icons/minus.gif',// junction for opened node
	'icon_27':'icons/minus.gif',      // junctioin for last opended node

	// icons - misc
	'icon_e':'icons/empty.gif', // empty image
	'icon_l':'icons/empty.gif',  // vertical line
*/	
	// styles - root
	'style_48':'mout', // normal root caption style
	'style_52':'mout', // selected root caption style
	'style_56':'mout', // opened root caption style
	'style_60':'mout', // selected opened root caption style
	'style_112':'mover', // mouseovered normal root caption style
	'style_116':'mover', // mouseovered selected root caption style
	'style_120':'mover', // mouseovered opened root caption style
	'style_124':'mover', // mouseovered selected opened root caption style
	
	// styles - node
	'style_16':'t0ic', // normal node caption style
	'style_20':'t0ic', // selected node caption style
	'style_24':'t0ic', // opened node caption style
	'style_28':'t0ic', // selected opened node caption style
	'style_80':'t0io', // mouseovered normal node caption style
	'style_84':'t0io', // mouseovered selected node caption style
	'style_88':'t0io', // mouseovered opened node caption style
	'style_92':'t0io', // mouseovered selected opened node caption style

	// styles - leaf
	'style_0':'t1io', // normal leaf caption style
	'style_4':'t1io', // selected leaf caption style
	'style_64':'t1ic', // mouseovered normal leaf caption style
	'style_68':'t1ic', // mouseovered selected leaf caption style

    'onItemMover':'mouseoverHandler',
    'onItemMout':'mouseoutHandler',
    'onItemSelect':'selectHandler',

    'userJoinEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)',
        'onmouseup':'return h_click_ff(event, o_tree_item)',
        'onclick':'return h_click_ie(event, o_tree_item)'
	},
	'userIconEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)'
	},
	'userTextEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)',
		'style':'color:000000'
	}
};
var cuesDrawer_tree_tpl_with = {

	// general
	'target':'_self',	// name of the frame links will be opened in
							// other possible values are:
							// _blank, _parent, _search, _self and _top
	//aditional info to save with cookies (selected & opened)
	'cookie_ext':'expires='+expiresdate()+';',
	//allow several items to be selected
	'multiselections':true,

	'b_solid':true, //if true will significantly effect appearance delay of the control on huge hierarchy

	// icons - root	
	'icon_48':'tigra/icons/spacer.gif',   // root icon normal
	'icon_52':'tigra/icons/spacer.gif',   // root icon selected
	'icon_56':'tigra/icons/spacer.gif',   // root icon opened
	'icon_60':'tigra/icons/spacer.gif',   // root icon selected opened

	// icons - node	
	'icon_16':'tigra/icons/spacer.gif', // node icon normal
	'icon_20':'tigra/icons/spacer.gif', // node icon selected
	'icon_24':'tigra/icons/spacer.gif', // node icon opened
	'icon_28':'tigra/icons/spacer.gif', // node icon selected opened

	'icon_80':'tigra/icons/spacer.gif', // mouseovered node icon normal
	'icon_88':'tigra/icons/spacer.gif',

	// icons - leaf
	//'icon_0':'tigra/icons/treeBullet.gif', // leaf icon normal
	//'icon_4':'tigra/icons/treeBullet.gif', // leaf icon selected
	//'icon_64':'tigra/icons/treeBullet.gif', // leaf icon selected
	'icon_0':'tigra/icons/spacer.gif', // leaf icon normal
	'icon_4':'tigra/icons/spacer.gif', // leaf icon selected
	'icon_64':'tigra/icons/spacer.gif', // leaf icon selected
	
	// icons - junctions	
	'icon_2':'tigra/icons/joinbottom.gif',   // junction for leaf
	'icon_3':'tigra/icons/join.gif',         // junction for last leaf
	'icon_18':'tigra/icons/plusbottom.gif',  // junction for closed node
	'icon_19':'tigra/icons/plus.gif',        // junctioin for last closed node
	'icon_26':'tigra/icons/minusbottom.gif', // junction for opened node
	'icon_27':'tigra/icons/minus.gif',       // junctioin for last opended node

	// icons - root junctions	------------------ comment the following block to hide root's +/- icons ----------------------
	'b_rootcollapse':true,      //                                                                                                
	'icon_50':'tigra/icons/rplus.gif',       // junction for closed root                                                                       
	'icon_51':'tigra/icons/rplus.gif',       // junctioin for last closed root                                                                 
	'icon_58':'tigra/icons/rminus.gif',      // junction for opened root                                                                       
	'icon_59':'tigra/icons/rminus.gif',      //junctioin for last opended root                                                                 
	// icons - root junctions	----------------------------------------------------------------------------------------------

	// icons - misc
	'icon_e':'tigra/icons/empty.gif', // empty image
	'icon_l':'tigra/icons/line.gif',  // vertical line

/*
	// icons - junctions	
	'icon_2':'icons/empty.gif', // junction for leaf
	'icon_3':'icons/empty.gif',       // junction for last leaf
	'icon_18':'icons/plus.gif', // junction for closed node
	'icon_19':'icons/plus.gif',       // junctioin for last closed node
	'icon_26':'icons/minus.gif',// junction for opened node
	'icon_27':'icons/minus.gif',      // junctioin for last opended node

	// icons - misc
	'icon_e':'icons/empty.gif', // empty image
	'icon_l':'icons/empty.gif',  // vertical line
*/	
	// styles - root
	'style_48':'mout', // normal root caption style
	'style_52':'mout', // selected root caption style
	'style_56':'mout', // opened root caption style
	'style_60':'mout', // selected opened root caption style
	'style_112':'mover', // mouseovered normal root caption style
	'style_116':'mover', // mouseovered selected root caption style
	'style_120':'mover', // mouseovered opened root caption style
	'style_124':'mover', // mouseovered selected opened root caption style
	
	// styles - node
	'style_16':'t0ic', // normal node caption style
	'style_20':'t0ic', // selected node caption style
	'style_24':'t0ic', // opened node caption style
	'style_28':'t0ic', // selected opened node caption style
	'style_80':'t0io', // mouseovered normal node caption style
	'style_84':'t0io', // mouseovered selected node caption style
	'style_88':'t0io', // mouseovered opened node caption style
	'style_92':'t0io', // mouseovered selected opened node caption style

	// styles - leaf
	'style_0':'t1io', // normal leaf caption style
	'style_4':'t1io', // selected leaf caption style
	'style_64':'t1ic', // mouseovered normal leaf caption style
	'style_68':'t1ic', // mouseovered selected leaf caption style

    'onItemMover':'mouseoverHandler',
    'onItemMout':'mouseoutHandler',
    'onItemSelect':'selectHandler',

    'userJoinEvent': {
        'oncontextmenu':'return h_context_menu(event, o_tree_item)',
        'onmouseup':'return h_click_ff(event, o_tree_item)',
        'onclick':'return h_click_ie(event, o_tree_item)'
	},
	'userIconEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)'
	},
	'userTextEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)',
		'style':'color:000000'
	}
};

function h_context_menu(evt, o_item){
	//alert('Context menu is disabled: '+o_item.a_config[0]);
	//return false;
    return icuesDrawerItemOncontextmenu(evt, o_item);
}

function h_context_menu_root(o_item){
	//alert('Context menu is disabled. Root specifyc handler: '+o_item.a_config[0]);
	return false;
}

function mouseoverHandler(o_item)
{
    try
    {
      //cuesMouseOverDrawerItem(o_item.o_root.n_id+"_"+o_item.n_id);
    }
    catch(e){}
	return false;
}
function mouseoutHandler(o_item)
{
    try
    {
      //cuesMouseOutDrawerItem(o_item.o_root.n_id+"_"+o_item.n_id);
    }
    catch(e){}
    return false;
}
function selectHandler(o_item)
{
    //alert("select "+o_item.o_root.n_id+"_"+o_item.n_id);
    return true;
}
function h_click_ff(evt, o_item){
    try
    {
      var eventObj = evt.target;
      // tagname is IMG 
      // class is treeIcon
      // src contains rplus
      if(eventObj.tagName=="IMG" &&
         eventObj.className=="treeIcon" &&
         eventObj.src.indexOf("rplus") != -1)
      {
        icuesDrawerItemLoadOnDemand(o_item);
      }
    }catch(e){}
	return true;
}
function h_click_ie(evt, o_item){
    try
    {
      var eventObj = evt.srcElement;
      // tagname is IMG 
      // class is treeIcon
      // src contains rplus
      if(eventObj.tagName=="IMG" &&
         eventObj.className=="treeIcon" &&
         eventObj.src.indexOf("rplus") != -1)
      {
        icuesDrawerItemLoadOnDemand(o_item);
      }
    }catch(e){}
	return true;
}


