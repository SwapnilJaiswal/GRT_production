<%@ taglib uri="http://www.cisco.com/cues/taglib" prefix="cues"%>
<%@ page import="java.util.*" %>
<%@ page import="com.cisco.taglib.ui.CuesSkin" %>
<%@ page import="com.cisco.taglib.ui.Skin" %>
<%@ page import="com.cisco.taglib.ui.CuesUtility" %>
<%
  String pathinfo = application.getAttribute("org.apache.catalina.jsp_classpath").toString();
  pathinfo = pathinfo.replaceAll(";",";<br>");
  Skin skin = CuesSkin.getSkin(session);
  ResourceBundle skinBundle = null;
  try
  {
    skinBundle = ResourceBundle.getBundle("cuesSkins");
  }
  catch(Exception localeErr){}
  String locale = CuesUtility.getBrowserLocale(request, session);
%>

<%	Properties prop = System.getProperties();%>

<html>
  <head>
    <title>CUES Version Info</title>
    <cues:supportfiles tree="false" menu="false"/>
  </head>
  <body>
    <div style="background-color:white;padding:10px;">
      <br/>
      <cues:version/>
      
      <br/><br/>
      
      Application:<br/>
      <div style="border:1px solid;">
      app context=<%=request.getContextPath()%><br/>
      locale=<%=locale%><br/>
      </div>
      <br/><br/>

      Classpath info:<br/>
      <div style="height:100px;overflow:auto;border:1px solid;">
      <%=pathinfo%>
      </div>
      <br/><br/>
      
      Skin info:<br/>
      <div style="border:1px solid;">
      name=<%=skin.getName()%><br/>
      version=<%=skin.getCuesStyleVersion()%><br/>
      CSS=<%=skin.getCuesCSS()%><br/>
      skinbundle=<%=skinBundle%><br/>
      </div>
    </div>
  </body>
</html>

