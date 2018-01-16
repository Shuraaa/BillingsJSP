package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DauSoDao;
import model.DauSo;
import model.Validation;

@WebServlet("/ManagerDauSo")
public class ManagerDauSo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerDauSo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		DauSoDao dsd = new DauSoDao();
		String dauso = "";
		String congtyid = "";
		String nhamang = "";
		String url = "";
		String errordauso = "";
		int count = 0;
		Validation vl = new Validation();
		switch (command) {
		// delete Tài khoản
		case "delete":
			dauso = request.getParameter("dauso");
			dsd.xoaDauSo(dauso);
			url = "/admin_dauso.jsp";
			break;
		case "add":
			dauso = request.getParameter("txt_DauSo");
			congtyid = request.getParameter("congty");
			nhamang = request.getParameter("nhamang");
			DauSo ds = new DauSo(dauso, congtyid, nhamang);
			// xử lý ngoại lệ
			if (dsd.kiemTraDauSo(dauso)) {
				errordauso = "Đầu số đã tồn tại!";
				request.setAttribute("errordauso", errordauso);
				count++;
			}
			if (vl.checkSpace(dauso)) {
				errordauso = "Đầu số không được được chứa khoảng cách";
				request.setAttribute("errordauso", errordauso);
				count++;
			}

			url = "/admin_dauso-add.jsp";
			// thêm tài khoản
			if (count == 0) {
				dsd.themDauSo(ds);
				url = "/admin_dauso.jsp";
			}
			break;
		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}