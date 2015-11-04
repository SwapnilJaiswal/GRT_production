package sat.tool;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import au.com.bytecode.opencsv.*;

/**
 * Servlet implementation class Get_Data
 */
@WebServlet("/Get_Data_Date")
public class Get_Data_Date extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**Added to read DB details from properties file*/
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
    /****/  
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Get_Data_Date() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String UName = (String) request.getSession().getAttribute("UName");
		if(UName==null)
		{
			PrintWriter out = response.getWriter();
			out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
			return;
		}
		Mssql_connect sql_conn = null;
		String Query = new String();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		//EDIT: Sourabh Start
		String exportQuery = request.getParameter("export");
		//EDIT: Sourabh End
		java.util.Date date = null;
		String filename="c:\\report.xls";
				
		if(startDate==null || startDate=="" || endDate==null || endDate==""){			
		//EDIT: Sourabh Start
        if(exportQuery==null || exportQuery=="") {
			Query = "select * from at.dbo.ProjectDetails";
			}
			else {
				Query = exportQuery;
			}
		}
		//EDIT: Sourabh End
		else
		{
			
			try {
				date = new SimpleDateFormat("MM/dd/yyyy").parse(startDate);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			java.sql.Date sql_start_date = new java.sql.Date(date.getTime());
			try {
				date = new SimpleDateFormat("MM/dd/yyyy").parse(endDate);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			java.sql.Date sql_end_date = new java.sql.Date(date.getTime());
			//EDIT: Sourabh Start
			if(exportQuery==null || exportQuery=="") {
			Query = "select * from at.dbo.ProjectDetails where PrjctStartDate between '"
				+ sql_start_date + "' and '" + sql_end_date + "' and status='active'";
			}
			else {
				Query = exportQuery + " and PrjctStartDate between '" + sql_start_date + "' and '" + sql_end_date + "' and status='active'";
			}
			//EDIT: Sourabh End
			System.out.println(sql_start_date + "  \t " + sql_end_date);
		}
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
			ResultSet rs = (ResultSet) sql_conn.stmt.executeQuery(Query);
			
			ServletConfig SC = getServletConfig();
			ServletContext sc = SC.getServletContext();
			HashMap<String,String> Headers = new HashMap<String,String>();
			ResultSetMetaData rsmd = rs.getMetaData();
			int ColumnCount = rsmd.getColumnCount();
			while(ColumnCount>0)
			Headers.put(rsmd.getColumnName(ColumnCount), (String) sc.getInitParameter(rsmd.getColumnName(ColumnCount--)));
			
			ResultSetToExcel resultSetToExcel = new ResultSetToExcel(rs, "Employee List", Headers);
			resultSetToExcel.generate(new File(filename));
			sql_conn.conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			 
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\""); 
		download(response,filename); 

	}
	private void download(HttpServletResponse response,String filename) 
	{ 
		BufferedInputStream input = null;
	    BufferedOutputStream output = null;

	    try {
	        try {
				input = new BufferedInputStream(new FileInputStream(filename));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        output = new BufferedOutputStream(response.getOutputStream());

	        byte[] buffer = new byte[8192];
	        for (int length = 0; (length = input.read(buffer)) > 0;) {
	            output.write(buffer, 0, length);
	        }
	    } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
	        if (output != null) try { output.close(); } catch (IOException ignore) {}
	        if (input != null) try { input.close(); } catch (IOException ignore) {}
	    }
	}
}
