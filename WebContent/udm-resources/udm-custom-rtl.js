// UDMv4.5 //
/***************************************************************/
var um={'menuClasses':[],'itemClasses':[],'menuCode':[]};
/***************************************************************\

  ULTIMATE DROP DOWN MENU Version 4.5 by Brothercake
  http://www.udm4.com/

  This script may not be used or distributed without license

\***************************************************************/


/***************************************************************\
 * CORE CONFIGURATION
\***************************************************************/


//path to images folder
um.baseSRC = "udm-resources/";


//navbar orientation
um.orientation = [
	"horizontal",	// alignment ["vertical"|"horizontal"|"popup"|"expanding"]
	"rtl",		// h align ["left"|"right"|"rtl"]
	"top",		// v align ["top"|"bottom"]
	"relative",	// positioning ["relative"|"absolute"|"fixed"|"allfixed"]
	"0",	// x position ["em"|"ex"|"px"|"0"]
	"0",		// y position ["em"|"ex"|"px"|"0"]
	"1000",		// z order ["0" to "10000"] (menu takes 20000 headroom)
	];


//navbar list output
um.list = [
	"rigid",	// horizontal overflow ["rigid"|"flexible"]
	"yes",		// -SPARE-
	"no", 		// -SPARE-
	];


//menu behaviors
um.behaviors = [
	"200",		// open timer ["milliseconds"|"0"]
	"500",		// close timer ["milliseconds"|"never"|"0"]
	"no",		// reposition menus to stay inside the viewport ["yes"|"no"]
	"default",	// manage windowed controls for win/ie ["default","hide","iframe","none"]
	];


//reset behaviors
um.reset = [
	"yes",		// reset from document mouse click ["yes"|"no"]
	"yes",		// reset from window resize ["yes"|"no"]
	"yes",		// reset from text resize ["yes"|"no"]
	"no",		// reset after following link ["yes"|"no"]
	];


//horizontal continuation strip
um.hstrip = [
	"#dbdbdb",	// background ["color"|"#hex"|"rgb()"|"image.gif"|"none"]
	"no",		// copy item margin-right to margin-bottom ["yes"|"no"]
	];


/***************************************************************\
 * MODULE SETTINGS
\***************************************************************/


//keyboard navigation
um.keys = [
	"38",		// up ["n"] ("38" = up arrow key)
	"39",		// right ["n"] ("39" = right arrow key)
	"40",		// down ["n"] ("40" = down arrow key)
	"37",		// left ["n"] ("37" = left arrow key)
	"123",		// hotkey ["n"] ("123" = F12)
	"none",		// hotkey modifier ["none"|"shiftKey"|"ctrlKey"|"altKey"|"metaKey"]
	"27",		// escape ["n"|"none"] ("27" = escape key)
	"document.getElementById('exit-link')", // exit focus ["js-expression"]
	];


/***************************************************************\
 * NAVBAR DEFAULT STYLES
\***************************************************************/


//styles which apply to the navbar
um.navbar = [
	"0",		// nav to menu x-offset (+-)["n" pixels]
	"0",	// nav to menu y-offset (+-)["n" pixels]
	"7.5em",	// width ["em"|"ex"|"px"] (vertical navbar only - horizontal navbar items have "auto" width) ("%" doesn't work right)
	];


//styles which apply to each navbar item
um.items = [
	"0",		// margin between items ["n" pixels]
	"0",		// border size ["n" pixels] (single value only)
	"separate",	// border collapse ["collapse"|"separate"] (only applies when margin = "0")
	"#dbdbdb",// border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",	// border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"#dbdbdb",// hover/focus border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",	// hover/focus border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"#dbdbdb",// visited border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",// visited border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"10",		// left/right padding ["n" pixels] (single value only)
	"4",		// top/bottom padding ["n" pixels] (single value only)
	"#dbdbdb",// background ["color"|"#hex"|"rgb()"|"image.gif"]
	"#b2b4bf",// hover/focus background ["color"|"#hex"|"rgb()"|"image.gif"]
	"#dbdbdb",// visited background ["color"|"#hex"|"rgb()"|"image.gif"]
	"1em",		// font size ["em"|"ex"|"%"|"px"|"pt"|"absolute-size"|"relative-size"]
	"verdana,arial,sans-serif",// font family ["font1,font2,font3"] (always end with a generic family name)
	"normal",		// font weight ["normal"|"bold"|"bolder"|"lighter|"100" to "900"]
	"none",		// text decoration ["none"|"underline"|"overline"|"line-through"]
	"left",		// text-align ["left"|"right"|"center"]
	"#000",	// color ["color"|"#hex"|"rgb()"]
	"#000",	// hover/focus color ["color"|"#hex"|"rgb()"]
	"#000",	// visited color ["color"|"#hex"|"rgb()"]
	"normal",	// font-style ["normal"|"italic"|"oblique"]
	"normal",	// hover/focus font-style ["normal"|"italic"|"oblique"]
	"normal",	// visited font-style ["normal"|"italic"|"oblique"]
	"",// additional link CSS (careful!)
	"",// additional hover/focus CSS (careful!)
	"",// additional visited CSS (careful!)
	"none",// menu indicator character/image ["text"|"image.gif"|"none"]
	"none",// menu indicator rollover image ["image.gif"|"none"] (only when using image arrows)
	"0",		// clipping width of indicator image ["n" pixels] (only when using image arrows)
	"..",		// alt text of indicator image ["text"] (only when using image arrows)
	];


