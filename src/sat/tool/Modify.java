package sat.tool;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;



import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Modify() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = (HttpSession) request.getSession();

		String UName = (String) request.getSession().getAttribute("UName");
		PrintWriter out = response.getWriter();
		if (UName == null) {
			out.println("<h3>Your Session has been expired. Please Login to the Portal<h3>");
			return;
		}
		String SNo = request.getParameter("sno");

		// modified

		Boolean chkflag = CheckRecordLock(Integer.parseInt(SNo),
				"at.dbo.ProjectDetails", session, UName);
		if (chkflag) {
			// modiied

			Mssql_connect sql_conn = null;
			try {
				/**Added to read DB details from properties file*/
				
				props = PropertiesReader.readProperties();
				db_ip = props.getProperty("GRT_DB_IP");
				db_port = props.getProperty("GRT_DB_PORT");
				db_username = props.getProperty("GRT_DB_USERNAME");
				db_password = props.getProperty("GRT_DB_PASSWORD");
				
				/****/
				//sql_conn = new Mssql_connect("10.105.217.240:1433", "ATUser",
						//"Cisco@123");
				sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
				Statement s = sql_conn.conn.createStatement();
				ResultSet rs = s
						.executeQuery("select * from at.dbo.ProjectDetails where SNo='"
								+ SNo + "'");
				JSONObject js_obj = convert(rs);

				ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);

				System.out.println(js_obj);

				sql_conn.conn.close();
				request.setAttribute("js_obj", js_obj.toString());
				RequestDispatcher rd = request
						.getRequestDispatcher("modify.jsp");
				rd.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else
			out.println("Record is currently in access by some other user");
	}

	public static JSONObject convert(ResultSet rs) throws SQLException {
		JSONArray json = new JSONArray();
		ResultSetMetaData rsmd = rs.getMetaData();
		JSONObject obj = new JSONObject();

		if (rs.next()) {
			int numColumns = rsmd.getColumnCount();
			for (int i = 1; i < numColumns + 1; i++) {
				String column_name = rsmd.getColumnName(i);

				if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
					obj.put(column_name, rs.getArray(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
					obj.put(column_name, rs.getInt(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
					obj.put(column_name, rs.getBoolean(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
					obj.put(column_name, rs.getBlob(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
					obj.put(column_name, rs.getDouble(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
					obj.put(column_name, rs.getFloat(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
					obj.put(column_name, rs.getInt(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
					obj.put(column_name, rs.getNString(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
					obj.put(column_name, rs.getString(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
					obj.put(column_name, rs.getInt(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
					obj.put(column_name, rs.getInt(column_name));
				} else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
					Date date = rs.getDate(column_name);
					String sDate = null;
					if (date != null) {
						sDate = date.toString();
						String[] tokens = sDate.split("-");
						sDate = tokens[1] + "/" + tokens[2] + "/" + tokens[0];
					} else
						sDate = "";
					obj.put(column_name, sDate);

				} else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
					String sDateTime = null;
					if (rs.getTimestamp(column_name) != null)
						sDateTime = rs.getTimestamp(column_name).toString();
					String tokens[] = null, tokens1[] = null;
					if (sDateTime != null) {
						tokens = sDateTime.split(" ");
						if (column_name.equalsIgnoreCase("RequestRecvDate")) {
							tokens1 = tokens[0].split("-");
							obj.put(column_name, tokens1[1] + "/" + tokens1[2]
									+ "/" + tokens1[0]);
							tokens1 = tokens[1].split(":");
							obj.put("RequestRecvTime", tokens1[0] + ":"
									+ tokens1[1]);
						}
						if (column_name.equalsIgnoreCase("FulfilmentDate")) {
							tokens1 = tokens[0].split("-");
							obj.put(column_name, tokens1[1] + "/" + tokens1[2]
									+ "/" + tokens1[0]);
							tokens1 = tokens[1].split(":");
							obj.put("FulfilTime", tokens1[0] + ":" + tokens1[1]);
						}
					} else {
						if (column_name.equalsIgnoreCase("RequestRecvDate")) {
							obj.put(column_name, "");
							obj.put("RequestRecvTime", "");
						}
						if (column_name.equalsIgnoreCase("FulfilmentDate")) {
							obj.put(column_name, "");
							obj.put("FulfilTime", "");
						}
					}
				} else {
					obj.put(column_name, rs.getObject(column_name));
				}
			}
			System.out.println("json obj" + obj);
			// json.add(obj);
		}

		return obj;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public boolean CheckRecordLock(int SNo, String TableName,
			HttpSession session, String UName)

	{
		Mssql_connect sql_conn = null;
		Statement s;
		Timestamp LockTime;
		//long TimeDiff;
		Date date= new Date();
		String sessionId;
		boolean chkflag = false;
		ServletContext context = getServletContext();
		Long timeoutInterval= Long.parseLong(context.getInitParameter("locktimeoutInterval"));
		timeoutInterval=timeoutInterval*60*1000;
		System.out.println("timeoutInterval"+timeoutInterval);
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
			//sql_conn = new Mssql_connect("10.105.217.240:1433", "ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);

			s = sql_conn.conn.createStatement();

			ResultSet rs = s
					.executeQuery("select * from at.dbo.RecordLockTable  where RecordId='"
							+ SNo + "' and TableName='" + TableName + "'");
			System.out.println("SNO is" + SNo);
			if (rs.next()) {
				
				if (rs.getString("UserId").equals(UName))
						{
					chkflag = true;
					return chkflag;
						}
				LockTime = rs.getTimestamp("LockTime");
				System.out.println("LockTime"+LockTime);
				System.out.println("LockTime.getTime()"+LockTime.getTime());
				sessionId = rs.getString("SessionId");
				System.out.println("System.currentTimeMillis("+System.currentTimeMillis());
				
				Long TimeDiffer =  new Timestamp(date.getTime()).getTime()- LockTime.getTime();
				
				System.out.println("TimeDiff"+TimeDiffer);
				System.out.println("TimeDiffIN Min"+new Timestamp((TimeDiffer)));
				if (TimeDiffer > timeoutInterval) {
					ClearRecordLock(SNo, TableName);
					InsertRecord(SNo, TableName, session, UName);
					
					HttpSession oldsession = (HttpSession) context
							.getAttribute(sessionId);
					System.out.println("oldsession"+oldsession);
					System.out.println("sessionId"+sessionId);
					chkflag =true;
					//oldsession.invalidate();
				} else {
					System.out.println("someone accessing");
					chkflag = false;
				}
			} else {
				chkflag = true;
				InsertRecord(SNo, TableName, session, UName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chkflag;
	}

	public void ClearRecordLock(int Sno, String TableName) {
		Mssql_connect sql_conn = null;
		Statement s;
System.out.println("inside delete");
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			/****/
			//sql_conn = new Mssql_connect("10.105.217.240:1433", "ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
     System.out.println("sno and table"+Sno+ "  "+TableName);
			s = sql_conn.conn.createStatement();
			String sql = "Delete from at.dbo.RecordLockTable where RecordId="
					+ Sno + " and TableName='" + TableName + "'";
			 s.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void InsertRecord(int SNo, String TableName, HttpSession session,
			String UName) {
		Mssql_connect sql_conn = null;
		Statement s;
		Date date= new Date();

		try {
		//	sql_conn = new Mssql_connect("10.105.217.240:1433", "ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);

			s = sql_conn.conn.createStatement();
			String sql = "insert into at.dbo.RecordLockTable(RecordId,TableName,SessionId,LockTime,UserId) "
					+ "values(" + SNo + ",'" + TableName + "','"
					+ session.getId()
					+ "', '"
					+ new Timestamp(date.getTime()) + "','" + UName + "')";

			s.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void ShowDetails() {

	}

}
