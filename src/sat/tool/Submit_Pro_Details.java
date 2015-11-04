package sat.tool;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Submit_Pro_Details
 */
@WebServlet("/ProjDetails")
public class Submit_Pro_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Submit_Pro_Details() {
		super();
		
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String SNo = (String) request.getParameter("SNo");
		HttpSession session = (HttpSession) request.getSession(false);
		String UName = (String) request.getSession().getAttribute("UName");
		if (UName == null) {
			PrintWriter out = response.getWriter();
			out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
			return;
		}
		System.out.println("sno is " + SNo);
		if (SNo == null)
			insert(request, response, session);
		else
			try {
				modify(request, response, session);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public void insert(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		Mssql_connect sql_conn = null;

		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			sql_conn = new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			ResultSet rs = sql_conn.stmt
					.executeQuery("select * from at.dbo.ProjectDetails");
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
			System.out.println("deliverable"+request.getParameter("Del1"));
			for (int i = 1; i <= columnCount; i++) {
				columnName = metaData.getColumnName(i);
				columns.add(columnName);
				if (columnName != null && columnName.equals("status"))
					continue;
				
				if (columnName != null && columnName.equals("SNo"))
					continue;

				if (columnName != null && columnName.equals("GDC")) {
					String gdcval = request.getParameter("gdcval");
					if(gdcval.startsWith(","))
						gdcval = gdcval.substring(1);
					sql += "'" + gdcval + "',";
					ColumnsForQuery += columnName + ",";
					System.out.println("gdc value is"
							+ request.getParameter("gdcval"));
					continue;
				}
				
				// system date for entered date 
				
				if (columnName != null && columnName.equals("RequestEntered")) {
					Date date=new Date();
					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
							"yyyyMMdd");
					
					sql += "'" + sdf.format(date) + "',";
					ColumnsForQuery += columnName + ",";
					System.out.println(" request entered value is"
							+ sdf.format(date));
					continue;
				}
				//
				
				
				// system date for resource assigned date 
				
				if (columnName != null && columnName.equals("ResourceEntered")) {
					if ( request.getParameter("ResourceAsgnDate")!="")
					{
						System.out.println("request.getParameter"+request.getParameter("ResourceAsgnDate")+"chk");
					Date date=new Date();
					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
							"yyyyMMdd");
					
					sql += "'" + sdf.format(date) + "',";
					ColumnsForQuery += columnName + ",";
					System.out.println(" resource entered value is"
							+ sdf.format(date));
					}
					else
					{
						System.out.println("else part");
					}
					
					continue;
				}
				//
				

				if (columnName != null && columnName.equals("Fiscal")) {
					sql += "'" + request.getParameter("Fiscal_Quarter") + " "
							+ request.getParameter("Fiscal_Year") + "',";
					ColumnsForQuery += columnName + ",";
					continue;
				}
				if (columnName != null && columnName.equals("UpdatedBy")) {
					sql += "'" + UpdatedBy + "',";
					ColumnsForQuery += columnName + ",";
					continue;
				}

				if (columnName != null && columnName.equals("CreatedBy")) {
					sql += "'" + UpdatedBy + "',";
					ColumnsForQuery += columnName + ",";
					continue;
				}

				if (request.getParameter(columnName) == ""
						&& !columnName.contains("Date")) {
					ColumnsForQuery += columnName + ",";
					sql += "'Incomplete',";
					continue;
				}
				if ((request.getParameter(columnName) == "" || request
						.getParameter(columnName) == null)
						&& !columnName.contains("Date")) {
					sql += "'Incomplete',";
					ColumnsForQuery += columnName + ",";
					continue;
				}

				if (request.getParameter(columnName) != ""
						&& columnName.contains("Date")) {
					System.out.print(request.getParameter(columnName));
					tokens = request.getParameter(columnName).split("/");
					// temp_date = tokens[2]+"-"+tokens[0]+"-"+tokens[1];
					temp_date = tokens[2] + tokens[0] + tokens[1];
					java.util.Date date = null;
					String currentTime = null;
					try {

						if (columnName.equalsIgnoreCase("RequestRecvDate")
								&& (request.getParameter("RequestRecvTime") != "")) {
							temp_date = temp_date + " "
									+ request.getParameter("RequestRecvTime");
							date = new SimpleDateFormat("yyyyMMdd HH:mm")
									.parse(temp_date);
							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
									"yyyyMMdd HH:mm");
							currentTime = sdf.format(date);
							ColumnsForQuery += columnName + ",";
							sql += "'" + currentTime + "'" + ",";
							System.out.println(" " + temp_date);
							continue;
						} else if (columnName
								.equalsIgnoreCase("FulfilmentDate")
								&& (request.getParameter("FulfilTime") != "")) {
							temp_date = temp_date + " "
									+ request.getParameter("FulfilTime");
							date = new SimpleDateFormat("yyyyMMdd HH:mm")
									.parse(temp_date);
							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
									"yyyyMMdd HH:mm");
							currentTime = sdf.format(date);
							ColumnsForQuery += columnName + ",";
							sql += "'" + currentTime + "'" + ",";
							System.out.println(" " + temp_date);
							continue;
						}

						else {
							date = new SimpleDateFormat("yyyyMMdd")
									.parse(temp_date);
							System.out.print("java date" + date);
							java.sql.Date sql_date = new java.sql.Date(
									date.getTime());
							System.out.print("sql date" + sql_date);
							sql += "'" + sql_date + "'" + ",";
							ColumnsForQuery += columnName + ",";
							System.out.println(" " + temp_date);
							continue;
						}
					} catch (java.text.ParseException e) {
						e.printStackTrace();
					}

				} else if ((request.getParameter(columnName) == "" || request
						.getParameter(columnName) == null)
						&& columnName.contains("Date")) {
					java.sql.Date sql_date = null;
					sql += sql_date + ",";
					ColumnsForQuery += columnName + ",";
					System.out.println(" " + temp_date);
					continue;
				}

				ColumnsForQuery += columnName + ",";
				/*
				 * if(columnName.equals("PIDNumber"))
				 * sql+=request.getParameter(columnName)+","; else
				 */
				sql += "'"
						+ request.getParameter(columnName).replace("'", "''")
						+ "',";
			}
			ColumnsForQuery += "status";
			// ColumnsForQuery=ColumnsForQuery.substring(0,
			// ColumnsForQuery.length()-1);

			System.out.println(columns);

			System.out.println(ColumnsForQuery);
			System.out.println(sql);
			sql += "'active'";
			query = "insert into at.dbo.ProjectDetails(" + ColumnsForQuery
					+ ") " + "values(" + sql + ")";
			System.out.println(query);
			sql_conn.stmt.executeUpdate(query);
			// sql_conn.conn.close();
			PrintWriter out = response.getWriter();

			int recordNo = 0;
			ResultSet rsno = sql_conn.stmt
					.executeQuery("select SNo from at.dbo.ProjectDetails where UpdatedBy= '"
							+ UpdatedBy + "' order by SNo desc");
			if (rsno.next()) {

				recordNo = rsno.getInt("SNo");

			}
			recordNo=0;

			sql_conn.conn.close();

			out.println("Thank you very much! A new project request has been recorded and Record no is "

					+ recordNo
					+ ". An email will be sent to the stakeholders. \nFor any further details please contact grt-support@cisco.com with"
					+ " record no as the reference");
			String Requester = request.getParameter("RequestedBy");
			String Assignee = request.getParameter("Assignee");
			String ServiceOwner = request.getParameter("ServiceOwner");
			System.out.println("assignee" + Assignee);
			System.out.println("ServiceOwner" + ServiceOwner);

			String textMessage = " New request has been created with Record No "

					+ +recordNo
					+ "\n\n"
					+ " URL: http://grt.cisco.com/Modify?sno="
					+ recordNo
					+ "\n"

					+ "	Created by : "
					+ UpdatedBy

					+ "\n"
					+ "	Requested by : "
					+ Requester
					+ "\n"
					+ "	Assigned to : "
					+ Assignee
					+ "\n"
					+ "	Service Owner / Program Manager : "
					+ ServiceOwner
					+ "\n\n\n"
					+"For any further details please contact grt-support@cisco.com with"
					+ " record no as the reference."
					+ "	This message is automatically generated by GSP Request Tracker \n"
					+ "**********************************************************************";

			String subToUser = "Project Created in Request Tracker with ID No:"
					+ recordNo;

			ArrayList<Address> cc = new ArrayList<Address>();
			cc.add(new InternetAddress(UpdatedBy + "@cisco.com"));
			//cc.add(new InternetAddress(Requester + "@cisco.com"));
			System.out.println("mailer list1" + cc);
			if (Assignee == null || Assignee == ""
					|| Assignee == "Enter Email ID")
				System.out.println("Assignee" + Assignee);
			else
				cc.add(new InternetAddress(Assignee + "@cisco.com"));

			if (ServiceOwner == "" || ServiceOwner == null
					|| ServiceOwner == "Enter Email ID")

				System.out.println("ServiceOwner" + ServiceOwner);
			else
				cc.add(new InternetAddress(ServiceOwner + "@cisco.com"));

			sendMail(cc, subToUser, textMessage);
			

			System.out.println("mailer list2" + cc);

			// out.println("Thank you very much! The information has been successfully registered in the system");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("mailer list ssss");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void modify(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws ServletException, IOException, MessagingException {
		String UName = (String) request.getSession().getAttribute("UName");
		boolean chkflg=chkrecordLockforUpdate( Integer.parseInt(request.getParameter("SNo")),"at.dbo.ProjectDetails",  UName);
		if (chkflg)
		{
		Mssql_connect sql_conn = null;

		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			//sql_conn = new Mssql_connect("10.105.217.240:1433", "ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			ResultSet rs = sql_conn.stmt
					.executeQuery("select * from at.dbo.ProjectDetails");
			ResultSetMetaData metaData = rs.getMetaData();

			int columnCount = metaData.getColumnCount();
			ArrayList<String> columns = new ArrayList<String>();
			String ColumnsForQuery = new String();
			String sql = new String();
			String query = new String();
			String columnName = null;
			String temp_date = null;
			session = (HttpSession) request.getSession(false);
			String UpdatedBy = (String) session.getAttribute("UName");
			String[] tokens = null;
			for (int i = 1; i < columnCount - 1; i++) {
				columnName = metaData.getColumnName(i);
				columns.add(columnName);
				System.out.println("Column Priyanka"+columnName);
				
				if (columnName != null && columnName.equals("status"))
					continue;
				
				if (columnName != null && columnName.equals("SNo"))
					continue;
				
				if (columnName != null && columnName.equals("RequestEntered"))
					continue;
				
				if (columnName != null && columnName.equals("ResourceEntered")) {
					if (request.getParameter("ResourceAsgnDate") != "") {
						System.out.println("request.getParameter"
											+ request.getParameter("ResourceAsgnDate")
											+ "chk1[ ");
						Date date = new Date();
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd");

						sql += columnName + "='" + sdf.format(date) + "',";
						System.out.println(" resource entered value is" + sdf.format(date));
					} else {
						System.out.println("else part");
					}

					continue;
				}
				
				

				if (columnName != null && columnName.equals("GDC")) {
					sql += columnName + "='" + request.getParameter("gdcval")
							+ "',";
					// ColumnsForQuery += columnName + ",";
					System.out.println("gdc value is"
							+ request.getParameter("gdcval"));
					continue;
				}

				if (columnName != null && columnName.equals("Fiscal")) {
					sql += columnName + "='"
							+ request.getParameter("Fiscal_Quarter") + " "
							+ request.getParameter("Fiscal_Year") + "',";
					continue;
				}
				if (columnName != null && columnName.equals("UpdatedBy")) {
					sql += columnName + "='" + UpdatedBy + "',";
					continue;
				}
				
				if (request.getParameter(columnName) == ""
						&& !columnName.contains("Date")) {
					sql += columnName + "='Incomplete',";
					continue;
				}
				if ((request.getParameter(columnName) == "" || request
						.getParameter(columnName) == null)
						&& !columnName.contains("Date")
						&& !columnName.contains("CreatedBy")) {
					sql += columnName + "='Incomplete',";
					continue;
				}

				if (columnName.equals("CreatedBy")) {
					System.out.println("inside");
					System.out.println("createdby");
					continue;
				}

				if (request.getParameter(columnName) != ""
						&& columnName.contains("Date")) {
					System.out.print(request.getParameter(columnName));
					tokens = request.getParameter(columnName).split("/");
					// temp_date = tokens[2]+"-"+tokens[0]+"-"+tokens[1];
					temp_date = tokens[2] + tokens[0] + tokens[1];
					java.util.Date date = null;
					String currentTime = null;
					try {

						if (columnName.equalsIgnoreCase("RequestRecvDate")) {
							temp_date = temp_date + " "
									+ request.getParameter("RequestRecvTime");
							date = new SimpleDateFormat("yyyyMMdd HH:mm")
									.parse(temp_date);
							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
									"yyyyMMdd HH:mm");
							currentTime = sdf.format(date);
							sql += columnName + "='" + currentTime + "'" + ",";
							System.out.println(" " + temp_date);
							continue;
						} else if (columnName
								.equalsIgnoreCase("FulfilmentDate")) {
							temp_date = temp_date + " "
									+ request.getParameter("FulfilTime");
							date = new SimpleDateFormat("yyyyMMdd HH:mm")
									.parse(temp_date);
							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
									"yyyyMMdd HH:mm");
							currentTime = sdf.format(date);
							sql += columnName + "='" + currentTime + "'" + ",";
							System.out.println(" " + temp_date);
							continue;
						} else {
							date = new SimpleDateFormat("yyyyMMdd")
									.parse(temp_date);
							System.out.print("java date" + date);
							java.sql.Date sql_date = new java.sql.Date(
									date.getTime());
							System.out.print("sql date" + sql_date);
							sql += columnName + "='" + sql_date + "'" + ",";
							System.out.println(" " + temp_date);
							continue;
						}
					} catch (java.text.ParseException e) {
						e.printStackTrace();
					}
				} else if ((request.getParameter(columnName) == "" || request
						.getParameter(columnName) == null)
						&& columnName.contains("Date")) {
					java.sql.Date sql_date = null;
					sql += columnName + "=" + sql_date + ",";
					System.out.println(" " + temp_date);
					continue;
				}
				System.out.println(" " + columnName);
				ColumnsForQuery += columnName + ",";
				/*
				 * if(columnName.equals("PIDNumber"))
				 * sql+=request.getParameter(columnName)+","; else
				 */
				sql += columnName + "='" + request.getParameter(columnName)
						+ "',";
			}

			// ColumnsForQuery=ColumnsForQuery.substring(0,
			// ColumnsForQuery.length()-1);

			System.out.println(sql);
			sql += "status='active'";
			query = "update at.dbo.ProjectDetails set " + sql + " where SNo="
					+ Integer.parseInt(request.getParameter("SNo"));
			
			ClearRecordLock(Integer.parseInt(request.getParameter("SNo")),
					"at.dbo.ProjectDetails");
			
			System.out.println(query);
			sql_conn.stmt.executeUpdate(query);

			PrintWriter out = response.getWriter();
			out.println("Thank you very much! The information has been successfully updated in the system for record no "
					+ Integer.parseInt(request.getParameter("SNo"))
					+ ". An email will be sent to the \n stakeholders. For any further details please contact grt-support@cisco.com with"
					+ " record no as the reference.");

			String createdBy = null;
			ResultSet rsno = sql_conn.stmt
					.executeQuery("select CreatedBy from at.dbo.ProjectDetails where SNo="
							+ Integer.parseInt(request.getParameter("SNo")));
			if (rsno.next()) {

				createdBy = rsno.getString("CreatedBy");

				System.out.println(" createdBy" + createdBy);

			}
			sql_conn.conn.close();

			String Requester = request.getParameter("RequestedBy");
			String Assignee = request.getParameter("Assignee");
			String ServiceOwner = request.getParameter("ServiceOwner");
			String textMessage = " Record No "

					+ Integer.parseInt(request.getParameter("SNo"))
					+ " is updated."
					+ "\n"
					+ " URL : http://grt.cisco.com/Modify?sno="
					+ Integer.parseInt(request.getParameter("SNo"))
					+ "\n"
					+ "	Created By : "
					+ createdBy
					+ "\n"
					+ "	Updated By : "
					+ UpdatedBy

					+ "\n"
					+ "	Requested By : "
					+ Requester
					+ "\n"
					+ "	Assigned to : "
					+ Assignee
					+ "\n"
					+ "	Service Owner / Program Manager : "
					+ ServiceOwner
					+ "\n\n\n"
                     +"For any further details please contact grt-support@cisco.com with"
					+ " record no as the reference."
					+ "	This message is automatically generated by GSP Request Tracker \n"
					+ "**********************************************************************";

			String subToUser = "Project updated in Request Tracker with ID No:"
					+ Integer.parseInt(request.getParameter("SNo"));

			ArrayList<Address> cc = new ArrayList<Address>();
			cc.add(new InternetAddress(createdBy + "@cisco.com"));
			cc.add(new InternetAddress(UpdatedBy + "@cisco.com"));
			//cc.add(new InternetAddress(Requester + "@cisco.com"));
			if (Assignee == null || Assignee == ""
					|| Assignee == "Enter Email ID" || Assignee == "Incomplete")
				System.out.println("Assignee" + Assignee);
			else
				cc.add(new InternetAddress(Assignee + "@cisco.com"));

			if (ServiceOwner == "" || ServiceOwner == null
					|| ServiceOwner == "Enter Email ID" || ServiceOwner == "Incomplete")

				System.out.println("ServiceOwner" + ServiceOwner);
			else
				cc.add(new InternetAddress(ServiceOwner + "@cisco.com"));
			System.out.println("ServiceOwner3333" + ServiceOwner);
			System.out.println("Assignee44" + Assignee);
			System.out.println("CC" + cc);
			sendMail(cc, subToUser, textMessage);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.println("Record is currently in access by some other user");
		}
	}

	void sendMail(ArrayList<Address> To, String Subject, String textMessage)
			throws MessagingException {

		Address[] tolist = To.toArray(new Address[To.size()]);
		String from = "grt-support@cisco.com";

		String host = "outbound.cisco.com";
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", host);
		Session session = Session.getDefaultInstance(properties);
		for (int i = 0; i < tolist.length; i++) {
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(from));
				// message.addRecipients(Message.RecipientType.TO, tolist);
				message.addRecipient(Message.RecipientType.TO, tolist[i]);

				message.setSubject(Subject);
				message.setText(textMessage);
				System.out.println("chk");
				Transport.send(message);
				System.out.println("Sent message successfully chkk");
			} catch (SendFailedException e) {
				e.printStackTrace();
				System.out.println("validchk");
				System.out.println("invalid addresses"
						+ e.getInvalidAddresses());
				System.out.println("valid sent" + e.getValidSentAddresses());
				System.out
						.println("valid unsent" + e.getValidUnsentAddresses());

			} catch (Exception mex) {
				mex.printStackTrace();
			}
		}
	}
	
	public void ClearRecordLock(int Sno, String TableName) {
		Mssql_connect sql_conn = null;
		Statement s;

		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			sql_conn = new Mssql_connect(db_ip+":"+db_port, db_username, db_password);

			s = sql_conn.conn.createStatement();
			String sql = "Delete from at.dbo.RecordLockTable where RecordId="
					+ Sno + " and TableName='" + TableName + "'";
			ResultSet rs = s.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public boolean chkrecordLockforUpdate(int Sno, String TableName, String UName)
	{
		Mssql_connect sql_conn = null;
		Statement s;
		boolean chkflg=false;
		
		
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			sql_conn = new Mssql_connect(db_ip+":"+db_port, db_username, db_password);

			s = sql_conn.conn.createStatement();
			

			ResultSet rs = s
					.executeQuery("select * from at.dbo.RecordLockTable  where RecordId='"
							+ Sno + "' and TableName='" + TableName + "' and UserId='" + UName + "'");
			System.out.println("SNO is" + Sno);
			if (rs.next()) {
				chkflg=true;
				
				}
			else
				chkflg=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chkflg;
	
}
	}
