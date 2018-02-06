package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserLogin;
import model.Validation;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserLogin userLogin = new UserLogin();

	public ForgotPassword() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String error = "";
		Validation validate = new Validation();

		if (validate.checkSpace(username) || validate.checkSpace(email)) {
			error = "Tên đăng nhập và Email không chứa khoảng trắng";
		} else if (userLogin.checkEmailByUsername(username, email) == false) {
			error = "Tên đăng nhập hoặc Email không đúng";
		}

		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		try {
			if (error.length() == 0) {
				userLogin.resetPassForLogin(username);
				response.sendRedirect("forgotPass_success.jsp");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("forgotPass.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			response.sendRedirect("page_500.jsp");
		}
	}
}
