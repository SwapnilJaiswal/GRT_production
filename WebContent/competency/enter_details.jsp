
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Competency Request Create</title>

<link rel="stylesheet" href="./css/styleQueryForm.css">
<link rel="stylesheet" href="./css/jquery.timepicker.css">

<link rel="stylesheet" type="text/css"
	href="./css/jquery.autocomplete.css" />
<script src="./js/jquery-1.8.2.min.js"></script>
<script src="./js/jquery.autocomplete-min.js"></script>
<script type="text/javascript" src="./js/jquery.timepicker.js"></script>


<link rel="stylesheet" href="./js/searchautocomplete/jquery-ui.css">
  <script src="./js/searchautocomplete/jquery-1.10.2.js"></script>
  <script src="./js/searchautocomplete/jquery-ui.js"></script>
  <script src="./js/searchautocomplete/chosen.jquery.js"></script>
  <script src="./js/searchautocomplete/chosen.jquery.min.js"></script>
  <link rel="stylesheet" href="./js/searchautocomplete/chosen.css">



<style>
td {
	vertical-align: middle;
}
table{
width:100%;
}
.theader {
	font-size: 22px;
	font-weight: normal;
	margin-bottom: 20px;
	margin-top: 20px;
}
</style>

<script>  
	var pidValidated = false;
    var CurrentFiscalQuarter, Current_Year,Current_month;
    $(function() {
    	
    	$( ".date" ).datepicker();
    	
    });
	
	$(function(){
		var d=new Date();
		var cdate=d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
		//alert(cdate);
		document.getElementById("CreatedDate").value=cdate;
		document.getElementById("CreatedDate").readOnly=true;
	});
   
function validate_form(){
	//alert(document.getElementById("StartDate").value+"ssda");
	var date1 = document.getElementById("StartDate").value;
	//alert("date is "+date1);
	if(date1=="")
	{
	document.getElementById("StartDate").value="";
	}
	var dT = document.getElementById("Region").value;
	if(dT=='select'){
	alert("please select a region");
	return false;
	}
	else{
		$('#x').val(x);	
	}
	var capId = $('#CapId').val();
	if(capId =="" && !($('#DeliverableClassification').val() == "Deployment Services" || $('#DeliverableClassification').val() == "Design Services")){
		var pid = $('#Pid').val();
		var task = $('#Task').val();
		if(pid == "" && task == "") {
			alert("Please enter PID and Task details");
			return false;
		}
		else if(pid=="" && task != ""){
			alert("Please enter PID");
			return false;
		}
		else if(task=="" && pid != ""){
			alert("Please enter Task");
			return false;
		}
		else if(pidValidated == false){
			alert("Please input pid and validate it");
			return false;
		}
		
	 }
	
	var limitField=this.form.SpecialComments;
	var limitFieldGR=this.form.Golden;
	var limitFieldDesc=this.form.Div6Description;
	var limitFieldDesc7=this.form.Div7Description;
	var limitFieldDesc8=this.form.Div8Description;
	
	var limitFieldExPr=this.form.ExistingFeatureProtocolinfo;
	var limitFieldFutPr=this.form.FutureFeatureProtocolinfo;
	var limitFieldPr7=this.form.Div7Protocol;
	var limitFieldPr8=this.form.Div8Protocol;
	var limitFieldHard8=this.form.Div8Hardware;
	var limitFieldHard7=this.form.Div7Hardware;
	
	var limitFieldNPA=this.form.NPADescription;
	var limitFieldTr=this.form.NPANPTrack;
	var limitFieldCNA=this.form.CNADescription;
	var limitFieldSORA=this.form.SoraDescription;
	var limitFieldNewHrd=this.form.FutureHardwareinfo;
	var limitFieldSORATr=this.form.SORANPTrack;
	var limitFieldTriggers=this.form.Triggers;
	
    var limitNum=10000;
	if (limitField.value.length > limitNum) {
	alert("Please Limit the Characters in Special Comments Field to 10000");
			return false;
	}
	if (limitFieldGR.value.length > limitNum) {
		alert("Please Limit the Characters in Golden Rules Field to 10000");
				return false;
		}
	
	if (limitFieldDesc.value.length > limitNum) {
		alert("Please Limit the Project Description to 10000 characters");
				return false;
		}
	
	if (limitFieldDesc7.value.length > limitNum) {
		alert("Please Limit the Project Description to 10000 characters");
				return false;
		}
	if (limitFieldDesc8.value.length > limitNum) {
		alert("Please Limit the Project Description to 10000 characters");
				return false;
		}
	
	if (limitFieldFutPr.value.length > limitNum) {
		alert("Please Limit the New Feature/Protocol Description to 10000 characters");
				return false;
		}
	if (limitFieldExPr.value.length > limitNum) {
		alert("Please Limit the Existing Protocol Description to 10000 characters");
				return false;
		}
	if (limitFieldPr7.value.length > limitNum) {
		alert("Please Limit the Technology/Protocol Info to 10000 characters");
				return false;
		}
	
	
	if (limitFieldTr.value.length > limitNum) {
		alert("Please Limit the NP Info to 10000 characters");
				return false;
		}
	if (limitFieldCNA.value.length > limitNum) {
		alert("Please Limit the Description to 10000 characters");
				return false;
		}
	
	if (limitFieldHard8.value.length > limitNum) {
		alert("Please Limit the Product/Hardware Info to 10000 characters");
				return false;
		}
	if (limitFieldHard7.value.length > limitNum) {
		alert("Please Limit the Product/Hardware Info to 10000 characters");
				return false;
		}
	if (limitFieldNewHrd.value.length > limitNum) {
		alert("Please Limit the New Hardware to 10000 characters");
				return false;
		}
	if (limitFieldPr8.value.length > limitNum) {
		alert("Please Limit the Technology/Protocol Info to 10000 characters");
				return false;
		}
	if (limitFieldNPA.value.length > limitNum) {
		alert("Please Limit the Description to 10000 characters");
				return false;
		}
	if (limitFieldSORA.value.length > limitNum) {
		alert("Please Limit the Description to 10000 characters");
				return false;
		}
	if (limitFieldSORATr.value.length > limitNum) {
		alert("Please Limit the NP Info to 10000 characters");
				return false;
		}
	if (limitFieldTriggers.value.length > limitNum) {
		alert("Please Limit the Triggers to 10000 characters");
				return false;
		}
	
	return true;
	}



function ShowCountryField(onsiteVal,id){
var str = "Div"+id+"Country";
switch (onsiteVal.value){

case 'Yes':{
document.getElementById(str).readOnly=false;
break;
}
case 'No':{
document.getElementById(str).readOnly=true;
break;
}
case '':{
document.getElementById(str).readOnly=true;
break;
}
case 'PartialRequirement':{
document.getElementById(str).readOnly=false;
break;
}
}
}
   
function SetDeliveryTeam(Theatre){
	var dropdown = document.getElementById("Region");
	switch (Theatre.value){
	case 'Enterprise and GES':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('select','select');
	dropdown.options[dropdown.options.length] = new Option('Automotive & Manufacturing','Automotive & Manufacturing');
	dropdown.options[dropdown.options.length] = new Option('U.S. Financials','U.S. Financials');
	dropdown.options[dropdown.options.length] = new Option('Non US Financials & IBM','Non US Financials & IBM');
	dropdown.options[dropdown.options.length] = new Option('Oil & Gas,Retail & Logistics','Oil & Gas,Retail & Logistics');
	break;
	}
	case 'Americas Enterprise':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('select','select');
		dropdown.options[dropdown.options.length] = new Option('West','West');
		dropdown.options[dropdown.options.length] = new Option('East','East');
		dropdown.options[dropdown.options.length] = new Option('South','South');
		dropdown.options[dropdown.options.length] = new Option('Central','Central');
		break;
	}
	case 'GSP':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('select','select');
	dropdown.options[dropdown.options.length] = new Option('SDE','SDE');
	dropdown.options[dropdown.options.length] = new Option('Non SDE','Non SDE');
	dropdown.options[dropdown.options.length] = new Option('Canada','Canada');
	dropdown.options[dropdown.options.length] = new Option('LATAM','LATAM');
	dropdown.options[dropdown.options.length] = new Option('APJC','APJC');
	dropdown.options[dropdown.options.length] = new Option('EMEAR','EMEAR');
	
	break;
	}
	case 'APJC':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('select','select');
	dropdown.options[dropdown.options.length] = new Option('India','India');
	dropdown.options[dropdown.options.length] = new Option('China','China');
	dropdown.options[dropdown.options.length] = new Option('Korea','Korea');
	dropdown.options[dropdown.options.length] = new Option('Japan','Japan');
	//dropdown.options[dropdown.options.length] = new Option('Asia','Asia');
	dropdown.options[dropdown.options.length] = new Option('ASEAN','ASEAN');
	dropdown.options[dropdown.options.length] = new Option('ANZ','ANZ');
	break;
	}
	case 'EMEAR':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('select','select');
	dropdown.options[dropdown.options.length] = new Option('Central','Central');
	dropdown.options[dropdown.options.length] = new Option('Emerging','Emerging');
	dropdown.options[dropdown.options.length] = new Option('North','North');
	dropdown.options[dropdown.options.length] = new Option('South','South');
	dropdown.options[dropdown.options.length] = new Option('UKI','UKI');
	dropdown.options[dropdown.options.length] = new Option('Vodafone','Vodafone');
	break;
	}
	case 'US Public Sector':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('select','select');
	dropdown.options[dropdown.options.length] = new Option('Federal','Federal');
	dropdown.options[dropdown.options.length] = new Option('SLED','SLED');
	break;
	}
	default:{
	alert(Theatre.value + ' is not yet supported');
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('Select a Theatre First','00');
	break;
	}
	}
}

