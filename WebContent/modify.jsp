
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
        #Deliverables { width:85px; }
        #AssigneeName { width:85px; }
        #AddMore { width:50px; }
    </style>
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
    <script type="text/javascript" src="./js/jquery.loadJSON.js"></script>
    <script type="text/javascript" src="./js/subteamSelection.js"></script>
    <script type="text/javascript" src="./js/subteamSelection_modify.js"></script>
    

    <script>  
    var gdcvalues="";
    var updateboolean=0;
    var delivercount=0;
    $(function() {
    	//$( ".date" ).datepicker({ dateFormat: "yy-mm-dd" });
    	$( ".date" ).datepicker();
    	$( ".time" ).timepicker();
    	
    	
    });
    
    function CalcuateTimeDiff() 
    {
    	//alert("chk");
    var RecvDate = $( "#RecvDate" ).datepicker( "getDate" );
    var FulfillmentDate = $( "#FulfilmentDate" ).datepicker( "getDate" );
  
    var RecvTime = $("#RecvTime").timepicker("getTime");
    var FulfillmentTime = $("#FulfilTime").timepicker("getTime");


    $("#SLABreeches").val(((FulfillmentDate-RecvDate)/3600000) + (((FulfillmentTime-RecvTime)/3600000)));
    }
    
    
    
    function GDCvalueCreate()
    {
    	
    	 var gdc= document.forms["form"]["GDC"];

    	    for (var i = 0; i < gdc.options.length; i++) {
    	      if (gdc.options[i].selected) {
    	    	  gdcvalues=gdcvalues+","+gdc.options[i].value;
    	      }
    	    }
    	    
    	    var form =  document.forms["form"];
    		var hiddenField = document.createElement("input");	
    		hiddenField.setAttribute("name", "gdcval");
    		hiddenField.setAttribute("value",gdcvalues);
    		hiddenField.type="hidden";
    		form.appendChild(hiddenField);
    	
    }
    
    
    function noOfDeliverable()
    {
    	 var form =  document.forms["form"];
 		var hiddenField = document.createElement("input");	
 		hiddenField.setAttribute("name", "NoOfDelivery");
 		hiddenField.setAttribute("value",delivercount);
 		hiddenField.type="hidden";
 		form.appendChild(hiddenField);
    	
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
    var language=document.forms["form"]["Language"];

    var h=document.forms["form"]["Assignee"];
    var i=document.forms["form"]["Customer"];
    var j=document.forms["form"]["Theatre"];
    var k=document.forms["form"]["ASType"];
    var l=document.forms["form"]["PrjClassification"];
    var o=document.forms["form"]["ModeReqRCV"];
    var p=document.forms["form"]["datepicker1"];
    var termchk=document.forms["form"]["term"];
    var timechk=document.forms["form"]["Timezone"];
    var request=document.forms["form"]["RequestedBy"];
    noOfDeliverable();
    
    var RecvDate = $( "#RecvDate" ).datepicker( "getDate" );
    var FulfillmentDate = $( "#FulfilmentDate" ).datepicker( "getDate" );

    if (RecvDate== null || RecvDate=="" )
    	{
    		alert("Please fill the Request Recv Date ");
    		return false;
    	
    	}
    if (FulfillmentDate == null || FulfillmentDate =="" )
	{
		alert("Please fill the Fulfillment Date ");
		return false;
	}
    
    // * priyanka
       var regulate=document.forms["form"]["Regulatory"];

    
    
    
       if (document.getElementById('TimezoneReq').checked)
     	 {
    	   if (timechk.value=="Incomplete")
    	   {
     		 alert ("Please select Timezone");
     			timechk.focus();
      	 		return false;
    	   }
     	 }
    

    if (regulate.value=="Incomplete")
   	 {
   	 alert ("Please select Regulatory");
   	 regulate.focus();
    	 return false;
   	 }
    
    if (language.value=="Incomplete" || language.value=="")
 	 {
 	 alert ("Please enter Language");
 	language.focus();
  	 return false;
 	 }
    if (termchk.value=="Incomplete")
  	 {
  	 alert ("Please select Project Term");
  	 regulate.focus();
   	 return false;
  	 }
    
    if (request.value == "" || (request.value.length == 0  && !isNaN(request.value)) )
    {
    	alert("Please Enter Email ID of Requester");	
    	request.focus();
    	return false;
    }  
   
   //priyanka
               
    if (!(c.value == "Incomplete" || (c.value.length == 6  && !isNaN(c.value)) ))
    {
    	alert("please Enter Valid 6 digit PID Number");	
    	c.focus();
    	return false;
    }
   if (updateboolean==0)
   {
	   alert("There are no New Changes");
	   return false;
   }
   
    GDCvalueCreate();
    }  
    
        
    </script>
    
