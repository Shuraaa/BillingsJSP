package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Extension;
import model.PhongBan;
import model.Validation;
import Dao.DauSoDao;
import Dao.ExtensionDao;
import Dao.PhongBanDao;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		ExtensionDao exd = new ExtensionDao();
		PhongBanDao pbd= new PhongBanDao();
		Validation vl = new Validation();
		String url="";
		String extensionid="";
		String dauso = "";
		String phongban="";
		String congtyid ="";
		String errorextension ="";
		switch (command) {
		// xóa extension
		case "delete":
			extensionid = request.getParameter("extensionid");
			exd.xoaExtension(extensionid);
			url="/admin_extension.jsp";
			break;
		// xử lý tên công ty đưa về form thêm extension chứa các đầu số và phòng ban của công ty đó
		case "choncongty":
			congtyid = request.getParameter("congty");
			request.setAttribute("choncongty", congtyid);
			url="/admin_extension-add.jsp";
			
			break;
		// thêm extension
		case "add":
			int count =0;
			extensionid = request.getParameter("txt_extension");	
			dauso = request.getParameter("txt_DauSo");
			phongban = request.getParameter("phongban");
			congtyid = pbd.getIDCongTy(phongban);
			request.setAttribute("choncongty", congtyid);
			Extension ex = new Extension(extensionid, "", dauso, phongban);
			// xử lý ngoại lệ extension
			if(exd.kiemTraExtension(extensionid, dauso)){
				errorextension = "Extension đã được sử dụng!";
				request.setAttribute("errorextension", errorextension);
				count++;
				}
			if(vl.checkNull(extensionid)){
				errorextension = "Extension không được để trống!";
				request.setAttribute("errorextension", errorextension);
				count++;
			}
			url="/admin_extension-add.jsp";
			// thêm extension
			if(count==0){
			exd.themExtension(ex);
			url="/admin_extension.jsp";
			}
			break;
		// edit extension
		case "edit":
			extensionid = request.getParameter("extensionid");	
			dauso = request.getParameter("dauso");
			phongban = request.getParameter("phongbanid");
			congtyid= pbd.getIDCongTy(phongban);
			request.setAttribute("editextension", extensionid);
			request.setAttribute("editdauso", dauso);
			request.setAttribute("editphongban", phongban);
			request.setAttribute("choncongty", congtyid);
			url="/admin_extension-update.jsp";
			break;
		// update extension
		case "update":
			int count1 =0;
			String extensioncu = request.getParameter("extensioncu");
			extensionid = request.getParameter("txt_extension");	
			dauso = request.getParameter("txt_DauSo");
			phongban = request.getParameter("phongban");
			congtyid = pbd.getIDCongTy(phongban);
			request.setAttribute("choncongty", congtyid);
			request.setAttribute("editextension", extensionid);
			Extension ex1 = new Extension(extensionid, "", dauso, phongban);
			// xử lý ngoại lệ extension
			if(exd.kiemTraExtension(extensionid, dauso)){
				errorextension = "Extension đã được sử dụng!";
				request.setAttribute("errorextension", errorextension);
				count1++;
			}
			if(vl.checkNull(extensionid)){
				errorextension = "Extension không được để trống!";
				request.setAttribute("errorextension", errorextension);
				count1++;
			}
			url="/admin_extension-update.jsp";
			if(count1==0){
			exd.updateExtension(extensioncu, ex1);
			url="/admin_extension.jsp";
			}
			break;

		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

		//delete
//		if(command.equals("delete")){
//			String extensionid = request.getParameter("extensionid");
//			exd.xoaExtension(extensionid);
//			response.sendRedirect(request.getContextPath()+"/admin_extension.jsp");
//		
//		}
		//add
//		if(command.equals("add")){	
//					String extension = request.getParameter("txt_extension");	
//					String dauso = request.getParameter("txt_DauSo");
//					String phongban = request.getParameter("phongban");
//					Extension ex = new Extension(extension, "", dauso, phongban);
//					exd.themExtension(ex);
//					response.sendRedirect(request.getContextPath()+"/admin_extension.jsp");
//						}
	//	hien thi danh sach phong ban cong ty
//		if(command.equals("choncongty")){
//			String congtyid = request.getParameter("congty");
//			request.setAttribute("choncongty", congtyid);
//			url="/admin_extension-add.jsp";
//		}
		//edit
//		if(command.equals("edit")){	
//			String congtyid="";
//			String extension = request.getParameter("extensionid");	
//			String dauso = request.getParameter("dauso");
//			String phongban = request.getParameter("phongbanid");
//			PhongBanDao pb = new PhongBanDao();
//			for (int i = 0; i < pb.getListPhongBan().size(); i++) {
//				if(pb.getListPhongBan().get(i).getPhongBanID().equals(phongban)){
//					congtyid=pb.getListPhongBan().get(i).getCongTyID();
//				}
//				
//			}
//			request.setAttribute("editextension", extension);
//			request.setAttribute("editdauso", dauso);
//			request.setAttribute("editphongban", phongban);
//			request.setAttribute("editcongtyid", congtyid);
//			
//			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_extension-update.jsp");
//			rd.forward(request, response);
//				}
//		//update
//		if(command.equals("update")){	
//			String extensioncu = request.getParameter("extensioncu");
//			String extension = request.getParameter("txt_extension");	
//			String dauso = request.getParameter("txt_DauSo");
//			String phongban = request.getParameter("phongban");
//			Extension ex = new Extension(extension, "", dauso, phongban);
//			exd.updateExtension(extensioncu, ex);
//			response.sendRedirect(request.getContextPath()+"/admin_extension.jsp");
//				}
	
//	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
