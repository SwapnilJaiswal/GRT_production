// UDMv4.5 // additional behaviors for Cisco menus //
/***************************************************************\
\***************************************************************/



//-- redefine the assign document handlers function
//to include error trapping when trying to focus disabled items
umKM.prototype.bdh=function()
{
	var self=this;
	if(typeof document.addEventListener!=um.un)
	{
		if(um.s)
		{
			document.addEventListener('keydown',function(e)
			{
				if(um.fkd){return;}
				um.fkd=1;
				self.kha(e);
			},0);
			document.addEventListener('keyup',function(){um.fkd=0;},0);
		}
		else
		{
			document.addEventListener('keypress',this.kha,0);
		}
	}

	else
	{
		document.attachEvent('onkeydown',function()
		{
			//add error trapping for keyhandler
			try { self.kha(); }
			catch(err) { }
		});
	}
};



//-- redefine the arrow rollovers function
//so that it can cater for disabled arrow styles
umNav.prototype.wv=function(l,n)
{
	if(um.nr){return false;}
	var a=this.ga(l);
	if(a)
	{
		var c=um.es(l.className);
		var r=(c.indexOf('udmR')==-1);
		if(c.indexOf('udmY')!=-1){r=0;}
		var p=um.es(um.gp(l).className);
		var t=(um.s||um.k)?a.firstChild:a;

		//if the parent is disabled
		if(l.parentNode.className.indexOf('disabled') != -1)
		{
			//use the disabled values
			t.src=um.baseSRC+(um.dir == 'left' ? 'menuSubArrowDisabled.gif' : 'menuSubArrowDisabled-rtl.gif');
		}
		//otherwise use the regular values
		else { t.src=um.baseSRC+(r?um.e[89]:um.e[90]); }
	}

	return a;
};




//-- implement disabled item behaviors
//using API event 000 (begin initialising, so that we know the menu list exists)
um.addReceiver(function(list)
{
	//bind a click handler to the list
	list.onclick = function(e)
	{
		//get event target
		var target = e ? e.target : window.event.srcElement;

		//if the target is a link
		if(target.nodeName.toLowerCase() == 'a')
		{
			//if its parent node has the "disabled" class name
			if(target.parentNode.className && /disabled/i.test(target.parentNode.className))
			{
				//don't follow the link
				return false;
			}
		}

		//follow the link by default
		return true;
	}

}, '000');




//-- apply default disabled arrows
//using API event 008 (list-item initialized)
um.addReceiver(function(li)
{
	//if this is a disabled item
	if(li.className && /disabled/i.test(li.className))
	{
		//look for the arrow object for different browsers
		var arrow = um.n.ga(um.gc(li));
		if(arrow)
		{
			//convert reference for safari
			if(um.s||um.k){arrow=arrow.firstChild;}
			//now set it to the default disabled style
			//according to writing mode
			arrow.src = um.baseSRC + (um.dir == 'left' ? 'menuSubArrowDisabled.gif' : 'menuSubArrowDisabled-rtl.gif');
		}
	}
}, '008');




//-- implement disabled child menus that don't open
//-- and cater for RTL text overflow problems in IE
//using API event 058 (menu pre-display event)
um.addReceiver(function(menu)
{
	//if the parent item is disabled
	if(menu.parentNode.className && /disabled/i.test(menu.parentNode.className))
	{
		//force hide the menu so that it can't open
		menu.style.display = 'none';
	}

	/*
	//if we're in RTL mode
	if(um.dir=='right')
	{
		//add an inner element around the text
		//inside each menu link that has no child menu
		var li=menu.childNodes;
		for(var i=0;i<li.length;i++)
		{
			if(li[i].nodeName.toLowerCase()=='li'&&um.gu(li[i]).length==0)
			{
				var html=um.gc(li[i]).innerHTML;
				html='<span style="background:red;white-space:nowrap;position:static;">'+html+'</span>';
				um.gc(li[i]).innerHTML=html;
			}
		}
	}
	*/

}, '058');

//using API event 060 (menu open event) as well
//to shore it up in win/ie5.0
um.addReceiver(function(menu)
{
	//if the parent item is disabled
	if(menu.parentNode.className && /disabled/i.test(menu.parentNode.className))
	{
		//force hide the menu so that it can't open
		menu.style.display = 'none';
	}

}, '060');






//"get arrow object" utility function
um.getArrowObject = function(node)
{
	var arrow = null;
	var eles = node.getElementsByTagName(um.s||um.k ? 'span' : 'img');
	for(var i=0; i<eles.length; i++)
	{
		if(eles[i].className && /udmA/.test(eles[i].className))
		{
			arrow = eles[i];
			break;
		}
	}
	return arrow;
};



//-------------------------