<script>

function load(js_obj)
{
    alert("This Record is locked for you.Please complete your transaction in 15 Minutes otherwise you will be logged out forcibly");
	jsonObj = js_obj;
	console.log(js_obj);
	$(document).ready(
			function()
				{
				$('form').loadJSON(jsonObj);
				//var Archteam = jsonObj.ArchTeam;
				//alert ("st"+jsonObj.PrjctStatus+"end");
				$("#PrjctStatus").val(jsonObj.PrjctStatus).prop('selected',true);
				//$("#PrjctStatus").val(jsonObj.PrjctStatus).prop('selected',true);
				 //alert("st"+jsonObj.ArchTeam+"end");
				var str = jsonObj.Fiscal;
				
				 var gdcvalues=jsonObj.GDC;
				var regul=jsonObj.Regulatory;
			    var timezone=jsonObj.Timezone;
				var fiscal = str.split(" ");
				
				//alert("st"+jsonObj.Del1+"end");
				//alert("st"+jsonObj.Del2+"end");
				//alert("st"+jsonObj.NoOfDelivery+"end");
				 delivercount=jsonObj.NoOfDelivery;
				loadadddeliverable();
				//alert("st"+delivercount+"end");
			$("#PPA").val(jsonObj.PPA).prop('selected',true);
			
				$("#ModeReqRCV").val($.trim(jsonObj.ModeReqRecv)).prop('selected',true);
				
				
				
				    
					$("#term").val(jsonObj.term).prop('selected',true);
				
				var fiscal = str.split(" ");
				$("#Fiscal_Quarter").val(fiscal[0]).prop('selected',true);
				$("#Fiscal_Year").val(fiscal[1]).prop('selected',true);				
				//console.log(Archteam);
				//$('option[value="+Archteam+"]').attr('selected',true);
				$("#ArchTeam").val(jsonObj.ArchTeam).prop('selected',true);
				  
				SetSubTeam_modify(jsonObj.ArchTeam);
				
				$("#SubTeam").val(jsonObj.SubTeam).prop('selected',true);
				$("#GSP_Manager").val(jsonObj.GSPManager).prop('selected',true);
				$("#Theatre").val(jsonObj.Theatre).prop('selected',true);
				//document.getElementsByName("Del1").val(jsonObj.Del1).prop('selected',true);
				$("#Del1").val(jsonObj.Del1).prop('selected',true);
				$("#Del2").val(jsonObj.Del2).prop('selected',true);
				$("#Del3").val(jsonObj.Del3).prop('selected',true);
				
				$("#ASType").val(jsonObj.ASType).prop('selected',true);
				$("#Type").val(jsonObj.Type).prop('selected',true);
				
				
				$("#PrjClassification").val(jsonObj.PrjClassification).prop('selected',true);
				//$("#ModeReqRcv").val(jsonObj.ModeReqRcv).prop('selected',true);
				$("#OnsiteInfo").val(jsonObj.OnsiteInfo).prop('selected',true);
				//alert("chk");
			
				var gdcval=gdcvalues.split(",");
				for(var i=1;i<gdcval.length;i++)
			    	$("#GDC option[value='" + $.trim(gdcval[i]) + "']").prop("selected", true);
			$("#Regulatory").val($.trim(regul)).prop('selected',true);
			$("#Timezone").val($.trim(timezone)).prop('selected',true);
			if(jsonObj.TimezoneReq ==='on'){
				
				$('#Timezone').show();
			}
			else{
				$("input[name='TimezoneReq'][value='off']").attr("checked", "checked");
				$('#Timezone').hide();
			}
				$("#RequestRecvTime").val(jsonObj.RequestRecvTime).prop('selected',true);
				$("#FulfilTime").val(jsobObj.FulfilTime).prop('selected',true);
			   
				 
				
				
				}
			);
}

