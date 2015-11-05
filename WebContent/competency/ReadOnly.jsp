<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Competency</title>

<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
<link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style1.css">
        
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="//cdn.jsdelivr.net/webshim/1.14.5/polyfiller.js"></script>
<script>
    webshims.setOptions('forms-ext', {types: 'date'});
webshims.polyfill('forms forms-ext');
</script>

<!-- <!-- cdn for modernizr, if you haven't included it already -->
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>

<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>

<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}

article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
  display: block;
}

body {
  line-height: 1;
}

ol, ul {
  list-style: none;
}

blockquote, q {
  quotes: none;
}

blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

.about {
  margin: 80px auto;
  padding: 8px;
  width: 260px;
  font: 10px/18px 'Lucida Grande', Arial, sans-serif;
  color: #666;
  text-align: center;
  text-shadow: 0 1px rgba(255, 255, 255, 0.25);
  background: #eee;
  background: rgba(250, 250, 250, 0.8);
  border-radius: 4px;
  background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.1));
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 0 1px rgba(255, 255, 255, 0.1), 0 0 6px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 0 1px rgba(255, 255, 255, 0.1), 0 0 6px rgba(0, 0, 0, 0.2);
}
.about a {
  color: #333;
  text-decoration: none;
  border-radius: 2px;
  -webkit-transition: background 0.1s;
  -moz-transition: background 0.1s;
  -o-transition: background 0.1s;
  transition: background 0.1s;
}
.about a:hover {
  text-decoration: none;
  background: #fafafa;
  background: rgba(255, 255, 255, 0.7);
}

.about-links {
  height: 30px;
}
.about-links > a {
  float: left;
  width: 50%;
  line-height: 30px;
  font-size: 12px;
}

.about-author {
  margin-top: 5px;
}
.about-author > a {
  padding: 1px 3px;
  margin: 0 -1px;
}


body {
  font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
  color: #404040;
  background: #194775;
}

.container {
  margin: 80px auto;
  width: 640px;
}

.login {
  position: relative;
  margin: 0 auto;
  padding: 20px 20px 20px;
  width: 410px;
  background: white;
  border-radius: 6px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}
