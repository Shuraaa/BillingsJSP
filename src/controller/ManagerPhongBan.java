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
import model.Validation;
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
		Validation vl = new Validation();
		String url="";
		String phongbanid="";
		String tenphongban="";
		String congtyID ="";
		String errorphongban="";
		switch (command) {
		
		// delete phòng ban
		case "delete":
			phongbanid = request.getParameter("phongbanid");
			pbd.xoaPhongBan(phongbanid);
			url="/admin_group.jsp";
			break;
			
		// add phòng ban
		case "add":
			tenphongban = request.getParameter("txt_tenGroup");	
			congtyID = request.getParameter("congty");
			PhongBan pb = new PhongBan(tenphongban+congtyID, tenphongban, congtyID);
			int count = 0;
			// xử lý ngoại lệ form thêm phòng ban
			if(pbd.kiemTraPhongBan(congtyID, tenphongban)){
				errorphongban="Tên phòng ban đã tồn tại!";
				request.setAttribute("errorphongban", errorphongban);
				count++;
			}
			if(vl.checkNull(tenphongban)){
				errorphongban="Tên phòng ban không được để trống!";
				request.setAttribute("errorphongban", errorphongban);
				count++;
			}
			url="/admin_group-add.jsp";
			// thêm phòng ban
			if(count==0){
				pbd.themPhongBan(pb);
				url="/admin_group.jsp";
			}
			break;
			
		// xử lý form edit phòng ban
		case "edit":
			phongbanid = request.getParameter("phongbanid");
			tenphongban = request.getParameter("tenphongban");
			request.setAttribute("editphongban", phongbanid);
			request.setAttribute("edittenphongban", tenphongban);
			url="/admin_group.jsp";
			break;
		// update tên phòng ban
		case "update":
			phongbanid = request.getParameter("txt_idphongban");
			tenphongban = request.getParameter("txt_tenphongban");
			pbd.updatePhongBan(phongbanid, tenphongban);
			url="/admin_group.jsp";
			break;

		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			

	}
}