function SetClassification(classification){
//var dropdown = document.getElementById("DeliveryClassification");
switch (classification.value){
case 'SORA':{
$('.sora').show();
$('.npa').hide();
$('.cna').hide();
$('.Div6').hide();
$('.Div7').hide();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = true;
document.getElementById("SORADeliverableType").required = true;
document.getElementById("ExistingFeatureProtocolinfo").required = true;
document.getElementById("SORADeliveryCategory").required = true;
document.getElementById("ExistingHardwareinfo").required = true;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = true;
document.getElementById("Triggers").required = true;
document.getElementById("SoraDescription").required = true;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
document.getElementById("DeploymentServicesDeliverableType").required = false;
document.getElementById("Div7Description").required = false;
document.getElementById("Div7Onsite").required = false;
document.getElementById("DesignServicesDeliverableType").required = false;
document.getElementById("Div8Description").required = false;
document.getElementById("Div8Onsite").required = false;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = true;
document.getElementById("NOSOEManager").required = true;
if($('#CapId').val() == ""){
	$('#pidmand').show();
	$('#taskmand').show();
}
break;
}
case 'NP/NPA/NHF':{
$('.sora').hide();
$('.npa').show();
$('.cna').hide();
$('.Div6').hide();
$('.Div7').hide();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = false;
document.getElementById("SORADeliverableType").required = false;
document.getElementById("ExistingFeatureProtocolinfo").required = false;
document.getElementById("SORADeliveryCategory").required = false;
document.getElementById("ExistingHardwareinfo").required = false;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = false;
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = true;
document.getElementById("NPADescription").required = true;
document.getElementById("NPANPTrack").required = true;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
document.getElementById("DeploymentServicesDeliverableType").required = false;
document.getElementById("Div7Description").required = false;
document.getElementById("Div7Onsite").required = false;
document.getElementById("DesignServicesDeliverableType").required = false;
document.getElementById("Div8Description").required = false;
document.getElementById("Div8Onsite").required = false;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
if($('#CapId').val() == ""){
	$('#pidmand').show();
	$('#taskmand').show();
}
break;
}
case 'Cisco Network Assessment':{
$('.sora').hide();
$('.npa').hide();
$('.cna').show();
$('.Div6').hide();
$('.Div7').hide();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = false;
document.getElementById("SORADeliverableType").required = false;
document.getElementById("ExistingFeatureProtocolinfo").required = false;
document.getElementById("SORADeliveryCategory").required = false;
document.getElementById("ExistingHardwareinfo").required = false;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = false;
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = true;
document.getElementById("CNADescription").required = true;
document.getElementById("DeploymentServicesDeliverableType").required = false;
document.getElementById("Div7Description").required = false;
document.getElementById("Div7Onsite").required = false;
document.getElementById("DesignServicesDeliverableType").required = false;
document.getElementById("Div8Description").required = false;
document.getElementById("Div8Onsite").required = false;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
if($('#CapId').val() == ""){
	$('#pidmand').show();
	$('#taskmand').show();
}
break;
}
case 'Deployment Services':{
$('.sora').hide();
$('.npa').hide();
$('.cna').hide();
$('.Div6').hide();
$('.Div7').show();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = false;
document.getElementById("SORADeliverableType").required = false;
document.getElementById("ExistingHardwareinfo").required = false;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = false;
document.getElementById("ExistingFeatureProtocolinfo").required = false;
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
document.getElementById("SORADeliveryCategory").required = false;
document.getElementById("DeploymentServicesDeliverableType").required = true;
document.getElementById("Div7Description").required = true;
document.getElementById("Div7Onsite").required = true;
document.getElementById("DesignServicesDeliverableType").required = false;
document.getElementById("Div8Description").required = false;
document.getElementById("Div8Onsite").required = false;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
$('#pidmand').hide();
$('#taskmand').hide();
break;
}
case 'Design Services':{
$('.sora').hide();
$('.npa').hide();
$('.cna').hide();
$('.Div6').hide();
$('.Div7').hide();
$('.Div8').show();
document.getElementById("SoftwareRelease").required = false;
document.getElementById("SORADeliverableType").required = false;
document.getElementById("ExistingHardwareinfo").required = false;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = false;
document.getElementById("ExistingFeatureProtocolinfo").required = false;
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
document.getElementById("DeploymentServicesDeliverableType").required = false;
document.getElementById("Div7Description").required = false;
document.getElementById("Div7Onsite").required = false;
document.getElementById("SORADeliveryCategory").required = false;
document.getElementById("DesignServicesDeliverableType").required = true;
document.getElementById("Div8Description").required = true;
document.getElementById("Div8Onsite").required = true;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
$('#pidmand').hide();
$('#taskmand').hide();
break;
}
case 'Other Deliverables':{
$('.sora').hide();
$('.npa').hide();
$('.cna').hide();
$('.Div6').show();
$('.Div7').hide();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = false;
document.getElementById("SORADeliverableType").required = false;
document.getElementById("ExistingHardwareinfo").required = false;
document.getElementById("FutureHardwareinfo").required = false;
document.getElementById("BugSeverity").required = false;
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
document.getElementById("ExistingFeatureProtocolinfo").required = false;
document.getElementById("SORADeliveryCategory").required = false;
document.getElementById("DeploymentServicesDeliverableType").required = false;
document.getElementById("Div7Description").required = false;
document.getElementById("Div7Onsite").required = false;
document.getElementById("DesignServicesDeliverableType").required = false;
document.getElementById("Div8Description").required = false;
document.getElementById("Div8Onsite").required = false;
document.getElementById("OtherDeliverablesDeliverableType").required = true;
document.getElementById("Div6Description").required = true;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
if($('#CapId').val() == ""){
	$('#pidmand').show();
	$('#taskmand').show();
}
break;
}
default:{
alert(classification.value + ' is not yet supported');
break;
}
}
}
function makePIDTaskmandatory(){
	 if($('#CapId').val() != ""){
		 $('#pidmand').hide();
		 $('#taskmand').hide();
	 }else if($('#DeliverableClassification').val() != "Deployment Services" && $('#DeliverableClassification').val() != "Design Services"){
		 $('#pidmand').show();
		 $('#taskmand').show();
	 }
 }

    
function check(value,textbox){
	if(value==='yes'){
		$('#'+textbox+'').show();
		//alert(textbox);
		document.getElementById(textbox).required=true;
		
	}
	else{
		$('#'+textbox+'').hide();
		document.getElementById(textbox).required=false;
	}
}

function charLimit(limitField, limitCount, limitNum) {
    if (limitField.value.length > limitNum) {
      limitField.value = limitField.value.substring(0, limitNum);
    } else {
      limitCount.value = limitNum - limitField.value.length;
    }
}

function isValid(evt){
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    	alert("Please Enter only numerals");
        return false;
    }
    
    else if (charCode == 13 && document.getElementById('Pid').value.length == 6 ){
    	runValidatePID();
    }
    
    else 
    	pidValidated = false;
}

