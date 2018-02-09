package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Regex;
import Dao.RegexDao;

@WebServlet("/ManagerRegex")
public class ManagerRegex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerRegex() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		RegexDao rgd = new RegexDao();
		String url = "";
		String tenbang = "";
		String tenRegex = "";
		String chuoiString = "";
		String loaiRegex = "";
		double block1sfpt = 0;
		double block6sfpt = 0;
		double block10sfpt = 0;
		double block1mfpt = 0;
		double block1scmc = 0;
		double block6scmc = 0;
		double block10scmc = 0;
		double block1mcmc = 0;

		switch (command) {
		// delete
		case "delete":
			tenRegex = (String) request.getParameter("tenRegex");
			tenbang = (String) request.getParameter("tenbang");
			rgd.xoaRegex(tenRegex, tenbang);
			url = "/admin_regex.jsp";
			break;
		case "add":
			tenRegex = request.getParameter("tenRegex");
			chuoiString = request.getParameter("chuoiString");
			loaiRegex = request.getParameter("loaiRegex");
			block1sfpt = Double.parseDouble(request.getParameter("block1sfpt"));
			block6sfpt = Double.parseDouble(request.getParameter("block6sfpt"));
			block10sfpt = Double.parseDouble(request.getParameter("block10sfpt"));
			block1mfpt = Double.parseDouble(request.getParameter("block1mfpt"));
			block1scmc = Double.parseDouble(request.getParameter("block1scmc"));
			block6scmc = Double.parseDouble(request.getParameter("block6scmc"));
			block10scmc = Double.parseDouble(request.getParameter("block10scmc"));
			block1mcmc = Double.parseDouble(request.getParameter("block1mcmc"));
			Regex rg = new Regex(tenRegex, chuoiString, block1sfpt, block6sfpt, block10sfpt, block1mfpt, block1scmc,
					block6scmc, block10scmc, block1mcmc);
			rgd.themRegex(rg, loaiRegex);
			url = "/admin_regex-add.jsp";
			break;
		case "edit":
			tenbang = request.getParameter("tenbang");
			chuoiString = request.getParameter("regexString");
			request.setAttribute("tenbang", tenbang);
			request.setAttribute("regexString", chuoiString);
			url = "/admin_regex-update.jsp";
			break;
		case "update":
			tenRegex = request.getParameter("tenRegex");
			chuoiString = request.getParameter("regexString");
			tenbang = request.getParameter("tenbang");
			block6sfpt = Double.parseDouble(request.getParameter("block6sfpt"));
			block10sfpt = Double.parseDouble(request.getParameter("block10sfpt"));
			block1mfpt = Double.parseDouble(request.getParameter("block1mfpt"));
			block1scmc = Double.parseDouble(request.getParameter("block1scmc"));
			block6scmc = Double.parseDouble(request.getParameter("block6scmc"));
			block10scmc = Double.parseDouble(request.getParameter("block10scmc"));
			block1mcmc = Double.parseDouble(request.getParameter("block1mcmc"));
			Regex rg1 = new Regex(tenRegex, chuoiString, block1sfpt, block6sfpt, block10sfpt, block1mfpt, block1scmc,
					block6scmc, block10scmc, block1mcmc);
			rgd.updateRegex(chuoiString, tenbang, rg1);
			url = "/admin_regex.jsp";

			break;
		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}