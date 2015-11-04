package sat.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class Import
 */
@WebServlet("/Import_backup")
public class Import_backup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Import_backup() {
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
		try {

			FileInputStream file = new FileInputStream(new File(
					"C:\\Master_Sheet_Tools_Automation.xlsx"));

			// Get the workbook instance for XLS file
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			// Get first sheet from the workbook
			XSSFSheet sheet = workbook.getSheetAt(0);
			int columnCount = sheet.getRow(0).getLastCellNum();

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();
			Row row = rowIterator.next();
			while (rowIterator.hasNext()) {
				
				row = rowIterator.next();
				
				int count = columnCount;
				// For each row, iterate through each columns
				Iterator<Cell> cellIterator = row.cellIterator();
				Cell cell = null;
				if (cellIterator.hasNext())
					cell = cellIterator.next();
				if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
					System.out.print("");
				// System.out.print(row.getCell(0).getNumericCellValue()+"\t");
				else if (cell.getCellType() == Cell.CELL_TYPE_STRING)
					System.out.print("");// System.out.print(row.getCell(0).getStringCellValue()+"\t");
				else {
					System.out.println("done");
					return;// System.out.print(row.getCell(0).getBooleanCellValue()+"\t");
				}

				while (cellIterator.hasNext() && count >= 0) {
					
					cell = cellIterator.next();
					count--;

					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BOOLEAN:
						System.out.print(cell.getBooleanCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							System.out.print(cell.getDateCellValue() + "\t\t");
							break;
						}
						System.out.print((int) cell.getNumericCellValue()
								+ "\t\t");
						break;
					case Cell.CELL_TYPE_STRING:
						System.out.print(cell.getStringCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_BLANK:
						System.out.print("blank\t\t");
						break;
					case Cell.CELL_TYPE_FORMULA:
						//System.out.print(cell.getCellFormula());
						switch (cell.getCachedFormulaResultType()) {
						case Cell.CELL_TYPE_NUMERIC:
							System.out.print((int) cell.getNumericCellValue()
									* 24 + "\t\t");
							break;
						case Cell.CELL_TYPE_ERROR:
							System.out.print("blah blah\t\t");
							break;
						}
					}
				}
				System.out.println("");
			}
			System.out.println("done");
			file.close();
			FileOutputStream out = new FileOutputStream(new File(
					"C:\\Master_Sheet_Tools_Automation.xlsx"));
			workbook.write(out);
			out.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
