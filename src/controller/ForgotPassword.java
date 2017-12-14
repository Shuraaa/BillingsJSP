package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserLogin;
import model.Encode;
import model.RandomString;
import model.SendMail;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserLogin userLogin = new UserLogin();
	private SendMail sm = new SendMail();
	private RandomString rd = new RandomString();
	private Encode encode = new Encode();
	private String host;
	private String port;
	private String user;
	private String pass;

	public ForgotPassword() {
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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
