package sat.tool.competency;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import sat.tool.Mssql_connect;
import sat.tool.PropertiesReader;

/**
 * Servlet implementation class ModifyCompetency
 */
@WebServlet("/ModifyCompetency")
public class ModifyCompetency extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**Added to read DB details from properties file*/
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
    /****/  
public String AllowedToEdit = "false";
	public ModifyCompetency() {
        super();


        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
		String UName = (String) session.getAttribute("UName");
		PrintWriter out = response.getWriter();
		if(UName == null)
		{
			UName="cisco";
		}
		String SNo = request.getParameter("sno");
		Mssql_connect sql_conn = null;
		Mssql_connect sql_conn1 = null;
		
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
			//sql_conn = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			Statement s	= sql_conn.conn.createStatement();
			ResultSet rs = s.executeQuery("select * from at.dbo.ProjectDetails_Competency2 where SNo='"+SNo+"'");
			JSONObject js_obj = convert(rs,UName);
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);
			System.out.println("JSON");
			System.out.println(js_obj);	
			
			
			request.setAttribute("js_obj", js_obj.toString());
			request.setAttribute("js_obj_json", js_obj);
			
			//get all NP PIDs from existing_harware table if it's already not present in session
			if(session!=null && session.getAttribute("HardwarePids")==null) {
		         String pidsQry = "select PID from at.dbo.existing_hardware";
		         ResultSet rsPids = sql_conn.stmt.executeQuery(pidsQry);
		         ArrayList<String> arrPids = new ArrayList<String>();
		         while(rsPids.next()){
		        	 arrPids.add(rsPids.getString("PID"));
		         }
		         session.setAttribute("HardwarePids", arrPids);
			}
			sql_conn.conn.close();
			//sql_conn1 = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
			sql_conn1=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			Statement s1	= sql_conn1.conn.createStatement();
			ResultSet rs1 = s1.executeQuery("select CECID from at.dbo.SuperAdminCompetency ");
			ResultSetMetaData rsmd = rs1.getMetaData();
			
			if(rs1.next()) {
		      int numColumns = rsmd.getColumnCount();
		        for (int i=1; i<numColumns+1; i++) 
				{
					String column_name = rsmd.getColumnName(i);
					if(column_name.equalsIgnoreCase("CECID"))
					{
						if(UName.equalsIgnoreCase(rs1.getString("CECID"))||AllowedToEdit.equalsIgnoreCase("true")){
							System.out.println("Made true becasue this user is super admin");
							AllowedToEdit="true";
							break;
						}
						else{
							
				        		AllowedToEdit="false";
				        		
				        	}
						
					}
					
				}
				
				}
			sql_conn1.conn.close();
			
			if(AllowedToEdit.equalsIgnoreCase("true")){
				System.out.println("Allowed to edit is true");
				AllowedToEdit="false";
			RequestDispatcher rd = request.getRequestDispatcher("competency/ReadOnly.jsp");
			rd.forward(request,response);
			}
			else{
				System.out.println("Allowed to edit is false");
				AllowedToEdit="false";
				RequestDispatcher rd = request.getRequestDispatcher("competency/ReadOnly2.jsp");
				rd.forward(request,response);
			}	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	

		public  JSONObject convert(ResultSet rs,String UName)
			    throws SQLException
			  {
			    JSONArray json = new JSONArray();
			    ResultSetMetaData rsmd = rs.getMetaData();
			    JSONObject obj = new JSONObject();
			    System.out.println("I am inside this fucna;skdsad");
			    if(rs.next()) {
			      int numColumns = rsmd.getColumnCount();
			        for (int i=1; i<numColumns+1; i++) {
			        String column_name = rsmd.getColumnName(i);
			        if(column_name.equalsIgnoreCase("SNo")){
						obj.put("SNo",rs.getString("SNo"));
						}
			        if(column_name.equalsIgnoreCase("Assignee")){
			        	if(UName.equalsIgnoreCase(rs.getString("Assignee"))||AllowedToEdit.equalsIgnoreCase("true")){
			        		
			        		System.out.println("made true caouse this user is assignee"+UName+"Allowed to edit current value is "+AllowedToEdit+" Assignee value is "+rs.getString("Assignee"));
			        		AllowedToEdit="true";
			        	}
			        	else{
			        		AllowedToEdit="false";
			        		
			        	}
			        	
			        	obj.put("Assignee", rs.getString("Assignee"));
			        }
			        if(column_name.equalsIgnoreCase("CreatedBy")){
			        	if(UName.equalsIgnoreCase(rs.getString("CreatedBy"))||AllowedToEdit.equalsIgnoreCase("true")){
			        		System.out.println("made true as this user is creator");
			        		AllowedToEdit="true";
			        	}
			        	else{
			        		AllowedToEdit="false";
			        		
			        	}
			        	//obj.put("Assignee", rs.getString("CreatedBy"));
			        }
			     				if(column_name.equalsIgnoreCase("DeliverableClassification"))
											{
											String DC = rs.getString(column_name);
											if(DC.equalsIgnoreCase("SORA")){
												obj.put("DeliverableClassification", "SORA");
												//obj.put("SORADeliverableName",rs.getString("DeliverableName"));
												obj.put("SoraDescription", rs.getString("Description").replace("'","&#39;"));
												String existingHwOld = rs.getString("ExistingHardware");
												
												if(existingHwOld != null){
													obj.put("ExistingHardwareinfo",rs.getString("ExistingHardware").replace("'","&#39;"));
												}
												else if(existingHwOld == null){
													String existingHwNew = rs.getString("ExistingHardwarePid");
													final JSONArray arr = new JSONArray();
													String[] result = existingHwNew.split("\\,");													
													//String bugsev = "";
													for(int idx = 0 ; idx< result.length ; idx++) {
													    //bugsev = result[idx];	    
													    arr.add(result[idx]);
													}
													obj.put("ExistingHardwareinfo",arr);
													obj.put("ExistingHardwareNew","Y");
												}											
												
												
												obj.put("ExistingFeatureProtocolinfo", rs.getString("ExistingProtocol").replace("'","&#39;"));
												obj.put("FutureHardwareinfo",rs.getString("FutureHardware").replace("'","&#39;"));
												obj.put("FutureFeatureProtocolinfo", rs.getString("FutureProtocol").replace("'","&#39;"));
												obj.put("SORANPTrack",rs.getString("NPTrack").replace("'","&#39;"));
												continue;
											}
											else if (DC.equalsIgnoreCase("NP/NPA/NHF")){
												//NPAScheduledDate,Deliverable Name,Description,NPTrack,ScheduledDate,NPADeliverableName
												obj.put("DeliverableClassification", "NP/NPA/NHF");
												obj.put("NPADescription", rs.getString("Description").replace("'","&#39;"));
												obj.put("NPANPTrack",rs.getString("NPTrack").replace("'","&#39;"));
												//obj.put("NPADeliverableName",rs.getString("DeliverableName"));
												Date date = rs.getDate("ScheduledDate");
												String sDate = null;
												if(date!=null)
												{
													sDate = date.toString();
													String[] tokens = sDate.split("-");
													sDate = tokens[1]+"/"+tokens[2]+"/"+tokens[0];
												}
												else
												sDate = "";
												
												obj.put("NPAScheduledDate",sDate);
												
												continue;
											}
											
											else if (DC.equalsIgnoreCase("Cisco Network Assessment")){
												//NPAScheduledDate,Deliverable Name,Description,NPTrack,ScheduledDate,NPADeliverableName,Div7DeliverableName
												obj.put("DeliverableClassification", "Cisco Network Assessment");
												obj.put("CNADescription", rs.getString("Description").replace("'","&#39;"));
												
												Date date = rs.getDate("ScheduledDate");
												String sDate = null;
												if(date!=null)
												{
													sDate = date.toString();
													String[] tokens = sDate.split("-");
													sDate = tokens[1]+"/"+tokens[2]+"/"+tokens[0];
												}
												else
												sDate = "";
												
												obj.put("CNAScheduledDate",sDate);
												
												continue;
											}
											else if (DC.equalsIgnoreCase("Deployment Services")){
												//NPAScheduledDate,Deliverable Name,Description,NPTrack,ScheduledDate,NPADeliverableName
												obj.put("DeliverableClassification", "Deployment Services");
												obj.put("Div7Description", rs.getString("Description").replace("'","&#39;"));
												//obj.put("Div7DeliverableName",rs.getString("DeliverableName"));
												obj.put("Div7Hardware",rs.getString("Hardware").replace("'","&#39;"));
												obj.put("Div7Protocol", rs.getString("Protocol").replace("'","&#39;"));
												obj.put("Div7Onsite",rs.getString("Onsite"));
												String Os = rs.getString("Onsite");
												if(!Os.equalsIgnoreCase("No"))
												{
												obj.put("Div7Country",rs.getString("Country").replace("'","&#39;"));}
												else{
												obj.put("Div7Country","No Onsite Required");
												}
												Date date = rs.getDate("ScheduledDate");
												String sDate = null;
												if(date!=null)
												{
													sDate = date.toString();
													String[] tokens = sDate.split("-");
													sDate = tokens[1]+"/"+tokens[2]+"/"+tokens[0];
												}
												else
												sDate = "";
												
												obj.put("Div7ScheduledDate",sDate);
												
												continue;
											}
											else if (DC.equalsIgnoreCase("Design Services")){
												//NPAScheduledDate,Deliverable Name,Description,NPTrack,ScheduledDate,NPADeliverableName
												obj.put("DeliverableClassification", "Design Services");
												obj.put("Div8Description", rs.getString("Description").replace("'","&#39;"));
												//obj.put("Div8DeliverableName",rs.getString("DeliverableName"));
												obj.put("Div8Hardware",rs.getString("Hardware").replace("'","&#39;"));
												obj.put("Div8Protocol", rs.getString("Protocol").replace("'","&#39;"));
												obj.put("Div8Onsite",rs.getString("Onsite"));
												String Os = rs.getString("Onsite");
												if(!Os.equalsIgnoreCase("No")){
												obj.put("Div8Country",rs.getString("Country").replace("'","&#39;"));}
												else{
												obj.put("Div8Country","No Onsite Required");
												}
												Date date = rs.getDate("ScheduledDate");
												String sDate = null;
												if(date!=null)
												{
													sDate = date.toString();
													String[] tokens = sDate.split("-");
													sDate = tokens[1]+"/"+tokens[2]+"/"+tokens[0];
												}
												else
												sDate = "";
												
												obj.put("Div8ScheduledDate",sDate);
												
												continue;
											}
											else if (DC.equalsIgnoreCase("Other Deliverables")){
												obj.put("DeliverableClassification", "Other Deliverables");
												obj.put("Div6Description", rs.getString("Description").replace("'","&#39;"));
												//obj.put("Div6DeliverableName",rs.getString("DeliverableName"));
												continue;
											}
									}

		        if(rsmd.getColumnType(i)==java.sql.Types.ARRAY){
		         obj.put(column_name, rs.getArray(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.BIGINT){
		         obj.put(column_name, rs.getInt(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.BOOLEAN){
		         obj.put(column_name, rs.getBoolean(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.BLOB){
		         obj.put(column_name, rs.getBlob(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.DOUBLE){
		         obj.put(column_name, rs.getDouble(column_name)); 
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.FLOAT){
		         obj.put(column_name, rs.getFloat(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.INTEGER){
		         obj.put(column_name, rs.getInt(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.NVARCHAR){
		        	if("ExistingHardwarePid".equalsIgnoreCase(column_name)){
		        		System.out.println("ExistingHardwarePidExistingHardwarePidExistingHardwarePidExistingHardwarePid");
		        	}
		        	if(!"ExistingHardwarePid".equalsIgnoreCase(column_name)){		        			        	
			        	if(rs.getNString(column_name)!=null){
			        		obj.put(column_name, rs.getNString(column_name).replace("'","&#39;"));
			        	}
			        	else{
			        		 obj.put(column_name, rs.getNString(column_name));
			        	}
		           }
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
		        	if("ExistingHardwarePid".equalsIgnoreCase(column_name)){
		        		System.out.println("ExistingHardwarePidExistingHardwarePidExistingHardwarePidExistingHardwarePid");
		        	}
		        	if(rs.getString(column_name)!=null){
		         obj.put(column_name, rs.getString(column_name).replace("'","&#39;"));
		        }
		        	else{
		        		obj.put(column_name, rs.getString(column_name));
		        	}
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.TINYINT){
		         obj.put(column_name, rs.getInt(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.SMALLINT){
		         obj.put(column_name, rs.getInt(column_name));
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.DATE){
		        	Date date = rs.getDate(column_name);
		        	String sDate = null;
		        	if(date!=null)
		        	{
		        		sDate = date.toString();
		        		String[] tokens = sDate.split("-");
		        		sDate = tokens[1]+"/"+tokens[2]+"/"+tokens[0];
		        	}
		        	else
		        	sDate = "";
		        	obj.put(column_name, sDate);
		         
		        }
		        else if(rsmd.getColumnType(i)==java.sql.Types.TIMESTAMP){
		        	String sDateTime = null;
		        	if(rs.getTimestamp(column_name)!=null)
		        		sDateTime = rs.getTimestamp(column_name).toString();
		        	String tokens[]=null, tokens1[]=null;
		        	if(sDateTime!=null)
		        	{
		        		tokens = sDateTime.split(" ");
		        		if(column_name.equalsIgnoreCase("RequestRecvDate"))
		        		{
		        			tokens1 = tokens[0].split("-");
		        			obj.put(column_name, tokens1[1]+"/"+tokens1[2]+"/"+tokens1[0]);
		        			tokens1 = tokens[1].split(":");
		        			obj.put("RequestRecvTime", tokens1[0]+":"+tokens1[1]);
		        		}
		        		if(column_name.equalsIgnoreCase("FulfilmentDate"))
		        		{
		        			tokens1 = tokens[0].split("-");
		        			obj.put(column_name, tokens1[1]+"/"+tokens1[2]+"/"+tokens1[0]);
		        			tokens1 = tokens[1].split(":");
		        			obj.put("FulfilTime", tokens1[0]+":"+tokens1[1]);
		        		}
		        	}
		        	else
		        	{
		        		if(column_name.equalsIgnoreCase("RequestRecvDate"))
		        		{
		        			obj.put(column_name,"");
		        			obj.put("RequestRecvTime", "");
		        		}
		        		if(column_name.equalsIgnoreCase("FulfilmentDate"))
		        		{
		        			obj.put(column_name,"");
		        			obj.put("FulfilTime", "");
		        		}
		        	}
		        }
		        else{
		         obj.put(column_name, rs.getObject(column_name));
		        }
		      }
		      //System.out.println(obj);
		      //json.add(obj);
		    }

		    	return obj;
		  }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
