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
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import sat.tool.Mssql_connect;
import sat.tool.PropertiesReader;

@WebServlet("/HardwarePids")
public class HardwarePids extends HttpServlet{
	
	/**Added to read DB details from properties file*/
	private String db_ip;
	private String db_port;
	private String db_username;
	private String db_password;
	private Properties props;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String UName = (String) session.getAttribute("UName");		
		if(UName==null)
		{
			PrintWriter out = response.getWriter();
			out.println("<h3>Your Session has been expired. Please Login to the Portal</h3>");
			return;
		}
		
		
		Mssql_connect sql_conn = null;
		ResultSet rsPids = null;
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			
			String pidsQry = "select PID from at.dbo.existing_hardware";;
	         
	         ArrayList<String> arrPids = null;
	         	         
				 if(session!=null && session.getAttribute("HardwarePids")==null) {
		         rsPids = sql_conn.stmt.executeQuery(pidsQry);
		         arrPids = new ArrayList<String>();
		         while(rsPids.next()){
		        	 arrPids.add(rsPids.getString("PID"));
		         }
		         session.setAttribute("HardwarePids", arrPids);
		        
			}
			
				
			RequestDispatcher rd=request.getRequestDispatcher("competency/enter_details.jsp");
			rd.forward(request, response);
			
			return;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(sql_conn !=null)
					sql_conn.conn.close();
				if(rsPids != null)
					rsPids.close();
			}
			catch(SQLException e)
			
			{
				e.printStackTrace();
			}
			
		}
		
	}

}
