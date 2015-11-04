package sat.tool.competency;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import sat.tool.Mssql_connect;
import sat.tool.PropertiesReader;

/**
 * Servlet implementation class View
 */
@WebServlet("/GetAssignee")
@MultipartConfig

public class GetAssignee extends HttpServlet {
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
    public GetAssignee() {
        super();


        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Mssql_connect sql_conn = null;
		
		 JSONObject js_obj = new JSONObject();
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
			ResultSet rs = sql_conn.stmt.executeQuery("select CECID,Name from at.dbo.Users");
			ResultSetMetaData metaData = rs.getMetaData();
			ArrayList<String> arr = new ArrayList<String>();
	        while (rs.next()) {
	           arr.add(rs.getString("CECID")+","+rs.getString("Name"));
	           //System.out.println(arr.get(arr.size()-1));
	        }
	         js_obj.put("Assignees", arr);
		}catch(Exception e){
			
			System.out.println(e);
		}
		response.getWriter().println(js_obj); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}

}
