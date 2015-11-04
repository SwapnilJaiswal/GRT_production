
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
String UName = (String) request.getSession().getAttribute("UName");
if(UName==null)
{
	out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
	return;
}
%>
<link rel="stylesheet" href="css/styleQueryForm.css">
<link rel="stylesheet" href="jquery.timepicker.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="jquery.timepicker.js"></script>
    

    <script>  
    $(function() {
    	//$( ".date" ).datepicker({ dateFormat: "yy-mm-dd" });
    	$( ".date" ).datepicker();
    	$( ".time" ).timepicker();
    	
    	
    });
    
    function CalcuateTimeDiff() 
    {
    var RecvDate = $( "#RecvDate" ).datepicker( "getDate" );
    var FulfillmentDate = $( "#FulfilmentDate" ).datepicker( "getDate" );

    var RecvTime = $("#RecvTime").timepicker("getTime");
    var FulfillmentTime = $("#FulfilTime").timepicker("getTime");


    $("#SLABreeches").val(((FulfillmentDate-RecvDate)/3600000) + (((FulfillmentTime-RecvTime)/3600000)));
    }
    
    function validateFormcomp()
    {

    var a=document.forms["form"]["Fiscal_Quarter"];
    var b=document.forms["form"]["JiraID"];
    var c=document.forms["form"]["PIDNumber"];
    var d=document.forms["form"]["RequestedBy"];
    var e=document.forms["form"]["Fiscal_Year"];
    var f=document.forms["form"]["SubTeam"];
    var g=document.forms["form"]["GSP_Manager"];
    

    var h=document.forms["form"]["Assignee"];
    var i=document.forms["form"]["Customer"];
    var j=document.forms["form"]["Theatre"];
    var k=document.forms["form"]["ASType"];
    var l=document.forms["form"]["PrjClassification"];
    var o=document.forms["form"]["ModeReqRCV"];
    var p=document.forms["form"]["datepicker1"];

               
    if (!(c.value == "" || (c.value.length == 6  && !isNaN(c.value)) ))
    {
    	alert("please Enter Valid 6 digit PID Number");	
    	c.focus();
    	return false;
    }
    
    }  
    
 function SetSubTeam(ArchTeam){
var dropdown = document.getElementById("SubTeam");
switch (ArchTeam.value){
case 'BN-AT':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('NMS','NMS');
dropdown.options[dropdown.options.length] = new Option('Security','Security');
dropdown.options[dropdown.options.length] = new Option('Wireless','Wireless');
break;
}
case 'Collab':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('BV','BV');
dropdown.options[dropdown.options.length] = new Option('CC','CC');
dropdown.options[dropdown.options.length] = new Option('UC-S','UC-S');
dropdown.options[dropdown.options.length] = new Option('UC-T','UC-T');
break;
}
case 'CPS':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Assessment','Assessment');
dropdown.options[dropdown.options.length] = new Option('G&D','G&D');
dropdown.options[dropdown.options.length] = new Option('Infra','Infra');
dropdown.options[dropdown.options.length] = new Option('Install','Install');
break;
}
case 'DCV':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Assessment','Assessment');
dropdown.options[dropdown.options.length] = new Option('G&D','G&D');
dropdown.options[dropdown.options.length] = new Option('Infra','Infra');
dropdown.options[dropdown.options.length] = new Option('Install','Install');
break;
}
case 'PM':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('PM','PM');
dropdown.options[dropdown.options.length] = new Option('PSO','PSO');
break;
}
case 'HTOM':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('HTOM','HTOM');
break;
}
case 'Mobility':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Mobility','Mobility');
break;
}
default:{
alert(ArchTeam.value + ' is not yet supported');
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Select Arch Team First','00');
break;
}
}
} 
    
       
    </script>
    