/***************************************************************\
 * MENU DEFAULT STYLES
\***************************************************************/


//styles which apply to each menu
um.menus = [
	"-6",		// menu to menu x-offset (+-)["n" pixels]
	"0",	// menu to menu y-offset (+-)["n" pixels]
	"1",		// border size ["n" pixels] (single value only)
	"#858a91",// border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"solid",	// border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"12em",	// width ["em"|"ex"|"px"]
	"1",		// padding ["n" pixels] (single value only)
	"menuItemBg-rtl.gif",	// background ["color"|"#hex"|"rgb()"|"image.gif"]
	"background-repeat:repeat-y;background-position:right top;background-color:#f8f8f8;",// additional menu CSS (careful!) (you can use a transition here but *not* a static filter)
	"menuShadow.png",// shadow background ["color"|"#hex"|"rgb()"|"image.gif"|"none"]
	"-3px",		// shadow offset (+-)["em"|"ex"|"px"|"%"|"0"]
	"filter:progid:DXImageTransform.Microsoft.Shadow(color=#838383,direction=225,strength=3);",// additional shadow layer CSS (if you use a Microsoft.Shadow filter here then Win/IE5.5+ will do that *instead* of default shadow)
	];


//styles which apply to each menu item
um.menuItems = [
	"0",		// margin around items ["n" pixels] (single value only; margins are like table cellspacing)
	"0",		// border size ["n" pixels] (single value only)
	"separate",	// border collapse ["collapse"|"separate"] (only applies when margin = "0")
	"#c0d5d5",	// border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",	// border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"#c0d5d5",		// hover/focus border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",	// hover/focus border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"#c0d5d5",	// visited border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
	"none",	// visited border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
	"8",		// left/right padding ["n" pixels] (single value only)
	"5",		// top/bottom padding ["n" pixels] (single value only)
	"transparent",	// background ["color"|"#hex"|"rgb()"|"image.gif"]
	"#c0d5d5",	// hover/focus background ["color"|"#hex"|"rgb()"|"image.gif"]
	"transparent",	// visited background ["color"|"#hex"|"rgb()"|"image.gif"]
	"1em",		// font size ["em"|"ex"|"%"|"px"|"pt"|"absolute-size"|"relative-size"]
	"verdana,arial,sans-serif",// font family ["font1,font2,font3"] (always end with a generic family name)
	"normal",	// font weight ["normal"|"bold"|"bolder"|"lighter|"100" to "900"]
	"none",		// text decoration ["none"|"underline"|"overline"|"line-through"]
	"right",		// text-align ["left"|"right"|"center"]
	"#000",		// color ["color"|"#hex"|"rgb()"]
	"#000",		// hover/focus color ["color"|"#hex"|"rgb()"]
	"#000",		// visited color ["color"|"#hex"|"rgb()"]
	"normal",	// font-style ["normal"|"italic"|"oblique"]
	"normal",	// hover/focus font-style ["normal"|"italic"|"oblique"]
	"normal",	// visited font-style ["normal"|"italic"|"oblique"]
	"padding-right:30px !important;",		// additional link CSS (careful!)
	"padding-right:30px !important;",		// additional hover/focus CSS (careful!)
	"padding-right:30px !important;",		// additional visited CSS (careful!)
	"menuSubArrow-rtl.gif",		// submenu indicator character/image ["text"|"image.gif"|"none"]
	"menuSubArrow-rtl.gif",		// submenu indicator rollover image ["image.gif"|"none"] (only when using image arrows)
	"5",		// clipping width of indicator image ["n" pixels] (only when using image arrows)
	"..",		// alt text of indicator image ["text"] (only when using image arrows)
	];




/***************************************************************\
\***************************************************************/



/***************************************************************\
 ICON CACHING CODE MUST BE AT THE END OF THE CUSTOM FILE
\***************************************************************/

//cache the menu icons and disabled arrows
var icons = [
	'icon-help',
	'icon-help-rollover',
	'icon-chart',
	'icon-chart-rollover',
	'icon-folder',
	'icon-dot',
	'icon-tick',
	'menuSubArrowDisabled-rtl'
	];

var imgs = [];
for(var i=0; i < icons.length; i++)
{
	imgs[i] = new Image;
	imgs[i].src = um.baseSRC + icons[i] + '.gif';
}


/***************************************************************\
\***************************************************************/

