<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Query Form</title>

    <script src="http://code.jquery.com/jquery-1.6.4.js"></script>
    <script src="http://code.jquery.com/ui/1.6.4/jquery-ui.js"></script>
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
    
    </script>
</head>


<body>

  <section class="container" style="width:930px; margin:10px auto;" >
    <div class="login" style="width:800px;min-height:500px;">
    	<h1>Report</h1>
		
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
	<thead>
		<tr>
			<th>User ID</th>
			<th>Manager ID</th>
			<th>Skill Name</th>
			<th>Skill Value</th>
			<th>Skill Hier</th>
		</tr>
	</thead>
	<tbody>
		
	
		<% ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("temp"); 	
		for (int i=0; i< temp.size(); i++){%>
		<tr class="<%= i%2==0?"even":"odd" %>">
		<%	int column_count=temp.get(i).size();
			for (int j=0; j < column_count;j++ ){				
				%><td><%=temp.get(i).get(j) %></td><%
		  	}
			%></tr><%
		}
		%>
	</tbody>
	<tfoot>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			<th>Platform(s)</th>
			<th>Engine version</th>
			<th>CSS grade</th>
		</tr>
	</tfoot>
</table>
		
		
    </div>
  </section>

  
</body>
</html>