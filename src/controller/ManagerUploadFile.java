package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 * Servlet implementation class ManagerUploadFile
 */
@WebServlet("/ManagerUploadFile")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1024)
public class ManagerUploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerUploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		InputStream is = null;
		Part filePart = request.getPart("inputFileExcel");
		if (filePart != null) {
			System.out.println(
					this.getServletContext().getRealPath("resources/assets") + filePart.getSubmittedFileName());
			is = filePart.getInputStream();

		}
		System.out.println(filePart.getSubmittedFileName());
		Workbook book = getWorkbook(is, filePart.getSubmittedFileName());
		Sheet sheet = (Sheet) book.getSheetAt(5);
		Iterator<Row> rowIterator = sheet.iterator();
		 
	       while (rowIterator.hasNext()) {
	           Row row = rowIterator.next();
	     
	           // Lấy Iterator cho tất cả các cell của dòng hiện tại.
	           Iterator<Cell> cellIterator = row.cellIterator();
	 
	           while (cellIterator.hasNext()) {
	               Cell cell = cellIterator.next();
	  
	               // Đổi thành getCellType() nếu sử dụng POI 4.x
	               CellType cellType = cell.getCellTypeEnum();
	 
	               switch (cellType) {
	               case _NONE:
	                   System.out.print("");
	                   System.out.print("\t");
	                   break;
	               case BOOLEAN:
	                   System.out.print(cell.getBooleanCellValue());
	                   System.out.print("\t");
	                   break;
	               case BLANK:
	                   System.out.print("");
	                   System.out.print("\t");
	                   break;
	               case FORMULA:
	       
	                   // Công thức
	                   System.out.print(cell.getCellFormula());
	                   System.out.print("\t");
	                    
	                   FormulaEvaluator evaluator = book.getCreationHelper().createFormulaEvaluator();
	         
	                   // In ra giá trị từ công thức
	                   System.out.print(evaluator.evaluate(cell).getNumberValue());
	                   break;
	               case NUMERIC:
	                   System.out.print(cell.getNumericCellValue());
	                   System.out.print("\t");
	                   break;
	               case STRING:
	                   System.out.print(cell.getStringCellValue());
	                   System.out.print("\t");
	                   break;
	               case ERROR:
	                   System.out.print("!");
	                   System.out.print("\t");
	                   break;
	               }
	 
	           }
	           System.out.println("");
	       }
	   }
	

	private Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
		Workbook workbook = null;

		if (excelFilePath.endsWith("xlsx")) {
			workbook = new XSSFWorkbook(inputStream);
		} else if (excelFilePath.endsWith("xls")) {
			workbook = new HSSFWorkbook(inputStream);
		} else {
			throw new IllegalArgumentException("The specified file is not Excel file");
		}

		return workbook;
	}

}
