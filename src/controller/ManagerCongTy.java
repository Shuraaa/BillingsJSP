package controller;

import java.io.IOException;
import java.io.InputStream;
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
import model.Validation;

@WebServlet("/ManagerCongTy")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class ManagerCongTy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerCongTy() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		String url = "";
		// add
		if (command.equals("add")) {
			String tenCongTy = "", msst = "", diaChi = "", stringDate = "", sdt = "", email = "";
			double tile = 0;
			Connection conn = null;
			PreparedStatement pre = null;
			String error_massage = "";
			boolean error = false;
			InputStream is = null;
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
				msst = request.getParameter("txt_mst");
				diaChi = request.getParameter("txt_DiaChi");
				email = request.getParameter("txt_email");
				sdt = request.getParameter("txt_dtdd");
				String tl_makeup = request.getParameter("txt_makeup");
				Part filePart = request.getPart("input_img");
				if (filePart != null) {
					System.out.println(
							this.getServletContext().getRealPath("resources/assets") + filePart.getSubmittedFileName());
					is = filePart.getInputStream();
				}

				if (is != null) {
					// fetches input stream of the upload file for the blob
					// column
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
			}
		}

		// edit thong tin cong ty
		if (command.equals("edit")) {
			String tenCongTy = "", msst = "", diaChi = "", stringDate = "", sdt = "", email = "";
			InputStream is = null;
			boolean error = false;
			String congTyId = (String) request.getParameter("congTyID_update");
			tenCongTy = request.getParameter("txt_tenCongTi_update");
			msst = request.getParameter("txt_mst");
			diaChi = request.getParameter("txt_DiaChi_update");
			email = request.getParameter("txt_email");
			sdt = request.getParameter("txt_dtdd");
			String tl_makeup = request.getParameter("txt_makeup");
			Part filePart = request.getPart("input_img");
			Connection conn = null;
			PreparedStatement pre1 = null, pre2 = null;
			conn = DatabaseSQLConnection.getConnection();
			String sql1 = "update congty set ten_congty = ? ,logo =?, maso_thue = ?,dia_chi =?,dienthoai = ?,email = ?,ti_le_make_up = ? where congtyID = ?";
			String sql2 = "update congty set ten_congty = ? , maso_thue = ?,dia_chi =?,dienthoai = ?,email = ?,ti_le_make_up = ? where congtyID = ?";
			double tile = 0;
			Validation val = new Validation();
			if (filePart != null) {
				is = filePart.getInputStream();
			} 
			// check data whether valid or invalid

			if (val.checkNull(tl_makeup)) {
				tile = 0;
			} else {
				tile = Double.parseDouble(tl_makeup)/100;
			}
			if (filePart.getSize() != 0) {
				try {
					pre1 = (PreparedStatement) conn.prepareStatement(sql1);
					pre1.setString(1, tenCongTy);
					pre1.setBlob(2, is);
					pre1.setString(3, msst);
					pre1.setString(4, diaChi);
					pre1.setString(5, sdt);
					pre1.setString(6, email);
					pre1.setDouble(7, tile);
					pre1.setString(8, congTyId);
					pre1.execute();
					pre1.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					if (error) {
						url = "/admin_company-add.jsp";
					} else {
						url = "/admin_company.jsp";
					}
				}
			} else {
				System.out.println("vao th null");
				try {
					pre2 = (PreparedStatement) conn.prepareStatement(sql2);
					pre2.setString(1, tenCongTy);
					pre2.setString(2, msst);
					pre2.setString(3, diaChi);
					pre2.setString(4, sdt);
					pre2.setString(5, email);
					pre2.setDouble(6, tile);
					pre2.setString(7, congTyId);
					pre2.execute();
					pre2.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {

					if (error) {
						url = "/admin_company-add.jsp";
					} else {
						url = "/admin_company.jsp";
					}
				}
			}
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

	public static void main(String[] args) {
		System.out.println();

	}
}
