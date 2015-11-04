<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<%@ page contentType="application/vnd.ms-excel" %>
<% 
  response.addHeader("content-disposition", "attachment;filename=ExportedTable.xls");
%>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Worksheet ss:Name="ExportedTable">
   <%=request.getParameter("data")%>
 </Worksheet>
</Workbook>

