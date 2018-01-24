package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Search() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String congtyid = "";
		String url = "";
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}