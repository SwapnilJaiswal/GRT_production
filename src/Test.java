

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.*;
import sat.tool.Mssql_connect;

	public class Test {
		
		public static void main(String[] x)
		{
			java.util.Date date = null;
			try {
				date = new SimpleDateFormat("yyyyMMdd HH:mm").parse("20130812 02:30");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(date);
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd HH:mm");
			String currentTime = sdf.format(date);
			
			System.out.println(currentTime);
			Mssql_connect sql_conn = null;
			try {
				sql_conn = new Mssql_connect("10.105.190.102:1433","ATUser","Cisco@123");
				sql_conn.stmt.executeUpdate("insert into dbo.Table_2(datetime) values('"+currentTime+"')");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}

	}
}
