package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TaiKhoan;
import model.Validation;
import Dao.TaiKhoanDao;

@WebServlet("/ManagerTaiKhoan")
public class ManagerTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerTaiKhoan() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		TaiKhoanDao tkd = new TaiKhoanDao();
		String userName ="";
		String pass="";
		String passcf = "";
		String select ="";
		String url="";
		String erroruser="";
		String errorpass="";
		String errorpasscf="";
		int role=0;
		int count =0;
		Validation vl = new Validation();
		switch (command) {
		//delete Tài khoản
		case "delete":
			userName = request.getParameter("userName");
			tkd.xoaTaiKhoan(userName);
			url="/admin_user.jsp";
			break;
		//add tài khoản
		case "add":
			userName = request.getParameter("username");
			pass = request.getParameter("password");
			passcf = request.getParameter("pwd_confirm");
			select = request.getParameter("select");
			role = Integer.parseInt(select);
			String congtyID = request.getParameter("congty");
			TaiKhoan tk = new TaiKhoan(userName, pass, role, congtyID);
			// xử lý ngoại lệ
			if(vl.checkNull(userName)){
				erroruser = "Tên tài khoản không được để trống!";
				request.setAttribute("erroruser", erroruser);
				count++;
			}
			if(!vl.checkNull(userName)&&tkd.kiemTraTaiKhoan(userName)){
				erroruser = "Tên tài khoản đã tồn tại!";
				request.setAttribute("erroruser", erroruser);
				count++;
			}
			if(vl.checkNull(pass)){
				errorpass = "Mật khẩu không được để trống!";
				request.setAttribute("errorpass", errorpass);
				count++;
			}
			if(!vl.checkNull(pass)&&!vl.checkLength(pass)){
				errorpass = "Mật khẩu phải trên 6 kí tự!";
				request.setAttribute("errorpass", errorpass);
				count++;
			}	
			if(!vl.checkNull(pass)&&!vl.checkPass(pass,passcf)){
				errorpass = "Mật khẩu không trùng khớp!";
				request.setAttribute("errorpass", errorpass);
				count++;
			}
			url="/admin_user-add.jsp";
			// thêm tài khoản
			if(count==0){
				tkd.themTaiKhoan(tk);
				url="/admin_user.jsp";
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