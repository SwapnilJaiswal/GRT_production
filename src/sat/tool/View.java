package sat.tool;

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

import org.apache.commons.lang.StringUtils;

/**
 * Servlet implementation class View
 */
@WebServlet("/View")
public class View extends HttpServlet {
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
    public View() {
        super();

		
		
        // TODO Auto-generated constructor stub
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
			PrintWriter out = response.getWriter();
			out.println("<h3>Your Session has been expired. Kindly login to the portal!</h3>");
			return;
		}
		
		String Query = "select * from at.dbo.ProjectDetails  where UpdatedBy='"+ UName +"' order by SNo desc";
		ArrayList<String> advancedSearchParameters = new ArrayList<String>();
		int what;
		try {
			what = Integer.parseInt(request.getParameter("w"));
		} catch (NumberFormatException e1) {
			what=0;}
		if(what==1)
			Query = "select * from at.dbo.ProjectDetails order by SNo desc";
		else if(what==2)
		{
			String gspmanager = request.getParameter("gspmanager").trim();
			String pidoperator = request.getParameter("pidoperator");
			String pid = request.getParameter("pid").trim();
			String fiscaloperator = request.getParameter("pidoperator");
			String fiscal = request.getParameter("fiscal").trim();
			
			if(!gspmanager.contentEquals("None"))
					advancedSearchParameters.add("GspManager='" + gspmanager + "'");
			if(pid!="")
					advancedSearchParameters.add("PIDNumber"+pidoperator+"'"+pid+"'");
			if(fiscal!="")
				advancedSearchParameters.add("Fiscal"+fiscaloperator+"'"+fiscal+"'");
		
			String joined = StringUtils.join(advancedSearchParameters.toArray(), " and ");
			if(joined!="")
			{	Query = "Select * from at.dbo.ProjectDetails where ";
				Query = Query + joined;
			}
			
		}
		System.out.println(Query);
		
		Mssql_connect sql_conn = null;
		try {
			/**Added to read DB details from properties file*/
			
			props = PropertiesReader.readProperties();
			db_ip = props.getProperty("GRT_DB_IP");
			db_port = props.getProperty("GRT_DB_PORT");
			db_username = props.getProperty("GRT_DB_USERNAME");
			db_password = props.getProperty("GRT_DB_PASSWORD");
			
		//sql_conn = new Mssql_connect("10.105.217.240:1433","ATUser","Cisco@123");
			sql_conn=new Mssql_connect(db_ip+":"+db_port, db_username, db_password);
			ResultSet rs = sql_conn.stmt.executeQuery(Query);
			ArrayList<ArrayList<Object>> temp = sql_conn.Results2Array(rs);
			ResultSetMetaData metaData = rs.getMetaData();
			for(int i=1;i<metaData.getColumnCount()+1;i++)
				System.out.print(metaData.getColumnName(i)+"\t");
			request.setAttribute("metaData", metaData);
			request.setAttribute("resultset",rs);
			//EDIT: Sourabh Start
			request.setAttribute("exportQuery",Query);
			//EDIT: Sourabh End
			//System.out.println(rs);
			
			//sql_conn.conn.close();
			
			request.setAttribute("temp", temp);
			RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
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
