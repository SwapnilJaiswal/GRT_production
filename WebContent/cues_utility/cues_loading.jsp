<%@ taglib uri="http://www.cisco.com/cues/taglib" prefix="cues"%>
<% 
  String version = (String)request.getParameter("version");
  if(version==null) version = "60";
  int nVersion = Integer.parseInt(version);
%>

<html>
  <head>
    <title><cues:localize key="loading"/></title>
    <cues:supportfiles tree="false" menu="false" cssalone="true"/>
  </head>
  <body class="cuesLoadingBody">
    <br/>
    <div style="text-align:center;">
      <% if(nVersion >= 60) { %>
        <img src="../cues_images/ProgressBar_indeterminate.gif"/>
      <% } else { %>
        <img src="../cues_images/progress-loading-animation.gif"/>
      <% } %>
      <br/>
      <span class="cuesLoadingMessage"><cues:localize key="loading"/></span>
      <br/>
    </div>
  </body>
</html>

