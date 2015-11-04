<html xmlns:cues="http://www.cisco.com"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/cues_utility/cues_taglib.js" language="JavaScript"></script><script>cuesKnownLocation='/../';cuesImageFolder='cues_images';cuesIconFolder='cues_icons';cuesVersion='62';cuesXslSkin='base';cuesImageSuffix='';icuesBackgroundImage="${pageContext.request.contextPath}/cues_images/pageBackground.jpg";cuesCSSMode='normal';cuesCSSFile='cues_taglib.css';</script><link id="cuesCSS" href="${pageContext.request.contextPath}/cues_utility/cues_taglib.css" rel="stylesheet" type="text/css"><script src="${pageContext.request.contextPath}/cues_utility/cues_drawn.js" language="JavaScript"></script><script>var cuesMsg = new Array();cuesMsg["InvalidData"]="Invalid data has been entered";cuesMsg["NoncontiguousReorder"]="You can only reorder selected rows that are contiguous";cuesMsg["EmptyRow"]="No data to display";var cuesAlt = new Array();cuesAlt["ExpandDrawer"]="Expand";cuesAlt["CollapseDrawer"]="Collapse";cuesAlt["ExpandNav"]="Expand Navigation Pane";cuesAlt["CollapseNav"]="Collapse Navigation Pane";cuesAlt["ExpandTree"]="Expand tree item";cuesAlt["CollapseTree"]="Collapse tree item";cuesAlt["LeafTree"]="Leaf";cuesAlt["WizardStepErrorState"]="Wizard step contains 1 or more errors";cuesAlt["TabErrorState"]="Tab contains 1 or more errors";cuesAlt["ExpandPane"]="Expand";cuesAlt["CollapsePane"]="Collapse";cuesAlt["RestorePane"]="Restore";cuesAlt["InformationalMessage"]="Informational message";cuesAlt["CriticalErrorMessage"]="Critical error message";cuesAlt["ErrorMessage"]="Error message";cuesAlt["WarningMessage"]="Warning message";cuesAlt["SuccessMessage"]="Success message";var cuesACP = new Array();cuesACP["Alert"]="Alert";cuesACP["Confirm"]="Confirm";cuesACP["Prompt"]="Prompt";cuesACP["OK"]="OK";cuesACP["Cancel"]="Cancel";cuesACP["Yes"]="Yes";cuesACP["No"]="No";cuesACP["MessageNumber"]="Message Number";var cuesMaskeditFormatError = new Array();cuesMaskeditFormatError["time2"]="The entered time must be in the range of 1:00 to 12:59";cuesMaskeditFormatError["netmask"]="A valid netmask consists of four numbers (0-255) separated by periods, e.g. 123.0.255.3";cuesMaskeditFormatError["ipv6mask"]="Invalid data has been entered";cuesMaskeditFormatError["miltime2"]="The entered time must be in the range of 0:00 to 23:59";cuesMaskeditFormatError["mac"]="A valid MAC address is nn:nn:nn:nn:nn:nn where the 'n's are either digits (0-9) or letters (A-F)";cuesMaskeditFormatError["ipv6"]="A valid IPv6 address is n:n:n:n:n:n:n:n where the 'n's are either digits (0-9) or letters (A-F)";cuesMaskeditFormatError["ipv4"]="A valid IPv4 address consists of four numbers (0-255) separated by periods, e.g. 123.0.255.3";</script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</head>

<body dir="LTR">
  <div class="cuesBackground"><img class="cuesBackgroundImage" src="${pageContext.request.contextPath}/cues_images/pageBackground.jpg" title="" alt=""></div>
  <script>try {document.body.dir='LTR';}catch(e){}</script>

  <form id="cuesLoginForm" method="post" onsubmit="cuesShowLoginProgressMessage();return true;" action="SignUp"><table class="cuesLoginContainer" border="0" cellpadding="0" cellspacing="0"><tbody><tr height="100%"><td valign="top"><div id="cuesLoginProductSection" class="cuesLoginProductSection" style="left: 255.5px; top: 222px;"><br class="cuesLoginClear"><table><tbody><tr><td valign="top" style="padding-bottom:5px"><img class="cuesLoginLogo" onload="cuesFixPNG(null,this)" src="${pageContext.request.contextPath}/cues_images/cisco_logo_header.png" align="absmiddle" title="Cisco" alt="Cisco"></td><td valign="top">
     
    <div class="cuesLoginProductName">GSP Request Tracker</div>
    
    <div class="cuesLoginVersionInfo">Version: 2.1</div>
    
	</td></tr></tbody></table></div></td><td valign="top"><div id="cuesLoginFieldsSection" class="cuesLoginFieldsSection" style="right: 255.5px; top: 222px;"><br class="cuesLoginClear"><table width="10"><tbody><tr><td>&nbsp;</td><td>
    </td></tr>
    
    <tr><td class="cuesLoginField"><label for="cecId"><nobr><b>CEC Id:*</b></nobr></label></td><td><input alt="&lt;b&gt;Username:&lt;/b&gt;" name="cecId" id="cecId" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
    <tr><td class="cuesLoginField"><label for="name"><nobr><b>Full Name:*</b></nobr></label></td><td><input  alt="&lt;b&gt;Username:&lt;/b&gt;" name="name" id="name" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
    <tr><td class="cuesLoginField"><label for="title"><nobr><b>Title:*</b></nobr></label></td><td><input  alt="&lt;b&gt;Username:&lt;/b&gt;" name="title" id="title" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
     <tr><td class="cuesLoginField"><label for="org"><nobr><b>Organization:*</b></nobr></label></td><td><input  alt="&lt;b&gt;Username:&lt;/b&gt;" name="org" id="org" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
    <tr><td class="cuesLoginField"><label for="mgrId"><nobr><b>Managers's CEC Id:*</b></nobr></label></td><td><input  alt="&lt;b&gt;Username:&lt;/b&gt;" name="mgrId" id="mgrId" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
    <tr><td class="cuesLoginField"><label for="mgrName"><nobr><b>Manager's Name:*</b></nobr></label></td><td><input  alt="&lt;b&gt;Username:&lt;/b&gt;" name="mgrName" id="mgrName" class="cuesLoginFieldText" type="text" size="20" value=""></td></tr>
    
     <tr>
    <td colspan="2" class="cuesBrSmall">&nbsp;</td>
    </tr>
    <tr>
    </tr>
    <tr>
    <td colspan="1" >&nbsp;</td>
     <td  nowrap="yes" align="center"><button id="cuesLoginSubmitButton" type="submit"  class="cuesLoginButton">Sign Up</button></td> 
    </td></tr></tbody></table></div></td></tr><tr><td valign="bottom" colspan="2"><div id="cuesLoginInfoSection" class="cuesLoginInfoSection" style="left: 255.5px; width: 769px;"><br class="cuesLoginClear">
    
    <div class="cuesLoginCopyright">
  		©2013, Cisco Systems, Inc. All rights rights reserved. 
    </div>
    
  
    </div></td></tr></tbody></table></form><script>try{document.getElementById('username').focus();}catch(e){}</script><script>if (document.addEventListener)  window.addEventListener('resize', icuesLoginLayout, false);else if (document.attachEvent)  window.attachEvent('onresize', icuesLoginLayout);icuesLoginLayout();</script>
    
</body>
</html>