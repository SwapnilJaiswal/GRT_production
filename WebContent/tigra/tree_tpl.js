/*
	Feel free to use your custom icons for the tree. Make sure they are all of the same size.
	If you don't use some keys you can just remove them from this config
*/
function expiresdate() {
	var exp = new Date();
	exp.setTime(exp.getTime() + (1/*years*/ * 365/*days*/ * 24/*hours*/ * 60/*minutes*/ * 60/*seconds*/ *1000/*milliseconds*/)); // ~1 year	
	return exp.toGMTString();
}
var tree_tpl = {

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
	'icon_48':'tigra/icons/folder.gif',   // root icon normal
	'icon_52':'tigra/icons/folder.gif',   // root icon selected
	'icon_56':'tigra/icons/folder.gif',   // root icon opened
	'icon_60':'tigra/icons/folder.gif',   // root icon selected opened

	// icons - node	
	'icon_16':'tigra/icons/folder.gif', // node icon normal
	'icon_20':'tigra/icons/folderopen.gif', // node icon selected
	'icon_24':'tigra/icons/folderopen.gif', // node icon opened
	'icon_28':'tigra/icons/folderopen.gif', // node icon selected opened

	'icon_80':'tigra/icons/folderover.gif', // mouseovered node icon normal
	'icon_88':'tigra/icons/folderopenover.gif',

	// icons - leaf
	'icon_0':'tigra/icons/page.gif', // leaf icon normal
	'icon_4':'tigra/icons/pagesel.gif', // leaf icon selected
	'icon_64':'tigra/icons/pagesel.gif', // leaf icon selected
	
	// icons - junctions	
	'icon_2':'tigra/icons/joinbottom.gif', // junction for leaf
	'icon_3':'tigra/icons/join.gif',       // junction for last leaf
	'icon_18':'tigra/icons/plusbottom.gif', // junction for closed node
	'icon_19':'tigra/icons/plus.gif',       // junctioin for last closed node
	'icon_26':'tigra/icons/minusbottom.gif',// junction for opened node
	'icon_27':'tigra/icons/minus.gif',      // junctioin for last opended node

	// icons - root junctions	------------------ comment the following block to hide root's +/- icons ----------------------
	'b_rootcollapse':true,      //                                                                                                
	'icon_50':'tigra/icons/rplus.gif', // junction for closed root                                                                       
	'icon_51':'tigra/icons/rplus.gif', // junctioin for last closed root                                                                 
	'icon_58':'tigra/icons/rminus.gif',// junction for opened root                                                                       
	'icon_59':'tigra/icons/rminus.gif',//junctioin for last opended root                                                                 
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

    'userJoinEvent': {
		'oncontextmenu':'return h_context_menu(event, o_tree_item)'
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