//function to connect to 'ValidatePID' servlet
function runValidatePID(){
	var xmlhttp,pidParam;
	pidParam = "pid="+document.getElementById('Pid').value;
	
	if (window.XMLHttpRequest)
	{// code to create XMLHttpRequest object for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code to create XMLHttpRequest object for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}

	//Handling response for xmlhttp
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	if(xmlhttp.responseText == 0){
	    		alert("Pid entered is invalid. Please enter a valid pid");
	    		pidValidated = false;
	    		return false;
	    	}
	    	else{
	    		alert("Pid is validated");
	    		pidValidated = true;
	    		return true;
	    	}
	    }
	}
	
	xmlhttp.onerror=function()
	{
		alert("error occurred");
	}    	
	
	//xmlhttp.open('GET', '/GRT/ValidatePID'+'?'+pidParam, true);
	xmlhttp.open('GET', '/ROOT/ValidatePID'+'?'+pidParam, true);
	xmlhttp.send(null);
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    	alert("Please Enter only numerals");
        return false;
    }
    return true;
}
    
    
  function numberAndDecimal(evt){
	  evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode !=46 && (charCode > 31 && (charCode < 48 || charCode > 57))) {
	    	alert("Please Enter only numerals");
	        return false;
	    }
	    return true;
  }  
  
  function checkForDUID(ID){
	  if(ID.value == "PID"){
		  $('#PID').show();
		  $('#DUIDPID').hide();
	  }
	  else{
		  $('#PID').hide();
		  $('#DUIDPID').show();
	  }
  }
  var x = 0;
  var dupFlag = 0;
  var filenameArray = new Array();
 
  function addMore()
 {
	   filenameArray[x] = $('#attachment'+x+'').val();
	   //alert(filenameArray[x]);
	   x = x+1;
	   
	   for(var i = 0; i<(filenameArray.length-1); i++)
		   {
		   		//alert(filenameArray.length);
			   if(filenameArray[i] == filenameArray[x-1])
			   {	
				   // Fixing AID 82191
				   if(filenameArray[i] == ""){
					   continue;
					}
				   alert("Please remove duplicate files!");
				   dupFlag = 1;
				   break;
			   }
			   else{
				   continue;
			   }
		   }
	 if(dupFlag == 0){
		 
		 $("#attachfiles tr:last").after('<tr colspan ="100%"><td><INPUT NAME="file'+x+ '"TYPE="file" id="attachment'+x+'" /></td></tr>');
	 }
	 
	 function removeFiles()
	 {
		 //show popup that will remove the divs
	 }
 }
 
 
/* function addMore()
 {
	 $("#attachfiles tr:last").after('<tr colspan ="100%"><td><INPUT NAME="file" TYPE="file"/></td></tr>');
 }*/
 function getAssignees(){
		$.ajax({ 
			url:"<%=request.getContextPath()%>/GetAssignee",
			type:"GET",
			dataType: 'json',
			success: function( json ) {
				
				$.each(json.Assignees, function(i, optionHtml){
					var res = optionHtml.split(",");
					//alert(res[0]);
              		$('#Assignee').append('<option value='+res[0]+'>'+optionHtml+'</option>');
           		});
		   }
		}); 
		
	}
    </script>
