package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import Dao.LogCallDao;
import model.LogCall;

@WebServlet("/ManagerUploadFile")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1024)
public class ManagerUploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerUploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int sheetIndex = Integer.parseInt(request.getParameter("input_sheetIndex"));
		// to format date type
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		InputStream is = null;
		Part filePart = request.getPart("inputFileExcel");
		if (filePart != null) {
			is = filePart.getInputStream();
		}
		Workbook book = getWorkbook(is, filePart.getSubmittedFileName());
		Sheet sheet = (Sheet) book.getSheetAt(sheetIndex - 1);
		String tenFile = filePart.getSubmittedFileName() + " Sheet: " + sheetIndex;
		System.out.println("Tên file:" + filePart.getSubmittedFileName() + "Sheet: " + sheetIndex);
		System.out.println("Thời gian import:" + dateFormat.format(date));
		System.out.println("Số dòng " + sheet.getLastRowNum());
		Iterator<Row> s = sheet.iterator();

		// LogCallDao logcallDAO = new LogCallDao();
		ArrayList<LogCall> list = new ArrayList<>();

		for (int i = 1; i < 500; i++) {
			Row row = sheet.getRow(i);
			DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int thoigian_goi = (int) row.getCell(3).getNumericCellValue();
			String d1 = "", d2 = "";
			d1 = dateFormat1.format(row.getCell(4).getDateCellValue());
			d2 = dateFormat1.format(row.getCell(5).getDateCellValue());
			LogCall l = new LogCall(row.getCell(1).getStringCellValue().trim(),
					row.getCell(2).getStringCellValue().trim(), thoigian_goi, d1, d2, "");
			list.add(l);
		}
		try {
			LogCallDao.insert(list, tenFile, 500);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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