function loadadddeliverable()
{

//alert("chk"+delivercount);
	if (delivercount==2)
		{
		
	  	document.getElementById("first").style.display="";
	
		}
	else
	if (delivercount==3)
	{
	
		document.getElementById("first").style.display="";
  	document.getElementById("second").style.display="";

	}
	
	
	
}
function adddeliverable()
{
	if (delivercount==0)
		delivercount++;
	delivercount++;
	//alert(delivercount);
	if (delivercount==2)
		{
	  	document.getElementById("first").style.display="";
		
		}
	else
	if (delivercount==3)
	{
	document.getElementById("first").style.display="";
  	document.getElementById("second").style.display="";
	
	}
	else if (delivercount>=3)
		{
		delivercount--;
		alert("You can not add more than three Deliverables")
		}
	
	
}

function calcBusinessDays(dDate1, dDate2) { // input given as Date objects  
    var iWeeks, iDateDiff, iAdjust = 0;  
    if (dDate2 < dDate1) return -1; // error code if dates transposed  
    var iWeekday1 = dDate1.getDay(); // day of week  
    var iWeekday2 = dDate2.getDay();  
    iWeekday1 = (iWeekday1 == 0) ? 7 : iWeekday1; // change Sunday from 0 to 7  
    iWeekday2 = (iWeekday2 == 0) ? 7 : iWeekday2;  
    if ((iWeekday1 > 5)) iAdjust++;
    if ((iWeekday2 > 5)) iAdjust++;
    // adjustment if both days on weekend  
    iWeekday1 = (iWeekday1 > 5) ? 5 : iWeekday1; // only count weekdays  
    iWeekday2 = (iWeekday2 > 5) ? 5 : iWeekday2;  
  
    // calculate differnece in weeks (1000mS * 60sec * 60min * 24hrs * 7 days = 604800000)  
    iWeeks = Math.floor((dDate2.getTime() - dDate1.getTime()) / 604800000); 
  
    if (iWeekday1 <= iWeekday2) {  
      iDateDiff = (iWeeks * 5) + (iWeekday2 - iWeekday1); 
    } else {  
      iDateDiff = ((iWeeks + 1) * 5) - (iWeekday1 - iWeekday2); 
    }  
  
    iDateDiff -= iAdjust // take into account both days on weekend  
   
    		return (iDateDiff); // add 1 because dates are inclusive  
} 




function CalcuateTimeDiff() 
{
var RecvDate = $( "#RecvDate" ).datepicker( "getDate" );
var FulfillmentDate = $( "#FulfilmentDate" ).datepicker( "getDate" );
var day=RecvDate.getDay();
//alert(day);
var RecvTime = $("#RecvTime").timepicker("getTime");
var FulfillmentTime = $("#FulfilTime").timepicker("getTime");
//alert(FulfillmentDate-RecvDate);

//alert(bd);


//alert("#"+RecvDate+"#"+FulfillmentDate+"#"+RecvTime+"#"+"#"+FulfillmentTime"#");
if(RecvDate!= null && RecvDate!="" && FulfillmentDate != null && FulfillmentDate !="" && RecvTime != null && RecvTime != "" && FulfillmentTime != null && FulfillmentTime !="") {
	var bd= calcBusinessDays(RecvDate,FulfillmentDate);
	
	var sla=bd*24 + ((FulfillmentTime-RecvTime)/3600000);
	//alert(sla);
	if(sla>=0)
    	
	     $("#SLABreeches").val(sla);
	    	else
	    		$("#SLABreeches").val(0);
	}

updateVariable( document.forms["form"]["RecvDate"]);

updateVariable( document.forms["form"]["FulfilmentDate"]);
}


function check(value,ddbutton){
		if(value==='yes'){
			$('#'+ddbutton+'').show();
		}
		else{
			
			var ele = document.getElementById("Timezone");
		    
			ele.options[32].selected=true;
			
			//alert(ele.options[ele.selectedIndex].text);
			
			$('#'+ddbutton+'').hide();
		}
	}
	
function updateVariable(updatedObj)
{
	//alert(updatedObj.value);
	//alert(jsonObj[updatedObj.name]);
	if(jsonObj[updatedObj.name]!=updatedObj.value)
		updateboolean=1;
	//alert(updatedObj.name);
	
	}

	
</script>
    