<script>
function setNOSXEManager(){
	var hardware = $('#platform').val();
	switch(hardware){
		case "IOS":
			$('#NOSOEManager').val('Sourabh Agarwal,Deepa Thomas Ajosh');
			break;
		case "IOS-XE":
			$('#NOSOEManager').val('Sourabh Agarwal,Deepa Thomas Ajosh');
			break;
		case "IOS-XR":
			$('#NOSOEManager').val('Mahesh Kumar Jothi');
			break;
		case "NX-OS":
			$('#NOSOEManager').val('Munjal Joshi');
			break;
		case "Security":
			$('#NOSOEManager').val('Mahesh Kumar Jothi');
			break;
		case "Wireless":
			$('#NOSOEManager').val('Mahesh Kumar Jothi');
			break;
		default:
			$('#NOSOEManager').val('');
			break;
	}
}
function setServiceOwner(){
	var str="";
	var DelClass = $('#DeliverableClassification').val();
	var TheaterSet = $('#Theatre').val();
	var RegionSet = $('#Region').val();
	var GdcSet = $('#GDC').val();
	var sdc=$('#SORADeliveryCategory').val();
	var Lr =$('input[name="LanguageRequirements"]:checked').val();
	var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
	var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
	
	if(DelClass=="SORA")
	{	
		sdc = $('#platform').val();
		if(TheaterSet=="Americas Enterprise")
			{
				//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
				//var Lr =$('input[name="LanguageRequirements"]:checked').val();
				//alert("Value of TR is "+Tr);
				
				if(Tr=="off")
					{
						document.getElementById("GDC").value="Bangalore";
						document.getElementById("ServiceOwner").value="Vijay Veerla";
						if(sdc=="NX-OS")
							{
								document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
							}
						else
							{
								document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
							}
					return;
					}
				else if(Tr=="on")
					{	
						document.getElementById("GDC").value="Mexico";
						document.getElementById("ServiceOwner").value="Ariel Magdaleno";
						document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
						return;
					}
				else
					{
						alert("Please select weather you have any specific Time-Zome requirements");
					}
			}
			
		else if(TheaterSet=="GSP")
			{
			
				//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
				if(RegionSet=="SDE"||RegionSet=="Non SDE")
					{
					
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Venkata Agoram";
								if(sdc=="NX-OS")
									{
										document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
									}
								else
									{
										document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
									}
								return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Mexico";
								document.getElementById("ServiceOwner").value="Ariel Magdaleno";
								document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
								return;
							}
					}
				else if(RegionSet=="LATAM")
					{
						if(Tr=="off"&&Lr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Venkata Agoram";
								if(sdc=="NX-OS")
									{
										document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
									}
								else
									{
										document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
									}
								return;
							}
						else if(Tr=="on"||Lr=="on")
							{	
								document.getElementById("GDC").value="Mexico";
								document.getElementById("ServiceOwner").value="Ariel Magdaleno";
								document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
								return;
							}
					}
				else if(RegionSet=="Canada")
				{
					if(Tr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Venkata Agoram";
							if(sdc=="NX-OS")
								{
									document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
								}
							else
								{
									document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
								}
							return;
						}
					else if(Tr=="on")
						{	
							document.getElementById("GDC").value="Mexico";
							document.getElementById("ServiceOwner").value="Ariel Magdaleno";
							document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
							return;
						}
				}
				else if(RegionSet=="EMEAR")
				{
					if(Tr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Venkata Agoram";
							if(sdc=="NX-OS")
								{
									document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
								}
							else
								{
									document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
								}
							return;
						}
					else if(Tr=="on")
						{	
							document.getElementById("GDC").value="Krakow";
							document.getElementById("ServiceOwner").value="Bartosz Krowicki";
							document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
							return;
						}
				}
				else if(RegionSet=="APJC")
				{
					if(Tr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Venkata Agoram";
							if(sdc=="NX-OS")
								{
									document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
								}
							else
								{
									document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
								}
							return;
						}
					else if(Tr=="on")
						{	
							document.getElementById("GDC").value="Dalian";
							document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
							document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
							return;
					}
				}
			}
			
		else if(TheaterSet=="EMEAR")
			{
				//var Lr =$('input[name="LanguageRequirements"]:checked').val();
				//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
				if(Lr=="off")
					{
						if(Rr=="off")
							{
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Vijay Veerla";
									if(sdc=="NX-OS")
										{
											document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
										}
									else
										{
											document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
										}
									return;
								}
							}
					}	
				else if(Lr=="on"||Rr=="on")
					{	
						document.getElementById("GDC").value="Krakow";
						document.getElementById("ServiceOwner").value="Bartosz Krowicki";
						document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
						return;
					}
			}
		else if(TheaterSet=="APJC")
			{
				//var Lr =$('input[name="LanguageRequirements"]:checked').val();
				if(Lr=="off")
					{
						document.getElementById("GDC").value="Bangalore";
						document.getElementById("ServiceOwner").value="Vijay Veerla";
						if(sdc=="NX-OS")
							{
								document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
							}
						else
							{
								document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
							}
						return;
					}
				else if(Lr=="on")
					{	
						document.getElementById("GDC").value="Dalian";
						document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
						document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
						return;
					}
			}
			
		else if(TheaterSet=="Enterprise and GES")
			{
				//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
				if(RegionSet=="Automotive & Manufacturing"||RegionSet=="U.S. Financials"||RegionSet=="Retail & Logistics")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Vijay Veerla";
								if(sdc=="NX-OS")
									{
										document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
									}
								else
									{
										document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
									}
								return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Mexico";
								document.getElementById("ServiceOwner").value="Ariel Magdaleno";
								document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
								return;
							}
					}
				else if(RegionSet=="Non US Financials & IBM")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Vijay Veerla";
								if(sdc=="NX-OS")
									{
										document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
									}
								else
									{
										document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
									}
								return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Krakow";
								document.getElementById("ServiceOwner").value="Bartosz Krowick"
								document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
								return;
							}
					}
				
			}
		else if(TheaterSet=="US Public Sector")
			{
				//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
				if(Rr=="off")
					{
						document.getElementById("GDC").value="Bangalore";
						document.getElementById("ServiceOwner").value="Vijay Veerla";
						if(sdc=="NX-OS")
							{
								document.getElementById("mailer").value="gsp-anr-switching-spocs@cisco.com";
							}
						else
							{
								document.getElementById("mailer").value="gsp-anr-routing-spocs@cisco.com";
							}
						return;
					}
				else if(Rr=="on")
					{	
						document.getElementById("GDC").value="RTP";
						document.getElementById("ServiceOwner").value="Ched Capps";
						document.getElementById("mailer").value="gsp-rtp-ini@cisco.com";
						return;
					}
			}
			
	}
	
	else if (DelClass=="NP/NPA/NHF"||DelClass=="Cisco Network Assessment"||DelClass=="Other Deliverables")
		{
			if(TheaterSet=="Americas Enterprise")
					{
						//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
						//alert("Value of TR is "+Tr);
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Vijay Veerla";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
							return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Mexico";
								document.getElementById("ServiceOwner").value="Ariel Magdaleno";
								document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
								return;
							}
						else
							{
								alert("Please select weather you have any specific Time-Zome requirements");
							}
					}
					
				else if(TheaterSet=="GSP")
					{
					
						//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
						if(RegionSet=="SDE"||RegionSet=="Non SDE")
							{
							
								if(Tr=="off")
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Venkata Agoram";
										document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
										return;
									}
								else if(Tr=="on")
									{	
										document.getElementById("GDC").value="Mexico";
										document.getElementById("ServiceOwner").value="Ariel Magdaleno";
										document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
										return;
									}
							}
						else if(RegionSet=="LATAM")
							{
								if(Tr=="off"&&Lr=="off")
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Venkata Agoram";
										document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
										return;
									}
								else if(Tr=="on"||Lr=="on")
									{	
										document.getElementById("GDC").value="Mexico";
										document.getElementById("ServiceOwner").value="Ariel Magdaleno";
										document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
										return;
									}
							}
						else if(RegionSet=="Canada")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Venkata Agoram";
									document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
						else if(RegionSet=="EMEAR")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Venkata Agoram";
									document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
									
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Krakow";
									document.getElementById("ServiceOwner").value="Bartosz Krowicki";
									document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
									return;
								}
						}
						else if(RegionSet=="APJC")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Venkata Agoram";
									document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Dalian";
									document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
									document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
									return;
							}
						}
						
					}
					
				else if(TheaterSet=="EMEAR")
					{
						//var Lr =$('input[name="LanguageRequirements"]:checked').val();
						//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
						if(Lr=="off")
							{
								if(Rr=="off")
									{
										{
											document.getElementById("GDC").value="Bangalore";
											document.getElementById("ServiceOwner").value="Vijay Veerla"
											document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
											return;
										}
									}
							}	
						else if(Lr=="on"||Rr=="on")
							{	
								document.getElementById("GDC").value="Krakow";
								document.getElementById("ServiceOwner").value="Bartosz Krowicki";
								document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
								return;
							}
					}
				else if(TheaterSet=="APJC")
					{
						//var Lr =$('input[name="LanguageRequirements"]:checked').val();
						if(Lr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Vijay Veerla";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								return;
							}
						else if(Lr=="on")
							{	
								document.getElementById("GDC").value="Dalian";
								document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
								document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
								return;
							}
					}
					
				else if(TheaterSet=="Enterprise and GES")
					{
						//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
						if(RegionSet=="Automotive & Manufacturing"||RegionSet=="U.S. Financials"||RegionSet=="Retail & Logistics")
							{
								if(Tr=="off")
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Vijay Veerla";
										document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
										return;
									}
								else if(Tr=="on")
									{	
										document.getElementById("GDC").value="Mexico";
										document.getElementById("ServiceOwner").value="Ariel Magdaleno";
										document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
										return;
									}
							}
						else if(RegionSet=="Non US Financials & IBM")
							{
								if(Tr=="off")
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Vijay Veerla";
										document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
										return;
									}
								else if(Tr=="on")
									{	
										document.getElementById("GDC").value="Krakow";
										document.getElementById("ServiceOwner").value="Bartosz Krowick"
										document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
										return;
									}
							}
						
					}
				else if(TheaterSet=="US Public Sector")
					{
						//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
						if(Rr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Vijay Veerla";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								return;
							}
						else if(Rr=="on")
							{	
								document.getElementById("GDC").value="RTP";
								document.getElementById("ServiceOwner").value="Ched Capps";
								document.getElementById("mailer").value="gsp-rtp-ini@cisco.com";
								return;
							}
					}
			
		}	
	else if (DelClass=="Design Services")
	{
		if(TheaterSet=="Americas Enterprise")
				{
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					//alert("Value of TR is "+Tr);
					if(Tr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-design@cisco.com";
						return;
						}
					else if(Tr=="on")
						{	
							document.getElementById("GDC").value="Mexico";
							document.getElementById("ServiceOwner").value="Ariel Magdaleno";
							document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
							return;
						}
					else
						{
							alert("Please select weather you have any specific Time-Zome requirements");
						}
				}
				
			else if(TheaterSet=="GSP")
				{
				
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					if(RegionSet=="SDE"||RegionSet=="Non SDE"||RegionSet=="Canada")
						{
						
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-design@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="LATAM")
						{
							if(Tr=="off"&&Lr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-design@cisco.com";
									return;
								}
							else if(Tr=="on"||Lr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="EMEAR")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Raj Biradar";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Krakow";
								document.getElementById("ServiceOwner").value="Bartosz Krowicki";
								document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
								return;
							}
					}
					else if(RegionSet=="APJC")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Raj Biradar";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Dalian";
								document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
								document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
								return;
						}
					}
					
					
				}
				
			else if(TheaterSet=="EMEAR")
				{
					//var Lr =$('input[name="LanguageRequirements"]:checked').val();
					//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
					if(Lr=="off")
						{
							if(Rr=="off")
								{
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Raj Biradar"
										document.getElementById("mailer").value="gsp-ini-design@cisco.com";
										return;
									}
								}
						}	
					else if(Lr=="on"||Rr=="on")
						{	
							document.getElementById("GDC").value="Krakow";
							document.getElementById("ServiceOwner").value="Bartosz Krowicki";
							document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
							return;
						}
				}
			else if(TheaterSet=="APJC")
				{
					//var Lr =$('input[name="LanguageRequirements"]:checked').val();
					if(Lr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-design@cisco.com";
							return;
						}
					else if(Lr=="on")
						{	
							document.getElementById("GDC").value="Dalian";
							document.getElementById("ServiceOwner").value="Mengjie Wu";
							document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
							return;
						}
				}
				
			else if(TheaterSet=="Enterprise and GES")
				{
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					if(RegionSet=="Automotive & Manufacturing"||RegionSet=="U.S. Financials"||RegionSet=="Retail & Logistics")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-design@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="Non US Financials & IBM")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-design@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Krakow";
									document.getElementById("ServiceOwner").value="Bartosz Krowick"
									document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
									return;
								}
						}
					
				}
			else if(TheaterSet=="US Public Sector")
				{
					//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
					if(Rr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-design@cisco.com";
							return;
						}
					else if(Rr=="on")
						{	
							document.getElementById("GDC").value="RTP";
							document.getElementById("ServiceOwner").value="Ched Capps";
							document.getElementById("mailer").value="gsp-rtp-ini@cisco.com";
							return;
						}
				}
		
	}
	else if (DelClass=="Deployment Services")
	{
		if(TheaterSet=="Americas Enterprise")
				{
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					//alert("Value of TR is "+Tr);
					if(Tr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
						return;
						}
					else if(Tr=="on")
						{	
							document.getElementById("GDC").value="Mexico";
							document.getElementById("ServiceOwner").value="Ariel Magdaleno";
							document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
							return;
						}
					else
						{
							alert("Please select weather you have any specific Time-Zome requirements");
						}
				}
				
			else if(TheaterSet=="GSP")
				{
				
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					if(RegionSet=="SDE"||RegionSet=="Non SDE"||RegionSet=="Canada")
						{
						
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="LATAM")
						{
							if(Tr=="off"&&Lr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
									return;
								}
							else if(Tr=="on"||Lr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="EMEAR")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Raj Biradar";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Krakow";
								document.getElementById("ServiceOwner").value="Bartosz Krowicki";
								document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
								return;
							}
					}
					else if(RegionSet=="APJC")
					{
						if(Tr=="off")
							{
								document.getElementById("GDC").value="Bangalore";
								document.getElementById("ServiceOwner").value="Raj Biradar";
								document.getElementById("mailer").value="gsp-anr-bglr-pm@cisco.com";
								return;
							}
						else if(Tr=="on")
							{	
								document.getElementById("GDC").value="Dalian";
								document.getElementById("ServiceOwner").value="Tom, Qihong Zhong";
								document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
								return;
						}
					}
					
					
				}
				
			else if(TheaterSet=="EMEAR")
				{
					//var Lr =$('input[name="LanguageRequirements"]:checked').val();
					//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
					if(Lr=="off")
						{
							if(Rr=="off")
								{
									{
										document.getElementById("GDC").value="Bangalore";
										document.getElementById("ServiceOwner").value="Raj Biradar"
										document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
										return;
									}
								}
						}	
					else if(Lr=="on"||Rr=="on")
						{	
							document.getElementById("GDC").value="Krakow";
							document.getElementById("ServiceOwner").value="Bartosz Krowicki";
							document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
							return;
						}
				}
			else if(TheaterSet=="APJC")
				{
					//var Lr =$('input[name="LanguageRequirements"]:checked').val();
					if(Lr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
							return;
						}
					else if(Lr=="on")
						{	
							document.getElementById("GDC").value="Dalian";
							document.getElementById("ServiceOwner").value="Mengjie Wu";
							document.getElementById("mailer").value="gsp-dalian-ini@cisco.com";
							return;
						}
				}
				
			else if(TheaterSet=="Enterprise and GES")
				{
					//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
					if(RegionSet=="Automotive & Manufacturing"||RegionSet=="U.S. Financials"||RegionSet=="Retail & Logistics")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Mexico";
									document.getElementById("ServiceOwner").value="Ariel Magdaleno";
									document.getElementById("mailer").value="gsp-mex-ini@cisco.com";
									return;
								}
						}
					else if(RegionSet=="Non US Financials & IBM")
						{
							if(Tr=="off")
								{
									document.getElementById("GDC").value="Bangalore";
									document.getElementById("ServiceOwner").value="Raj Biradar";
									document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
									return;
								}
							else if(Tr=="on")
								{	
									document.getElementById("GDC").value="Krakow";
									document.getElementById("ServiceOwner").value="Bartosz Krowick"
									document.getElementById("mailer").value="gsp-krakow-ini@cisco.com";
									return;
								}
						}
					
				}
			else if(TheaterSet=="US Public Sector")
				{
					//var Rr =$('input[name="RegulatoryRequirements"]:checked').val();
					if(Rr=="off")
						{
							document.getElementById("GDC").value="Bangalore";
							document.getElementById("ServiceOwner").value="Raj Biradar";
							document.getElementById("mailer").value="gsp-ini-deployment@cisco.com";
							return;
						}
					else if(Rr=="on")
						{	
							document.getElementById("GDC").value="RTP";
							document.getElementById("ServiceOwner").value="Ched Capps";
							document.getElementById("mailer").value="gsp-rtp-ini@cisco.com";
							return;
						}
				}
		
	}
	
	else
	{
		document.getElementById("GDC").value="";
		document.getElementById("ServiceOwner").value="";
		document.getElementById("mailer").value="";
		return;
	}
	
}

