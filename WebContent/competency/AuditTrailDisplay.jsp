<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Audit Trail</title>
<link rel="stylesheet" href="../css/styleQueryForm.css">
<link rel="stylesheet" href="jquery.timepicker.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="jquery.timepicker.js"></script>
   
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
  margin: 5px auto;
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


   td{
   vertical-align:middle;
   }
   
   .theader{
   font-size: 22px;
   font-weight: normal;
   margin-bottom: 20px;
   margin-top: 20px;   
   }

	</style>

</head>
<body>
<%@page import="sat.tool.Mssql_connect,java.sql.ResultSetMetaData, java.util.*,java.sql.ResultSet,java.sql.SQLException" %>

<%
                            int columnCount=0,i,j;
                            ResultSet rs = null;
                            ResultSetMetaData  metaData = null;
                            try {    
                                	rs = (ResultSet) request.getAttribute("resultset");                                	                               	
                                	metaData = (ResultSetMetaData) request.getAttribute("metaData");   
                                	columnCount = metaData.getColumnCount();
                                	ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("temp");
                                    	//out.println("\n\nTEMP: "+temp.get(0).toString());
                                out.println("<div class='login' style='float: left; margin-left:10%;border-right: 1px solid grey; border-left: 1px solid grey;width:80%;background:white'><table><h1>Audit Trail</h1></table>");   
                                    
                                for(j=0;j<temp.size();j++)//To FETCH WHOLE RECORD
                                {
                                	out.println("<div class='login' style='float: left; margin-left:10%;border-right: 1px solid grey; border-left: 1px solid grey;width:80%;background:white'><table id='table"+j+"'>");
                                	String updater = new String();
                               		String timestamp = new String();
                               		out.println("<tr colspan = '3'><td style='color:#002970'>");
                               		for(i=0;i<columnCount;i++)//TO ITERATE THROUGH COLUMN NAMES
   	                    			{
                              			if(metaData.getColumnName(i+1).equalsIgnoreCase("UpdatedBy"))
  	                                		updater = temp.get(j).get(i).toString();
                                		if(metaData.getColumnName(i+1).equalsIgnoreCase("Timestamp"))
   	                                		timestamp = temp.get(j).get(i).toString();
                              			
   	                    			}
                                		
                               		out.println(updater+"&nbsp made changes - <span class='date'>"+timestamp+": </span><br/>");
                               		out.println("</td></tr>");
                               		if(j==0)
                                   	{
                               			out.println("<tr><td width='100%'>");
                                		out.println("Request Created. <br/>");
                                		out.println("</td></tr>");
                                	}
                                	else
                                	{
                                		out.println("<tr><td width='20%'>Field</td><td width='40%'>Old Value</td><td width='40%'>New Value</td></tr>");
                                		for(i=0;i<columnCount;i++)//TO ITERATE THROUGH COLUMN NAMES
    	                    			{
                                			
                                			String colName = metaData.getColumnName(i+1);
                                			String colType = metaData.getColumnTypeName(i+1);
                                			String oldVal = new String();
                                			String newVal = new String();
                                			
                                			if((temp.get(j).get(i) == null) || (temp.get(j).get(i) == "")) newVal = "";
                                			if((temp.get(j-1).get(i) == null) || (temp.get(j-1).get(i) == "")) oldVal = "";
                                			
                                			if (colName.equalsIgnoreCase("UpdatedBy")||colName.equalsIgnoreCase("Version")||colName.equalsIgnoreCase("Timestamp"))
                                				continue;
                                			else if ((temp.get(j).get(i) != null) && (temp.get(j-1).get(i) != null))
                                			{
                                				if(colType.equalsIgnoreCase("nvarchar")||colType.equalsIgnoreCase("date")||colType.equalsIgnoreCase("datetime2")||colType.equalsIgnoreCase("int"))
                                				{
                                					oldVal = temp.get(j-1).get(i).toString();
                                					newVal = temp.get(j).get(i).toString();
                                					if(!newVal.equals(oldVal))
                                						out.println("<tr><td width='30%'>"+colName+" </td><td width='40%'> "+oldVal+" </td><td width='40%'> "+newVal+"</td></tr>");
                                				}
                                			}                                				
                                			else if (oldVal.equalsIgnoreCase("")||newVal.equalsIgnoreCase(""))
                                			{                                	
                                				if(!newVal.equals(oldVal))
                            						out.println("<tr><td width='30%'>"+colName+" </td><td width='40%'> "+oldVal+" </td><td width='40%'> "+newVal+"</td></tr>");
                                			}
                                			
                                			/*
                                				out.println(temp.get(j).get(i).getClass()+"&nbsp&nbsp");
                                			out.println("<br/>");
                                			
    	                                	if ((temp.get(j).get(i)).equals(temp.get(j-1).get(i)))
    	                                		out.println(metaData.getColumnName(i+1)+" changed from "+temp.get(j-1).get(i)+" to --> "+temp.get(j).get(i)+"<br/>");
    	                                	
    	                                	if(metaData.getColumnName(i).equalsIgnoreCase("UpdatedBy"))
    	                                		out.println("<th style=\"width:200px;\">"+temp.get(i)+"</th>");
    	                                	*/
    	                                	
    	                    			}
                                		out.println("<br/>");
                                	}
                               		out.println("</table></div>");
	                                out.println("<br/><br/>");
                                	
                                }
                            }
                			catch(SQLException e)
                			{
                				e.printStackTrace();
                			}
                                

%>
</body>
</html>