.login:before {
  content: '';
  position: absolute;
  top: -8px;
  right: -8px;
  bottom: -8px;
  left: -8px;
  z-index: -1;
  background: rgba(0, 0, 0, 0.08);
  border-radius: 4px;
}
.login h1 {
  margin: -20px -20px 21px;
  line-height: 40px;
  font-size: 15px;
  font-weight: bold;
  color: #555;
  text-align: center;
  text-shadow: 0 1px white;
  background: #f3f3f3;
  border-bottom: 1px solid #cfcfcf;
  border-radius: 3px 3px 0 0;
  background-image: -webkit-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -moz-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -o-linear-gradient(top, whiteffd, #eef2f5);
  background-image: linear-gradient(to bottom, whiteffd, #eef2f5);
  -webkit-box-shadow: 0 1px whitesmoke;
  box-shadow: 0 1px whitesmoke;
}
.login p {
  margin: 2px 0 0;
}
.login p:first-child {
  margin-top: 0;
}
.login input[type=text], .login input[type=password]{
  width: 200px;
}
 
.login p.remember_me {
  float: left;
  line-height: 31px;
}
.login p.remember_me label {
  font-size: 12px;
  color: #777;
  cursor: pointer;
}
.login p.remember_me input {
  position: relative;
  bottom: 1px;
  margin-right: 4px;
  vertical-align: middle;
}
.login p.submit {
  text-align: right;
}

.login-help {
  margin: 20px 0;
  font-size: 11px;
  color: white;
  text-align: center;
  text-shadow: 0 1px #2a85a1;
}
.login-help a {
  color: #cce7fa;
  text-decoration: none;
}
.login-help a:hover {
  text-decoration: underline;
}

:-moz-placeholder {
  color: #c9c9c9 !important;
  font-size: 13px;
}

::-webkit-input-placeholder {
  color: #ccc;
  font-size: 13px;
}

input {
  font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif;
  font-size: 14px;
}

input[type=text], input[type=password]{
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

textarea
{
  margin: 5px;
  padding: 0 0px;
  width: 220px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

td {
	vertical-align: middle;
}

.theader {
	font-size: 22px;
	font-weight: normal;
	margin-bottom: 20px;
	margin-top: 20px;
}

.login select {
  margin: 5px;
  width: 222px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}


input[type=text]:focus, input[type=password]:focus, .login select:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
}

input[type=submit] {
  padding: 7px 12px;
  cursor: pointer;
  font-size: 12px;
  font-weight: bold;
  color: #527881;
  text-shadow: 0 1px #e3f1f1;
  background: #cde5ef;
  border: 1px solid;
  border-color: #b4ccce #b3c0c8 #9eb9c2;
  border-radius: 5px;
  outline: 0;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -moz-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -o-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: linear-gradient(to bottom, #edf5f8, #cde5ef);
  -webkit-box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
  box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
}
input[type=submit]:active {
  background: #cde5ef;
  border-color: #9eb9c2 #b3c0c8 #b4ccce;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
}

input[type=button]:active {
  background: #cde5ef;
  border-color: #9eb9c2 #b3c0c8 #b4ccce;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
}

.lt-ie9 input[type=text], .lt-ie9 input[type=password] {
  line-height: 34px;
}
tr td{ 
	font-weight:bold;
}
#RecvDate, #FulfilmentDate, .time {
	width:84px !important;
}
#FulfilmentDate,#FulfilTime{
	margin:3px !important;
}
.requirements
{
	height: 34px;
}

</style>
<link rel="stylesheet" href="jquery.timepicker.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="jquery.timepicker.js"></script>
     <script src="./js/searchautocomplete/chosen.jquery.js"></script>
  <script src="./js/searchautocomplete/chosen.jquery.min.js"></script>
  <link rel="stylesheet" href="./js/searchautocomplete/chosen.css">
    <script type="text/javascript" src="./js/jquery.loadJSON.js"></script>
    
    
   
    

    <script>  	
   
    $(function() {
    	
    	$( ".date" ).datepicker();
    	
    });
	
	$(function(){
		document.getElementById("CreatedDate").readonly=true;
		//$("#CreatedDate").datepicker('setDate', new Date());
	});
   
function validate_form(){
		//alert("validating ");
		var dT = document.getElementById("Region").value;
		if(dT=='select'){
		alert("please select a region");
		return false;
		}
		else{
		return true;
		}}

		
		
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

function ShowCountryField1(onsiteVal,id){
var str = "Div"+id+"Country";
switch (onsiteVal){

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
function SetDeliveryTeam2(Theatre){
	var dropdown = document.getElementById("Region");
	switch (Theatre){
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
	case 'Americas ENT':{
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
	alert(Theatre + ' is not yet supported');
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('Select a Theatre First','00');
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
	case 'Americas ENT':{
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
	}f
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
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
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
document.getElementById("DesignServicesDeliverableType").required = true;
document.getElementById("Div8Description").required = true;
document.getElementById("Div8Onsite").required = true;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
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
break;
}
default:{
alert(classification.value + ' is not yet supported');
break;
}
}
}

function SetClassification2(classification){
//var dropdown = document.getElementById("DeliveryClassification");
switch (classification){
case 'SORA':{
$('.sora').show();
$('.npa').hide();
$('.cna').hide();
$('.Div6').hide();
$('.Div7').hide();
$('.Div8').hide();
document.getElementById("SoftwareRelease").required = true;
document.getElementById("SORADeliverableType").required = true;
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
document.getElementById("Triggers").required = false;
document.getElementById("SoraDescription").required = false;
document.getElementById("NPDeliverableType").required = false;
document.getElementById("NPADescription").required = false;
document.getElementById("NPANPTrack").required = false;
document.getElementById("CNADeliverableType").required = false;
document.getElementById("CNADescription").required = false;
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
document.getElementById("DesignServicesDeliverableType").required = true;
document.getElementById("Div8Description").required = true;
document.getElementById("Div8Onsite").required = true;
document.getElementById("OtherDeliverablesDeliverableType").required = false;
document.getElementById("Div6Description").required = false;
document.getElementById("platform").required = false;
document.getElementById("NOSOEManager").required = false;
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
break;
}
default:{
alert(classification.value + ' is not yet supported');
break;
}
}
}


    
function check(value,textbox){
	if(value==='yes'){
		$('#'+textbox+'').show();
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
    </script>
    
    <script>
 function addMore()
 {
	 $("#attachfiles tr:last").after('<tr><td><INPUT NAME="file" TYPE="file"/></td></tr>');
 }
 

 	$(document).ready(function(){
	jsonObj=${js_obj};
				//alert(jsonObj);
				//jsonObj.replace(/'/g,'&quot');
 				$('form').loadJSON(jsonObj); 				
				$("#GDC").val(jsonObj.GDC).prop('selected',true);
				//$("#ExistingHardwareinfo").chosen().trigger("chosen:updated");
				var existingHwNew = jsonObj.ExistingHardwareNew;
				if(existingHwNew == "Y") {
					$(".chzn-select").chosen();
					$(".chzn-select").attr("disabled", "disabled").trigger("chosen:updated");
				}
				var sno= jsonObj.SNo;
				//alert(sno);
				document.getElementById("SNo").value=sno;
				document.getElementById("sno").value=sno;
 				var attachment = jsonObj.attachments;
 				var res = attachment.split(";");
 				var links = '<a href="download?sno='+jsonObj.SNo+'&fileName='+encodeURIComponent(res[0])+'">'+res[0]+'</a><br><br>';
 				for(var i=1;i<res.length;i++)
 				{
 				 links = links+'<a href="download?sno='+jsonObj.SNo+'&fileName='+encodeURIComponent(res[i])+'">'+res[i]+'</a><br><br>';
 				}
 				document.getElementById("uploadedfiles").innerHTML=links;
 				
 				$("#Team").val(jsonObj.Team).prop('selected',true);
 				
 				$("#Theatre").val(jsonObj.Theatre).prop('selected',true);
				var th = jsonObj.Theatre + "";
 				SetDeliveryTeam2(th);
 				$("#Region").val(jsonObj.Region).prop('selected',true);
 				$("#DeliverableClassification").val(jsonObj.DeliverableClassification).prop('selected',true);
				var dc= jsonObj.DeliverableClassification + "";
				SetClassification2(dc);
				if(dc=="SORA"){
					$("#SORADeliverableType").val(jsonObj.SORADeliverableType).prop('selected',true);
					$("#SORADeliveryCategory").val(jsonObj.SORADeliveryCategory).prop('selected',true);
					if(jsonObj.platform != null || jsonObj.platform != ""){
						$("#platform").val(jsonObj.platform).prop('selected',true);
					}
					
					if(jsonObj.NOSOEManager != null || jsonObj.NOSOEManager != ""){
						$("#NOSOEManager").val(jsonObj.NOSOEManager);
					}
				}
				if(dc=="Cisco Network Assessment"){
				$("#CNADeliverableType").val(jsonObj.CNADeliverableType).prop('selected',true);
				
				}
				if(dc=="Design Services"){
				$("#DesignServicesDeliverableType").val(jsonObj.DesignServicesDeliverableType).prop('selected',true);
				$("#Div8Onsite").val(jsonObj.Onsite).prop('selected',true);
				ShowCountryField1(jsonObj.Onsite,8);
				
				}
				else if(dc=="Deployment Services"){
				$("#DeploymentServicesDeliverableType").val(jsonObj.DeploymentServicesDeliverableType).prop('selected',true);
				$("#Div7Onsite").val(jsonObj.Onsite).prop('selected',true);
				ShowCountryField1(jsonObj.Onsite,7);
				}
				else if(dc=="NP/NPA/NHF"){
				$("#NPDeliverableType").val(jsonObj.NPDeliverableType).prop('selected',true);
				}
				var RR = jsonObj.RegulatoryRequirements;
				if (RR=="on"){
				document.getElementById('RegulatoryRequirementsyes').checked = true;
				$('#RegulatoryRequirementstext').show();}
				else if (RR=="off"){
				document.getElementById('RegulatoryRequirementsno').checked = true;
				$('#RegulatoryRequirementstext').hide();}
				
				var LR = jsonObj.LanguageRequirements;
				if(LR=="off"){
				document.getElementById('LanguageRequirementsno').checked = true;
				$('#LanguageRequirementstext').hide();}
				
				else if (LR=="on"){
				document.getElementById('LanguageRequirementsyes').checked = true;
				$('#LanguageRequirementstext').show();
				$("#LanguageRequirementstext").val(jsonObj.LanguageRequirementstext).prop('selected',true);
				
				}
				var TR = jsonObj.TimeZoneRequirements;
				if(TR=="off"){
				document.getElementById('TimeZoneRequirementsno').checked = true;
				document.getElementById('TimeZoneRequirementsyes').checked = false;
				$('#TimeZoneRequirementstext').hide();
				}
				else if (TR=="on"){
				document.getElementById('TimeZoneRequirementsyes').checked = true;
				document.getElementById('TimeZoneRequirementsno').checked = false;
				$("#TimeZoneRequirementstext").val(jsonObj.TimeZoneRequirementstext).prop('selected',true);
				$('#TimeZoneRequirementstext').show();
				}
				var ER = jsonObj.ExpertiseRequirements;
				if(ER=="off"){
				document.getElementById('ExpertiseRequirementsno').checked = true;
				$('#ExpertiseRequirementstext').hide();
				}
				else if (ER=="on"){
				document.getElementById('ExpertiseRequirementsyes').checked = true;
				$('#ExpertiseRequirementstext').show();
				}
				var Gid= jsonObj.SNo;
				$("#SNo1").val(Gid);
				$("#SNo").innerHTML = Gid;
 				$("#DeliveryModel").val(jsonObj.DeliveryModel).prop('selected',true);
 				$("#Hourslogging").val(jsonObj.Hourslogging).prop('selected',true);
 				$("#BugSeverity").val(jsonObj.BugSeverity).prop('selected',true);
 				$("#ProjStatus").val(jsonObj.ProjStatus).prop('selected',true);
				$("#AuditType").val(jsonObj.AuditType).prop('selected',true);
				$("#ResourceAssignedDate").val(jsonObj.ResourceAssignedDate);
				$('#form input').attr('readonly', 'readonly');
				$('#form textarea').attr('readonly', 'readonly');
				$('#form select').attr('disabled','disabled');
				$("#Owner").val(jsonObj.Owner).prop('selected',true);
				$("#TransitionBy").val(jsonObj.TransitionBy).prop('selected',true);
				$("#State").val(jsonObj.State).prop('selected',true);
 				
				$.ajax({ 
					url:"<%=request.getContextPath()%>/GetAssignee",
					type:"GET",
					dataType: 'json',
					success: function( json ) {
				
						$.each(json.Assignees, function(i, optionHtml){
							var res=optionHtml.split(",");
							$('#Assignee').append('<option value='+res[0]+'>'+optionHtml+'</option>');
						});
						$("#Assignee").val(jsonObj.Assignee).prop('selected',true);
					}
				}); 
 	});
				
 			
 /*
 function makeEditable(){
				$('#form input').attr('readonly', false);
				$('#form textarea').attr('readonly', false);
				$('#form select').attr('disabled',false);
 }*/
 function getAssignees(){
		$.ajax({ 
			url:"<%=request.getContextPath()%>/GetAssignee",
			type:"GET",
			dataType: 'json',
			success: function( json ) {
				
				$.each(json.Assignees, function(i, optionHtml){
				var res=optionHtml.split(",");
           		$('#Assignee').append('<option value='+res[0]+'>'+optionHtml+'</option>');
        		});
				$("#Assignee").val(jsonObj.Assignee).prop('selected',true);
		   }
		}); 
		
	} 
 </script>
<script>
var GdcSet = "";
var TeamSet = "";
function setNOSXEManager(){
	var hardware = $('#platform').val();
	switch(hardware){
		case "IOS":
			$('#NOSOEManager').val(['Sourabh Agarwal','Deepa Thomas Ajosh']);
			break;
		case "IOS-XE":
			$('#NOSOEManager').val(['Sourabh Agarwal','Deepa Thomas Ajosh']);
			break;
		case "IOS-XR":
			$('#NOSOEManager').val(['Mahesh Kumar Jothi']);
			break;
		case "NX-OS":
			$('#NOSOEManager').val(['Munjal Joshi']);
			break;
		case "Security":
			$('#NOSOEManager').val(['Mahesh Kumar Jothi']);
			break;
		case "Wireless":
			$('#NOSOEManager').val(['Mahesh Kumar Jothi']);
			break;
		default:
			$('#NOSOEManager').val(['']);
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
		sdc = $('#hardware').val();
		if(TheaterSet=="Americas Enterprise")
			{
				//var Tr =$('input[name="TimeZoneRequirements"]:checked').val();
				//var Lr =$('input[name="LanguageRequirements"]:checked').val();
				//alert("Value of TR is "+Tr);
				
				if(Tr=="off")
					{
						document.getElementById("GDC").value="Bangalore";
						document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
									document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
						document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
								document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
								document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
						document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
								document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
											document.getElementById("ServiceOwner").value="Krishnendu DasGupta"
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
								document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
										document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
										document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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
								document.getElementById("ServiceOwner").value="Krishnendu DasGupta";
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

<%-- progress bar by shivam--%> 
<style>
span.dot {
  height: 10px;
  width: 10px;
  border-radius: 100%;
  border: 3px solid #137CC0;
  background:#137CC0;
  position: absolute;
  left:0px;
  
  cursor: pointer;
  
}

table{
width:100%;
}



*{
  box-sizing: border-box;
  
}



div.trackingstatus{
  
  left: calc(50% - 330px);
  width: 660px;
 position: relative; 
}
div.linebar{
top:2px;
    width: 660px;
  position: relative;
  border: 1px solid blue;  
}
div.overlinebar{
    width: 660px;
  position: relative;
  border: 1px solid black;  
}
div.cont{
  top:-5px;
  width: 660px;
  position: relative;
}
div.dotHover{
    top: 20px;
  left: calc(50% - 330px);
   width: 660px;
    
    border: 2px solid blue;
    margin: 0 auto;
  position: absolute;
   
}



span.dot {
  height: 10px;
  width: 10px;
  border-radius: 100%;
  border: 3px solid #137CC0;
  background:#137CC0;
  position: absolute;
  left:0px;
  
  cursor: pointer;
  
}



span.border-change{
  border-color:#fff;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.5), inset 2px 2px 4px rgba(0,0,0,.5);
}


ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
.displayinfo{
  
  display: inline;
  float: left;
    width: 100px;
    padding: 0;
    margin: 0px;
  
   
}

.col4{
  
  width: 200px;
}

.col1{
  left: 100px;
  width: 150px;
}
.col2{
  left: 100px;
  width: 150px;
}




</style>
<script  >
var idVal= 0;
var statename;
var owner="not defined";
var transition="not defined";
var info="cool lagate hai "

function statenamebyid(id) {
  var states = ["Open","Staffing","Screening","Brp","Queued","Assigned","Query-rerun","In-progress","Review","Review-done","Delivered","Completed"];
    return states[id-1];
}

function getidbystatename(name) {
  var states = ["Open","Staffing","Screening","Brp","Queued","Assigned","Query-rerun","In-progress","Review","Review-done","Delivered","Completed"];
    return states.indexOf(name)+1;
}

function dotHoverChange(id){
	
  statename=statenamebyid(id)
  if(id <= idVal){
    document.getElementById("dotHover").style.display = "inline";
    document.getElementById("disstate").innerHTML = statename;
    document.getElementById("disowner").innerHTML = "owner :"+owner;
    document.getElementById("distransition").innerHTML = "transition by :"+ id;
    document.getElementById("discomment").innerHTML = id;
  }
}

function dotHoverChange1(id){
   if(id <= idVal){
   document.getElementById("dotHover").style.display = "none";
   }
}

function mycurrentsituation() {
	
	statename=document.getElementById('State').value;
	owner=document.getElementById('Owner').value;
	transition=document.getElementById('TransitionBy').value;
	
  var val = getidbystatename(statename);
  idVal = val;
  
  var i;
  
  for (i = 1; i <= val; i++) { 
    document.getElementById(i).className += " border-change";
}
  
  
  document.querySelector('div.overlinebar').style.width = (val-1)*60+'px';
   
   }
</script>

</head>

<body onload="mycurrentsituation()">


<%-- ending progress bar by shivam--%> 


<!-- swapnil -->

<div class="form">
      
      <ul class="tab-group">
        
        
        <li class="tab active"><a href="#signup">General information</a></li>
        <li class="tab" ><a href="#igg">Inter GDC Governance</a></li>
        <li class="tab"><a href="#wat">Work Assignment</a></li>
        <li class="tab"><a href="#grr">Attachments</a></li>
     
      </ul>
      
       
       <!-- <form name="form" id="form" method="post" action="NewEntry" enctype='multipart/form-data'> -->
<div class="tab-content">

    
    
		<div style = "width:80%;background:white">
		 <div id="AuditTrail" style="float:right;align=right">
		<form id="AuditTrail" method="post" action="AuditTrailHandler">
		  <input type="hidden" name="SNo2" id="SNo2"/>
		  <input type="text" id="SNo" name="SNo" style="display:none"/>					
		  <input type="submit" name="History" value="History" style="float:right;top:10px;position:relative;" onclick="redirectToAuditPage()" />
		  <input type="submit" name="CloneRequest" value="Clone Project" style="float:right;top:10px;position:relative;" onclick="redirectToClonePage()" />
		</form>

		</div>
		
        <form name="form" id="form" method="post"  action="EditCompetency" enctype='multipart/form-data'>
		
            <div class="login" style="float: left; margin-left:10%;border-right: 1px solid grey; border-left: 1px solid grey;width:100%;background:white">
                <h1>GRT ID -- <label id ="SNo" name='SNo'></label> </h1>
                
                 <%-- adding owner transition by state by shivam--%> 
					

<div class="trackingstatus">
<div class="linebar"></div>
<div class="overlinebar"></div>
<div class="cont" >
 

<span class="dot" id="1" style = "left: 0px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)" ></span>
<span class="dot" id="2" style = "left: 60px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
<span class="dot" id="3" style = "left: 120px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="4" style = "left: 180px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="5" style = "left: 240px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="6" style = "left: 300px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
<span class="dot" id="7" style = "left: 360px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="8" style = "left: 420px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
<span class="dot" id="9" style = "left: 480px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="10" style = "left: 540px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="11" style = "left: 600px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
  <span class="dot" id="12" style = "left: 660px;" onmouseover="dotHoverChange(this.id)" onmouseout = "dotHoverChange1(this.id)"></span>
</div>

<div class = "dotHover" id = "dotHover"  style= "display:none">
  <ul > 
    <li class="displayinfo col1" >state</li>
<li class="displayinfo col2" >OWNER</li>
 <li class="displayinfo col2" >TRANSITOIN</li> 
 <li class="displayinfo"> </li> 
 <li class="displayinfo col4" >COMMENT</li>
 </ul>
  <ul > 
<li class="displayinfo col1" id="disstate"></li>
    <li class="displayinfo col1" id="disowner"></li>
 <li class="displayinfo col2" id="distransition"></li> 
 <li class="displayinfo"> </li> 
 <li class="displayinfo col4" id="discomment"></li>
 </ul>
  
</div>
</div>					
					
<div id="signup">					
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
											 >Select</option>
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
											>Select</option>
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
				
				
				
							<!--Division 2 Starts-->
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
								<td>PID:</td><td align="left"><input type="text" name="Pid" id="Pid" maxlength="6"
									onkeypress="return isNumber(event)" style="width: 300px"></td>	

							</tr>

							<tr>
								<td align="left">Requested By: <font color='red'> *
								</font></td>

								<td align="left"><input type="text" name="RequestedBy"
									id="RequestedBy" placeholder="Enter CEC ID" style="width:300px;" required /></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>		
								<td align="left">Task:</td><td align="left"><input type="text" name="Task" id="Task" style=" width:300px"></td>
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
								<td align="left"><input type="text" name="CapId" id="CapId"	 style="width:300px" placeholder="" /></td>
							</tr>
							
							<tr><td colspan="100%">
								<br />
								<hr />
								<br />
							</td>	
							</tr>
						</tbody>
					</table>
				<!--Division 2 Ends-->	
				
		</div>		
				
				
	
	<div id="igg">			
                
                
                <table style="width:100%%">
                    <tbody>
                    <input type="hidden" id="SNo1" name="SNo1" value=""/>
						
						<input type="hidden" id="sno" name="sno" value=""/>
						<input type="text" name="mailer" id="mailer" style="display:none;"/>
							<!-- <tr><td colspan="100%" ></td></tr> -->
							<tr class="requirements">
								<td align="left">Regulatory Requirements:<font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="RegulatoryRequirements" id="RegulatoryRequirementsyes"
									value="on"
									onchange="check('yes','RegulatoryRequirementstext');setServiceOwner();" required>YES
									<input type="radio" name="RegulatoryRequirements"
									id="RegulatoryRequirementsno" value="off" 
									onchange="check('no','RegulatoryRequirementstext');setServiceOwner();">NO
									<input type="text" name="RegulatoryRequirementstext"
									id="RegulatoryRequirementstext"
									style="display: none; width: 110px; height: 25px"
									maxlength="1000"></td>
							</tr>

							<tr class="requirements">
								<td align="left">Language Requirements : <font color='red'>
										* </font></td>

								<td align="left"><input type="radio"
									name="LanguageRequirements" id="LanguageRequirementsyes"
									value="on" onchange="check('yes','LanguageRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="LanguageRequirements" id="LanguageRequirementsno"
									value="off"  onchange="check('no','LanguageRequirementstext');setServiceOwner();">NO
									<select name="LanguageRequirementstext" id="LanguageRequirementstext" style="display:none;width:110px;height:25px">
									<option selected="selected" value=" " style="display: none;"
											 >Select 'NO' for english</option>
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
									name="TimeZoneRequirements" id="TimeZoneRequirementsyes"
									value="on" onchange="check('yes','TimeZoneRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="TimeZoneRequirements" id="TimeZoneRequirementsno"
									value="off"  onchange="check('no','TimeZoneRequirementstext');setServiceOwner();">NO
									<select name="TimeZoneRequirementstext"
									id="TimeZoneRequirementstext"
									style="display: none; width: 125px;">
									<option selected="selected" value=" " style="display: none;"
											 >Select NO for Bangalore GDC</option>
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
										<option
											value="(GMT +5:30) Bombay, Calcutta, Madras, New Delhi">(GMT
											+5:30) Bombay, Calcutta, Madras, New Delhi</option>
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
									name="ExpertiseRequirements" id="ExpertiseRequirementsyes"
									value="on" onchange="check('yes','ExpertiseRequirementstext');setServiceOwner();"
									required>YES <input type="radio"
									name="ExpertiseRequirements" id="ExpertiseRequirementsno"
									value="off" onchange="check('no','ExpertiseRequirementstext');setServiceOwner();">NO
									<input type="text" name="ExpertiseRequirementstext"
									id="ExpertiseRequirementstext"
									style="display: none; width: 110px; height: 25px"
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



</div>




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
								<c:choose>
									<c:when test="${js_obj_json.ExistingHardwareNew == 'Y'}">
										<td align="left">								  																
										  <select class="chzn-select" multiple="multiple" name="ExistingHardwareinfo" id="ExistingHardwareinfo">
										  <c:forEach items="${HardwarePids}" var="item">
											    <option value="${item}">${item}</option>
											</c:forEach>
										</select></td>
									</c:when>
									<c:otherwise>
									<td align="left"><textarea rows="4" cols="26"
											name="ExistingHardwareinfo" id="ExistingHardwareinfo"
											onKeyDown="charLimit(this.form.ExistingHardwareinfo,this.form.countdown,3999);"
											style="overflow-y: scroll; width: 300px; height: 100px"></textarea></td>
									</c:otherwise>
								</c:choose>
								

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
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.
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
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.
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





					<!--Division 8 Design Services -->
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
							<td colspan="100%" align="left">Please use the text box below to provide description about the project.
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
								followed.</td>
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
									<option value="Screening">Screening</option>
									<option value="Queued">Queued</option>
									<option value="Delivered">Delivered</option>
									<option value="Customer Pending">Customer Pending</option>
									<option value="Deleted(Project abandoned before commencing work )">Deleted(Project abandoned before commencing work )</option>
									<option value="Canceled (Project halted after commencing work)">Canceled (Project halted after commencing work)</option>
							</select></td>
						</tr>
						<tr><td><br/></td></tr>
						<tr>
							<td colspan="100%" align="left">Please use the text box below to provide Special Comments about the project.
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
					
											<table id="attachfiles">
											
											<tbody>
											<tr>
							<th class="theader" align="left">Attachments (Max File size 25MB per file )</th>
							<td><br />
							<br /></td>
						</tr>
											<tr>
																			</tr>
											<tr>
											<td><label id='uploadedfiles'></label> </td>
											</tr>
																	
											</tbody>
											</table>
											<Table>
											<tr><td>For editing please login to the portal and search your project in view project details</td></tr>
											<tr><td><a href="http://grt.cisco.com" target="_blank">grt.cisco.com</a></td></tr>
											</Table>
											<table>
											<tr>
												<td colspan="2"><input type="submit" value="Edit" style="float:right;top:10px;position:relative;" onclick="redirectToEditPage()"/></td>
											</tr>
											
											</table>
											</div>
		
		</div>	
		</div>								
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
											
</body>

 
</html>


<script>

function redirectToAuditPage(){
	var SNO = $("#SNo").val();
	//alert(SNO);
	$("form").attr("action", "AuditTrailHandler?SNo=" + SNO);
}

function redirectToClonePage(){
	
	var SNO = $("#SNo").val();
	//alert("redirectToClonePage:"+SNO);
	$("form").attr("action", "CloneHandler?sno=" + SNO);
}


function redirectToEditPage(){
	var SNO = $("#sno").val();
	//alert(SNO);
	$("form").attr("action", "EditCompetency?sno=" + SNO);
}

</script>