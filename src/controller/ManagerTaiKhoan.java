package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TaiKhoan;
import Dao.TaiKhoanDao;

/**
 * Servlet implementation class ManagerTaiKhoan
 */
@WebServlet("/ManagerTaiKhoan")
public class ManagerTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerTaiKhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		if(command.equals("delete")){
			String userName = request.getParameter("userName");
			TaiKhoanDao tkd = new TaiKhoanDao();
			tkd.xoaTaiKhoan(userName);
			response.sendRedirect(request.getContextPath()+"/admin_user.jsp");
		
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String url ="";
		if(command.equals("add")){
			
			String userName = request.getParameter("username");
			String pass = request.getParameter("password");
			String passcf = request.getParameter("pwd_confirm");
			String select = request.getParameter("select");
			int role = Integer.parseInt(select);
			String congtyID = request.getParameter("congty");
			TaiKhoanDao tkd = new TaiKhoanDao();
			TaiKhoan tk = new TaiKhoan(userName, pass, role, congtyID);
			int count =0;
			for (int i = 0; i < TaiKhoanDao.getListTaiKhoan().size(); i++) {
				if(TaiKhoanDao.getListTaiKhoan().get(i).getUserName().equals(userName)){
					count++;
				}
			}
			
			if(count!=0){
				String errorUserName = "failed";
				request.setAttribute("errorUserName",errorUserName);
				url = "/admin_user-add.jsp";	
			}else{
				if(!pass.equals(passcf)){
					String errorPass = "failed";
					request.setAttribute("errorPass",errorPass);
					url = "/admin_user-add.jsp";
				}else{
					tkd.themTaiKhoan(tk);
					url="/admin_user.jsp";
				}
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
