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
import javax.servlet.RequestDispatcher;
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
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
	String cecId = "";
	String name = "";
	String title ="";
	String org = "";
	String mgrId = "";
	String mgrName = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		
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
		System.out.println("Inbside signup");
		 cecId = request.getParameter("cecId");
		 name = request.getParameter("name");
		 title = request.getParameter("title");
		 org = (String) request.getParameter("org");
		 mgrId = request.getParameter("mgrId");
		 mgrName = request.getParameter("mgrName");
		
		//System.out.println("cecId"+cecId);
	
		
			insert(request, response);
		
	}

	public void insert(HttpServletRequest request,
			HttpServletResponse response)
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
			String insQ="INSERT INTO [AT].[dbo].[Users] ([Status],[CECID],"
			+ "[Name],[Title],[Organization],[ManagerID],[Manager],[AccessID],[Location],"
			+ "[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn]) VALUES "
			+ "('Active','"+cecId+ "','"+name+ "','"+title+ "','"+org+"','"+mgrId+"','"+mgrName+"','','','','','','')";
			System.out.println(insQ);
			Statement s= sql_conn.conn.createStatement();
			s.execute(insQ);
			request.setAttribute("sign", "success");
			RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/AfterSign.jsp");
			rd.forward(request, response);
			
			//query = "insert into at.dbo.ProjectDetails(" + ColumnsForQuery
					
			
			//sql_conn.stmt.executeUpdate(query);
			

			// out.println("Thank you very much! The information has been successfully registered in the system");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			request.setAttribute("sign", "fail");
			RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/AfterSign.jsp");
			rd.forward(request, response);
			
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
