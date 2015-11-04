package sat.tool.competency;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import sat.tool.Mssql_connect;
import sat.tool.PropertiesReader;

/**
 * Servlet implementation class ModifyEntry
 */
@WebServlet("/ModifyEntry")
@MultipartConfig
public class ModifyEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**Added to read DB details from properties file*/
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
    /****/  
	private final static Logger LOGGER = 
            Logger.getLogger(FileUploadServlet.class.getCanonicalName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	//Some useless function (do not remove):
    public ModifyEntry() {
        super();


        // TODO Auto-generated constructor stub
    }
    //Fetch UName, Check session expiration, fetch info from DB and send JSON to Modify.jsp : 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//out.println("Working :)");
		String UName = (String) request.getSession().getAttribute("UName");
		//PrintWriter out = response.getWriter();
		if(UName == null)
		{
			out.println("<h3>Your Session has been expired. Please Login to the Portal<h3>");
			return;
		}
		String SNo = request.getParameter("sno");
		
		Mssql_connect sql_conn = null;
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			System.out.println("props"+props);
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
			//sql_conn = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			Statement s	= sql_conn.conn.createStatement();
			ResultSet rs = s.executeQuery("select * from at.dbo.ProjectDetails_Competency3 where SNo='"+SNo+"'");
			JSONObject js_obj = convert(rs,UName);
				
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);
			System.out.println("JSON");
			System.out.println(js_obj);				
			sql_conn.conn.close();
			request.setAttribute("js_obj", js_obj.toString());
			RequestDispatcher rd = request.getRequestDispatcher("competency/Modify.jsp");
			rd.forward(request,response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String SNo = (String) request.getParameter("SNo1");
		System.out.println("TEST TEST @ "+SNo);*/
		
		System.out.println("XXXXXXXXXXXXXXXXXX\nTo out-put All the request parameters received from request - \n");

		Enumeration enParams = request.getParameterNames(); 
		while(enParams.hasMoreElements()){
		 String paramName = (String)enParams.nextElement();
		 System.out.println("Attribute Name - "+paramName+", Value - "+request.getParameter(paramName));
		}
		System.out.println("XXXXXXXXXXXXXXXXXX\n");

		
		HttpSession session = (HttpSession) request.getSession(false);
		String UName = (String) request.getSession().getAttribute("UName");
		if(UName==null)
		{
			PrintWriter out = response.getWriter();
			out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
			return;
		}
		
			try {
				insert(request,response,session);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	public void insert(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException, MessagingException
	{
		System.out.println("\nIn INsert fn():of ModifyEntry.java!!");
		int LatestVersion = 0;
		String CreatedBy = null;
		//int sno = sno);
		int sno = Integer.parseInt(request.getParameter("SNo1"));
		
		String IdentityInsertQueryON = "SET IDENTITY_INSERT at.dbo.ProjectDetails_Competency3 ON";
		String IdentityInsertQueryOFF = "SET IDENTITY_INSERT at.dbo.ProjectDetails_Competency3 OFF";
		//-------------------------------------------------------------------------------------------------------------------------------
		//-------------------------------------------- FETCHING LAST VERSION DETAILS AND VERSION ZERO DETAILS --------------------------------------
		//........................................................................................................................................
		
		
		Mssql_connect sql_conn1 = null;
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
			//sql_conn1 = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
			sql_conn1=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			
			try {
				sql_conn1.stmt.execute(IdentityInsertQueryON);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			session = (HttpSession) request.getSession(false);
			String UpdatedBy = (String) session.getAttribute("UName");
			
			//Fetching createdBy:
			//System.out.println("TEST TEST TEST "+request.getParameter("SNo"));
			//int sno1=sno+1;
			System.out.println("TEST TEST TEST: select UpdatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
			ResultSet rsVer0 = sql_conn1.stmt.executeQuery("select UpdatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
			if(rsVer0.next()){
			CreatedBy = rsVer0.getString("UpdatedBy");
			System.out.println("\nFetching Ver0 details: Createdy: "+CreatedBy);
			}
			
			
			//Fetching Latest Version details:
			ResultSet rsVerLatest = sql_conn1.stmt.executeQuery("select top 1 * from at.dbo.ProjectDetails_Competency3 where SNo ="+sno+" order by version desc");
			if(rsVerLatest.next())
				LatestVersion = rsVerLatest.getInt("Version");
			System.out.println("The Latest Version is: "+LatestVersion);
			
			/*		
			ArrayList<ArrayList<Object>> temp = sql_conn1.Results2Array(rsVerLatest);
			ResultSetMetaData metaData = rsVerLatest.getMetaData();
						
			for(int i=1;i<metaData.getColumnCount()+1;i++)
				//System.out.print(metaData.getColumnName(i)+"\t");
			request.setAttribute("metaData", metaData);
			request.setAttribute("resultset",rsVerLatest);
			
			*/
			try {
				sql_conn1.stmt.execute(IdentityInsertQueryOFF);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			sql_conn1.conn.close();
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		//........................................................................................................................................
		//-------------------------------------------- END OF FETCHING LAST VERSION DETAILS AND VERSION ZERO DETAILS ----------------------------------
		//-------------------------------------------------------------------------------------------------------------------------------
		
		
		
		//-----------------------------------------------------------------------------------------------------------
		//-------------------NEW VALUES TO INSERT INTO AUDIT DB:--------------------------------------------------------------------
		//..............................................................................................................
		Mssql_connect sql_conn = null;
		
		
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
	//	sql_conn = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
		sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);

		String createdBy=null;
		ResultSet rsCreatedBy = sql_conn.stmt.executeQuery("select CreatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
		System.out.println("Shikha  "+"select CreatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
		while(rsCreatedBy.next()){
			createdBy=rsCreatedBy.getString(1);
			
		}
		System.out.println("Shikha createdBy "+createdBy);
		try {
			sql_conn.stmt.execute(IdentityInsertQueryON);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ResultSet rs = sql_conn.stmt.executeQuery("select * from at.dbo.ProjectDetails_Competency3");// NEEL: Very slow.
		
	
	
		//For future: SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('at.dbo.ProjectDetails_Competency3')
		ResultSetMetaData metaData = rs.getMetaData();
		int columnCount = metaData.getColumnCount();
		ArrayList<String> columns = new ArrayList<String>();
		String ColumnsForQuery = new String();
		String sql = new String();
		String query = new String();
		String columnName = null;
		String temp_date = null;
		String time = null;
		session = (HttpSession) request.getSession(false);
		String UpdatedBy = (String) session.getAttribute("UName");
		String[] tokens = null;
		String ToAssignee = null;
		String Pid = null;
		String Description = null;
		String DeliverableName =null;
		String Protocol = null;
		String Hardware = null;
		String DeliverableClassification = null;
		String NPTrack = null;
		String ScheduledDate = null;
		String Country = null;
		String GSPCompetency = null; 
		String AccountName =   null;
		String platform = null;
		String NOSOEManager = null;
		String RequestedBy = request.getParameter("RequestedBy");
		String mailer = request.getParameter("mailer");
		
		//Check wether existing hardware field is listbox or text area.... for listbox:	existingHwNew=Y			
		String existingHwNew = request.getParameter("existingHwNew");
		System.out.println("ModifyEntry comp3:::"+existingHwNew);
		
		for(int i=1;i<columnCount+1;i++)
		{
			
			System.out.println("testing");
			columnName = metaData.getColumnName(i);
			columns.add(columnName);
			if(columnName.equalsIgnoreCase("attachments")||columnName.equalsIgnoreCase("Onsite")||columnName.equalsIgnoreCase("Country")||columnName.equals("BugSeverity")||columnName.equalsIgnoreCase("Description")||columnName.equalsIgnoreCase("ExistingProtocol")||columnName.equalsIgnoreCase("FutureProtocol")||columnName.equalsIgnoreCase("Protocol")||columnName.equalsIgnoreCase("Hardware")||columnName.equalsIgnoreCase("ExistingHardware")||columnName.equalsIgnoreCase("FutureHardware")||columnName.equalsIgnoreCase("DeliverableName")||columnName.equalsIgnoreCase("NPTrack")||columnName.equalsIgnoreCase("ScheduledDate")){
				continue;
			}
			if(columnName.equalsIgnoreCase("SNo")){
				System.out.println("SNo in Modify JAVA Insert fn():"+sno);
				sql+=sno+",";
				ColumnsForQuery+="SNo,";
				continue;
			}
			
			if(columnName.equalsIgnoreCase("Version")){
				int Version = LatestVersion+1;
				System.out.println("Version in Modify JAVA Insert fn():"+Version);
				sql+=","+Version+",";
				ColumnsForQuery+=",Version,";
				continue;
			}
			if(columnName!=null && columnName.equalsIgnoreCase("NOSOEManager"))
			{
				String temp = request.getParameter("NOSOEManager");
				if(temp == null || temp == ""){
					sql+="'',";
				}else{
					sql+="'"+temp+"',";
				}
				
				ColumnsForQuery+="NOSOEManager,";
				continue;
			}
			if(columnName!=null && columnName.equalsIgnoreCase("platform"))
			{
				String platformValue = request.getParameter("platform");
  				String delClassification = request.getParameter("DeliverableClassification");
  				
  				if(!delClassification.equalsIgnoreCase("SORA") || "".equals(existingHwNew)){
  					if(platformValue == null || platformValue == ""){
  						sql+="''";
  					}else{
  						sql+="'"+platformValue+"'";
  					}
  					ColumnsForQuery+= columnName;
  				}
  				else if(delClassification.equalsIgnoreCase("SORA") && (existingHwNew != null && "Y".equalsIgnoreCase(existingHwNew))){
  					if(platformValue == null || platformValue == ""){
  						sql+="'',";
  					}else{
  						sql+="'"+platformValue+"',";
  					}
  					ColumnsForQuery+= columnName+",";
  				}
				/*System.out.println("hardware in NewEntry.java Insert fn(): "+platformValue);
				if(platformValue == null || platformValue == ""){
					sql+="'',";
				}else{
					sql+="'"+request.getParameter("platform")+"',";
				}
				ColumnsForQuery+= columnName+",";*/
				continue;
			}
			
			String deliveryClass = request.getParameter("DeliverableClassification");
			
			if(deliveryClass.equalsIgnoreCase("SORA") && (existingHwNew !=null && "Y".equalsIgnoreCase(existingHwNew)) && columnName.equalsIgnoreCase("ExistingHardwarePid")){
				String[] hwPids = request.getParameterValues("ExistingHardwareinfo");
				StringBuffer ret = new StringBuffer("");
		        for (int idx = 0; hwPids != null && idx < hwPids.length; idx++) {
		            ret.append(hwPids[idx]);
		            if (idx < hwPids.length - 1) {
		                ret.append(',');
		            }
		        }
		        String hwPidsSelected = ret.toString();
		        sql+="'"+hwPidsSelected+"',";
		        ColumnsForQuery+="ExistingHardwarePid,";
		        
		      continue;
			}
			
			if(columnName!=null && columnName.equalsIgnoreCase("UpdatedBy"))
			{
				System.out.println("Uby in ModifyEntry.java Modify JAVA Insert fn():"+UpdatedBy);
				sql+="'"+UpdatedBy+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			
			if(columnName!=null && columnName.equalsIgnoreCase("CreatedBy"))
			{
				System.out.println("CreatedBy in ModifyEntry.java Modify JAVA Insert fn():"+createdBy);
				sql+="'"+createdBy+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			
			
			
			if(columnName.equalsIgnoreCase("Team")){
			GSPCompetency = request.getParameter("Team");
			sql+="'"+GSPCompetency+"',";
			ColumnsForQuery+="Team,";
			continue;
			}

			if(columnName.equalsIgnoreCase("AccountName")){
			AccountName = request.getParameter("AccountName");
			sql+="'"+AccountName+"',";
			ColumnsForQuery+="AccountName,";
			continue;
			}
			
			if(columnName.equalsIgnoreCase("Timestamp")){
				java.util.Calendar cal = java.util.Calendar.getInstance();
				Timestamp Timestamp =  new java.sql.Timestamp(cal.getTimeInMillis());
				System.out.println("Timestamp in Modify JAVA Insert fn():"+Timestamp.toString());
				sql+="'"+Timestamp+"'";
				ColumnsForQuery+="Timestamp";
				continue;
				}


			if(columnName.equalsIgnoreCase("DeliverableClassification")){
				DeliverableClassification = request.getParameter("DeliverableClassification");
				
				if(DeliverableClassification.equalsIgnoreCase("SORA")){
					
					Description = request.getParameter("SoraDescription").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
					
					/*Hardware = request.getParameter("ExistingHardwareinfo").replace("'", "''");
					sql+="'"+Hardware+"',";
					ColumnsForQuery+="ExistingHardware,";*/
					
					if(existingHwNew == null || "".equals(existingHwNew)){
  						Hardware = request.getParameter("ExistingHardwareinfo").replace("'", "''");
	  					sql+="'"+Hardware+"',";
	  					ColumnsForQuery+="ExistingHardware,";
  					}
					
					String Hardware1 = request.getParameter("FutureHardwareinfo").replace("'", "''");
					sql+="'"+Hardware1+"',";
					ColumnsForQuery+="FutureHardware,";
					Protocol = request.getParameter("ExistingFeatureProtocolinfo").replace("'", "''");
					sql+="'"+Protocol+"',";
					ColumnsForQuery+="ExistingProtocol,";
					String Protocol1 = request.getParameter("FutureFeatureProtocolinfo").replace("'", "''");
					sql+="'"+Protocol1+"',";
					ColumnsForQuery+="FutureProtocol,";
					NPTrack = request.getParameter("SORANPTrack").replace("'", "''");
					sql+="'"+NPTrack+"',";
					ColumnsForQuery+="NPTrack,";
					
					
					String[] BS = request.getParameterValues("BugSeverity");
					String bs = "";
					if (BS != null){
						for (int k = 0; k < BS.length; k++) {
							if (k == BS.length - 1){
								bs = bs + BS[k];
							}else{
								bs = bs + BS[k] + ",";
							}
						}
					}
					System.out.println("values of BS are -- > "+ bs);
					sql+="'"+bs+"',";
					ColumnsForQuery+="BugSeverity,";
					
				}
				else if(DeliverableClassification.equalsIgnoreCase("NP/NPA/NHF")){

					Description = request.getParameter("NPADescription").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
					NPTrack = request.getParameter("NPANPTrack").replace("'", "''");
					sql+="'"+NPTrack+"',";
					ColumnsForQuery+="NPTrack,";
					ScheduledDate = request.getParameter("NPAScheduledDate");
					sql+="'"+ScheduledDate+"',";
					ColumnsForQuery+="ScheduledDate,";
					
				}
				else if(DeliverableClassification.equalsIgnoreCase("Cisco Network Assessment")){
					Description = request.getParameter("CNADescription").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
					ScheduledDate = request.getParameter("CNAScheduledDate");
					sql+="'"+ScheduledDate+"',";
					ColumnsForQuery+="ScheduledDate,";
					
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Other Deliverables")){
				
					Description = request.getParameter("Div6Description").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Deployment Services")){
					
					Description = request.getParameter("Div7Description").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
					Hardware = request.getParameter("Div7Hardware").replace("'", "''");
					sql+="'"+Hardware+"',";
					ColumnsForQuery+="Hardware,";
					String Onsite=request.getParameter("Div7Onsite");
						sql+="'"+Onsite+"',";
						ColumnsForQuery+="Onsite,";
						if(Onsite.equalsIgnoreCase("Yes")||Onsite.equalsIgnoreCase("PartialRequirement")){
						Country = request.getParameter("Div7Country");
	  					sql+="'"+Country+"',";
	  					ColumnsForQuery+="Country,";
						}
						else{
						sql+="'',";
	  					ColumnsForQuery+="Country,";
						}
	  					

					Protocol = request.getParameter("Div7Protocol").replace("'", "''");
					sql+="'"+Protocol+"',";
					ColumnsForQuery+="Protocol,";
					
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Design Services")){
					
					Description = request.getParameter("Div8Description").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
					Hardware = request.getParameter("Div8Hardware").replace("'", "''");
					sql+="'"+Hardware+"',";
					ColumnsForQuery+="Hardware,";
					String Onsite=request.getParameter("Div8Onsite");
						sql+="'"+Onsite+"',";
						ColumnsForQuery+="Onsite,";
						if(Onsite.equalsIgnoreCase("Yes")||Onsite.equalsIgnoreCase("PartialRequirement")){
						Country = request.getParameter("Div8Country");
	  					sql+="'"+Country+"',";
	  					ColumnsForQuery+="Country,";
						}
						else{
						sql+="'',";
	  					ColumnsForQuery+="Country,";
						}
	  					
					Protocol = request.getParameter("Div8Protocol").replace("'", "''");
					sql+="'"+Protocol+"',";
					ColumnsForQuery+="Protocol,";
					
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Other Deliverables")){
				//Div6DeliverableName,Div6Description
				
				Description = request.getParameter("Div6Description").replace("'", "''");
					sql+="'"+Description+"',";
					ColumnsForQuery+="Description,";
				}
			}
			
			if(columnName!=null && columnName.equalsIgnoreCase("Assignee")){ //Neel: Change this to .contains('assignee')...
				System.out.println(request.getParameter("Assignee"));
				ToAssignee = request.getParameter("Assignee")+"@cisco.com";
			}
			if(columnName!=null && columnName.equalsIgnoreCase("DUIDPID")){
				System.out.println(request.getParameter("Hourslogging"));
				if(request.getParameter("Hourslogging").equalsIgnoreCase("DUID")){
					Pid = request.getParameter("DUIDPID");
				}
				else{
					Pid = request.getParameter("PID");
				}
				sql+="'"+Pid+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			
			
			
			if(request.getParameter(columnName)=="" && !columnName.contains("Date"))
			{
				ColumnsForQuery+=columnName+",";
				sql+="'Incomplete',";
				continue;
			}
			if((request.getParameter(columnName)==""||request.getParameter(columnName)==null) && !columnName.contains("Date") && !columnName.equalsIgnoreCase("ExistingHardwarePid"))
			{
				sql+="'Incomplete',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			
		
			if((request.getParameter(columnName)==""||request.getParameter(columnName)==null) && columnName.contains("Date"))
			{
				java.sql.Date sql_date = null;
				sql+=sql_date+",";
				ColumnsForQuery+=columnName+",";
				System.out.println(" "+temp_date);
				continue;
			}
			

			
			if(!columnName.equalsIgnoreCase("State")){
				ColumnsForQuery+=columnName+",";
				
				
				sql+="'"+request.getParameter(columnName).replace("'", "''")+"',";
			}
			if(columnName.equalsIgnoreCase("State")){
				ColumnsForQuery+=columnName;
				
				
				sql+="'"+request.getParameter(columnName).replace("'", "''")+"'";
			}
		
			
		}
		
		//ColumnsForQuery+="status";
		
		System.out.println("\n\n"+ColumnsForQuery);
		System.out.println(sql);
		//sql+="'active'";
		query = "insert into at.dbo.ProjectDetails_Competency3("+ColumnsForQuery+") "+"values("+sql+")";
		System.out.println("\n\n"+query);
		sql_conn.stmt.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);
		
		try {
			sql_conn.stmt.execute(IdentityInsertQueryOFF);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    
		
		
		//.................................................................................................................................
		//----------------------------------------- END OF INSERTING DATA BACK TO THE AUDIT TABLE DB --------------------------------------------------
		//----------------------------------------------------------------------------------------------------------------------------
	    
	    
		//--------------------------------------------------------------------------------------------------------------------------------------
		//-------------------------------------------------- NEW VALUES TO INSERT INTO ORIGINAL DB:--------------------------------------------------------------------
		//.....................................................................................................................................
		
		modifyOriginalDB(request, response, session, CreatedBy, UpdatedBy, sno);
		System.out.println("BACK FROM MODIFYING ORIGINAL DB!!\n\n");
		
		
		//.................................................................................................................................
		//----------------------------------------- END OF INSERTING DATA BACK TO THE ORIGINAL TABLE DB --------------------------------------------------
		//----------------------------------------------------------------------------------------------------------------------------
		
		
		
		//-----------------------------------------------------------------------------------------------------------------------------------
		//------------------------------------------- UPDATING ATTACHMENTS PART: -------------------------------------------------
		//....................................................................................................................................
		query = "select * from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version="+LatestVersion;
		ResultSet rs1 = sql_conn.stmt.executeQuery(query);
		
		String files="";
	    if(rs1.next())
	    	files = rs1.getString("attachments");

	    System.out.println(sno);
	
	//new File("c:\\SAT_Uploads\\"+sno).mkdir();
	    //new File("c:\\SAT_Uploads\\"+sno).mkdir();
		
		final String path = "c:\\SAT_Uploads\\"+sno;
		Collection<Part> Parts = request.getParts();
		
		int filenumber=Integer.parseInt(request.getParameter("x"));
		System.out.println("kukaushi100" +filenumber);
			
		//String filename=getFileName(request.getPart("file"));
		//String filename1=getFileName(request.getPart("file1"));
		//System.out.println("filename"+filename);
		//System.out.println("filename1"+filename1);
		//System.out.println(Parts.toString());
	    Iterator<Part> it = Parts.iterator();
	    final PrintWriter writer = response.getWriter();
	    for (int i=0;i<=filenumber;i++)
	    {
	    	//final Part filePart = (Part) it.next();
	    Part partname=request.getPart("file"+i);
	    	final String fileName = getFileName(partname);
	    	System.out.println("fileName getparts"+fileName);
	    	OutputStream out = null;
	    	InputStream filecontent = null;
	    		    	
	    	String actualFileName = fileName;
	    	if(actualFileName==null)
	    	it.next();
	    	else
	    	{
	    	try {
	    	
	    	out = new FileOutputStream(new File(path + File.separator + fileName));
	        filecontent = partname.getInputStream();
	        
	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            
	            	out.write(bytes, 0, read);
				
	        }
	        //writer.println("New file " + fileName + " created at " + path);
	        /*LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
	                new Object[]{fileName, path});*/
	        
	        if(files.equals(""))
	        		files = fileName;
	        else
	        		files += ";"+fileName;
	        
	        	
	        //System.out.println("Done!");
	    	}
	     catch (FileNotFoundException fne) {
	        
	        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
	                new Object[]{fne.getMessage()});
	    } finally {
	        
	        if (filecontent != null) {
	            filecontent.close();
	        }
        
    	}
    }
    }
    
    System.out.println("The files are please seee"+files);
    query =  "update at.dbo.ProjectDetails_Competency3 set attachments = '"+files+"' where SNo="+sno+" and Version ="+(LatestVersion+1);
    System.out.println("The query for updating files is ***********************"+ query);
    sql_conn.stmt.executeUpdate(query);
		
		//sql_conn.conn.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
/*	
	String files="";
	    if(rs1.next())
	    	files = rs1.getString("attachments");
	    //int sno = sno);
	    System.out.println(sno);
	    System.out.println(files);
	
	//new File("c:\\SAT_Uploads\\"+sno).mkdir();
	final String path = "c:\\SAT_Uploads\\"+sno;
	Collection<Part> Parts = request.getParts();
    //System.out.println(Parts.toString());
    Iterator<Part> it = Parts.iterator();
    //PrintWriter writer = response.getWriter();
    while(it.hasNext())
    {
    	final Part filePart = (Part) it.next();
    	final String fileName = getFileName(filePart);
    	OutputStream out = null;
    	InputStream filecontent = null;
    		    	
    	String actualFileName = fileName;
    	if(actualFileName==null)
    	it.next();
    	else
    	{
    	try {
    	
    	out = new FileOutputStream(new File(path + File.separator + fileName));
        filecontent = filePart.getInputStream();
        
        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        //writer.println("New file " + fileName + " created at " + path);
        /*LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
                new Object[]{fileName, path});
        
        if(files.equals(""))
        		files = fileName;
        else
        		files += ";"+fileName;
        
        	
        //System.out.println("Done!");
    	}
     catch (FileNotFoundException fne) {
    	 /*
        writer.println("You either did not specify a file to upload or are "
                + "trying to upload a file to a protected or nonexistent "
                + "location.");
        writer.println("<br/> ERROR: " + fne.getMessage());

        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                new Object[]{fne.getMessage()});
    } finally {
        
        if (filecontent != null) {
            filecontent.close();
        }
        
    	}
    }
    }
    
    System.out.println(files);
	    query = "update at.dbo.ProjectDetails_Competency3 set attachments = '"+files+"' where SNo="+sno+" and Version ="+(LatestVersion+1);
	    String query2 = "update at.dbo.ProjectDetails_Competency3 set attachments = attachments + ';"+files+"' where SNo="+sno;
	    //SET title = CONCAT('Mr. ', title)
	    System.out.println(query);
	    sql_conn.stmt.executeUpdate(query);
			    	
		sql_conn.conn.close();
		*/
		//PrintWriter out = response.getWriter();
		
		
		//.....................................................................................................................................
		//---------------------------------------------- END OF UPDATING FILE ATTACHMENTS ---------------------------------------------------------
		//---------------------------------------------------------------------------------------------------------------------------------------
		
		
		
		
		//============================================
		//============== Calculating difference in fields:
		
		ResultSet rsCompare = sql_conn.stmt.executeQuery("select top 2 * from at.dbo.ProjectDetails_Competency3 where SNo ="+sno+" order by version desc");
		if(rsCompare.next())
			LatestVersion = rsCompare.getInt("Version");
		System.out.println("The Latest Version is: "+LatestVersion);
		
			String ChangedFieldsEmailString = new String();
		ArrayList<ArrayList<Object>> temp2 = sql_conn1.Results2Array(rsCompare);
		ResultSetMetaData mtData = rsCompare.getMetaData();
		int columnCount2 = mtData.getColumnCount();			
		 for(int j=1;j<temp2.size();j++)//To FETCH WHOLE RECORD
         {
			 for(int i=0;i<columnCount2;i++)//TO ITERATE THROUGH COLUMN NAMES
 			{
     			
     			String colName = mtData.getColumnName(i+1);
     			String colType = mtData.getColumnTypeName(i+1);
     			String oldVal = new String();
     			String newVal = new String();
     			
     			if((temp2.get(j).get(i) == null) || (temp2.get(j).get(i) == "")) oldVal = "";
     			if((temp2.get(j-1).get(i) == null) || (temp2.get(j-1).get(i) == "")) newVal = "";
     			
     			if (colName.equalsIgnoreCase("Version"))
     				continue;
     			else if ((temp2.get(j).get(i) != null) && (temp2.get(j-1).get(i) != null))
     			{
     				System.out.println("\n"+colName+" has been changed from "+temp2.get(j-1).get(i)+" to "+temp2.get(j).get(i));
     				if(colType.equalsIgnoreCase("nvarchar")||colType.equalsIgnoreCase("date")||colType.equalsIgnoreCase("datetime2")||colType.equalsIgnoreCase("int"))
     				{
     					oldVal = temp2.get(j).get(i).toString();
     					newVal = temp2.get(j-1).get(i).toString();
     					if(!newVal.equals(oldVal))
     						ChangedFieldsEmailString += "\n"+colName+" has been changed from "+oldVal+" to "+newVal;     						
     				}
     			}                                				
     			else if (oldVal.equalsIgnoreCase("")||newVal.equalsIgnoreCase(""))
     			{                                	
     				if(!newVal.equals(oldVal))
     					ChangedFieldsEmailString += "\n"+colName+" has been changed from "+oldVal+" to "+newVal;						
     			}     			    			             	
 			}
         }
			//System.out.print(mtData.getColumnName(i)+"\t");
		//request.setAttribute("metaData", mtData);
		//request.setAttribute("resultset",rsCompare);
		 //System.out.println("\n\n\nCHANGED VALUES FOR EMAIL:"+ChangedFieldsEmailString);
		
		//===============================================
		//==============================================
		
		String ToUser = UpdatedBy+"@cisco.com";		
		//String SNo = (String)request.getParameter("SNo");
		String SNo = sno+"";
		String From = "grt-support@cisco.com";
		String subToUser = "GRT Request ID - "+SNo+" has been updated.";
		String msgToUser ="";
		String CapId=request.getParameter("CapId");
		if(!CapId.isEmpty()){
		msgToUser =
		" URL : http://grt.cisco.com/ModifyCompetency?sno="+SNo+ "\n" +
		"	Created by : "+createdBy+"@cisco.com \n" + 
		"	Assigned to : "+ToAssignee+"\n" +
		"	Requested By :"+RequestedBy+"\n"+
		"	Deliverable Classification : "+DeliverableClassification +"\n" +
		"	Account Name : " +AccountName+"\n\n" +
		"	Updated by "+ToUser+"\n\n\n"+

		"	This message is automatically generated by GSP Request Tracker \n" +
		"**********************************************************************";
		}
		else{
			msgToUser =	" URL : http://grt.cisco.com/ModifyCompetency?sno="+SNo+ "\n" +
					"	Created by : "+createdBy+"@cisco.com \n" + 
					"	Assigned to : "+ToAssignee+"\n" +
					"	Requested By :"+RequestedBy+"\n"+
					"	Deliverable Classification : "+DeliverableClassification +"\n" +
					"	Account Name : " +AccountName+"\n\n" +
					"	Updated by "+ToUser+"\n\n\n"+

					"	This message is automatically generated by GSP Request Tracker \n" +
					"**********************************************************************";
					
		}
		//String msgToUser = "The Project with ID No:"+SNo+" has been successfully added";
		//String msgToAssignee = "The Project with ID No:"+SNo+" has been assigned to you";
		
		String msgToAssignee = msgToUser;
				/*
		" New request ( " + SNo+ " ) has been assigned to you \n" + 
		" URL : http://grt.cisco.com/ModifyCompetency?sno="+SNo+ "\n" +
		"	Created by : "+ToUser+ "\n" + 
		"	Assigned to : "+ToAssignee+"\n" +
		"	GSP Competency : "+GSPCompetency+"\n" +
		"	Deliverable Classification : "+DeliverableClassification +"\n" +
		"	Account Name : " +AccountName+"\n\n\n" +

		"	This message is automatically generated by GSP Request Tracker \n" +
		"**********************************************************************"; */
		
		String subToAssignee = subToUser;//"Assigned to Project with ID No:"+SNo;
		sendMail(ToUser, From, subToUser, msgToUser);
		sendMail(mailer,From,subToUser,msgToUser);
		sendMail(ToAssignee, From, subToAssignee, msgToAssignee);
		/*out.println("Thank you very much! The following information has been successfully registered in the system");
		String[] columns1 = ColumnsForQuery.split(",");
		String[] values = sql.split(",");
		int i = columns1.length;
		String[] finalPrint = {};
		for (int j=0;j<i;j++){
			finalPrint[j] = columns1[j]+" ----> "+values[j];
		}
		for (String s :finalPrint){
			out.println(s +"\n");
		}
	    for (String s : columns1){
	    	out.println(s);
	    }
	    for (String s : values){
	    	out.println(s);
	    }*/
		//--------------------------in mid kukaushi-----------------------------------------//
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
			System.out.println("in mid functuin and conn successfull");
			ResultSet rs2 = s.executeQuery("select * from at.dbo.ProjectDetails_Competency2 where SNo='"+SNo+"'");
			JSONObject js_obj = convert(rs2,UpdatedBy);
				
			//ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);
			System.out.println("got the array list");
			System.out.println("JSON");
			System.out.println(js_obj);	
			request.setAttribute("js_obj_json", js_obj);
			sql_conn.conn.close();
			request.setAttribute("js_obj", js_obj.toString());
			RequestDispatcher rd = request.getRequestDispatcher("competency/ReadOnly.jsp");
			rd.forward(request,response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       //-----------------------------------here-----------------------------------------//  
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	public  JSONObject convert(ResultSet rs, String UpdatedBy)
		    throws SQLException
		  {
		    JSONArray json = new JSONArray();
		    ResultSetMetaData rsmd = rs.getMetaData();
		    JSONObject obj = new JSONObject();

		    if(rs.next()) {
		      int numColumns = rsmd.getColumnCount();
		        for (int i=1; i<numColumns+1; i++) {
		        String column_name = rsmd.getColumnName(i);
				if(column_name.equalsIgnoreCase("SNo")){
				obj.put("SNo",rs.getString("SNo"));
				}
				String Assignee = rs.getString("Assignee");
				String Cby = rs.getString("UpdatedBy");
				String SuperAdmin = "kukaushi";
				if(UpdatedBy.equalsIgnoreCase(Assignee)||UpdatedBy.equalsIgnoreCase(Cby)||UpdatedBy.equalsIgnoreCase(SuperAdmin)){
				obj.put("ShowButton","yes");
				}
				//kukaushi -100
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
													String existingHwPid = rs.getString("ExistingHardwarePid");
													final JSONArray arr = new JSONArray();
													String[] result = existingHwPid.split("\\,");													
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
		        		System.out.println("Modify Entry---------------ExistingHardwarePidExistingHardwarePid");
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


	private String getFileName(final Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
	

	void sendMail(String To, String From, String Subject, String textMessage){
		System.out.println("To"+ To +"From"+ From);
	// Recipient's email ID needs to be mentioned.
    String to = To;

    // Sender's email ID needs to be mentioned
    String from = From;

    // Assuming you are sending email from localhost -----> ?????
    String host = "outbound.cisco.com";

    // Get system properties
    Properties properties = System.getProperties();

    // Setup mail server
    properties.setProperty("mail.smtp.host", host);

    // Get the default Session object.
    Session session = Session.getDefaultInstance(properties);

    try{
       // Create a default MimeMessage object.
       MimeMessage message = new MimeMessage(session);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));

       // Set To: header field of the header.
       message.addRecipient(Message.RecipientType.TO,
                                new InternetAddress(to));

       // Set Subject: header field
       message.setSubject(Subject);

       // Now set the actual message
       message.setText(textMessage);

       // Send message
       Transport.send(message);
       System.out.println("Sent message successfully....");
    }catch (Exception mex) {
       mex.printStackTrace();
    }
	}
	
	public void modifyOriginalDB(HttpServletRequest request, HttpServletResponse response, HttpSession session, String CreatedBy, String UpdatedBy, int sno) throws ServletException, IOException
	{
/**Added to read DB details from properties file*/
		String createdBy=null;
		props = PropertiesReader.readProperties();
		db_ip = props.getProperty("GRT_DB_IP");
		db_port = props.getProperty("GRT_DB_PORT");
		db_username = props.getProperty("GRT_DB_USERNAME");
		db_password = props.getProperty("GRT_DB_PASSWORD");
		Mssql_connect sql_conn4 = null;	
		try {
		
		sql_conn4=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
	ResultSet rsCreatedBy = sql_conn4.stmt.executeQuery("select CreatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
		
		while(rsCreatedBy.next()){
			
				createdBy=rsCreatedBy.getString(1);
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
			System.out.println("Exception !!");
				e.printStackTrace();
			}
		
		Mssql_connect sql_conn5 = null;
		//int sno = Integer.parseInt(request.getParameter("SNo"));
		//int sno = 1;
		
	try {

		
		/****/
	//	sql_conn5 = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
		sql_conn5=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
		ResultSet rs = sql_conn5.stmt.executeQuery("select * from at.dbo.ProjectDetails_Competency2");
		ResultSetMetaData metaData = rs.getMetaData();
		int columnCount = metaData.getColumnCount();
		
		/**ResultSet rsCreatedBy = sql_conn5.stmt.executeQuery("select CreatedBy from at.dbo.ProjectDetails_Competency3 where SNo="+sno+" and Version=0");
		
		while(rsCreatedBy.next()){
			createdBy=rsCreatedBy.getString(1);
		}**/
		System.out.println("Testt createdBy "+createdBy);
		
		ArrayList<String> columns = new ArrayList<String>();
		String ColumnsForQuery = new String();
		String sql = new String();
		String query = new String();
		String columnName = null;
		String temp_date = null;
		session = (HttpSession) request.getSession(false);
		//String UpdatedBy = (String) session.getAttribute("UName");
		
		
		String[] tokens = null;
		String ToAssignee = null;
		String Pid = null;
		String Description = null;
		String DeliverableName =null;
		String Protocol = null;
		String Hardware = null;
		String DeliverableClassification = null;
		String NPTrack = null;
		String ScheduledDate = null;
		String Country = null;
		String From = null;
		//Check wether existing hardware field is listbox or text area.... for listbox:	existingHwNew=Y	
		String existingHwNew = request.getParameter("existingHwNew");
		for(int i=1;i<columnCount+1;i++)
		{
			columnName = metaData.getColumnName(i);
			columns.add(columnName);
			if(columnName.equalsIgnoreCase("attachments")||columnName.equalsIgnoreCase("Onsite")||columnName.equalsIgnoreCase("Country")||columnName.equals("BugSeverity")||columnName.equalsIgnoreCase("Description")||columnName.equalsIgnoreCase("ExistingProtocol")||columnName.equalsIgnoreCase("FutureProtocol")||columnName.equalsIgnoreCase("Protocol")||columnName.equalsIgnoreCase("Hardware")||columnName.equalsIgnoreCase("ExistingHardware")||columnName.equalsIgnoreCase("FutureHardware")||columnName.equalsIgnoreCase("DeliverableName")||columnName.equalsIgnoreCase("NPTrack")||columnName.equalsIgnoreCase("ScheduledDate")||columnName.equalsIgnoreCase("SNo")){
				continue;
			}
			
			if(columnName.equalsIgnoreCase("Timestamp")){
				java.util.Calendar cal = java.util.Calendar.getInstance();
				Timestamp Timestamp =  new java.sql.Timestamp(cal.getTimeInMillis());
				System.out.println("Timestamp in Insert fn(): "+Timestamp.toString());
				sql+="Timestamp='"+Timestamp+"',";
				ColumnsForQuery+="Timestamp";
				continue;
				}
			if(columnName!=null && columnName.equalsIgnoreCase("NOSOEManager"))
			{
				String temp = request.getParameter("NOSOEManager");
				if(temp == null || temp == ""){
					sql+="NOSOEManager='',";
				}else{
					sql+="NOSOEManager='"+temp+"',";
				}
				
				ColumnsForQuery+="NOSOEManager,";
				continue;
			}
			if(columnName.equalsIgnoreCase("platform")){				
				String platformValue = request.getParameter("platform");
  				String delClassification = request.getParameter("DeliverableClassification");
  				
  				if(!delClassification.equalsIgnoreCase("SORA") || "".equals(existingHwNew)){
  					if(platformValue == null || platformValue == ""){
  						sql+="platform=''";
  					}else{
  						sql+="platform='"+platformValue+"'";
  					}
  					ColumnsForQuery+="platform";
  				}
  				else if(delClassification.equalsIgnoreCase("SORA") && (existingHwNew != null && "Y".equalsIgnoreCase(existingHwNew))){
  					if(platformValue == null || platformValue == "" ){
						sql+="platform='' ,";
					}else{
						sql+="platform='"+platformValue+"',";
					}
	  					ColumnsForQuery+= "platform,";
  				}
				
				continue;
				}
			if(columnName.equalsIgnoreCase("attachment")){
				
				//sql+="attachment='"+attachment+"',";
				//ColumnsForQuery+="attachment,";
				continue;
				}
			String delClassification = request.getParameter("DeliverableClassification");
				
				if(delClassification.equalsIgnoreCase("SORA") && (existingHwNew !=null && "Y".equalsIgnoreCase(existingHwNew)) && columnName.equalsIgnoreCase("ExistingHardwarePid")){
					String[] hwPids = request.getParameterValues("ExistingHardwareinfo");
					StringBuffer ret = new StringBuffer("");
			        for (int idx = 0; hwPids != null && idx < hwPids.length; idx++) {
			            ret.append(hwPids[idx]);
			            if (idx < hwPids.length - 1) {
			                ret.append(',');
			            }
			        }
			        String hwPidsSelected = ret.toString();
			        sql+="ExistingHardwarePid='"+hwPidsSelected+"',";
			        ColumnsForQuery+="ExistingHardwarePid,";
			      continue;
				}
			
			if(columnName.equalsIgnoreCase("DeliverableClassification")){
				DeliverableClassification = request.getParameter("DeliverableClassification");
				
				if(DeliverableClassification.equalsIgnoreCase("SORA")){
				
					
					Description = request.getParameter("SoraDescription").replace("'", "''");
					sql+="Description ='"+Description+"',";
					ColumnsForQuery+="Description,";
					if(existingHwNew == null || "".equals(existingHwNew)){
						Hardware = request.getParameter("ExistingHardwareinfo").replace("'", "''");
						System.out.println("I am here .... ");
						sql+="ExistingHardware ='"+Hardware+"',";
						ColumnsForQuery+="ExistingHardware,";
					}
					
					Protocol = request.getParameter("ExistingFeatureProtocolinfo").replace("'", "''");
					sql+="ExistingProtocol ='"+Protocol+"',";
					ColumnsForQuery+="ExistingProtocol,";
					String Hardware1 = request.getParameter("FutureHardwareinfo").replace("'", "''");
					sql+="FutureHardware ='"+Hardware1+"',";
					ColumnsForQuery+="FutureHardware,";
					
					String Protocol1 = request.getParameter("FutureFeatureProtocolinfo").replace("'", "''");
					sql+="FutureProtocol ='"+Protocol1+"',";
					ColumnsForQuery+="FutureProtocol,";
					
					
					NPTrack = request.getParameter("SORANPTrack").replace("'", "''");
					sql+="NPTrack ='"+NPTrack+"',";
					ColumnsForQuery+="NPTrack,";
					
				}
				else if(DeliverableClassification.equalsIgnoreCase("NP/NPA/NHF")){
					
					Description = request.getParameter("NPADescription").replace("'", "''");
					sql+="Description = '"+Description+"',";
					ColumnsForQuery+="Description,";
					NPTrack = request.getParameter("NPANPTrack").replace("'", "''");
					sql+="NPTrack='"+NPTrack+"',";
					ColumnsForQuery+="NPTrack,";
					ScheduledDate = request.getParameter("NPAScheduledDate");
					sql+="ScheduledDate = '"+ScheduledDate+"',";
					ColumnsForQuery+="ScheduledDate,";
					
				}
				else if(DeliverableClassification.equalsIgnoreCase("Cisco Network Assessment")){
					ScheduledDate = request.getParameter("CNAScheduledDate");
					sql+="ScheduledDate='"+ScheduledDate+"',";
					ColumnsForQuery+="ScheduledDate,";
					Description = request.getParameter("CNADescription").replace("'", "''");
					sql+="Description='"+Description+"',";
					ColumnsForQuery+="Description,";
					
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Other Deliverables")){
					
					Description = request.getParameter("Div6Description").replace("'", "''");
					sql+="Description='"+Description+"',";
					ColumnsForQuery+="Description,";
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Deployment Services")){
					
					Description = request.getParameter("Div7Description").replace("'", "''");
					sql+="Description='"+Description+"',";
					ColumnsForQuery+="Description,";
					Hardware = request.getParameter("Div7Hardware").replace("'", "''");
					sql+="Hardware='"+Hardware+"',";
					ColumnsForQuery+="Hardware,";
					String Onsite=request.getParameter("Div7Onsite");
						sql+="Onsite='"+Onsite+"',";
						ColumnsForQuery+="Onsite,";
						if(Onsite.equalsIgnoreCase("Yes")||Onsite.equalsIgnoreCase("PartialRequirement")){
						Country = request.getParameter("Div7Country");
	  					sql+="Country='"+Country+"',";
	  					ColumnsForQuery+="Country,";
						}
						else{
						sql+="Country='',";
	  					ColumnsForQuery+="Country,";
						}
					Protocol = request.getParameter("Div7Protocol").replace("'", "''");
					sql+="Protocol='"+Protocol+"',";
					ColumnsForQuery+="Protocol,";
					
				}
				
				else if (DeliverableClassification.equalsIgnoreCase("Design Services")){
					
					Description = request.getParameter("Div8Description").replace("'", "''");
					sql+="Description='"+Description+"',";
					ColumnsForQuery+="Description,";
					Hardware = request.getParameter("Div8Hardware").replace("'", "''");
					sql+="Hardware='"+Hardware+"',";
					ColumnsForQuery+="Hardware,";
					
					String Onsite=request.getParameter("Div8Onsite");
						sql+="Onsite='"+Onsite+"',";
						ColumnsForQuery+="Onsite,";
						if(Onsite.equalsIgnoreCase("Yes")||Onsite.equalsIgnoreCase("PartialRequirement")){
						Country = request.getParameter("Div8Country");
	  					sql+="Country='"+Country+"',";
	  					ColumnsForQuery+="Country,";
						}
						else{
						sql+="Country='',";
	  					ColumnsForQuery+="Country,";
						}
	  					
					Protocol = request.getParameter("Div8Protocol").replace("'", "''");
					sql+="Protocol='"+Protocol+"',";
					ColumnsForQuery+="Protocol,";
					
				}
			}
			
			if(columnName!=null && columnName.equalsIgnoreCase("AssigneeNCEName")){ //Neel: Change this to .contains('assignee')...
				System.out.println(request.getParameter("AssigneeNCEName"));
				ToAssignee = request.getParameter("AssigneeNCEName")+"@cisco.com";
			}
			if(columnName!=null && columnName.equalsIgnoreCase("DUIDPID")){
				System.out.println(request.getParameter("Hourslogging"));
				if(request.getParameter("Hourslogging").equalsIgnoreCase("DUID")){
					Pid = request.getParameter("DUIDPID");
				}
				else{
					Pid = request.getParameter("PID");
				}
				sql+=columnName+" = '"+Pid+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			
			
			if(columnName!=null && columnName.equalsIgnoreCase("CreatedBy"))
			{
				System.out.println("CreatedByyyy in MODIFY_ORIGINAL_DB Modify fn(): "+createdBy);
				sql+=columnName+"= '"+createdBy+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			if(columnName!=null && columnName.equalsIgnoreCase("UpdatedBy"))
			{
				System.out.println("Uby in MODIFY_ORIGINAL_DB Modify fn(): "+UpdatedBy);
				sql+=columnName+"= '"+UpdatedBy+"',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
			if(request.getParameter(columnName)=="" && !columnName.contains("Date"))
			{
				ColumnsForQuery+=columnName+",";
				sql+=columnName + "= 'Incomplete',";
				continue;
			}
			if((request.getParameter(columnName)==""||request.getParameter(columnName)==null) && !columnName.contains("Date") && !columnName.equalsIgnoreCase("ExistingHardwarePid"))
			{
				sql+=columnName+"='Incomplete',";
				ColumnsForQuery+=columnName+",";
				continue;
			}
						
			else if ((request.getParameter(columnName)==""||request.getParameter(columnName)==null) && columnName.contains("Date"))
			{
				java.sql.Date sql_date = null;
				sql+=columnName+ "=" +sql_date+",";
				ColumnsForQuery+=columnName+",";
				System.out.println(" "+temp_date);
				continue;
			}
			
			if(!columnName.equalsIgnoreCase("State")) {
				ColumnsForQuery+=columnName+",";
				String colName = request.getParameter(columnName);
				sql+=columnName +"='"+colName.replace("'", "''")+"',";
			}
				
			if(columnName.equalsIgnoreCase("State")) {
  				ColumnsForQuery+=columnName;
  				
  				String colName = request.getParameter(columnName);
  				sql+=columnName +"='"+colName.replace("'", "''")+"'";
  			}
		}
		
		
		System.out.println(sql);
		//sql+= "status='active'";
		query = "update at.dbo.ProjectDetails_Competency2 set "+sql+" where SNo="+sno;
		System.out.println(query);
		sql_conn5.stmt.executeUpdate(query);
		
		query = "select * from at.dbo.ProjectDetails_Competency2 where SNo="+sno;
		ResultSet rs1 = sql_conn5.stmt.executeQuery(query);
		
		String files="";
	    if(rs1.next())
	    	files = rs1.getString("attachments");

	    System.out.println(sno);
	
	//new File("c:\\SAT_Uploads\\"+sno).mkdir();
	    //new File("c:\\SAT_Uploads\\"+sno).mkdir();
		
		final String path = "c:\\SAT_Uploads\\"+sno;
		Collection<Part> Parts = request.getParts();
		
		int filenumber=Integer.parseInt(request.getParameter("x"));
		System.out.println("kukaushi100" +filenumber);
			
		//String filename=getFileName(request.getPart("file"));
		//String filename1=getFileName(request.getPart("file1"));
		//System.out.println("filename"+filename);
		//System.out.println("filename1"+filename1);
		//System.out.println(Parts.toString());
	    Iterator<Part> it = Parts.iterator();
	    final PrintWriter writer = response.getWriter();
	    for (int i=0;i<=filenumber;i++)
	    {
	    	//final Part filePart = (Part) it.next();
	    Part partname=request.getPart("file"+i);
	    	final String fileName = getFileName(partname);
	    	System.out.println("fileName getparts"+fileName);
	    	OutputStream out = null;
	    	InputStream filecontent = null;
	    		    	
	    	String actualFileName = fileName;
	    	if(actualFileName==null)
	    	it.next();
	    	else
	    	{
	    	try {
	    	
	    	out = new FileOutputStream(new File(path + File.separator + fileName));
	        filecontent = partname.getInputStream();
	        
	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            
	            	out.write(bytes, 0, read);
				
	        }
	        //writer.println("New file " + fileName + " created at " + path);
	        /*LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
	                new Object[]{fileName, path});*/
	        
	        if(files.equals(""))
	        		files = fileName;
	        else
	        		files += ";"+fileName;
	        
	        	
	        //System.out.println("Done!");
	    	}
	     catch (FileNotFoundException fne) {
	        
	        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
	                new Object[]{fne.getMessage()});
	    } finally {
	        
	        if (filecontent != null) {
	            filecontent.close();
	        }
        

    	}
    }
    }
    
    System.out.println(files);
    query = "update at.dbo.ProjectDetails_Competency2 set attachments= '"+files+"' where SNo="+sno;
    sql_conn5.stmt.executeUpdate(query);
	sql_conn5.conn.close();
	sql_conn4.conn.close();
			
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
}
