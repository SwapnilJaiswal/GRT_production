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
 * Servlet implementation class Get_Data
 */
@WebServlet("/Get_Data")
public class Get_Data extends HttpServlet {
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
    public Get_Data() {
        super();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Mssql_connect sql_conn = null;
		
		try {
		//	sql_conn = new Mssql_connect("10.105.190.240:1433","ATUser","Cisco@123");
			new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			
			
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(sql_conn.stmt.executeQuery("select distinct Level1 from AT.dbo.CSI;"));
			sql_conn.conn.close();
			
			request.setAttribute("Skill_Level1", temp);
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/QueryForm.jsp");
			rd.forward(request, response);

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//Fill Skill_Level2 with Ajax Call 
		
		String Query =new String();
		String Returned_Value = "";
		
		if (request.getParameter("Skill_Level1_Ajax") != null && request.getParameter("Skill_Level1_Ajax").equals("true")){
			
			Query = "select distinct Level2 from AT.dbo.CSI where Level1='" + request.getParameter("Skill_Level1") + "';";
			
		}
		
		if (request.getParameter("Skill_Level2_Ajax") != null && request.getParameter("Skill_Level2_Ajax").equals("true")){
			
			Query = "select distinct Level3 from AT.dbo.CSI where Level1='" + request.getParameter("Skill_Level1")  + "' and Level2='" + request.getParameter("Skill_Level2") + "';";
			
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
			//	sql_conn = new Mssql_connect("10.105.190.102:1433","ATUser","Cisco@123");
				new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
				ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(sql_conn.stmt.executeQuery(Query));
				sql_conn.conn.close();
			
			for (int i=0; i < temp.size(); i++){
				
				Returned_Value = Returned_Value + temp.get(i).get(0) + ",";
				
			}
			
			response.getWriter().write(Returned_Value);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
