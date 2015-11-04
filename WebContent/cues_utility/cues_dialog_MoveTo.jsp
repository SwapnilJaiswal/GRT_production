<%@ taglib uri="http://www.cisco.com/cues/taglib" prefix="cues"%>
<%@page contentType='text/html;charset=UTF-8'%>
<html>
  <head>
    <title><cues:localize key="moveto_moveto"/></title>
    <cues:supportfiles tree="false" menu="false"/>
    <script>
      var errCnt = 0;
      function reply()
      {
        var answer = new Array();
        var dropdown = document.getElementById("direction");
        answer[0] = dropdown.options[dropdown.selectedIndex].value;
        answer[1] = document.getElementById("rownum").value;
        // check if row is valid or not
        var located = cuesDialog.getOpener().icuesLocateRowPosition(cuesDialog.getOpener().cuesMoveToActiveTableId, answer[1]);
        if(located==-1)
        {
          errCnt++;
          cuesSetStatusVisible('errmsg',true);
          if(errCnt==1)
          {
            if(isIE)
            {
              window.dialogHeight = parseInt(window.dialogHeight)+document.getElementById("errmsg").offsetHeight+"px";
            }
            else
            {
              var chrome = parseInt(window.outerHeight) - parseInt(window.innerHeight);
              window.outerHeight = parseInt(window.innerHeight)+document.getElementById("errmsg").offsetHeight+chrome;
            }
          }
        }
        else
        {
          window.returnValue=answer;
          window.close();
        }
      }
      function init()
      {
        // make buttons uniform width
        try
        {
          var b1 = document.getElementById("b1");
          var b2 = document.getElementById("b2");
          var w = Math.max(b1.offsetWidth, b2.offsetWidth);
          b1.style.width = w;
          b2.style.width = w;
        }catch(e){}
      }
    </script>
  </head>
  <body style="background-color:#dbdbdb;" onload="init()">
    <div style="padding:8px;">
      <br/>
      <cues:status level="critical" id="errmsg" visible="false">
        <cues:localize key="msgReorderError"/>
      </cues:status>
      <br/>
      <div style="text-align:center;">
        <cues:localize key="moveto_move"/>:
        <select id="direction">
          <option value="above"><cues:localize key="moveto_above"/></option>
          <option value="below"><cues:localize key="moveto_below"/></option>
        </select>
        <cues:localize key="moveto_rownum"/>:
        <input type="text" size="3" id="rownum"/>
        <br/>
        <br/>
        <br/>
      </div>
      <div style="text-align:right;">
        <button id="b1" class="cuesButton" type="button" onclick="reply()"><cues:localize key="ok"/></button>
        &nbsp;
        <button id="b2" class="cuesButton" type="button" onclick="window.returnValue='null';window.close()"><cues:localize key="cancel"/></button>
      </div>
    </div>
  </body>
</html>

