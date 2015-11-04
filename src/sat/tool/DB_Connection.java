package sat.tool;

import java.sql.*;
import javax.sql.*;

public class DB_Connection{

public ResultSet P_rs;
	
public void Connect() throws Exception{

	System.out.println("Inside connect class");
	
	String userName = "RCUser";
	String password = "Cisco@123";

	String url = "jdbc:sqlserver://10.105.217.240:1433;databaseName=RequestCenter;";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(url, userName, password);	
	
	System.out.println("After Get connection....");
	Statement Stmt = conn.createStatement();
	ResultSet rs = Stmt.executeQuery("Select * from SiOrgVDC");
	P_rs = rs;
	//conn.close();
	return ;
	
/*

while (rs.next()) {
String a = rs.getString("Name");
System.out.println(a);
} //end while

conn.close();
*/
}

}  //end class