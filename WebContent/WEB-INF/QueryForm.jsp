<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Query Form</title>
  <link rel="stylesheet" href="css/styleQueryForm.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />

    <script>  
    $(function() {
    	$( "#datepicker1" ).datepicker();  
    	$( "#datepicker2" ).datepicker(); 
    	
    	$("#Level1").change(function(evt){
    		
    		 $("#Level2").parent().hide("slow");
    		 $("#Level3").parent().hide("slow");
    		var elem = evt.currentTarget;
    		$.post("./Get_Data", {Skill_Level1: elem.options[elem.selectedIndex].value, Skill_Level1_Ajax: "true"},function(data){
    		 var option_txt='<option value="None">-- Select Skill --</option>"';
    		 var temp=data.split(",");
             for (i=0; i < temp.length -1; i++)
            	 {
            	 option_txt+='<option value="'+temp[i]+'">'+temp[i]+'</option>';            	         	 	
            	 }
           
             $("#Level2").html(option_txt).parent().show("slow");
             
    			
    		});
    		
    	});
    	
    	$("#Level2").change(function(evt){
    		
   		 $("#Level3").parent().hide("slow");
   		var elem2 = evt.currentTarget;
   		var elem1 = $("#Level1")[0];
   		$.post("./Get_Data", {Skill_Level1: elem1.options[elem1.selectedIndex].value, Skill_Level2: elem2.options[elem2.selectedIndex].value, Skill_Level2_Ajax: "true"},function(data){
   		 var option_txt='<option value="None">-- Select Skill --</option>"';
   		 var temp=data.split(",");
            for (i=0; i < temp.length -1; i++)
           	 {
           	 option_txt+='<option value="'+temp[i]+'">'+temp[i]+'</option>';            	         	 	
           	 }
          
            $("#Level3").html(option_txt).parent().show("slow");
            
   			
   		});
   		
   	});
    	
    });  
    </script>
</head>


<body>

  <section class="container">
    <div class="login">
    	<h1>Please Enter Details...</h1>
		
      <form method="post" action="Disp_Report">
    
    <div style="border:solid; border-width:1px; border-color:silver; padding:10px;"> 
    <p>Select Skill Levels:</p> 
    <div >
    <b>Level1:</b>   
	<select id="Level1" name="Level1">
		<option value="None">-- Select Skill --</option>
		<% ArrayList<ArrayList<Object>> temp = (ArrayList<ArrayList<Object>>) request.getAttribute("Skill_Level1"); 	
		for (int i=0; i< temp.size(); i++)
		{
			
			%><option value="<%=temp.get(i).get(0)%>"><%=temp.get(i).get(0)%></option> <%
				
		}
		%>
		

	</select>
	</div> 
	
	<div style="display:none">
	<b>Level2:</b>
	<select id="Level2" name="Level2">
		<option value="None">-- Select Skill --</option>
	</select>
	</div>
	
	<div style="display:none">
	<b>Level3:</b>
	<select id="Level3" name="Level3">
		<option value="None">-- Select Skill --</option>
	</select>
	</div>
     
    </div> 
     
        
   		  <script type="text/javascript">
      $(document).ready(function () {
          $("#jqxdatetimeinput").jqxDateTimeInput({ width: '250px', height: '25px' });
      });
  </script>  
  
   		<p>Project Start Date:</p>
   		</p><input type="text" id="datepicker1" name="ProjectStDate" placeholder="Project Start Date"/></p>
   		
   		<p>Project End Date:</p>
   		</p><input type="text" id="datepicker2" name="ProjectEnDate" placeholder="Project End Date"/></p>
   		  		
   		
        <p class="submit"><input type="submit" name="commit" value="Submit Request"></p>
      </form>
    </div>
  </section>

  
</body>
</html>