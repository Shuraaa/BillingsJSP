package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;

import connection.DatabaseSQLConnection;

@WebServlet("/UpdateProfile")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		String iD = (String) session.getAttribute("companyID");
		String emailCT = request.getParameter("email_update");
		String diaChiCT = request.getParameter("diaChi");
		String sdtCT = request.getParameter("sdt");
		String mstCT = request.getParameter("mst");
		InputStream is = null;
		Part filePart = request.getPart("input_img");
		System.out.println(filePart.getSubmittedFileName());
		try {

			Connection conn = null;
			PreparedStatement pre1 = null, pre2 = null;
			conn = DatabaseSQLConnection.getConnection();
			String sql1 = "update congty set logo =?, maso_thue = ?,dia_chi =?,dienthoai = ?,email = ? where congtyID = ?";
			String sql2 = "update congty set maso_thue = ?,dia_chi =?,dienthoai = ?,email = ? where congtyID = ?";
			is = filePart.getInputStream();

			if (filePart.getSize() != 0) {
				try {
					pre1 = (PreparedStatement) conn.prepareStatement(sql1);
					pre1.setBlob(1, is);
					pre1.setString(2, mstCT);
					pre1.setString(3, diaChiCT);
					pre1.setString(4, sdtCT);
					pre1.setString(5, emailCT);
					pre1.setString(6, iD);
					pre1.execute();
					pre1.close();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					conn.close();
				}
			} else {
				System.out.println("vao th null");
				try {
					pre2 = (PreparedStatement) conn.prepareStatement(sql2);
					pre2.setString(1, mstCT);
					pre2.setString(2, diaChiCT);
					pre2.setString(3, sdtCT);
					pre2.setString(4, emailCT);
					pre2.setString(5, iD);
					pre2.execute();
					pre2.close();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					conn.close();
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("companyAddress", diaChiCT);
		session.setAttribute("companyEmail", emailCT);
		session.setAttribute("companyPhone", sdtCT);
		session.setAttribute("companyMST", mstCT);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/success_page.jsp");
		rd.forward(request, response);
	}
}
