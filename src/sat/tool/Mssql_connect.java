package sat.tool;
import java.sql.*;
import java.util.ArrayList;

public class Mssql_connect {

	
	public Statement stmt=null;// = conn.createStatement();
    public Connection conn=null;
	public Mssql_connect(String host,String username,String password) throws SQLException{
		DB db = new DB();
//		conn=db.dbConnect("jdbc:sqlserver://10.105.190.102:1433;"+
 //       	   "databaseName=RequestCenter;user=abhinav;password=cisco@123;"
//, "abhinav", "cisco@123");
		conn=db.dbConnect("jdbc:sqlserver://"+host+";"+
        	   "databaseName=AT;", username, password);		
        stmt = conn.createStatement();
        //ResultSet rs = stmt.executeQuery( "SELECT * FROM dbo.products;" ) ;               
	}
	
    public ArrayList<ArrayList<Object>> Results2Array(ResultSet rs) throws SQLException {
        ResultSetMetaData metaData = rs.getMetaData();
        int columns = metaData.getColumnCount();

        ArrayList<ArrayList<Object>> al = new ArrayList<ArrayList<Object>>();

        while (rs.next()) {
            ArrayList<Object> record = new ArrayList<Object>();

            for (int i = 1; i <= columns; i++) {
                Object value = rs.getObject(i);
                record.add(value);
            }
            al.add(record);
        }
        return al;
    }
    
    public ArrayList<String> getColumnNames(ResultSet rs) throws SQLException{
    	ResultSetMetaData metaData = rs.getMetaData();
    	ArrayList<String> columnNames = new ArrayList<String>();
    	int count = metaData.getColumnCount();
    	for(int i=1;i<=count;i++)
    	{
    		columnNames.add(metaData.getColumnName(i));
    	}
    	return columnNames;
    }
}


class DB{
    public  Connection dbConnect(  String db_connect_string, 
                            String db_userid, 
                            String db_password){
        try{
        Class.forName( "com.microsoft.sqlserver.jdbc.SQLServerDriver" );
            Connection conn = DriverManager.getConnection(
                            db_connect_string, 
                        db_userid, 
                        db_password);
            return conn;
        }
        catch( Exception e ){
            e.printStackTrace();
        }
        return null;
    }
   
};
