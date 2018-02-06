package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserLogin;
import model.SendMail;
import model.Validation;

@WebServlet("/forgotPassword")
public class ForgotPasswordOld extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserLogin userLogin = new UserLogin();
	private SendMail sm = new SendMail();
	private String host;
	private String port;
	private String user;
	private String pass;

	public ForgotPasswordOld() {
		super();
	}

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String username = request.getParameter("username");
		String error = "";
		Validation validate = new Validation();

		// Check Username
		if (validate.checkNull(username)) {
			error = "Vui lòng điền Username";
		}
		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		try {
			if (error.length() == 0) {

				String oldPass = userLogin.getUserInfo(username).getUserPass();
				String email = userLogin.getCompanyInfo(username).getEmail();

				String text = "Kính chào quý khách," + "\n"
						+ "Chúng tôi vừa nhận được yêu cầu lấy lại mật khẩu trên Billings cho Username: " + "\n"
						+ username + "\n" + "Đây là mật khẩu của quý khách: " + oldPass + "\n"
						+ "Vui lòng truy cập lại vào website để thay đổi mật khẩu." + "\n"
						+ "Nếu có vấn đề trong việc truy cập tài khoản, vui lòng gửi Email cho chúng tôi: trunghieuit191@gmail.com"
						+ "\n" + "Trân trọng, " + "\n" + "Billings Team";

				HttpSession session = request.getSession();
				sm.sendEmail("smtp.gmail.com", "587", "michelhung258@gmail.com", "arthurpendragon191", email,
						"Xác nhận mật khẩu", text);
				session.setAttribute("username", username);
				session.setAttribute("email", email);
				response.sendRedirect("forgotPass_pending.jsp");

			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/forgotPass.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
