package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Validation;
import Dao.UserLogin;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserLogin userLogin = new UserLogin();

	public UpdateProfile() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String iD = (String) session.getAttribute("companyID");
		String error = "";

		// update user info
		String emailCT = (String) request.getParameter("emailCT");
		String diaChiCT = request.getParameter("diaChi");
		String sdtCT = request.getParameter("sdt");
		String mstCT = request.getParameter("mst");

		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		try {
			if (error.length() == 0) {
				userLogin.updateProfile(iD, emailCT, diaChiCT, sdtCT, mstCT);
				HttpSession ss = request.getSession();
				ss.removeAttribute(iD);
				RequestDispatcher rd = request.getRequestDispatcher("success_page.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("user_update.jsp");
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
