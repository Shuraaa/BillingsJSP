package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TaiKhoanDao;
import model.Validation;

/**
 * Servlet implementation class ManagerTaiKhoan
 */
@WebServlet("/ManagerTaiKhoan")
public class ManagerTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDao taikhoanImp = new TaiKhoanDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerTaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String command = request.getParameter("command");
		String userID = request.getParameter("userName");

		String url = "";
		try {

			switch (command) {
			case "delete":
				taikhoanImp.deleteTaiKhoan(userID);
				url = "/admin_user.jsp";
				break;
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (

		Exception e) {
			// TODO: handle exception
		}

		// tam thoi khong dung
		// if (command.equals("delete")) {
		// String userName = request.getParameter("userName");
		// // TaiKhoanDao.addTaiKhoan("sad1", "a", 1, "ct01");
		// response.sendRedirect(request.getContextPath() + "/admin_user.jsp");
		//
		// }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String command = request.getParameter("command");
		
		Validation validation = new Validation();
		String url = "", error = "";

		
	}
}
