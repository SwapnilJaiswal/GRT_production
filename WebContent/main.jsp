<%@ taglib uri="http://www.cisco.com/cues/taglib" prefix="cues"%>
<html>
  <head>
    <cues:supportfiles menu="false"/>
    <style>
     </style>
    <script>
      var resizeTimer = null;
      function onresizeHandler()
      {
        if(resizeTimer!=null)clearTimeout(resizeTimer);
        resizeTimer = setTimeout("resize()",500);
      }
      function resize()
      {
        cuesExpandHeight("cuesLayout");
        cuesExpandHeight('contentarea');
       
        cuesFillHeight('navigation_drawer_sample');
	    cuesTileDrawers('navigation_drawer_sample');
        
        cuesExpandHeight('contentarea');
      }
    </script>
  </head>
 
  <%String UName = (String)request.getSession().getAttribute("UName");
  if(UName==null)
  response.sendRedirect("CEC_Login");%>
 <body onload="resize()" onresize="onresizeHandler()">
    <cues:background/>

    <cues:pageheader title="GSP Request Tracker" aboutlink="#" logoutlink="Logout">
    </cues:pageheader>

			<!--  <div style="padding-right:15px;padding-left:15px;padding-bottom:4px;">
			  <cues:primarytabset>
				<cues:primarytab title="Tab 1" onclick="blank.jsp" target="reply" active="true"/>
				<cues:primarytab title="Tab 2" onclick="blank.jsp" target="reply" />
				<cues:primarytab title="Tab 3" onclick="blank.jsp" target="reply" />
			 </cues:primarytabset>  		
			</div> -->

			
			<!-- <div style="padding-left:2px;padding-bottom:4px;">
			 	<cues:toolbar usage="main">
				<cues:toolbaritem id="tb1b" tooltip="Save" onclick="#" image="${pageContext.request.contextPath}/images/save_16x.png" caption="Save"/>
				<cues:toolbaritem id="tb2b" tooltip="Print" onclick="#" image="${pageContext.request.contextPath}/images/print_16x.png" caption="Print"/>
				
				<cues:toolbarspacer/> 
			</cues:toolbar> 
			</div> -->
    <cues:layout>	

    
        <cues:layoutnav width="200px"  id="navarea" resizable="true">
      
	<cues:drawers mode="multiple" scrollers="false" id="navigation_drawer_sample">

		<cues:drawer id="layout_sample_drawer1" title="Enter Project Details" state="" mode="tree" >
			<cues:draweritem text="Enter New Project Details" onclick="./enter_details.jsp" target="contentiframe" appdata="'name':'query_form'" default="true" />
			<cues:draweritem text="View Project Details" onclick="View" target="contentiframe" appdata="'name':'query_form'" default="true" />
			<cues:draweritem text="Export Project Details" onclick="Get_Data_Date" target="contentiframe" appdata="'name':'query_form'" default="true" />
			
			<cues:draweritem text="Generate Reports" onclick="" target="contentiframe" appdata="'name':'query_form'" default="true" />
		
		</cues:drawer>

		<!--<cues:drawer id="layout_sample_drawer2" title="Query Forms" state="" mode="tree">
			<cues:draweritem text="Employee Skill Information" onclick="./Get_Data" target="contentiframe" appdata="'name':'query_form'" default="true" />
		 </cues:drawer>

		<cues:drawer id="layout_sample_drawer3" title="Overview" onclick="#" />
		<cues:drawer id="layout_sample_drawer4" title="Support and Downloads" onclick="#" />-->
	</cues:drawers>

	</cues:layoutnav>

      <cues:layoutcontent id="contentarea">
	      <iframe allowtransparency="true" style="height:100%;width:100%;" frameborder="0" name="contentiframe" id="contentiframe" src=""> </iframe>
      </cues:layoutcontent>
      <cues:layouttaskpanel/>
      <cues:layoutcopyright>
        ©2013, Cisco System, Inc. All rights reserved.
      </cues:layoutcopyright>
    </cues:layout>
	
  </body>
</html>

