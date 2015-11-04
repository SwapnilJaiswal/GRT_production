package sat.tool;

import java.io.IOException;
import javax.naming.NamingException;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CEC_Login
 */
@WebServlet(description = "CEC Login handler class", urlPatterns = { "/CEC_Login" })
public class CEC_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CEC_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getSession().getAttribute("UName") != null)
		{
			System.out.println(request.getSession().getAttribute("UName"));
			response.sendRedirect("./main.jsp");
			return;
		}
		request.getParameter("username");		
		RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/Login.jsp");
		rd.forward(request, response);
		return;
			
		}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String UserName = request.getParameter("login");
	String Password = request.getParameter("password");
	String Group = request.getParameter("group");
	
	System.out.println(Group);
	
	if (UserName.isEmpty() || Password.isEmpty())
	{
		request.setAttribute("Message", "Invalid User Name or Password...");
		RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/Login.jsp");
		rd.forward(request, response);
		return;
	}
	
	boolean a = fetchContext(UserName,Password,1);
	
	if (a == true )
	{
		System.out.println(UserName);
		request.getSession().setAttribute("UName", UserName);
		// fixing time out issue
		request.getSession().setMaxInactiveInterval(-1);
		if(Group.equalsIgnoreCase("Architecture"))
		response.sendRedirect("./main.jsp");
		else if(Group.equalsIgnoreCase("Competency"))
		response.sendRedirect("./main_competency.jsp");
	
		return;
	}
	else
	{
		request.setAttribute("Message", "Invalid UserName or Password...");
	}
	
	RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/Login.jsp");
	rd.forward(request, response);
	return;
	

	}
	
	private boolean fetchContext(String userID, String pwd, int auth) {
		
		String initCtx = "com.sun.jndi.ldap.LdapCtxFactory";
		String ldapHost = null;
		String baseDn = null;
		DirContext ctx = null;
		try {
			ldapHost = "ldap://ldap.cisco.com:389/ou=active,ou=employees,ou=people,o=cisco.com";
			baseDn = "ou=active,ou=employees,ou=people,o=cisco.com";
			
			//ldapHost = "sldap://ds.cisco.com:636/ou=employees,ou=cisco users,dc=cisco,dc=com";
			//baseDn="ou=employees,ou=cisco users,dc=cisco,dc=com";
			
			Properties env = new Properties();
			env.put(Context.INITIAL_CONTEXT_FACTORY, initCtx);
			env.put(Context.PROVIDER_URL, ldapHost);
			env.put(Context.SECURITY_AUTHENTICATION, "simple");

			// In development environments we would still use ldap rather ldaps
			if (ldapHost.indexOf("ldaps:") != -1
					|| ldapHost.indexOf("636") != -1) {
				System.out.println(" Connection over secure LDAP ");
				env.put(Context.SECURITY_PROTOCOL, "ssl");
			}
			if (auth == 1) {
				env.put(Context.SECURITY_PRINCIPAL, "uid=" + userID + ","
						+ baseDn);
				env.put(Context.SECURITY_CREDENTIALS, pwd);
			}
			ctx = new InitialDirContext(env);
		}  catch (NamingException e) {
			System.out.println("Inside naming exception......");
			return false;
		}
		catch (Exception ex)
		{
			System.out.println("Unknown Exception...,");
			return false;
		}
		
		System.out.println("Ldap returning true value.....");
		return true;
	}
}

		

	
	


