package deprecated;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import sat.tool.Mssql_connect;

/**
 * Servlet implementation class Import
 */
@WebServlet("/Import_test")
public class Import extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*
     * @see HttpServlet#HttpServlet()
     */
    public Import() {
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
		
			HttpSession session = (HttpSession) request.getSession(false);
			String UName = (String) request.getSession().getAttribute("UName");
			int DBColumnCount =0,ExcelCellCount=0;
			/*if(UName==null)
			{
				PrintWriter out = response.getWriter();
				out.println("<h3>Your Session has been expired. Kindly login to the portal!<h3>");
				return;
			}*/
			ArrayList<String> columnsList = new ArrayList<String>();
			Mssql_connect sql_conn = null;
			String query = null;
			String ColumnsForQuery = new String();
			try {
				sql_conn = new Mssql_connect("10.105.190.102:1433","ATUser","Cisco@123");
				ResultSet rs = sql_conn.stmt.executeQuery("select * from at.dbo.ProjectDetails");
				ResultSetMetaData metaData = rs.getMetaData();
				int columnCount = metaData.getColumnCount();
				
				DBColumnCount=columnCount-2;
				String columnName = null;
				String temp_date = null;
				
				String[] tokens = null;
				for(int i=1;i<columnCount-2;i++)
				{
					columnName = metaData.getColumnName(i);
					columnsList.add(columnName);					
					ColumnsForQuery+=columnName+",";
				}	
				sql_conn.stmt.executeUpdate("delete from at.dbo.ProjectDetails");
				ColumnsForQuery=ColumnsForQuery + "UpdatedBy,status";
				
				//ColumnsForQuery = ColumnsForQuery.substring(0, ColumnsForQuery.length()-1);
				System.out.println(ColumnsForQuery);
				
				PrintWriter out = response.getWriter();
				//out.println("Thank you very much! The information has been successfully registered in the system");
							
							
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			try
			{
				ServletContext sc = getServletContext();
				String Filename = (String) sc.getAttribute("FileName");
				
			FileInputStream file = new FileInputStream(new File(
					Filename));

			// Get the workbook instance for XLS file
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			// Get first sheet from the workbook
			XSSFSheet sheet = workbook.getSheetAt(0);
			int columnCount = sheet.getRow(0).getLastCellNum();
			String column = null;

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();
			Row row = rowIterator.next();
			while (rowIterator.hasNext()) {

				row = rowIterator.next();
				int count = columnCount;
				ExcelCellCount = row.getLastCellNum();
				System.out.println(row.getLastCellNum()+"\t"+row.getPhysicalNumberOfCells());
				// For each row, iterate through each columns
				Iterator<Cell> cellIterator = row.cellIterator();
				Iterator<String> columnNameIterator = columnsList.iterator(); 
				Cell cell = null;
				String sql = new String();
				if (cellIterator.hasNext())
					cell = cellIterator.next();
				if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
					System.out.print("");
				// System.out.print(row.getCell(0).getNumericCellValue()+"\t");
				else if (cell.getCellType() == Cell.CELL_TYPE_STRING)
					System.out.print("");// System.out.print(row.getCell(0).getStringCellValue()+"\t");
				else 
				{
					System.out.println("done");
					response.getWriter().println("You have succesfully uploaded the file");
					return;// System.out.print(row.getCell(0).getBooleanCellValue()+"\t");
				}
				

				while (cellIterator.hasNext() && columnNameIterator.hasNext() && count >= 0) {

					cell = cellIterator.next();
					column = columnNameIterator.next();
					count--;

					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BOOLEAN:
						System.out.print(cell.getBooleanCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (HSSFDateUtil.isCellDateFormatted(cell) && column.contains("Date")) {
							System.out.print(cell.getDateCellValue() + "\t\t");
							/*if(column.equalsIgnoreCase("RequestRecvDate"))
							{
								java.util.Date date = null;
								String currentTime = null;
								try {
									date = new SimpleDateFormat("yyyyMMdd HH:mm").parse(cell.getDateCellValue().toString());
								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd HH:mm");
								currentTime = sdf.format(date);
								sql = sql + "'" + currentTime +"',";
							}
							else*/
							sql = sql + "'" + new java.sql.Date(cell.getDateCellValue().getTime())+"',";
							break;
						}
						else
						{
						System.out.print((int) cell.getNumericCellValue()
								+ "\t\t");
						sql = sql + "'" + Integer.toString((int)cell.getNumericCellValue())+"',";
						break;
						}
					case Cell.CELL_TYPE_STRING:
						if(column.contains("Date"))
						{
							java.sql.Date sql_date= null;
							sql = sql + sql_date + ",";
						}
						else
							sql = sql + "'" + cell.getStringCellValue() +"',";
						System.out.print(cell.getStringCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_BLANK:
						System.out.print("blank\t\t");
						if(column.contains("Date"))
						{
							java.sql.Date sql_date= null;
							sql = sql + sql_date + ",";
						}
						else
							sql = sql + "'Incomplete',";
						break;
					case Cell.CELL_TYPE_FORMULA:
						//System.out.print(cell.getCellFormula());
						switch (cell.getCachedFormulaResultType()) {
						case Cell.CELL_TYPE_NUMERIC:
							sql = sql + "'" + Integer.toString((int)cell.getNumericCellValue()*24)+"',";
							System.out.print((int) cell.getNumericCellValue()* 24 + "\t\t");
							break;
						case Cell.CELL_TYPE_ERROR:
							sql = sql + "'Incomplete',";
							System.out.print("blah blah\t\t");
							break;
						}
					}
				}
				if(DBColumnCount>ExcelCellCount)
				{
					for(int i=0;i<(DBColumnCount-ExcelCellCount);i++)
						sql = sql+"'Incomplete',";
				}
				
				try {
					sql = sql +"'"+ UName + "','active'";
					System.out.println("\n"+sql);
					query = "insert into at.dbo.ProjectDetails("+ColumnsForQuery+") "+"values("+sql+")";
					//System.out.println(query);
					sql_conn.stmt.executeUpdate(query);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("");
			}
			try {
				sql_conn.stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("done");
			file.close();
			FileOutputStream out = new FileOutputStream(new File(
					Filename));
			workbook.write(out);
			out.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
