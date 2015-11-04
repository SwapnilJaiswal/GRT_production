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
  <link rel="stylesheet" href="./css/smoothness/jquery-ui-1.8.4.custom.css" />
  
   
     
<style type="text/css" title="currentStyle">
                                                @import "./css/demo_table_jui.css";
                                                @import "./css/demo_table.css";                                            

</style> 
  
<link rel="stylesheet" href="css/styleQueryForm.css">


    <script src="./js/jquery.dataTables.js"></script>

    <script>  
    $(function() {
                $("#example").dataTable({
                                "bJQueryUI": true,
                                "sPaginationType": "full_numbers"
                });
                
    });
    
    function getSerialNumber(modify)
    {
    	var siblings = modify.parentNode.parentNode;
    	var tds = siblings.getElementsByTagName("td");
    	var sno;
    	for(var i=0;i<tds.length;i++)
    		{
    			link = tds[i];
    			if(link.getAttribute("id")=="SNo")
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
    	document.location.href="ModifyCompetency?"+"sno="+sno;
    	
    }
    
    function getsno(sno)
    {
    	alert(sno.innerHTML);
    }
    
    function test(sno)
    {
    	//alert(sno.innerHTML);
    	document.location.href="ModifyCompetency?"+"sno="+sno.innerHTML;
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

  <section class="container" style="width:930px; margin:10px auto;" >
    <div class="login" style="width:10000px;min-height:500px;">
    			
                <h1>Report</h1>
                                
                                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                <thead>
                                <tr>
                                
                        		
                                </tr>
                </thead>
                <tbody>
                                <% 
                                int columnCount=0,i;
                                ResultSet rs = null;
                                ResultSetMetaData  metaData = null;
                                try {
                                	rs = (ResultSet) request.getAttribute("resultset");                                	                               	
                                	metaData = (ResultSetMetaData) request.getAttribute("metaData");                                	
                                	ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("temp");
                                	columnCount = metaData.getColumnCount();
                        			}
                        			catch(SQLException e)
                        			{
                        				e.printStackTrace();
                        			}
                                
                               		//out.println("<th>"+application.getInitParameter("SNo")+"</th>");
                        			for(i=1;i<columnCount;i++)
                        			{
                        				//system.out.println(metaData.getColumnName(i));
                        				String colname = metaData.getColumnName(i);
                        				//Neel: out.println("Column Name fetched is: "+colname);
                        				/*if(application.getInitParameter(metaData.getColumnName(i))==null)
                        				{
                        					out.println("<th>"+metaData.getColumnName(i)+"</th>");         					
                        				}*/
                        				if(metaData.getColumnName(i).equalsIgnoreCase("SNo")) continue;
                        				if(metaData.getColumnName(i).equals("PrjctDeclineLineReasons") || metaData.getColumnName(i).equals("Remarks"))
                        					out.println("<th style=\"width:200px;\">"+metaData.getColumnName(i)+"</th>");
                        				else
                        				out.println("<th>"+(metaData.getColumnName(i))+"</th>");
                        			}
                        		%>
                
                
                
                
                
                
                
                                <%
                                ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("temp");
                                System.out.println("\n\nTEMP: "+temp.toString());
                                int sno=0;
                                for(i=1;i<metaData.getColumnCount()+1;i++)
                                {
                                	if(metaData.getColumnName(i).equalsIgnoreCase("SNo"))
                                	{
                                		sno = i-1;
                                		System.out.println(sno);
                                	}
                                }
                                for (i=0; i< temp.size(); i++)
                                {
                                	out.println("<tr class=\"<%= i%2==0?\"even\":\"odd\">");
                                	int column_count=temp.get(i).size();
                                	//System.out.println(rs);
                                	//if(rs.next())
                                	out.println("<td id=\""+"SNo"+"\" align=\"center\">"+"<a class=\"sno\" href=\"#\" onclick=\"test(this)\">"+temp.get(i).get(sno)+"</a>"+"</td>");                                				
                                                for (int j=0; j < column_count-1;j++)
                                                {
                                                	if(j==sno) continue;
                                                
                                                  if(temp.get(i).get(j) == null)
                                                	  out.println("<td id=\""+metaData.getColumnName(j+1)+"\" align=\"center\">Incomplete</td>");
                                                 else
                                                	  out.println("<td id=\""+metaData.getColumnName(j+1)+"\" align=\"center\">"+temp.get(i).get(j)+"</td>");
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
