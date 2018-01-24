package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Validation;
import Dao.BillingDao;

@WebServlet("/ManagerBilling")
public class ManagerBilling extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerBilling() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		BillingDao bld = new BillingDao();
		String url = "";
		String congtyID = "";
		String tencongty = "";
		String phongbanID = "";
		String extensionID = "";
		String yeucau = "";
		String thangnam = "";
		String yeucauthang = "";
		String exportToExcel="";
		switch (command) {

		// delete phòng ban
		case "detail":
			congtyID = request.getParameter("congtyid");
			tencongty = request.getParameter("tencongty");
			yeucau = "tongbill";
			request.setAttribute("yeucau", yeucau);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("tencongty", tencongty);
			url = "/billings_detail.jsp";
			break;
		case "filter_phongban":
			congtyID = request.getParameter("congtyid");
			phongbanID = request.getParameter("phongban");
			yeucau = "phongban";
			tencongty = request.getParameter("tencongty");
			thangnam = request.getParameter("thangnam");
			yeucauthang = "thangnam";
			request.setAttribute("yeucauthang", yeucauthang);
			request.setAttribute("tencongty", tencongty);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("phongbanid", phongbanID);
			request.setAttribute("yeucau", yeucau);
			request.setAttribute("thangnam", thangnam);
			url = "/billings_detail.jsp";
			break;
		case "filter_extension":
			congtyID = request.getParameter("congtyid");
			extensionID = request.getParameter("extension");
			yeucau = "extension";
			tencongty = request.getParameter("tencongty");
			thangnam = request.getParameter("thangnam");
			yeucauthang = "thangnam";
			request.setAttribute("yeucauthang", yeucauthang);
			request.setAttribute("tencongty", tencongty);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("extensionid", extensionID);
			request.setAttribute("yeucau", yeucau);
			request.setAttribute("thangnam", thangnam);
			url = "/billings_detail.jsp";
			break;
		case "filter_thangnam":
			congtyID = request.getParameter("congtyid");
			tencongty = request.getParameter("tencongty");
			yeucau = "tongbill";
			thangnam = request.getParameter("thangnam");
			// yeucau = request.getParameter("yc");
			yeucauthang = "thangnam";
			request.setAttribute("tencongty", tencongty);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("thangnam", thangnam);
			request.setAttribute("yeucau", yeucau);
			request.setAttribute("yeucauthang", yeucauthang);
			url = "/billings_detail.jsp";
			break;
		case "filter_thangnamtotal":
			thangnam = request.getParameter("thangnam");
			yeucauthang = "thangnam";
			request.setAttribute("thangnam", thangnam);
			request.setAttribute("yeucauthang", yeucauthang);
			url = "/billings_total.jsp";
			break;
		case "exportPDF":
			congtyID = request.getParameter("congtyid");
			tencongty = request.getParameter("tencongty");
			thangnam = request.getParameter("thangnam");
			exportToExcel = request.getParameter("exportToExcel");
			request.setAttribute("tencongty", tencongty);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("thangnam", thangnam);
			request.setAttribute("exportToExcel", exportToExcel);
			url = "/excel.jsp";
			break;
		case "exportPDFdetail":
			congtyID = request.getParameter("congtyid");
			tencongty = request.getParameter("tencongty");
			thangnam = request.getParameter("thangnam");
			exportToExcel = request.getParameter("exportToExcel");
			request.setAttribute("tencongty", tencongty);
			request.setAttribute("congtyid", congtyID);
			request.setAttribute("thangnam", thangnam);
			request.setAttribute("exportToExcel", exportToExcel);
			url = "/excel_detail.jsp";
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
