package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;

import Dao.CongTyDao;
import connection.DatabaseSQLConnection;
import model.CongTy;
import model.Validation;

/**
 * Servlet implementation class ManagerCongTy
 */
@WebServlet("/ManagerCongTy")
@MultipartConfig(maxFileSize = 16177215)
public class ManagerCongTy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerCongTy() {
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
		String command = request.getParameter("command");
		CongTyDao congTyDAO = new CongTyDao();
		String url = "";

		// delete
		if (command.equals("delete")) {
			String congTyId = request.getParameter("congtyid");
			congTyDAO.deleteCongTy(congTyId);
			url = "/admin_company.jsp";

		}
		if (command.equals("edit")) {
			String congTyId = (String) request.getParameter("congTyID_update");
			String tenCongTy = request.getParameter("txt_tenCongTi_update");
			String msst = request.getParameter("txt_msst");
			String diaChi = request.getParameter("txt_DiaChi_update");
			String email = request.getParameter("txt_email");
			String sdt = request.getParameter("txt_dtdd");
			String tl_makeup = request.getParameter("txt_makeup");
			double tile = 0;

			// check data whether valid or invalid
			Validation val = new Validation();
			if (val.checkNull(tl_makeup)) {
				tile = 0;
			} else
				tile = Double.parseDouble(tl_makeup);

			congTyDAO.updateCongTy(new CongTy(congTyId, tenCongTy, null, msst, diaChi, sdt, email, tile));
			url = "/admin_company.jsp";

		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		String url = "", tenCongTy = "", msst = "", diaChi = "", stringDate = "", sdt = "", email = "";
		double tile = 0;
		Connection conn = null;
		PreparedStatement pre = null;
		String error_massage = "";
		boolean error = false;
		InputStream is = null;
		// add
		if (command.equals("add")) {
			conn = DatabaseSQLConnection.getConnection();
			String sql = "insert into congty values (?,?,?,?,?,?,?,?);";
			try {
				pre = (PreparedStatement) conn.prepareStatement(sql);
				DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				// tạo 1 đối tượng có định dạng thời gian yyyy-MM-dd HH:mm:ss
				Date date = new Date(); // lấy thời gian hệ thống
				stringDate = dateFormat.format(date);// Định dạng thời gian
														// theo trên

				tenCongTy = request.getParameter("txt_tenCongTy");
				msst = request.getParameter("txt_msst");
				diaChi = request.getParameter("diaChi");
				email = request.getParameter("txt_email");
				sdt = request.getParameter("txt_dtdd");
				String tl_makeup = request.getParameter("txt_makeup");
				Part filePart = request.getPart("input_img");
				if (filePart != null) {

//					System.out.println(filePart.getName());
//					System.out.println(filePart.getSize());
//					System.out.println(filePart.getContentType());
					is = filePart.getInputStream();
				}

				if (is != null) {
					// fetches input stream of the upload file for the blob column
					pre.setBlob(3, is);
				}
				
				tile = 0;
				// check data whether valid or invalid
				Validation val = new Validation();

				if (!tl_makeup.equals(""))
					tile = Double.parseDouble(tl_makeup) / 100;
				pre.setString(1, stringDate);
				pre.setString(2, tenCongTy);
				pre.setBlob(3, is);
				pre.setString(4, msst);
				pre.setString(5, diaChi);
				pre.setString(6, sdt);
				pre.setString(7, email);
				pre.setDouble(8, tile);
				pre.execute();
				pre.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (error) {
					url = "/admin_company-add.jsp";
				} else {
					url = "/admin_company.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		}

	}

	public static void main(String[] args) {
		System.out.println();

	}
}
