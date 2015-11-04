<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Projects</title>
	
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="jquery.timepicker.js"></script>
	<script type="text/javascript" src="./js/jquery.loadJSON.js"></script>
	<!-- Lighbox Jquery -->
	<!-- Add jQuery library -->
	<script type="text/javascript" src="js/lib/jquery-1.10.1.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="js/lib/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="js/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="js/source/jquery.fancybox.css?v=2.1.5" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="js/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="js/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="js/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="js/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="js/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
	
	
	<link rel="stylesheet" href="./css/smoothness/jquery-ui-1.8.4.custom.css" />
	
	<style type="text/css" title="currentStyle">
	@import "./css/demo_table_jui.css";
	
	@import "./css/demo_table.css";
	
	.button {
		margin-left: 10px;
		text-decoration: none;
		padding: 7px 5px 5px 12px;
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
	
	.button:active {
		background: #cde5ef;
		border-color: #9eb9c2 #b3c0c8 #b4ccce;
		-webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
		box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
	}
	</style>
	
	<link rel="stylesheet" href="css/styleQueryForm.css">


	<script src="./js/jquery.dataTables.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			 *  Simple image gallery. Uses default settings
			 */

			$('.fancybox').fancybox();


			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});

		});
	</script>
	
	<script>
		$(function() {
			$("#example").dataTable({
				"bJQueryUI" : true,
				"sPaginationType" : "full_numbers"
	
			});
	
		});
	
		function getSerialNumber(modify) {
			var siblings = modify.parentNode.parentNode;
			var tds = siblings.getElementsByTagName("td");
			var sno;
			for (var i = 0; i < tds.length; i++) {
				link = tds[i];
				if (link.getAttribute("id") == "SNo")
				//alert(link.text);
				//alert(link.innerHTML);
				{
					sno = link.innerHTML;
					console.log(sno);
	
					//$.post("Modify",{sno:link.innerHTML},function(data,status){$('body').replaceWith(data);});
				}
			}
			//var SNo = siblings.getElementById("SNo");
			//alert(SNo);
			//alert(siblings.innerHTML);
			document.location.href = "ModifyCompetency?" + "sno=" + sno;
	
		}
	
		function getsno(sno) {
			alert(sno.innerHTML);
		}
	
		function test(sno) {
			//alert(sno.innerHTML);
			document.location.href = "ModifyCompetency?" + "sno=" + sno.innerHTML;
			//document.location.href="Get_Data_Date";
		}
	
		/*$(document).ready($("#export").click(function()
		{
			document.location.href="View";
		}));*/
	
		/*$(function(){
			$('a').click(function() {
			    var sno = $(this).text();
			    //alert(sno);
			    if(($(this).attr("class"))=='sno')
			    test(sno);
			   });
			});*/
	</script>
</head>


<body>
<%@page import="sat.tool.Mssql_connect,java.sql.ResultSetMetaData, java.sql.ResultSet,java.sql.SQLException"%>

  <section class="container" style="width:930px; margin:10px 10px;" >
    <div class="login" style="width:10000px;min-height:500px;">

	<!-- EDIT: Dhaval -->
		<h1 style="text-align: left;">
			<span>
				<a class=button href='Display'>My Records</a>
	<!-- EDIT: Sourabh Start -->
                <a class=button href="Export?export=<% out.println( request.getAttribute("exportQuery") );  %>" title="Export Results">Export Results</a>
    <!-- EDIT: Sourabh End -->
				<a class=button href='Display?w=1'>All Records</a>
				<a class="fancybox button" href="#inline" title="Advanced Search">Advanced Search</a>
			</span>
		</h1>
		<div id="inline" style="width: 400px; display: none;">
			<p>
			<form method=post action="Display?w=2">
				<table>
					<tr>
						<td>Created By:</td>
						<td><input type="text" name="createdBy" /></td>
					</tr>
					<tr>
						<td>Assignee:</td>
						<td><input type="text" name="assignee" /></td>
					</tr>
					<tr>
						<td>Account Name:</td>
						<td><input type="text" name="accountName" /></td>
					</tr>
					<tr>
						<td>Created Date (YYYY-MM-DD):</td>
						<td><input type="text" name="createdDate" /></td>
					</tr>
					<tr>
						<td>Due Date (YYYY-MM-DD):</td>
						<td><input type="text" name="dueDate" /></td>
					</tr>
				</table>
				<input type=submit value="Submit" />
				<input type=reset value="Reset">
			</form>
			</p>
		</div>

		<h1>Report</h1>
                                
                                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                <thead>
                                <tr>
                                <%
                                	int columnCount = 0, i;
                                	ResultSet rs = null;
                                	ResultSetMetaData metaData = null;
                                	try {
                                		rs = (ResultSet) request.getAttribute("resultset");
                                		metaData = (ResultSetMetaData) request.getAttribute("metaData");

                                		columnCount = metaData.getColumnCount();
                                	} catch (SQLException e) {
                                		e.printStackTrace();
                                	}

                                	out.println("<th>" + application.getInitParameter("SNo") + "</th>");
                                	for (i = 1; i < columnCount+1; i++) {
                                		//system.out.println(metaData.getColumnName(i));
                                		String colname = metaData.getColumnName(i);
                                		//Neel: out.println("Column Name fetched is: "+colname);
                                		/*if(application.getInitParameter(metaData.getColumnName(i))==null)
                                		{
                                			out.println("<th>"+metaData.getColumnName(i)+"</th>");         					
                                		}*/
                                		if (metaData.getColumnName(i).equalsIgnoreCase("SNo"))
                                			continue;
                                		if (metaData.getColumnName(i).equals("PrjctDeclineLineReasons")
                                				|| metaData.getColumnName(i).equals("Remarks"))
                                			out.println("<th style=\"width:200px;\">"
                                					+ metaData.getColumnName(i) + "</th>");
                                		else
                                			out.println("<th>" + (metaData.getColumnName(i)) + "</th>");
                                	}
                                %>
                        		<!--  <th>Operation</th> -->
                                </tr>
                </thead>
                <tbody>
					<%
					ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("temp");
					int sno = 0;
					for (i = 1; i < metaData.getColumnCount() + 1; i++) {
						if (metaData.getColumnName(i).equalsIgnoreCase("SNo")) {
							sno = i - 1;
							System.out.println(sno);
						}
					}
					for (i = 0; i < temp.size(); i++) {
						out.println("<tr class=\"<%= i%2==0?\"even\":\"odd\">");
						int column_count = temp.get(i).size();
						//System.out.println(rs);
						//if(rs.next())
						out.println("<td id=\"" + "SNo" + "\" align=\"center\">"
								+ "<a class=\"sno\" href=\"#\" onclick=\"test(this)\">"
								+ temp.get(i).get(sno) + "</a>" + "</td>");
						for (int j = 0; j < column_count; j++) {
							if (j == sno)
								continue;
					
							if (temp.get(i).get(j) == null)
								out.println("<td id=\"" + metaData.getColumnName(j + 1)
										+ "\" align=\"center\">Incomplete</td>");
							else
								out.println("<td id=\"" + metaData.getColumnName(j + 1)
										+ "\" align=\"center\">" + temp.get(i).get(j)
										+ "</td>");
						}
						//out.println("<td align=\"center\"><button type=\"button\" onclick=\"getSerialNumber(this)\">Modify</button></td></tr>");
					
					}
					%>
                </tbody>
                </table>
                                
                                
    </div>
  </section>

  
</body>
</html>
