package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Extension;
import model.Validation;
import Dao.ExtensionDao;
import Dao.PhongBanDao;

@WebServlet("/ManagerExtension")
public class ManagerExtension extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerExtension() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		ExtensionDao exd = new ExtensionDao();
		PhongBanDao pbd = new PhongBanDao();
		Validation vl = new Validation();
		String url = "";
		String extensionid = "";
		String dauso = "";
		String phongban = "";
		String congtyid = "";
		String errorextension = "";
		switch (command) {
		// xóa extension
		case "delete":
			extensionid = request.getParameter("extensionid");
			exd.xoaExtension(extensionid);
			url = "/admin_extension.jsp";
			break;
		// xử lý tên công ty đưa về form thêm extension chứa các đầu số và phòng
		// ban của công ty đó
		case "choncongty":
			congtyid = request.getParameter("congty");
			request.setAttribute("choncongty", congtyid);
			url = "/admin_extension-add.jsp";

			break;
		// thêm extension
		case "add":
			int count = 0;
			extensionid = request.getParameter("txt_extension");
			dauso = request.getParameter("txt_DauSo");
			phongban = request.getParameter("phongban");
			congtyid = pbd.getIDCongTy(phongban);
			request.setAttribute("choncongty", congtyid);
			Extension ex = new Extension(extensionid, "", dauso, phongban);
			// xử lý ngoại lệ extension
			if (exd.kiemTraExtension(extensionid, dauso)) {
				errorextension = "Extension đã được sử dụng!";
				request.setAttribute("errorextension", errorextension);
				count++;
			}
			if (vl.checkSpace(extensionid)) {
				errorextension = "Extension không được được chứa khoảng cách";
				request.setAttribute("errorextension", errorextension);
				count++;
			}
			url = "/admin_extension-add.jsp";
			// thêm extension
			if (count == 0) {
				exd.themExtension(ex);
				url = "/admin_extension.jsp";
			}
			break;
		// edit extension
		case "edit":
			extensionid = request.getParameter("extensionid");
			dauso = request.getParameter("dauso");
			phongban = request.getParameter("phongbanid");
			congtyid = pbd.getIDCongTy(phongban);
			request.setAttribute("editextension", extensionid);
			request.setAttribute("editdauso", dauso);
			request.setAttribute("editphongban", phongban);
			request.setAttribute("choncongty", congtyid);
			url = "/admin_extension-update.jsp";
			break;
		// update extension
		case "update":
			int count1 = 0;
			String extensioncu = request.getParameter("extensioncu");
			extensionid = request.getParameter("txt_extension");
			dauso = request.getParameter("txt_DauSo");
			phongban = request.getParameter("phongban");
			congtyid = pbd.getIDCongTy(phongban);
			request.setAttribute("choncongty", congtyid);
			request.setAttribute("editextension", extensionid);
			Extension ex1 = new Extension(extensionid, "", dauso, phongban);
			// xử lý ngoại lệ extension
			if (exd.kiemTraExtension(extensionid, dauso)) {
				errorextension = "Extension đã được sử dụng!";
				request.setAttribute("errorextension", errorextension);
				count1++;
			}
			if (vl.checkNull(extensionid)) {
				errorextension = "Extension không được để trống!";
				request.setAttribute("errorextension", errorextension);
				count1++;
			}
			url = "/admin_extension-update.jsp";
			if (count1 == 0) {
				exd.updateExtension(extensioncu, ex1);
				url = "/admin_extension.jsp";
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