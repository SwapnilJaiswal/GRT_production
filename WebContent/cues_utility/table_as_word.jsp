<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<%@ page contentType="application/ms-word" %>
<% 
  response.addHeader("content-disposition", "attachment;filename=ExportedTable.doc");
%>
<w:wordDocument xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml" xml:space="preserve">
<w:body>
<w:tbl>
<w:tblPr>
<w:tblStyle w:val="TableGrid"/>
<w:tblW w:w="5000" w:type="pct"/>
</w:tblPr>
<%=request.getParameter("data")%>
</w:tbl>
</w:body>
</w:wordDocument>

