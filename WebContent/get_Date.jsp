<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Details</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />

    <script>  
    $(function() {
    	$( "#startDate" ).datepicker();  
    	$( "#endDate" ).datepicker();
    	    	
    });
    function validate()
    {
    	var startDate = document.getElementById("startDate").value;
    	var endDate = document.getElementById("endDate").value;
    }
    
	</script>
</head>
<body>
<%String UName = (String) request.getSession().getAttribute("UName");
if(UName==null)
{
	out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
	return;
} %>
<h3>Select a range to display all the projects started in between:</h3>

<form name="get_Date" method="post" action="Get_Data_Date">
<table>
<tr>
<td>From:</td><td><input type="text" name="startDate" id="startDate"></td>
<tr>
<tr></tr>
<tr>
<td>To:</td><td><input type="text" name="endDate" id="endDate"></td>
</tr>
<tr></tr>
<tr><td></td><td><input type="submit" value="submit"></td></tr>
</table>
</form>

</body>
</html>