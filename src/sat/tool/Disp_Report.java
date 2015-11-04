package sat.tool;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Disp_Report
 */
@WebServlet("/Disp_Report")
public class Disp_Report extends HttpServlet {
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
    public Disp_Report() {
        super();
	
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/Report.jsp");
		rd.forward(request, response);
		return;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public String Print_Log(String s){
		System.out.println(s);
		return s;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String Level1_Skill = (String) request.getParameter("Level1");
		String Level2_Skill = (String) request.getParameter("Level2");
		String Level3_Skill = (String) request.getParameter("Level3");
		
		String Skill_Hier = "%" + Level1_Skill + "->" + Level2_Skill + "->" + Level3_Skill +"%";
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
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(sql_conn.stmt.executeQuery(
					Print_Log("SELECT * from AT.dbo.ATCSI where [Skill Hier] like '"+ Skill_Hier + "';") 
					));
			
			sql_conn.conn.close();
			
			request.setAttribute("temp", temp);
			RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/Report.jsp");
			rd.forward(request, response);
			return;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
