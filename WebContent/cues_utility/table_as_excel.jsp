<%@ page contentType="application/vnd.ms-excel" %>
<% 
  response.addHeader("content-disposition", "attachment;filename=ExportedTable.xls");
%>
<%=request.getParameter("data")%>

