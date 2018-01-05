package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ExtensionDao;
import Dao.PhongBanDao;
import model.Extension;

/**
 * Servlet implementation class ManagerExtension
 */
@WebServlet("/ManagerExtension")
public class ManagerExtension extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerExtension() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		ExtensionDao exd = new ExtensionDao();
		// delete
		if (command.equals("delete")) {
			String extensionid = request.getParameter("extensionid");
			exd.xoaExtension(extensionid);
			response.sendRedirect(request.getContextPath() + "/admin_extension.jsp");

		}
		// add
		if (command.equals("add")) {
			String extension = request.getParameter("txt_extension");
			String dauso = request.getParameter("txt_DauSo");
			String phongban = request.getParameter("phongban");
			Extension ex = new Extension(extension, "", dauso, phongban);
			exd.themExtension(ex);
			response.sendRedirect(request.getContextPath() + "/admin_extension.jsp");
		}
		// hien thi danh sach phong ban cong ty
		if (command.equals("choncongty")) {
			String congtyid = request.getParameter("congty");
			request.setAttribute("choncongty", congtyid);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_extension-add.jsp");
			rd.forward(request, response);
		}
		// edit
		if (command.equals("edit")) {
			String congtyid = "";
			String extension = request.getParameter("extensionid");
			String dauso = request.getParameter("dauso");
			String phongban = request.getParameter("phongbanid");
			PhongBanDao pb = new PhongBanDao();
			for (int i = 0; i < pb.getListPhongBan().size(); i++) {
				if (pb.getListPhongBan().get(i).getPhongBanID().equals(phongban)) {
					congtyid = pb.getListPhongBan().get(i).getCongTyID();
				}

			}
			request.setAttribute("editextension", extension);
			request.setAttribute("editdauso", dauso);
			request.setAttribute("editphongban", phongban);
			request.setAttribute("editcongtyid", congtyid);

			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_extension-update.jsp");
			rd.forward(request, response);
		}
		// update
		if (command.equals("update")) {
			String extensioncu = request.getParameter("extensioncu");
			String extension = request.getParameter("txt_extension");
			String dauso = request.getParameter("txt_DauSo");
			String phongban = request.getParameter("phongban");
			Extension ex = new Extension(extension, "", dauso, phongban);
			exd.updateExtension(extensioncu, ex);
			response.sendRedirect(request.getContextPath() + "/admin_extension.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
