package deprecated;

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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sat.tool.Mssql_connect;
import au.com.bytecode.opencsv.*;

import au.com.bytecode.opencsv.CSVReader;

/**
 * Servlet implementation class Get_Data
 */
@WebServlet("/csv")
public class WritetoCSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WritetoCSV() {
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
		CSVWriter writer = new CSVWriter(new FileWriter("c:\\report.csv"));
		String Query = new String();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		Mssql_connect sql_conn = null;
		
		if(startDate==null || startDate=="" || endDate==null || endDate=="")
			Query = "select * from at.dbo.ProjectDetails";
		else
		{
			java.util.Date date = null;
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

				
			Query = "select * from at.dbo.ProjectDetails where PrjctStartDate between '"
				+ sql_start_date + "' and '" + sql_end_date + "' and status='active'";
			System.out.println(sql_start_date + "  \t " + sql_end_date);
		}
		try {
			sql_conn = new Mssql_connect("10.105.190.102:1433", "ATUser",
					"Cisco@123");
			ResultSet rs = (ResultSet) sql_conn.stmt.executeQuery(Query);
			
			writer.writeAll(rs, true);
			writer.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String filename="c:\\employees.xls";	 
		response.setContentType("text/comma-separated-values"); 
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\""); 
		download(response); 

	}
	private void download(HttpServletResponse response) 
	{ 
		BufferedWriter ow = null; 
		try 
		{ 
			BufferedReader br = new BufferedReader(new FileReader("c:\\employees.xls")); 
			String line = br.readLine(); 
			ow = new BufferedWriter(response.getWriter()); 
			while (line != null) 
			{ 
				ow.write(line); 
				ow.newLine(); 
				line = br.readLine(); 
			} 
			br.close();
			ow.flush(); 
		} 
		catch (Exception exception) 
		{ 
			exception.printStackTrace(); 
		} 
		finally 
		{ 
			if (ow != null) 
			{ 
				try 
				{ ow.close(); 
				} 
			catch (IOException ioe) 
			{ ioe.printStackTrace(); 
			} 
		} 
	}
		
	}
}