</head>
<body onload='load(${js_obj})'>

    
    <div class="login" style="width:90%;height=100%;">
        <h1>Enter Project Details</h1>
        <form name="form" id="form" method="post" action="ProjDetails"   onsubmit="return validateFormcomp()">
            <div style="float: left; border-right: 1px solid grey; margin-right: 10px;">
                <table>
                    <tbody>
                            <tr>
                            <td>Fiscal:</td>
 
                            <td><select name="Fiscal_Quarter" id="Fiscal_Quarter" style= "width:104px;" Onchange = "updateVariable(this)">
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
                                 <select name="Fiscal_Year" id="Fiscal_Year" style= "width:104px;" onchange="updateVariable(this)">
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
						<tr style="display:none;">
                            <td>JIRA ID:</td>
 
                            <td><input type="text" name="JiraID" id="JiraID" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
                        
                         <!--  *Priyanka -->
   <tr>
                            <td>Service Catalogue ID</td>
 
                            <td><input type="text" name="ServiceCatID" id="ServiceCatID"  placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
 
 
 <!-- / Priyanka -->
 
                        <tr>
                            <td>PID Number:</td>
 
                            <td><input type="text" name="PIDNumber" id="PIDNumber" value="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						
						<tr>
                            <td>Requested By <font color=red>*</font></td>
 
                            <td><input type="text" name="RequestedBy" id="RequestedBy" placeholder="Enter Email ID" onchange="updateVariable(this)"/></td>
                        </tr>
						
                        <tr>
                            <td style="min-height: 50px;">Arch Team <font color=red>*</font></td>
 
                            <td><select name="ArchTeam" id="ArchTeam" onchange="SetSubTeam(this);">
                            	<option value="Collab">
                                    Collab
                                </option>
								<option value="Competency">
                                    Competency
                                </option>
                                <option value="CPS">
                                    CPS
                                </option>
                                <option value="DCC">
                                    DCC
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
								<option value="Software">
                                    Software
                                </option>
								<option value="Security">
                                    Security
                                </option>
								<option value="NMS">
                                    NMS
                                </option>
                                 <option value="SVS">
                                    SVS
                                </option>
                                 <option value="Migration">
                                    Migration
                                </option>
                                 <option value="BDM">
                                    BDM
                                </option>
                            </select></td>
                        </tr>
						
						<tr>
                            <td>Sub Team <font color=red>*</font></td>
 
                            <td><select name="SubTeam" id="SubTeam" onchange="updateVariable(this)">
                            <option value="BV">
                                    BV
                                </option>
                                 <option value="CC">
                                   CC
                                </option>
                                <option value="UC">
                                   UC
                                </option>
                                </select>
                           </td>
                        </tr>
 
                        <tr>
 
                       <tr>
                            <td>GSP Manager</td>
 
                            <td><select name="GSPManager" id="GSP_Manager" onchange="updateVariable(this)">
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
                               
                                <option value="Sastry Kuchimanchi">
                  					Sastry Kuchimanchi
 								</option>
 								<option value="Raghuram Kasavaraju">
 									Raghuram Kasavaraju
 								</option>
 								<option value="Vidhi Rastogi">
 									Vidhi Rastogi
 								</option>
 								<option value="Vijay Shekhar">
                                    Vijay Shekhar
                                </option>
                                 <option value="Praveen Sankaran">
                                   Praveen Sankaran
                                </option>
                                <option value="Venkata Agoram">
                                    Venkata Agoram
                                </option>
                                <option value="Beena Parameswaran Nair">
                                   Beena Parameswaran Nair
                                </option>
                                <option value="Pavan Vajhula">
                                    Pavan Vajhula
                                </option>
                                <option value="Vijay Veerla">
                                    Vijay Veerla
                                </option>
                                <option value="Hari Thiagarajana">
                                   Hari Thiagarajan
                                </option>
                                
                                   <option value="Frank Corrao">
                                   Frank Corrao
                                </option>
                                   <option value="Ched Capps">
                                   Ched Capps
                                </option>
                                   <option value="Mauricio Blanc">
                                   Mauricio Blanc
                                </option>
                                   <option value="Michal Zajaczkowski">
                                  Michal Zajaczkowski
                                </option>
                                   <option value="Przemyslaw Likus">
                                   Przemyslaw Likus
                                </option>
                                   <option value="Bartosz Krowicki">
                                  Bartosz Krowicki
                                </option>
                                   <option value="Wszebor Boksa">
                                  Wszebor Boksa
                                </option>
                                 <option value="Zheng Liu">
                                 Zheng Liu
                                </option>
                                 <option value="PhotoDongning Yang ">
                                  PhotoDongning Yang 
                                </option>
                                 <option value="Mengjie Wu">
                                 Mengjie Wu
                                </option>
                                 <option value="Claudia Martinez">
                                 Claudia Martinez
                                </option>
                                <option value="Vivasvan Shastri">
                                Vivasvan Shastri
                                </option>
                            </select></td>
                        </tr>
						<tr>
                            <td>Assignee(s):</td>
 
                            <td><input type="text" name="Assignee" id="Assignee" placeholder="Enter Email ID" onchange="updateVariable(this)" /></td>
                        </tr>
						<tr>
                            <td>Customer:</td>
 
                            <td><input type="text" name="Customer" id="Customer"  placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						<tr>
                            <td>Theatre <font color=red>*</font></td>
 
                            <td>
                            <select name="Theatre" id="Theatre" onchange="updateVariable(this)">
                                <option value="Americas ENT">
                                   Americas ENT
                                </option>
 
                                <option value="Americas SP">
                                    Americas SP
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
                                <option value="US Public Sector">
                                	US Public Sector
                                </option>
                               
                                <option value="Incomplete" selected>
                                	Incomplete
                                </option>
                                </select>
                          </td>
                        </tr>
                        
                        
                        
                        
                        
                        
						
						
						 <!--  * priyanka -->
                       <tr><td>Regulatory <font color=red>*</font> </td>
                          <td> 
                            <select id="Regulatory" name="Regulatory" onchange="updateVariable(this)">
                             <option value="Incomplete">Incomplete</option>
                             <option value="No">No</option>
							<option value="Yes">Yes</option>
                           
                            </select>
                             	
                            </td>
                           
                        </tr>
                     
                        <!-- /Priyanka -->
						
						<tr>
                            <td>AS classification:</td>
 
                            <td><select name="ASType" id="ASType" onchange="updateVariable(this)">
															
                                <option value="AS-C">
                                    AS-C
                                </option>
                                <option value="AS-F">
                                    AS-F
                                </option>
 
                                <option value="AS-S">
                                    AS-S
                                </option>
								<option value="AS-T" selected = "selected">
                                    AS-T
                                </option>
                                <option value="CAP" >
                                    CAP
                                </option>
                                <option value="Incomplete">
                                    Incomplete
                                </option>
                            </select></td>
                        </tr>
                        
                        <tr>
                        <td>Type:</td>
                        <td><select name="Type" id="Type" onchange="updateVariable(this)">
                        <option value="Ent">Ent</option>
                        <option value="SP">SP</option>
                        </select>
						</td>
						</tr>
						
						
						 <tr>
                            <td>Language Support<font color=red>*</font></td>
 
                            <td><input type="text" name="Language" id="Language"  placeholder="English" onchange="updateVariable(this)"/></td>
                        </tr>
						
						
						<tr>
                            <td>Project Classification</td>
 
                            <td><select name="PrjClassification" id=
                            "PrjClassification" onchange="updateVariable(this)">
								<option value="A">
                                    A
                                </option>
 
                                <option value="B">
                                    B
                                </option>
 
                                <option value="C">
                                    C
                                </option>
								<option value="Incomplete" selected = "selected">
                                    Incomplete
                                </option>
                                
                            </select></td>
                       </tr>
						 <tr style='display:none'>
                            <td>JIRA Created by:</td>
 
                            <td><input type="text" name="JiraCreatedBy" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
 
                       
                        <tr>
                            <td>Mode of Request Recv:</td>
 
                            <td><select name="ModeReqRecv" id="ModeReqRCV" onchange="updateVariable(this)">
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
                            <td>Onsite / Remote / FIFO</td>
 
                            <td><select name="OnsiteInfo" id="OnsiteInfo" onchange="updateVariable(this)">
                            <option value="Remote">Remote</option>
                            <option value="Onsite">Onsite</option>
                            <option value="OnsiteandRemote">Onsite & Remote</option>
                            <option value="FIFO">FIFO</option>
                            <option value="Incomplete">Incomplete</option>
                            </select>
                           </td>
                        </tr>
 
                        <tr>
                            <td>VISA (Work Permit / Buisness VISA)</td>
 
                            <td><input type="text" name="VisaWrkPermit" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						<tr>
                            <td>VISA (Available / Not Available)</td>
 
                            <td><input type="text" name="VisaAvailability" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
                        
                        
                         <tr>
                            <td align="left">Timezone Requirement <font color=red>*</font></td>
 
                            <td align="left"><input type="radio" style= "width:15px;" name="TimezoneReq" id="TimezoneReq" value="on" onchange="check('yes','Timezone');">YES
                            <input type="radio" style= "width:15px;" name="TimezoneReq" id="TimezoneReq" value="off" checked="checked"  onchange="check('no','Timezone');">NO
                            <select name="Timezone" id="Timezone" style="display:none; width:125px;" onchange="updateVariable(this)">
      <option value="(GMT -12:00) Eniwetok, Kwajalein">(GMT -12:00) Eniwetok, Kwajalein</option>
      <option value="(GMT -11:00) Midway Island, Samoa">(GMT -11:00) Midway Island, Samoa</option>
      <option value="(GMT -10:00) Hawaii">(GMT -10:00) Hawaii</option>
      <option value="(GMT -9:00) Alaska" >(GMT -9:00) Alaska</option>
      <option value="(GMT -8:00) Pacific Time">(GMT -8:00) Pacific Time </option>
      <option value="(GMT -7:00) Mountain Time">(GMT -7:00) Mountain Time </option>
      <option value="(GMT -6:00) Central Time, Mexico City">(GMT -6:00) Central Time, Mexico City</option>
      <option value="(GMT -5:00) Eastern Time , Bogota, Lima">(GMT -5:00) Eastern Time , Bogota, Lima</option>
      <option value="(GMT -4:00) Atlantic Time, Caracas, La Paz">(GMT -4:00) Atlantic Time, Caracas, La Paz</option>
      <option value="(GMT -3:30) Newfoundland">(GMT -3:30) Newfoundland</option>
      <option value="(GMT -3:00) Brazil, Buenos Aires, Georgetown">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
      <option value="(GMT -2:00) Mid-Atlantic">(GMT -2:00) Mid-Atlantic</option>
      <option value="(GMT -1:00 hour) Azores, Cape Verde Islands">(GMT -1:00 hour) Azores, Cape Verde Islands</option>
      <option value="(GMT) Western Europe Time, London, Lisbon, Casablanca">(GMT) Western Europe Time, London, Lisbon, Casablanca</option>
      <option value="(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris">(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris</option>
      <option value="(GMT +2:00) Kaliningrad, South Africa">(GMT +2:00) Kaliningrad, South Africa</option>
      <option value="(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
      <option value="(GMT +3:30) Tehran">(GMT +3:30) Tehran</option>
      <option value="(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
      <option value="(GMT +4:30) Kabul">(GMT +4:30) Kabul</option>
      <option value="(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
      <option value="(GMT +5:30) Bombay, Calcutta, Madras, New Delhi" >(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
      <option value="(GMT +5:45) Kathmandu">(GMT +5:45) Kathmandu</option>
      <option value="(GMT +6:00) Almaty, Dhaka, Colombo">(GMT +6:00) Almaty, Dhaka, Colombo</option>
      <option value="(GMT +7:00) Bangkok, Hanoi, Jakarta">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
      <option value="(GMT +8:00) Beijing, Perth, Singapore, Hong Kong">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
      <option value="(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
      <option value="(GMT +9:30) Adelaide, Darwin">(GMT +9:30) Adelaide, Darwin</option>
      <option value="(GMT +10:00) Eastern Australia, Guam, Vladivostok">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
      <option value="(GMT +11:00) Magadan, Solomon Islands, New Caledonia">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
      <option value="(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
          <option value="Others">Others</option>
            <option value="Incomplete" selected>Incomplete</option>
</select>
               </td>         </tr>
                        
                         <tr>
                            <td>Remarks:</td>
 <td>          <textarea  name="Remarks" placeholder= "Incomplete" cols="30" rows="15" style="overflow-y: scroll; width: 220px; height: 50px" > </textarea></td>	
                          <!--    <td><input type="text" name="Remarks" placeholder="Incomplete" onchange="updateVariable(this)"/></td>-->
                        </tr>
                    
                        
                         <tr> <td colspan="2"><a href="http://iwe.cisco.com/web/view-post/post/-/posts?postId=438800099"  target="_blank" style="float:left;top:0px;position:relative;">Please refer for Service owner Information</a></td>
                        </tr>  
                     </tbody>
                </table>
            </div>
 
            <div style="">
                <table>
                    <tbody>
                    <tr>
                            <td>Long Term / Short Term <font color=red>*</font></td>
 
                            <td><select name="term" id="term" onchange="updateVariable(this)">
							
							<option value="Long Term">Long Term</option>
                            <option value="Short Term">Short Term</option>
							<option value="Incomplete" selected = "selected">Incomplete</option>
                            </select>
                            </td>
                        </tr>
                    <tr>
                            <td>Service Owner / Program Manager</td>
 
                            <td><input type="text" name="ServiceOwner" id="ServiceOwner"  placeholder="Enter Email ID" onchange="updateVariable(this)"/></td>
                        </tr>
                     <tr>
                            <td>Project Status</td>
 
                             <td>
                            <select name="PrjctStatus" onchange="updateVariable(this)" id="PrjctStatus">
							<option value="Hold">Hold</option>
                            <option value="Cancelled">Cancelled</option>
                            <option value="Completed">Completed</option>
                            <option value="Incomplete">Incomplete</option>
							<option value="In progress" selected = "selected">In progress</option>
                            <option value="Not Started">Not Started</option>
                            </select>
                            </td>
                        </tr>
                         
						<tr>
                            <td>Project Decline Reasons</td>
 
                            <td><input type="text" name="PrjctDeclineLineReasons" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						<tr>
                            <td>Request Recv Date <font color=red>*</font></td>
 
                            <td><input class="date" type="text" placeholder="Request Recieved Date" name="RequestRecvDate" style= "width:84px;"
                            id="RecvDate" onchange ="CalcuateTimeDiff()" /><input class = "time" type="text" placeholder="Request Recieved Time" name="RequestRecvTime"
                            id="RecvTime" style= "width:84px;" onchange ="CalcuateTimeDiff()" /></td>
                        </tr>
						
						<tr style='display:none'>
						    <td>JIRA Create Date</td>
 
                            <td><input type="text" class="date" name="JiraCreateDate" id="JiraCreateDate" placeholder="JIRA Create Date" onchange="updateVariable(this)"/></td>
                        </tr>
						
						<tr style='display:none'>
                            <td>JIRA Ack Date</td>
 
                            <td><input class="date" type="text" name="JiraAckDate" id="JiraAckDate" placeholder="JIRA Ack Date" onchange="updateVariable(this)"/></td>
                        </tr>
						
						<tr>
                            <td>Request Ack Date:</td>
 
                            <td><input class="date" type="text" name="ReqAckDate" id="ReqAckDate" placeholder="Request Ack Date" onchange="updateVariable(this)" /></td>
                        </tr>
						
                        <tr>
                            <td>Resource Assign Date</td>
 
                            <td><input type="text" class="date" name="ResourceAsgnDate" id="ResourceAsgnDate" placeholder="Resource Assign Date" onchange="updateVariable(this)"/></td>
                        </tr>
						
						<tr>
                            <td>Fulfilment date <font color=red>*</font></td>
 
                            <td><input class="date" type="text" name="FulfilmentDate" id="FulfilmentDate" placeholder="Fulfilment Date" style= "width:84px;" onchange ="CalcuateTimeDiff()"/>
                            <input class = "time" type="text" placeholder="FulfilTime" name="FulfilTime"
                            id="FulfilTime" style= "width:84px;" onchange = "CalcuateTimeDiff()" /></td>
                        </tr>
						 <tr>
                            <td>SLA(in HRS)</td>
 
                            <td><input type="text" id="SLABreeches" name="SLABreeches" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						
                        <tr>
						
						<tr>
                         <td>Planned Start</td>
 
                            <td><input class="date" type="text" placeholder="Planned Start" name=
                            "PrjctStartDate" id="datepicker1" onchange="updateVariable(this)" /></td>
                        </tr>
 
                        <tr>
                            <td>Actual Start Date</td>
 
                            <td><input type="text" class="date" placeholder="Actual Start Date" name=
                            "ActStartDate" id="datepicker2"  onchange="updateVariable(this)" /></td>
                        </tr>
						
						<tr>
                            <td>Planned End </td>
 
                            <td><input class="date" type="text" placeholder="Planned End" name=
                            "PrjctEndDate" id="datepicker3" onchange="updateVariable(this)"/></td>
                        </tr>
 
                        <tr>
                            <td>Actual End Date</td>
 
                            <td><input type="text" class="date" placeholder="Actual End Date" name=
                            "ActEndDate" id="datepicker4" onchange="updateVariable(this)"  /></td>
                        </tr>
                        
                        
                         
 
                        <tr>
                            <td>Risk Code (From Risk Catalouge)</td>
 
                            <td>
							<input type="text" name="RiskCode" placeholder="Incomplete" onchange="updateVariable(this)"/>
							</td>
                        </tr>
						<tr>
                            <td>PPA (Post Project Analysis)</td>
                            <td> 
                            <select name="PPA" id ="PPA" onchange="updateVariable(this)">
							<option value="Yes">Yes</option>
                            <option value="No">No</option>
							<option value="Incomplete" selected = "selected">Incomplete</option>
                            </select>
                            </td>
                        </tr>
 
                        <tr style='display:none'>
                            <td>Inter GDC Assignee(s)</td>
 
                            <td><input type="text" name="InterGDCAssignee" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
 
                        
						<tr style='display:none'>
                            <td>Request Transferred to Inter GDC</td>
 
                            <td><input type="text" name="ReqTransferedtoGDC" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						<tr>
                            <td>Request Transferred from Inter GDC</td>
 
                            <td><input type="text" name="ReqTransferedfromGDC" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
                        <tr>
                            <td>Transfer Reason</td>
 
                            <td><input type="text" name="TransferReason" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
						<tr>
                            <td>Specific Skills</td>
 
                            <td><input type="text" name="SpecialSkills" placeholder="Incomplete" onchange="updateVariable(this)"/></td>
                        </tr>
                        
                        
                        
                         <tr>
                            <td>Deliverables </td>
 
                            <td><select  name="Del1" id="Del1" style="height:30px; position: relative;
top: -7px;">
                             <option value="---" selected>---</option>
							<option value="CRD" >CRD</option>
							<option value="HLD">HLD</option>
							<option value="LLD">LLD</option>
							<option value="NIP & ATP">NIP & ATP</option>
							<option value="Audit">Audit</option>
								<option value="Implementation">Implementation</option>
									<option value="Remote support">Remote support</option>
										<option value="PSR">PSR</option>
						</select> <input  type="text" placeholder="AssigneeName" name="Assignee1"
                            id="Assignee1" onchange="updateVariable(this)" /></td>
                            <td ><input type="button" id= "AddMore" name= "AddMore" value="Add" onclick="adddeliverable()" style="float:right;top:10px;position:relative;"/></td>
                         </tr>
                        
                       <tr id = 'first' style="display:none;"><td></td>
                            <td><select  name="Del2" id="Del2" style="height:30px; position: relative;
top: -7px;" >
                             <option value="---" selected>---</option>
							<option value="CRD" >CRD</option>
							<option value="HLD">HLD</option>
							<option value="LLD">LLD</option>
							<option value="NIP & ATP">NIP & ATP</option>
							<option value="Audit">Audit</option>
								<option value="Implementation">Implementation</option>
									<option value="Remote support">Remote support</option>
										<option value="PSR">PSR</option>
						</select><input  type="text" placeholder="AssigneeName" name="Assignee2"
                            id="Assignee2" onchange="updateVariable(this)" /></td>
                           
                         </tr>
                         <tr id = 'second' style="display:none;"><td></td>
                            <td><select  name="Del3" id="Del3" style="height:30px; position: relative;
top: -7px;">
                            <option value="---" selected>---</option>
							<option value="CRD" >CRD</option>
							<option value="HLD">HLD</option>
							<option value="LLD">LLD</option>
							<option value="NIP & ATP">NIP & ATP</option>
							<option value="Audit">Audit</option>
								<option value="Implementation">Implementation</option>
									<option value="Remote support">Remote support</option>
										<option value="PSR">PSR</option>
						</select><input  type="text" placeholder="AssigneeName" name="Assignee3"
                            id="Assignee3" onchange="updateVariable(this)" /></td>
                            
                         </tr>
                        
                        
                       
                        <tr>
 
                         <tr>
						<td rowspan="2" style="text-align:left;vertical-align:middle;padding:0">GSP GDC <font color=red>*</font></td>
						<td>
						<select multiple style="height:50px" name="GDC" id="GDC" onchange="updateVariable(this)" required>
							<option value="Bangalore">Bangalore</option>
							<option value="Dalian">Dalian</option>
							<option value="Krakow">Krakow</option>
							<option value="Mexico">Mexico</option>
							<option value="RTP">RTP</option>
						</select>
						</td>
                        
                        </tr>
                        
                        <tr>
                            <td colspan="2"><input type="submit" value="Update" style="float:right;top:10px;position:relative;"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height:20px"></td>
                        </tr>
                        
                    </tbody>
                </table>
				 <input type="hidden" id="SNo" name="SNo"/>
            </div>
        </form>
    </div></body>
 
</html>
