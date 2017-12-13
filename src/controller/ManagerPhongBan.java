package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PhongBan;
import model.TaiKhoan;
import Dao.PhongBanDao;
import Dao.TaiKhoanDao;

/**
 * Servlet implementation class ManagerGroup
 */
@WebServlet("/ManagerPhongBan")
public class ManagerPhongBan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerPhongBan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		PhongBanDao pbd = new PhongBanDao();
		//delete
		if(command.equals("delete")){
			String phongbanid = request.getParameter("phongbanid");
			pbd.xoaPhongBan(phongbanid);
			response.sendRedirect(request.getContextPath()+"/admin_group.jsp");
		
		}
		if(command.equals("edit")){
			String phongbanid = request.getParameter("phongbanid");
			String tenphongban = request.getParameter("tenphongban");
			request.setAttribute("editphongban", phongbanid);
			request.setAttribute("edittenphongban", tenphongban);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_group.jsp");
			rd.forward(request, response);
			
		}
		if(command.equals("update")){
			String phongbanid = request.getParameter("txt_idphongban");
			String tenphongban = request.getParameter("txt_tenphongban");
			pbd.updatePhongBan(phongbanid, tenphongban);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_group.jsp");
			rd.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		//add
			if(command.equals("add")){	
						String tenphongban = request.getParameter("txt_tenGroup");	
						String congtyID = request.getParameter("congty");
						PhongBanDao pbd = new PhongBanDao();
						PhongBan pb = new PhongBan(tenphongban+congtyID, tenphongban, congtyID);
						pbd.themPhongBan(pb);
						response.sendRedirect(request.getContextPath()+"/admin_group.jsp");
							}
			

	}
}

