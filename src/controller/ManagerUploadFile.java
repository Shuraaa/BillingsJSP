package controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import Dao.LogCallDAO;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		int sheetIndex = Integer.parseInt(request.getParameter("input_sheetIndex"));
		// to format date type
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		InputStream is = null;
		Part filePart = request.getPart("inputFileExcel");
		if (filePart != null) {
			is = filePart.getInputStream();
		}
		Workbook book = getWorkbook(is, filePart.getSubmittedFileName());
	   System.out.println("Số sheet: "+book.getNumberOfSheets());
		Sheet sheet = (Sheet) book.getSheetAt(sheetIndex);
		LogCallDAO logcallDAO = new LogCallDAO();
		for (int i = 1; i < sheet.getLastRowNum(); i++) {
			Row row = sheet.getRow(i);
			int thoigian_goi = (int) row.getCell(3).getNumericCellValue();
			String d1 = "", d2 = "";
			d1 = dateFormat.format(row.getCell(4).getDateCellValue());
			d2 = dateFormat.format(row.getCell(5).getDateCellValue());
			logcallDAO.insert(row.getCell(1).getStringCellValue(), row.getCell(2).getStringCellValue(), thoigian_goi,
					d1, d2);
		}

	}
    // lấy work book đúng với định dạng file excel
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
