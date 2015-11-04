package sat.tool.competency;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sat.tool.Mssql_connect;
import sat.tool.PropertiesReader;

/**
 * Servlet implementation class View
 */
@WebServlet("/AuditTrailHandler")
public class AuditTrailHandler extends HttpServlet {
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
    public AuditTrailHandler() {
        super();



    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String UName = (String) request.getSession().getAttribute("UName");
		if(UName==null)
		{
			UName="cisco";
		}
		
		Mssql_connect sql_conn = null;
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
			int SNo = Integer.parseInt(request.getParameter("SNo"));
			int SNo2=SNo+1;
			System.out.println("IN AUDIT_TRAIL_HANDLER. Query run is: \nselect * from at.dbo.ProjectDetails_Competency3 where SNo="+SNo2+" order by version asc");
			ResultSet rs = sql_conn.stmt.executeQuery("select * from at.dbo.ProjectDetails_Competency3 where SNo="+SNo2+" order by version asc");
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1;i<metaData.getColumnCount()+1;i++)
				System.out.print(metaData.getColumnName(i)+"\t");
			request.setAttribute("metaData", metaData);
			request.setAttribute("resultset",rs);
			//System.out.println(rs);
			
			//sql_conn.conn.close();
			
			request.setAttribute("temp", temp);
			RequestDispatcher rd=request.getRequestDispatcher("competency/AuditTrailDisplay.jsp");
			rd.forward(request, response);
			System.out.println("\n"+"Display Done");
			try{
				sql_conn.conn.close();
				rs.close();
			}
			catch(SQLException e)
			
			{
				e.printStackTrace();
			}
			
			return;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
