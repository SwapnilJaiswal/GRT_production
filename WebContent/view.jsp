<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Projects</title>
	
	<script src="http://code.jquery.com/jquery-1.6.4.js"></script>
	<script src="http://code.jquery.com/ui/1.6.4/jquery-ui.js"></script>


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
	

<!-- Lightbox end -->


<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.8.4.custom.css" />


<style type="text/css" title="currentStyle">
@import "./css/demo_table_jui.css";

@import "./css/demo_table.css";

.button {
margin-left:10px;
text-decoration:none;
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
.button:active
{
background: #cde5ef;
  border-color: #9eb9c2 #b3c0c8 #b4ccce;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);}
</style>

<link rel="stylesheet" href="css/styleQueryForm.css">


<script src="./js/jquery.dataTables.js"></script>

<script>
	$(function() {
		$("#example").dataTable({
			"bJQueryUI" : true,
			"sPaginationType" : "full_numbers",
			"aaSorting" : [ [ 0, "desc" ] ],
			"iDisplayLength" : 50

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
		document.location.href = "Modify?" + "sno=" + sno;

	}

	function getsno(sno) {
		alert(sno.innerHTML);
	}

	function test(sno) {
		//alert();
		document.location.href = "Modify?" + "sno=" + sno.innerHTML;
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
	<%@page
		import="sat.tool.Mssql_connect,java.sql.ResultSetMetaData, java.sql.ResultSet,java.sql.SQLException"%>

	<section class="container" style="width:90%; margin:10px auto;">
	<div class="login" style="width: 10000px; min-height: 500px;">

		<h1 style="text-align: left;">
			<span> 
			<a class=button href='View'>My Records</a> 
			<a class=button href='View?w=1'>All Records</a>
			<a class="fancybox button" href="#inline" title="Advanced Search">Advanced Search</a>
			<!-- EDIT: Sourabh Start -->
			<a class=button href="Get_Data_Date?export=<% out.println( request.getAttribute("exportQuery") );  %>" title="Export Results">Export Results</a>
			<!-- EDIT: Sourabh End -->
			</span>
		</h1>
		<div id="inline" style="width:400px;display: none;">
		<p>
			<form method=post action="View?w=2">
				GSP Manager : 
				  <select name="gspmanager">
				  				<option value="None">
                                    
                                </option>
                                <option value="Himadri Choudhary">
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
                </select>
				<br>
				PID no : 
			    <select name="pidoperator">
                                <option value="=">=</option>
                </select>
                <input type=text name="pid" />
                <br>
                Fiscal : 
			    <select name="fiscaloperator">
                                <option value="=">=</option>
                </select>
                <input type=text name="fiscal" />
                <br>
				<input type=submit value=Submit />
			</form>
		</p>
	</div>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="example" width="100%">
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
						for (i = 1; i < columnCount + 1; i++) {
							//system.out.println(metaData.getColumnName(i));
							/*if(application.getInitParameter(metaData.getColumnName(i))==null)
							{
								out.println("<th>"+metaData.getColumnName(i)+"</th>");         					
							}*/
							if (metaData.getColumnName(i).equalsIgnoreCase("SNo"))
								continue;
							if (metaData.getColumnName(i).equals("PrjctDeclineLineReasons")
									|| metaData.getColumnName(i).equals("Remarks"))
								out.println("<th style=\"width:200px;\">"
										+ application.getInitParameter(metaData
												.getColumnName(i)) + "</th>");
							else
								out.println("<th>"
										+ application.getInitParameter(metaData
												.getColumnName(i)) + "</th>");
						}
					%>
					<!--  <th>Operation</th> -->
				</tr>
			</thead>
			<tbody>


				<%
					ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request
							.getAttribute("temp");
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
