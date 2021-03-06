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
import model.*;

@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserLogin userLogin = new UserLogin();

	public ChangePass() {
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

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		Validation validation = new Validation();

		// change password
		String oldPass = request.getParameter("current_pwd");
		String newPass = request.getParameter("new_pwd");
		String confirmPass = request.getParameter("confirm_new_pwd");

		String error = "";
		String error2 = "";
		String error3 = "";
		String error4 = "";

		if (!userLogin.checkLogin(username, oldPass)) {
			error3 = "Mật khẩu không đúng";
		} else if (!validation.checkPass(newPass, confirmPass)) {
			error2 = "Mật khẩu mới không khớp";
		}
		if (validation.checkNull(newPass) || validation.checkNull(oldPass) || validation.checkNull(confirmPass)) {
			error = "Vui lòng điền đầy đủ thông tin";
		} else if (!validation.checkLength(newPass)) {
			error = "Mật khẩu phải chứa ít nhất 6 ký tự và tối đa 30 ký tự";
		}
		if (validation.checkSpace(newPass) || validation.checkSpace(oldPass) || validation.checkSpace(confirmPass)) {
			error4 = "Mật khẩu không được chứa khoảng trắng";
		}

		if (error.length() > 0) {
			request.setAttribute("error", error);
		}
		if (error2.length() > 0) {
			request.setAttribute("error2", error2);
		}
		if (error3.length() > 0) {
			request.setAttribute("error3", error3);
		}

		if (error4.length() > 0) {
			request.setAttribute("error4", error4);
		}

		try {
			if (error.length() == 0 && error2.length() == 0 && error3.length() == 0 && error4.length() == 0) {
				if (userLogin.checkLogin(username, oldPass)) {
					userLogin.setNewPassByUsername(username, confirmPass);
					HttpSession ss = request.getSession();
					ss.removeAttribute(username);
					response.sendRedirect("success_page.jsp");
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("user_changePass.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			response.sendRedirect("page_500.jsp");
		}
	}
}