</head>
<body>


    <div class="login" style="width:900px;">
        <h1>Enter Details</h1>
        <form name="form" id="form" method="post" action="ProjDetails" onsubmit="return validateFormcomp()">
            <div style="float: left; border-right: 1px solid grey; margin-right: 10px;">
                <table>
                    <tbody>
                            <tr>
                            <td>Fiscal:</td>
 
                            <td><select name="Fiscal_Quarter" id="Fiscal_Quarter" style= "width:104px;">
                                <option value="Q1">
                                    Q1
                                </option>

                                <option value="Q2">
                                    Q2
                                </option>
                                <option value="Q3">
                                    Q3
                                </option>
                                <option value="Q4">
                                    Q4
                                </option>
                             </select>
                                <select name="Fiscal_Year" id="Fiscal_Year" style= "width:104px;">
                                <option value="FY13">
                                    FY13
                                </option>
                                 <option value="FY14">
                                   FY14
                                </option>
                                <option value="FY15">
                                   FY15
                                </option>
                                <option value="FY16">
                                   FY16
                                </option>
                             </select>

                            <td>
                        </tr>
						<tr>
                            <td>JIRA ID:</td>
 
                            <td><input type="text" name="JiraID" id="JiraID"/></td>
                        </tr>
 
                        <tr>
                            <td>PID Number:</td>
 
                            <td><input type="text" name="PIDNumber" id="PIDNumber"/></td>
                        </tr>
						
						<tr>
                            <td>Requested By:</td>
 
                            <td><input type="text" name="RequestedBy" id="RequestedBy" /></td>
                        </tr>
						
                        <tr>
                            <td style="min-height: 50px;">Arch Team:</td>
 
                            <td><select name="ArchTeam" id="ArchTeam" onchange="SetSubTeam(this);">
                            	<option value="BN-AT">
                                    BN-AT
                                </option>
                                <option value="Collab">
                                    Collab
                                </option>
                                <option value="CPS">
                                    CPS
                                </option>
                                <option value="DCV">
                                    DCV
                                </option>
                                <option value="HTOM">
                                	HTOM
                                </option>
                                <option value="Mobility">
                                	Mobility
                                </option>                               
                                <option value="PM">
                                    PM
                                </option>
                            </select></td>
                        </tr>
						
						<tr>
                            <td>Sub Team:</td>
 
                            <td><select name="SubTeam" id="SubTeam"></select>
                           </td>
                        </tr>
 
                        <tr>
 
                        <tr>
                            <td>GSP Manager:</td>
 
                            <td><select name="GSPManager" id="GSP_Manager">
                                <option value="Himadri Choudary">
                                    Himadri Choudary
                                </option>
                                <option value="Jayant Moghe">
                                    Jayant Moghe
                                </option>
                                <option value="Kasturi Venkatesh">
                                    Kasturi Venkatesh
                                </option>
                                <option value="Krishna Murthy">
                                	Krishna Murthy
                                </option>
 
                                <option value="Laxminarayan Bhat">
                                    Laxminarayan Bhat
                                </option>
 
                                <option value="Maqsood Ahamadi">
                                    Maqsood Ahamadi
                                </option>
 
                                <option value="Murali Sethuraman">
                                    Murali Sethuraman
                                </option>
 
                                <option value="Prasad Shetty">
                                    Prasad Shetty
                                </option>
                                <option value="Praveen Joshi">
                                	Praveen Joshi
                                </option>
                                <option value="Ravi Koulagi">
                                    Ravi Koulagi
                                </option>
                                <option value="Sastry Kuchimanchi">
                  					Sastry Kuchimanchi
 								</option>
 								<option value"Venkata Krishna Subbarao Pakala">
 									Venkata Krishna Subbarao Pakala
 								</option>
 								<option value="Vidhi Rastogi">
 									Vidhi Rastogi
 								</option>
 								<option value="Vijay Shekhar">
                                    Vijay Shekhar
                                </option>
                            </select></td>
                        </tr>
						<tr>
                            <td>Assignee(s):</td>
 
                            <td><input type="text" name="Assignee" id="Assignee" /></td>
                        </tr>
						<tr>
                            <td>Customer:</td>
 
                            <td><input type="text" name="Customer" id="Customer"/></td>
                        </tr>
						<tr>
                            <td>Theatre:</td>
 
                            <td>
                            <select name="Theatre" id="Theatre">
                                <option value="AMER">
                                    AMER
                                </option>
 
                                <option value="APJC">
                                    APJC
                                </option>
 
                                <option value="EMEAR">
                                    EMEAR
                                </option>
                                <option value="GET">
                                	GET
                                </option>
                                <option value="LATAM">
                                	LATAM
                                </option>
                                <option value="PS">
                                	PS
                                </option>
                                <option value="Incomplete">
                                	Incomplete
                                </option>
                                </select>
                          </td>
                        </tr>
						
						<tr>
                            <td>AS classification:</td>
 
                            <td><select name="ASType" id="ASType">
                                <option value="AS-F">
                                    AS-F
                                </option>
 
                                <option value="AS-T">
                                    AS-T
                                </option>
 
                                <option value="AS-S">
                                    AS-S
                                </option>
                                <option value="Incomplete">
                                    Incomplete
                                </option>
                            </select></td>
                        </tr>
						
						<tr>
                            <td>Project Classification:</td>
 
                            <td><select name="PrjClassification" id=
                            "PrjClassification">
                                <option value="A">
                                    A
                                </option>
 
                                <option value="B">
                                    B
                                </option>
 
                                <option value="C">
                                    C
                                </option>
                                <option value="Incomplete">
                                    Incomplete
                                </option>
                            </select></td>
                       </tr>
						 <tr>
                            <td>JIRA Created by:</td>
 
                            <td><input type="text" name="JiraCreatedBy" /></td>
                        </tr>
 
                       
                        <tr>
                            <td>Mode of Request Recv:</td>
 
                            <td><select name="ModeReqRecv" id="ModeReqRCV">
                                <option value="Email">
                                    E-Mail
                                </option>
 
                                <option value="Jira">
                                    JIRA
                                </option>
 
                                <option value="OP-RM">
                                    OP-RM
                                </option>
                            </select></td>
                        </tr>
						<tr>
                            <td>OnsiteRemoteFIFO</td>
 
                            <td><select name="OnsiteInfo" id="OnsiteInfo">
                            <option value="Onsite">Onsite</option>
                            <option value="Remote">Remote</option>
                            <option value="OnsiteandRemote">OnsiteandRemote</option>
                            <option value="Incomplete">Incomplete</option>
                            </select>
                           </td>
                        </tr>
 
                        <tr>
                            <td>VISA (Work Permit / Buisness VISA)</td>
 
                            <td><input type="text" name="VisaWrkPermit" /></td>
                        </tr>
						<tr>
                            <td>VISA (Available / Not Available)</td>
 
                            <td><input type="text" name="VisaAvailability" /></td>
                        </tr>
                        <tr>
                            <td>Long Term/Short Term</td>
 
                            <td><select name="term" id="term"><option value="Long Term">Long Term</option>
                            <option value="Short Term">Short Term</option>
                            <option value="Incomplete">Incomplete</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Project Status</td>
 
                            <td>
                            <select name="PrjctStatus">
                            <option value="Hold">Hold</option>
                            <option value="Cancelled">Cancelled</option>
                            <option value="Completed">Completed</option>
                            <option value="In progress">In progress</option>
                            <option value="Incomplete">Incomplete</option>
                            <option value="Not Started">Not Started</option>
                            </select>
                            </td>
                        </tr>
                         
						<tr>
                            <td>Project Decline Reasons</td>
 
                            <td><input type="text" name="PrjctDeclineLineReasons" /></td>
                        </tr>
                     </tbody>
                </table>
            </div>
 
            <div style="">
                <table>
                    <tbody>
						<tr>
                            <td>JIRA Create Date</td>
 
                            <td><input type="text" class="date" name="JiraCreateDate" id="JiraCreateDate" placeholder="JIRA Create Date"/></td>
                        </tr>
 
                        <tr>
                            <td>Resource Assign Date</td>
 
                            <td><input type="text" class="date" name="ResourceAsgnDate" id="ResourceAsgnDate" placeholder="Resource Assign Date"/></td>
                        </tr>
 
                        <tr>
						
 
                        <tr>
                            <td>Actual Start Date</td>
 
                            <td><input type="text" class="date" placeholder="Actual Start Date" name=
                            "ActStartDate" id="datepicker2"  /></td>
                        </tr>
 
                        <tr>
                            <td>Actual End Date</td>
 
                            <td><input type="text" class="date" placeholder="Actual End Date" name=
                            "ActEndDate" id="datepicker4"  /></td>
                        </tr>
                        
                         
 
                        <tr>
                            <td>Request Ack Date:</td>
 
                            <td><input class="date" type="text" name="ReqAckDate" id="ReqAckDate" placeholder="Request Ack Date" /></td>
                        </tr>
 
                        <tr>
                            <td>JIRA Ack Date</td>
 
                            <td><input class="date" type="text" name="JiraAckDate" id="JiraAckDate" placeholder="JIRA Ack Date"/></td>
                        </tr>
                         <tr>
                         <td>Project Start Date</td>
 
                            <td><input class="date" type="text" placeholder="Project Start Date" name=
                            "PrjctStartDate" id="datepicker1" /></td>
                        </tr>
 
                        <tr>
                            <td>Project End Date</td>
 
                            <td><input class="date" type="text" placeholder="Project End Date" name=
                            "PrjctEndDate" id="datepicker3"/></td>
                        </tr>
						<tr>
                            <td>Request Recv Date:</td>
 
                            <td><input class="date" type="text" placeholder="Request Recieved Date" name="RequestRecvDate"
                            id="RecvDate"  /><input class = "time" type="text" placeholder="Request Recieved Time" name="RequestRecvTime"
                            id="RecvTime"  /></td>
                        </tr>
						<tr>
                            <td>Fulfilment date</td>
 
                            <td><input class="date" type="text" name="FulfilmentDate" id="FulfilmentDate" placeholder="Fulfilment Date" />
                            <input class = "time" type="text" placeholder="FulfilTime" name="FulfilTime"
                            id="FulfilTime"  /></td>
                        </tr>
						 <tr>
                            <td>SLA</td>
 
                            <td><input type="text" id="SLABreeches" name="SLABreeches" /></td>
                        </tr>
 
                       				
 
                        <tr>
                            <td>Risk Code (From Risk Catalouge)</td>
 
                            <td>
                            <select name="RiskCode">
                            <option value="All">All</option>
                            <option value="Incomplete">Incomplete</option>
                            <option value="No Risk">No Risk</option>
                            <option value="P3D3">P3D3</option>
                            <option value="S2A2">S2A2</option>
                            </select></td>
                        </tr>
						<tr>
                            <td>PPA (Post Project Analysis)</td>
                            <td> 
                            <select name="PPA">
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                            <option value="Incomplete">Incomplete</option>
                            </select>
                            </td>
                        </tr>
 
                        <tr>
                            <td>Inter GDC Assignee(s)</td>
 
                            <td><input type="text" name="InterGDCAssignee" /></td>
                        </tr>
 
                        
						<tr>
                            <td>Request Transferred to Inter GDC</td>
 
                            <td><input type="text" name="ReqTransferedtoGDC" /></td>
                        </tr>
						<tr>
                            <td>Request Transferred from Inter GDC</td>
 
                            <td><input type="text" name="ReqTransferedfromGDC" /></td>
                        </tr>
                        <tr>
                            <td>Transfer Reason</td>
 
                            <td><input type="text" name="TransferReason" /></td>
                        </tr>
						<tr>
                            <td>Specific Skills</td>
 
                            <td><input type="text" name="SpecialSkills" /></td>
                        </tr>
                        
                        <tr>
                            <td>Remarks:</td>
 
                            <td><input type="text" name="Remarks" /></td>
                        </tr>
                        <tr>
 
                        
                        <tr>
                            <td colspan="2"><input type="submit" value="submit" style="float:right;top:10px;position:relative;"/></td>
                        </tr>
                        
                        
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</body>
 
</html>
