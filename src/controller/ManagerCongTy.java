package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CongTyDao;
import model.CongTy;
import model.Validation;

/**
 * Servlet implementation class ManagerCongTy
 */
@WebServlet("/ManagerCongTy")
public class ManagerCongTy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerCongTy() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getParameter("command");
		CongTyDao congTyDAO = new CongTyDao();
		String url = "";

		// delete
		if (command.equals("delete")) {
			String congTyId = request.getParameter("congtyid");
			congTyDAO.deleteCongTy(congTyId);
			url = "/admin_company.jsp";

		}
		if (command.equals("edit")) {
			String congTyId = (String) request.getParameter("congTyID_update");
			String tenCongTy = request.getParameter("txt_tenCongTi_update");
			String msst = request.getParameter("txt_msst");
			String diaChi = request.getParameter("txt_DiaChi_update");
			String email = request.getParameter("txt_email");
			String sdt = request.getParameter("txt_dtdd");
			String tl_makeup = request.getParameter("txt_makeup");
			double tile = 0;

			// check data whether valid or invalid
			Validation val = new Validation();
			if (val.checkNull(tl_makeup)) {
				tile = 0;
			} else
				tile = Double.parseDouble(tl_makeup);

			congTyDAO.updateCongTy(new CongTy(congTyId, tenCongTy, "", msst, diaChi, sdt, email, tile));
			url = "/admin_company.jsp";

		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		String url = "";
		// add
		if (command.equals("add")) {
			String tenCongTy = request.getParameter("txt_tenCongTy");
			String msst = request.getParameter("txt_msst");
			String diaChi = request.getParameter("diaChi");
			String email = request.getParameter("txt_email");
			String sdt = request.getParameter("txt_dtdd");
			String tl_makeup = request.getParameter("txt_makeup");
			double tile = 0;
			// check data whether valid or invalid
			Validation val = new Validation();
			String error_massage = "";
			boolean error = false;

			// in case of invalid name
			if (val.checkNull(tenCongTy)) {
				error_massage = "Không được để trống";
				error = true;
				request.setAttribute("name_err", error_massage);
			}
			// in case of invalid number
			if (val.checkTiLeMakeUp(tl_makeup)) {
				tile = 0;
			} else if (!val.checkPhoneNumber(tl_makeup)) {
				error_massage = "Nhập vào một số hợp lệ. Vd:10";
				error = true;
				request.setAttribute("tile_mk_err", error_massage);
			} else {
				tile = Double.parseDouble(tl_makeup) / 100;
			}

			// in case of invalid email
			if (!val.checkEmail(email)) {
				error_massage = "Địa chỉ email không hợp lệ";
				error = true;
				request.setAttribute("email_err", error_massage);
			}
			// in case of invalid email
			if (!val.checkPhoneNumber(sdt)) {
				error_massage = "SĐT không hợp lệ";
				error = true;
				request.setAttribute("sdt_err", error_massage);
			}
			if (error) {
				url = "/admin_company-add.jsp";
			} else {
				CongTyDao ctDAO = new CongTyDao();
				ctDAO.addCongTy(new CongTy("", tenCongTy, "logo", msst, diaChi, sdt, email, tile));
				url = "/admin_company.jsp";
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	public static void main(String[] args) {
		System.out.println();

	}
}
