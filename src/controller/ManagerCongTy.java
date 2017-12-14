package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CongTyDao;
import model.CongTy;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getParameter("command");
		CongTyDao congTyDAO = new CongTyDao();
		//delete
		if(command.equals("delete")){
			String congTyId = request.getParameter("congtyid");
			congTyDAO.deleteCongTy(congTyId);
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
			//congTyDAO.updatePhongBan(phongbanid, tenphongban);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_group.jsp");
			rd.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		//add
			if(command.equals("add")){	
				String tenCongTy = request.getParameter("txt_tenCongTy");
				String msst = request.getParameter("txt_msst");
				String diaChi = request.getParameter("diaChi");
				String email = request.getParameter("txt_email");
				String sdt = request.getParameter("txt_dtdd");
				String tl_makeup = request.getParameter("txt_makeup");
				double tile = Double.parseDouble(tl_makeup);
				CongTyDao ctDAO = new CongTyDao();
				ctDAO.addCongTy(new CongTy(tenCongTy+diaChi,tenCongTy,"",msst,diaChi,sdt,email,tile));
				response.sendRedirect(request.getContextPath()+"/admin_company-add.jsp");
			}
	}

}
