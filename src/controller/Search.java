package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DauSo;
import model.Validation;
import Dao.DauSoDao;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String congtyid = "";
		String url="";
		switch (command) {
		case "searchdauso":
			congtyid = request.getParameter("congtyid");
			request.setAttribute("congtyid", congtyid);
			url = "/admin_dauso.jsp";	
			break;
		case "searchphongban":
			congtyid = request.getParameter("congtyid");
			request.setAttribute("congtyid", congtyid);
			url = "/admin_group.jsp";	
			break;
		case "searchuser":
			congtyid = request.getParameter("congtyid");
			request.setAttribute("congtyid", congtyid);
			url = "/admin_user.jsp";	
			break;
		case "searchextension":
			congtyid = request.getParameter("congtyid");
			request.setAttribute("congtyid", congtyid);
			url = "/admin_extension.jsp";	
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
		// TODO Auto-generated method stub
	}

}