</script>
</head>
<body onload="getAssignees();">

	<div>

		<div style="width: 80%; background: white">
			<form name="form" id="form" method="post" action="NewEntry" onkeypress="return event.keyCode != 13;" enctype='multipart/form-data'>

				<div class="login"
					style="float: left; margin-left: 10%; border-right: 1px solid grey; border-left: 1px solid grey; width: 100%; background: white">
					<h1>Enter Project Details</h1>
					
					<%-- adding owner transition by state by shivam--%> 
					
					<table class="status" id='status'>
						<tr>
							<th class="theader">Status</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
							
							<tr>
								<td align="left">Owner: <font color='red'>
										* </font></td>
								<td align="left"><select name="Owner"
									id="Owner" style="width:320px" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="staffer">staffer</option>
										<option value="requester">requester</option>
										<option value="screener">screener</option>
										<option value="PNCE">PNCE</option>
										<option value="reviewer">reviewer</option>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</tr>
								<tr>
								<td align="left">Transition by: <font color='red'>
										* </font></td>
								<td align="left"><select name="TransitionBy"
									id="TransitionBy" style="width:320px" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="staffer">staffer</option>
										<option value="requester">requester</option>
										<option value="screener">screener</option>
										<option value="PNCE">PNCE</option>
										<option value="reviewer">reviewer</option>
								</select></td>
								
								<td align="left">State: <font color='red'>
										* </font></td>
								<td align="left"><select name="State"
									id="State" style="width:320px" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="New">NEW</option>
										<option value="Open">OPEN</option>
										<option value="Staffing">STAFFING</option>
										<option value="Screening">SCREENING</option>
										<option value="Brp">BRP</option>
										<option value="Queued">QUEUED</option>
										<option value="Assigned">ASSIGNED</option>
										<option value="Query-rerun">QUERY RERUN</option>
										<option value="In-progress">IN PROGRESS</option>
										<option value="Review">REVIEWER</option>
										<option value="Review-done">REVIEW DONE</option>
										<option value="Delivered">DELIVERED</option>
										<option value="Completed">COMPLETED</option>
								</select></td>							
							</tr>
							
							
							
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
						</tbody>
					</table>
					
						
							
				<%-- ending shivam code--%> 
					
					<table>
						<tr>
							<th class="theader">Inter GDC Governance</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
						<input type="text" name="mailer" id="mailer" style="display:none;"/>
							<!-- <tr><td colspan="100%" ></td></tr> -->
							<tr class="requirements">
								<td align="left">Regulatory Requirements:<font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="RegulatoryRequirements" id="RegulatoryRequirements"
									value="on"
									onchange="check('yes','RegulatoryRequirementstext');setServiceOwner();" required>YES
									<input type="radio" name="RegulatoryRequirements"
									id="RegulatoryRequirements" value="off" checked
									onchange="check('no','RegulatoryRequirementstext');setServiceOwner();">NO
									<input type="text" name="RegulatoryRequirementstext"
									id="RegulatoryRequirementstext"
									style="display: none; width: 150px;"
									maxlength="1000"></td>
							</tr>

							<tr class="requirements">
								<td align="left">Language Requirements : <font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="LanguageRequirements" id="LanguageRequirements"
									value="on" onchange="check('yes','LanguageRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="LanguageRequirements" id="LanguageRequirements"
									value="off" checked onchange="check('no','LanguageRequirementstext');setServiceOwner();">NO
									<select name="LanguageRequirementstext" id="LanguageRequirementstext" style="display:none; width: 200px;">
									<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select 'NO' for English</option>
									<option value="Spanish">Spanish</option>
									<option value="Portugese">Portugese</option>
									<option value="German">German</option>
									<option value="Polish">Polish</option>
									<option value="French">French</option>
									<option value="Mandarin">Mandarin</option>
									<option value="Korean">Korean</option>
									<option value="Japanese">Japanese</option>
									</select></td>
							</tr>

							<tr class="requirements">
								<td align="left">Timezone Requirements :<font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="TimeZoneRequirements" id="TimeZoneRequirements"
									value="on" onchange="check('yes','TimeZoneRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="TimeZoneRequirements" id="TimeZoneRequirements"
									value="off" checked onchange="check('no','TimeZoneRequirementstext');setServiceOwner();">NO
									<select name="TimeZoneRequirementstext"
									id="TimeZoneRequirementstext"
									style="display: none; width: 200px;">
									<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select NO for Bangalore GDC</option>
										<option value="(GMT -12:00) Eniwetok, Kwajalein">(GMT
											-12:00) Eniwetok, Kwajalein</option>
										<option value="(GMT -11:00) Midway Island, Samoa">(GMT
											-11:00) Midway Island, Samoa</option>
										<option value="(GMT -10:00) Hawaii">(GMT -10:00)
											Hawaii</option>
										<option value="(GMT -9:00) Alaska">(GMT -9:00)
											Alaska</option>
										<option value="(GMT -8:00) Pacific Time">(GMT -8:00)
											Pacific Time</option>
										<option value="(GMT -7:00) Mountain Time">(GMT -7:00)
											Mountain Time</option>
										<option value="(GMT -6:00) Central Time, Mexico City">(GMT
											-6:00) Central Time, Mexico City</option>
										<option value="(GMT -5:00) Eastern Time , Bogota, Lima">(GMT
											-5:00) Eastern Time , Bogota, Lima</option>
										<option value="(GMT -4:00) Atlantic Time, Caracas, La Paz">(GMT
											-4:00) Atlantic Time, Caracas, La Paz</option>
										<option value="(GMT -3:30) Newfoundland">(GMT -3:30)
											Newfoundland</option>
										<option value="(GMT -3:00) Brazil, Buenos Aires, Georgetown">(GMT
											-3:00) Brazil, Buenos Aires, Georgetown</option>
										<option value="(GMT -2:00) Mid-Atlantic">(GMT -2:00)
											Mid-Atlantic</option>
										<option value="(GMT -1:00 hour) Azores, Cape Verde Islands">(GMT
											-1:00 hour) Azores, Cape Verde Islands</option>
										<option
											value="(GMT) Western Europe Time, London, Lisbon, Casablanca">(GMT)
											Western Europe Time, London, Lisbon, Casablanca</option>
										<option
											value="(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris">(GMT
											+1:00 hour) Brussels, Copenhagen, Madrid, Paris</option>
										<option value="(GMT +2:00) Kaliningrad, South Africa">(GMT
											+2:00) Kaliningrad, South Africa</option>
										<option
											value="(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg">(GMT
											+3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
										<option value="(GMT +3:30) Tehran">(GMT +3:30) Tehran</option>
										<option value="(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi">(GMT
											+4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
										<option value="(GMT +4:30) Kabul">(GMT +4:30) Kabul</option>
										<option
											value="(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent">(GMT
											+5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
										
										<option value="(GMT +5:45) Kathmandu">(GMT +5:45)
											Kathmandu</option>
										<option value="(GMT +6:00) Almaty, Dhaka, Colombo">(GMT
											+6:00) Almaty, Dhaka, Colombo</option>
										<option value="(GMT +7:00) Bangkok, Hanoi, Jakarta">(GMT
											+7:00) Bangkok, Hanoi, Jakarta</option>
										<option
											value="(GMT +8:00) Beijing, Perth, Singapore, Hong Kong">(GMT
											+8:00) Beijing, Perth, Singapore, Hong Kong</option>
										<option
											value="(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk">(GMT
											+9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
										<option value="(GMT +9:30) Adelaide, Darwin">(GMT
											+9:30) Adelaide, Darwin</option>
										<option
											value="(GMT +10:00) Eastern Australia, Guam, Vladivostok">(GMT
											+10:00) Eastern Australia, Guam, Vladivostok</option>
										<option
											value="(GMT +11:00) Magadan, Solomon Islands, New Caledonia">(GMT
											+11:00) Magadan, Solomon Islands, New Caledonia</option>
										<option
											value="(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka">(GMT
											+12:00) Auckland, Wellington, Fiji, Kamchatka</option>
										<option value="Others">Others</option>
										
								</select></td>
							</tr>

							<tr class="requirements">
								<td align="left">Expertise Requirement: <font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="ExpertiseRequirements" id="ExpertiseRequirements"
									value="on" onchange="check('yes','ExpertiseRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="ExpertiseRequirements" id="ExpertiseRequirements"
									value="off" checked onchange="check('no','ExpertiseRequirementstext');setServiceOwner();">NO
									<input type="text" name="ExpertiseRequirementstext"
									id="ExpertiseRequirementstext"
									style="display: none; width: 150px;"
									maxlength="1000"></td>
							</tr>
							<tr>
								<td align="left">Theatre: <font color='red'> * </font></td>
								<td align="left"><select name="Theatre" id="Theatre"
									onchange="SetDeliveryTeam(this);setServiceOwner();" style="width: 300px;" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value = "GSP">GSP</option>
										<option value = "Enterprise and GES">Enterprise and GES</option>
										<option value = "Americas Enterprise">Americas Enterprise</option>
										<option value="EMEAR">EMEAR</option>
										<option value="APJC">APJC</option>
										<option value="US Public Sector">US Public Sector</option>
									</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">Region: <font color='red'> * </font></td>
								<td align="left"><select name="Region" style="width: 320px;" onchange="setServiceOwner();" id="Region" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="US West">US West</option>
										<option value="US East">US East</option>
										<option value="US South">US South</option>
										<option value="US Central">US Central</option>
										<option value="LATAM">LATAM</option>
										<option value="Canada">Canada</option>

								</select></td>
							</tr>
							<tr>
								<td align="left">Deliverable Classification: <font
									color='red'> * </font></td>
								<td align="left"><select name="DeliverableClassification"
									id="DeliverableClassification"
									onchange="SetClassification(this);setServiceOwner()" style="width: 300px;" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="SORA">SORA</option>
										<option value="NP/NPA/NHF">NP/NPA/NHF</option>
										<option value="Cisco Network Assessment">Cisco Network Assessment</option>
										<option value="Deployment Services">Deployment Services</option>
										<option value="Design Services">Design Services</option>
										<option value="Other Deliverables">Other Deliverables</option>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">Theatre Owner/Manager:</td>
								<td align="left"><input type="text" name="ServiceOwner"
									id="ServiceOwner" placeholder="" style="width: 300px;"/></td>
							</tr>
							<tr>
								<td align="left">GSP GDC: <font color='red'> * </font></td>
								<td align="left">
								<select  name="GDC" id="GDC" style="width: 300px;" required>
									<option selected="selected" value="" style="display: none;" disabled="disabled" >Select</option>
										<option value="Bangalore">Bangalore</option>
										<option value="Dalian">Dalian</option>
										<option value="Krakow">Krakow</option>
										<option value="Mexico">Mexico</option>
										<option value="RTP">RTP</option>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">Service Catalogue ID:</td>
								<td align="left"><input type="text"
									name="ServiceCatalogueID" style="width: 300px;" id="ServiceCatalogueID"
									placeholder="" /></td>

							</tr>
							<tr>
								<td align="left">If changing GDC/Service Owner please <br/>provide reasons:</td>
								<td align="left"><textarea rows="4" cols="26"
										style="overflow-y: scroll; width: 300px; height: 125px"
										onKeyDown="charLimit(this.form.ChangingGDC,this.form.countdown,3999);"
										name="ChangingGDC" id="ChangingGDC" placeholder=""></textarea></td>
							</tr>
							<tr><td colspan="100%"><br/></td></tr>
							<tr>
							<td colspan ="100%" align="right"><a href="http://iwe.cisco.com/web/view-post/post/-/posts?postId=438800099" target="_blank">GSP Inter GDC Engagement :  http://iwe.cisco.com/web/view-post/post/-/posts?postId=438800099</a></td>
							</tr>
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>


						</tbody>
					</table>



					<!-- Division 2 starts -->
					<table class="classification" id="classification">
						<tr>
							<th class="theader">General Information</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
							
							<tr>
								<td align="left">Account Name: <font color='red'> *
								</font></td>

								<td align="left"><input type="text" name="AccountName"
									id="AccountName" placeholder="" style="width:300px;" required /></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">DUID :</td><td align="left"><input type="text" name="DUID" id="DUID" maxlength="7"
									onkeypress="return isNumber(event)" style="width: 300px">
									
									</td></tr>
								<tr>	
								<td align="left">Account NCE Name: <font color='red'>
										* </font></td>
								<td align="left"><input type="text" name="AccountNCEName"
									id="AccountNCEName" placeholder="Enter CEC ID"  style="width:300px;" required></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
								<td>PID: <font color='red' id = "pidmand">
										* </font></td><td align="left"><input type="text" name="Pid" id="Pid" placeholder="Input PID and Press ENTER" maxlength="6"
									onkeypress="return isValid(event)" style="width: 300px"></td>	

							</tr>

							<tr>
								<td align="left">Requested By: <font color='red'> *
								</font></td>

								<td align="left"><input type="text" name="RequestedBy"
									id="RequestedBy" placeholder="Enter CEC ID" style="width:300px;" required /></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>		
								<td align="left">Task: <font color='red' id = "taskmand">
										* </font></td><td align="left"><input type="text" name="Task" id="Task" style=" width:300px"></td>
							</tr>
	
							<tr>
								
								<td align="left">Delivery Model: <font color='red'>
										* </font></td>
								<td align="left"><select name="DeliveryModel"
									id="DeliveryModel" style="width:320px" required>
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="E2E">E2E</option>
										<option value="NES">NES</option>
										<option value="OND">OND</option>
										<option value="SPOC">SPOC</option>
										<option value="Other">Other</option>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">CAP Id:</td>
								<td align="left"><input type="text" name="CapId" id="CapId"	 style="width:300px" placeholder="" onblur="makePIDTaskmandatory();" /></td>
							</tr>
							
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
						</tbody>
					</table>
					<!--Division 2 ends -->



					<!--Division 3 SORA -->
					<table class="sora" id='sora'>
						<tr>
							<th class="theader">SORA</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
							<tr>
								<td align="left">SORA Deliverable Type: <font color='red'>
										* </font></td>
								<td><select name="SORADeliverableType" id="SORADeliverableType" style="width:300px">
								<option selected="selected" value="" style="display:none"
											disabled="disabled">Select</option>
								<option value="Proactive Software Recommendation">Proactive Software Recommendation</option>
								<option value="Proactive Critical Bug Analysis (Periodic)">Proactive Critical Bug Analysis (Periodic)</option>
								
								<option value="Others">Others</option>
								</select></td>	
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">SORA Delivery Category <font color='red'>
										* </font></td>
									<td align="left"><select style="width:300px" name="SORADeliveryCategory" id="SORADeliveryCategory" onchange="setServiceOwner();">
									<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
									<option value="Routing" >Routing</option>
									<option value="Switching">Switching</option>
									</select></td>
							
							<tr>
								<td align="left">Software Release: <font color='red'>
										* </font></td>
								<td align="left"><input type="text" name="SoftwareRelease"
									id="SoftwareRelease" placeholder="" style="width:280px"/></td>
								<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
								<td align="left">SORA URL</td>
								<td align="left"><input type="text" name="SORAURL"
									id="SORAURL" maxlength="600" style="width:280px"></td>
							
							</tr>
							<tr>	
								<td align="left">Triggers: <font color='red'> * </font></td>
								<td align="left"><textarea rows="4" cols="26"
										style="overflow-y: scroll; width: 300px; height: 100px"
										onKeyDown="charLimit(this.form.Description,this.form.countdown,3999);"
										name="Triggers" id="Triggers" placeholder=""></textarea></td>
								<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>		
								<td align="left">Description: <font color='red'> * </font></td>
								<td align="left"><textarea rows="4" cols="26"
										name="SoraDescription" id="SoraDescription"
										onKeyDown="charLimit(this.form.Description,this.form.countdown,3999);"
										style="overflow-y: scroll; width: 300px; height: 100px"></textarea></td>		

							</tr>
							<tr>
								<td align="left">Existing Hardware : <font color='red'> *
								</font></td>
								<!--<td align="left"><textarea rows="4" cols="26"
										name="ExistingHardwareinfo" id="ExistingHardwareinfo"
										onKeyDown="charLimit(this.form.ExistingHardwareinfo,this.form.countdown,3999);"
										style="overflow-y: scroll; width: 300px; height: 100px"></textarea></td> -->
								<td align="left">
								<select class="chzn-select" name="ExistingHardwareinfo" id="ExistingHardwareinfo"  multiple>
								<c:forEach items="${HardwarePids}" var="item">
									    <option value="${item}">${item}</option>
									</c:forEach> 
										<!-- <option value="SF220-48P-K9-CN">SF220-48P-K9-CN</option>
										<option value="SF220-48P-K9-EN">SF220-48P-K9-EN</option>
										<option value="SF220-48P-K9-EU">SF220-48P-K9-EU</option>
										<option value="Raghu">Raghu</option> -->									
								</select></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
								<td align="left">New Hardware : 
								</td>
								<td align="left"><textarea rows="4" cols="26"
										name="FutureHardwareinfo" id="FutureHardwareinfo"
										onKeyDown="charLimit(this.form.FutureHardwareinfo,this.form.countdown,3999);"
										style="overflow-y: scroll; width: 300px; height: 100px"></textarea></td>

							</tr>
							<tr>
								<td align="left">Existing Feature/Protocol :<font color='red'> *
								</font></td>
								<td align="left"><textarea rows="4" cols="26"
										name="ExistingFeatureProtocolinfo" id="ExistingFeatureProtocolinfo"
										onKeyDown="charLimit(this.form.ExistingFeatureProtocolinfo,this.form.countdown,3999);"
										style="overflow-y: scroll; width: 300px; height: 100px "></textarea></td>
							<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
								<td align="left">New Feature/Protocol :</td>
								<td align="left"><textarea rows="4" cols="26"
										name="FutureFeatureProtocolinfo" id="FutureFeatureProtocolinfo"
										onKeyDown="charLimit(this.form.FutureFeatureProtocolinfo,this.form.countdown,3999);"
										style="overflow-y: scroll; width: 300px; height: 100px "></textarea></td>
							</tr>
							<tr>
								<td align="left">Bug Severity <font color='red'> * </font>
								</td>
								<td align="left"><select multiple name="BugSeverity"
									id="BugSeverity"
									style="overflow-y: scroll; width: 300px; height: 100px">
										<option value="Sev123">Severity 1 , Severity 2 & Severity 3</option>
										<option value="Sev1">Severity 1</option>
										<option value="Sev2">Severity 2</option>
										<option value="Sev3">Severity 3</option>
										<option value="Sev4">Severity 4</option>
										<option value="Sev5">Severity 5</option>
										<option value="Sev6">Severity 6</option>
								</select></td>
								<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
								<td align="left">NP Info:</td>
								<td align="left"><textarea  name="SORANPTrack"
									id="SORANPTrack" onKeyDown="charLimit(this.form.SORANPTrack,this.form.countdown,3999);" style="overflow-y: scroll;width:300px;height:100px"></textarea></td>

							</tr>
							<tr>
								</tr>
							<tr>
								<td align="left">Hardware: <font color='red'> *
								</font></td>
								<td align="left">
									<select  name="platform" id="platform" onchange= "setNOSXEManager();setServiceOwner()" style="width: 300px;">
									<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="IOS">IOS</option>
										<option value="IOS-XE">IOS-XE</option>
										<option value="IOS-XR">IOS-XR</option>
										<option value="NX-OS">NX-OS</option>
										<option value="Security">Security</option>
										<option value = "Wireless">Wireless</option>
								</select>
								</td>	
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">NOS-OE Manager: <font color='red'> *
								</font></td>
								<td align="left">
								<input type="text" placeholder="" id="NOSOEManager" style="width: 280px;" name="NOSOEManager" value="" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td align="left">Initial Bug Count</td>
								<td align="left"><input type="text" name="InitialBugCount"
									id="InitialBugCount" maxlength="5"
									onkeypress="return isNumber(event)" style="width:280px"></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">Final Bug Count</td>
								<td align="left"><input type="text" name="FinalBugCount"
									id="FinalBugCount" maxlength="5"
									onkeypress="return isNumber(event)" style="width:280px"></td>
							</tr>
							
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
						</tbody>
					</table>
					<!--Division 3 ends -->



					<!--Division 4  /NPA/NHF -->

					<table class="npa" id='npa' style="display: none">
						<tr>
							<th class="theader">NP / NPA / NHF</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
							<tr>

								<td align="left">Deliverable Type: <font color='red'>
										* </font></td>
								<td align="left"><select name="NPDeliverableType"
									id="NPDeliverableType"style="width:300px;">
										<option selected="selected" value="" style="display: none; "
											disabled="disabled">Select</option>
										<option value="HardwareEOX">Hardware EOX</option>
										<option value="SyslogAnalysis">Syslog Analysis</option>
										<option value="BestPracticeReport">Best Practice
											Report</option>
										<option value="CustomConfigAnalysis">Custom Config
											Analysis</option>
										<option value="HardwareFieldNotice">Hardware Field
											Notice</option>
										<option value="SoftwareSecurityAnalysis">Software
											Security Analysis</option>
										<option value="SoftwareInfrastructureAnalysis">Software
											Infrastructure Analysis</option>
										<option value="Others">Others</option>	
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">Scheduled Date:</td>
								<td align="left"><input class="date" type="text"
									placeholder="Scheduled Date" name="NPAScheduledDate"
									id="NPAScheduledDate" style="width:280px;"/></td>
							</tr>
							<tr>
								<td align="left">Description: <font color='red'> * </font></td>
								<td align="left"><textarea rows="4" cols="26"
										name="NPADescription" id="NPADescription"
										onKeyDown="charLimit(this.form.Description,this.form.countdown,6000);"
										style="overflow-y: scroll; width: 300px; height: 100px"></textarea></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="left">NP Info: <font color='red'> * </font></td>
								<td align="left"><textarea type="text" name="NPANPTrack"
									id="NPANPTrack" maxlength="600" onKeyDown="charLimit(this.form.NPANPTrack,this.form.countdown,6000);"
										style="overflow-y: scroll ;width:300px;height:100px"></textarea></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								
								
							</tr>
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					
					<!--Division 4 ends -->



					<!--Division 5 CNA -->
					<table class="cna" id='cna' style='display: none'>
						<tr>
							<th class="theader" colspan="3" style="text-align: left;">Cisco
								Network Assessment</th>
							<td><br />
							<br /></td>
						</tr>
						<tbody>
							<tr>
								<td align="left">CNA Deliverable Type: <font color='red'> * </font></td>
								<td align="right"><select name="CNADeliverableType" id="CNADeliverableType" style="width:320px">
										<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
										<option value="Protocol Audit">Protocol Audit</option>
										<option value="Hardware Audit">Hardware Audit</option>
										<option value="Technology Audit">Technology Audit</option>
										<option value="Other Audit">Other Audit</option>
								</select>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</td>
								<td align="left">Scheduled Date:</td>
								<td align="left"><input class="date" type="text"
									placeholder="CNAScheduled Date" name="CNAScheduledDate"
									id="ScheduledDate" style="width:300px" /></td>
							</tr>
							<tr>
								<td align="left">Description: <font color='red'> * </font></td>
								<td align="right"><textarea rows="4" cols="26"
										name="CNADescription" id="CNADescription"
										onKeyDown="charLimit(this.form.Description,this.form.countdown,6000);"
										style="overflow-y: scroll; width: 320px; height: 100px"></textarea></td>
							</tr>
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
						</tbody>
					</table>
					<!--Division 5 ends -->



					<!--Division 6 Other Deliverables -->
					<table class="Div6" name="Div6" id="Div6" style="display: none">
						<tr>
							<th class="theader">Other Deliverables</th>
							<td><br />
							<br /></td>
						</tr>
						<tr>
							<td align="left" colspan="100%">Deliverable Type: <font color='red'>* &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
							<input type="text"	name="OtherDeliverablesDeliverableType" id="OtherDeliverablesDeliverableType" style="width:300px; margin-left:0px" maxlength="1000" />
							</td>
						</tr>
							<tr><td><br/></td></tr>
							<tr>
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.(Max characters 10000)
							</td>
							</tr>
							<tr>
								<td><br /></td>
							</tr>
							<tr>
							<td colspan='100%'><textarea rows="10" cols="100"
									name="Div6Description" id="Div6Description" placeholder="Description"
									onKeyDown="charLimit(this.form.Div6Description,this.form.countdown,10000);"
									style="overflow-y: scroll; width: 100%; height: 200px"></textarea>
							</td>

						</tr>
						<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					<!--Division 6 ends -->




					<!--Division 7 Deployment Services -->
					<table class="Div7" name="Div7" id="Div7" style="display: none">
						<tr>
							<th class="theader" colspan='100%'>Deployment Services (Intelligent Network Infrastructure Deployment Services)</th>
							<td><br />
							<br /></td>
						</tr>
						<tr>
							<td align="left">Onsite:<font color='red'> * </font></td>
							<td align="left"><select name="Div7Onsite" id="Div7Onsite"
								onchange="ShowCountryField(this,7)" style="width:300px">
									<option value="" selected>Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
									<option value="PartialRequirement">Partial Requirement</option>
							</select>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Country : </td>
							<td align="left"><input type="text" name="Div7Country"
								id="Div7Country" style="width:280px;" readonly /></td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>	
							<td align="left">Deliverable Type: <font color='red'>
									* </font></td>
							<td align="left"><select name="DeploymentServicesDeliverableType"
								id="DeploymentServicesDeliverableType" style="width:300px">
									<option selected="selected" value="" style="display: none;"
											disabled="disabled">Select</option>
									<option value="NIP">NIP</option>
									<option value="NRFU">NRFU</option>
									<option value="POC Testing">POC Testing</option>
									<option value="Implementation-Onsite">
										Implementation Onsite</option>
									<option value="ScheduledChangeSupport">Scheduled
										Change Support</option>
									<option value="Migration">Migration</option>
									<option value="HWInstallation">HW Installation</option>
									<option value="Implementation Custom Deliverables">Implementation Custom Deliverables</option>
									<option value="Implementation Remote">Implementation Remote</option>
									<option value="Others">Others</option>									
							</select></td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
							<td align="left">Technology/Protocol Info:</td>
							<td align="left"><textarea rows="4" cols="26"
									name="Div7Protocol" id="Div7Protocol"
									onKeyDown="charLimit(this.form.Div7Protocol,this.form.countdown,6000);"
									style="overflow-y: scroll; width: 300px; height: 100px"></textarea>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Product/Hardware Info:</td>
							<td align="left"><textarea rows="1" cols="26"
									name="Div7Hardware" id="Div7Hardware"
									onKeyDown="charLimit(this.form.Div7Hardware,this.form.countdown,6000);"
									style="overflow-y: scroll; width: 300px; height: 100px"></textarea>
							</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.(Max characters 10000)
							</td>
							</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td colspan='100%'><textarea rows="10" cols="100"
									name="Div7Description" id="Div7Description" placeholder="Description"
									onKeyDown="charLimit(this.form.Div7Description,this.form.countdown,10000);"
									style="overflow-y: scroll; width: 100%; height: 200px"></textarea>
							</td>

						</tr>
						<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					<!--Division 7 ends -->




					<!-- Design Service-->
					<table class="Div8" name="Div8" id="Div8" style="display: none">
						<tr>
							<th class="theader" colspan='100%'>Design Services</th>
							<td><br />
							<br /></td>
						</tr>
						<tr>
							<td align="left">Onsite:<font color='red'> * </font></td>
							<td align="left"><select name="Div8Onsite" id="Div8Onsite"
								onchange="ShowCountryField(this,8)" style="width:300px">
									<option value="" selected>Select</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
									<option value="PartialRequirement">Partial Requirement</option>
							</select>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Country : </td>
							<td align="left"><input type="text" name="Div8Country"
								id="Div8Country" style="width:280px;" readonly /></td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>	
							<td align="left">Deliverable Type:<font color='red'>
									* </font></td>
							<td align="left"><select name="DesignServicesDeliverableType"
								id="DesignServicesDeliverableType" style="width:300px;">
									<option selected="selected" value="" style="display: none; "
											disabled="disabled">Select</option>
									<option value="Low Level Design">Low Level Design</option>
									<option value="High Level Design">High Level Design</option>
									<option value="Customer Workshops">Customer Workshops</option>
									<option value="Customer Requirement Documentation">Customer Requirement Documentation
										</option>
									<option value="Design Reviews">Design Reviews</option>
									<option value="Ongoing Design Activities">Ongoing Design Activities</option>
									<option value="Architecture Reviews">Architecture Reviews</option>
									<option value="Others">Others</option>
							</select></td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
							<td align="left">Technology/Protocol Info:</td>
							<td align="left"><textarea rows="4" cols="26"
									name="Div8Protocol" id="Div8Protocol"
									onKeyDown="charLimit(this.form.Div8Protocol,this.form.countdown,6000);"
									style="overflow-y: scroll; width: 300px; height: 100px"></textarea>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Product/Hardware Info:</td>
							<td align="left"><textarea rows="1" cols="26"
									name="Div8Hardware" id="Div8Hardware"
									onKeyDown="charLimit(this.form.Div8Hardware,this.form.countdown,6000);"
									style="overflow-y: scroll; width: 300px; height: 100px"></textarea>
							</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.(Max characters 10000)
							</td>
							</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td colspan='100%'><textarea rows="10" cols="100"
									name="Div8Description" id="Div8Description" placeholder="Description"
									onKeyDown="charLimit(this.form.Div8Description,this.form.countdown,10000);"
									style="overflow-y: scroll; width: 100%; height: 200px"></textarea>
							</td>

						</tr>
						<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					<!--Division 8 ends -->





					<!--Division 9 Golden Rules -->
					<table class="Div9" name="Div9" id="Div9">
						<tr>
							<th class="theader" style="text-align: left">Golden Rules</th>
							<td><br />
							<br /></td>
						</tr>
						<tr>
							<td>Please use the text box to either provide a link to
								Golden Rules or to detail in free text the Golden Rules to be
								followed.(Max 10000 characters)</td>
						</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td colspan='100%'><textarea rows="10" cols="100"
									name="Golden" id="Golden"
									onKeyDown="charLimit(this.form.Golden,this.form.countdown,10000);"
									style="overflow-y: scroll; width: 100%; height: 200px"></textarea>
							</td>

						</tr>
						<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					<!--Division 9 ends -->




					<!--Division 10 Work Assignment -->
					<table class="Div10" name="Div10" id="Div10">
						<tr>
							<th class="theader">Work Assignment</th>
							<td><br />
							<br /></td>
						</tr>
						<tr>
							<td align="left">Assignee:</td>
							<td align="left"><select name="Assignee" id="Assignee" style="width:300px">
									<option value='Incomplete,noreply'>Select</option>
							</select></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Created Date:</td>
							<td align="left"><input type="text" 
								name="CreatedDate" id="CreatedDate" style="width:300px" readonly /></td>
						</tr>
						<tr>	
							<td align="left">Resource Assigned Date:</td>
							<td align="left"><input type="text" class="date"
								name="ResourceAssignedDate" id="ResourceAssignedDate"
								placeholder="Resource Assigned Date" style="width:280px"/></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Start Date:</td>
							<td align="left"><input class="date" type="text"
								placeholder="Project Start Date" name="StartDate" style="width:300px" id="StartDate" />
							</td>
						</tr>
						<tr>	
							<td align="left">Estimated Hours:</td>
							<td><input type="text" name="EstimatedHours"
								id="EstimatedHours" placeholder=".. in hours" style="width:280px"></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td align="left">Due Date:</td>
							<td align="left"><input type="text" class="date"
								name="DueDate" id="DueDate" placeholder="Due date" style="width:300px"/></td>
						</tr>
						<tr>
							<td align="left">Status:</td>
							<td align="left"><select name="ProjStatus" id="ProjStatus" style="width:300px">
									<option value="Open">Open</option>
									
							</select></td>
						</tr>
						<tr><td><br/></td></tr>
						<tr>
							<td colspan="100%" align="left">Please use the text box below to provide Special Comments about the project(Max 10000 characters).
							</td>
							</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td colspan='100%'><textarea rows="10" cols="100"
									name="SpecialComments" id="SpecialComments" placeholder="SpecialComments"
									onKeyDown="charLimit(this.form.SpecialComments,this.form.countdown,10000);"
									style="overflow-y: scroll; width: 100%; height: 200px"></textarea>
							</td>

						</tr>
						<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
					</table>
					<br>
					
					<table class="attachments" id="attachfiles">
						<tbody>
						<tr>
							<th class="theader" align="left">Attachments (Max File size 25MB per file )</th>
							<td><br />
							<br /></td>
						</tr>
							<tr>
								<td><INPUT NAME="file0" TYPE="file" id="attachment0" /></td>
								<td><button type="button" onclick="addMore()">Add
										Files</button></td>
								<!-- <td><button type="button" onclick="removeFiles()">Remove Files</button></td> -->
							</tr>
							<tr><td><input type="hidden" name="x" value=0 id="x">
							</td>
							</tr>

						</tbody>
					</table>
					<table class="submit" id="submitDiv">
						<tr>
							<td colspan="2">
							<input type="hidden" name="existingHwNew" value="Y" />
							<input type="submit" value="submit"
								onClick="return validate_form();"
								style="float: right; top: 10px; position: relative;" /></td>
						</tr>
					</table>
				
		</div>
		</form>
	</div>
	</div>
<script type="text/javascript">
$(function(){
   $(".chzn-select").chosen({search_contains:true});
    
    });
</script>


</body>


</html>
