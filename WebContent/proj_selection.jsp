<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Details</title>
</head>
<body>
<h3>Please select a Project ID:</h3>
<%@page import="java.sql.*"%>
<form name="proj_form" method="post" action="Purge" >
<select name="pid" id="pid">
<%
String user = (String) request.getSession().getAttribute("UName");
if(user==null||user=="")
{
	out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
	return;
}
System.out.println(user);
//String user = (String) session.getAttribute("UName");
Connection conn=null; Statement stmt=null; ResultSet rs = null;
try {
	Class.forName( "com.microsoft.sqlserver.jdbc.SQLServerDriver" );
    conn = DriverManager.getConnection("jdbc:sqlserver://10.105.190.102:1433;databaseName=AT;","ATUser","Cisco@123");
    stmt = conn.createStatement();
    rs = (ResultSet)stmt.executeQuery("select * from at.dbo.ProjectDetails where UpdatedBy like '"+user+"' and status='active'");
    
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	while(rs.next())
	{
	 out.println("<option>"+rs.getInt("PIDNumber")+"</option>");
	}
%>
</select>
<br><br>
<input type="submit" value="submit">
</form>


</body>
</html>