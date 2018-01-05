package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserLogin;
import model.Validation;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserLogin userLogin = new UserLogin();

	public Login() {
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
		String password = request.getParameter("password");
		int role;
		String error = "";

		Validation validate = new Validation();
		if (validate.checkNull(username) || validate.checkNull(password)) {
			error = "Vui lòng nhập đầy đủ thông tin";
		} else if (userLogin.checkLogin(username, password) == false) {
			error = "Tài khoản hoặc mật khẩu không đúng";
		}
		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		String url = "";
		try {
			if (error.length() == 0) {
				HttpSession session = request.getSession();
				role = userLogin.getUserInfo(username).getRole();
				session.setAttribute("username", username);
				session.setAttribute("role", role);
				url = "/index.jsp";
			} else {
				url = "/login.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			url = "/page_500.jsp";
		}
	}
}
