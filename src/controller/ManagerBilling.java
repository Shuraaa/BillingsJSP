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
import Dao.PhongBanDao;

/**
 * Servlet implementation class ManagerBilling
 */
@WebServlet("/ManagerBilling")
public class ManagerBilling extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerBilling() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		BillingDao bld = new BillingDao();
		String url = "";
		Validation vl = new Validation();
		String congtyID ="";
		String tencongty ="";
		String phongbanID ="";
		String extensionID ="";
		String dichvu="";
		String yeucau ="";
		switch (command) {
		
		// delete phòng ban
		case "detail":
			congtyID = request.getParameter("congtyid");
			tencongty = request.getParameter("tencongty");
			yeucau = "tongbill";
			request.setAttribute("yeucau",yeucau);
			request.setAttribute("congtyid",congtyID);
			request.setAttribute("tencongty",tencongty);
			url="/Billing_detail.jsp";
			break;
		case "filter_phongban":
			congtyID = request.getParameter("congtyid");
			phongbanID = request.getParameter("phongban");
			yeucau = "phongban";
			tencongty = request.getParameter("tencongty");
			request.setAttribute("tencongty",tencongty);
			request.setAttribute("congtyid",congtyID);
			request.setAttribute("phongbanid",phongbanID);
			request.setAttribute("yeucau",yeucau);
			url="/Billing_detail.jsp";
			break;
		case "filter_extension":
			congtyID = request.getParameter("congtyid");
			extensionID = request.getParameter("extension");
			yeucau = "extension";
			tencongty = request.getParameter("tencongty");
			request.setAttribute("tencongty",tencongty);
			request.setAttribute("congtyid",congtyID);
			request.setAttribute("extensionid",extensionID);
			request.setAttribute("yeucau",yeucau);
			url="/Billing_detail.jsp";
			break;
		case "filter_dichvu":
			congtyID = request.getParameter("congtyid");
			dichvu = request.getParameter("dichvu");
			yeucau = "dichvu";
			tencongty = request.getParameter("tencongty");
			request.setAttribute("tencongty",tencongty);
			request.setAttribute("congtyid",congtyID);
			request.setAttribute("dichvu",dichvu);
			request.setAttribute("yeucau",yeucau);
			url="/Billing_detail.jsp";
			break;
		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
			
		// add phòng ban
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
