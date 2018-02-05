package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BangMa;
import model.Extension;
import model.Validation;
import Dao.BangMaDao;
import Dao.ExtensionDao;
import Dao.PhongBanDao;

/**
 * Servlet implementation class ManagerBangMa
 */
@WebServlet("/ManagerBangMa")
public class ManagerBangMa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerBangMa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		BangMaDao bmd = new BangMaDao();
		String url = "";
		String tab = "";
		String ten = "";
		String maquyuoc = "";
		int chieudai = 0;
		String cd = "";
		String loaicuocgoi ="";
		double block1sfpt =0;
		double block6sfpt =0;
		double block10sfpt =0;
		double block1mfpt =0;
		double block1scmc=0;
		double block6scmc=0;
		double block10scmc=0;
		double block1mcmc=0;
		
		switch (command) {
		// xóa extension
		case "delete":
			maquyuoc = request.getParameter("maquyuoc");
			chieudai = Integer.parseInt(request.getParameter("chieudai"));
			tab= request.getParameter("tab");
			request.setAttribute("tab", tab);
			bmd.xoaBangMa(maquyuoc, chieudai);
			url = "/admin_bangma.jsp";
			break;
		case "add":
			ten = request.getParameter("ten");
			maquyuoc = request.getParameter("maquyuoc");
			chieudai = Integer.parseInt(request.getParameter("chieudai"));
			block1sfpt = Double.parseDouble(request.getParameter("block1sfpt"));
			loaicuocgoi = request.getParameter("loaicuocgoi");
			block6sfpt = Double.parseDouble(request.getParameter("block6sfpt"));
			block10sfpt = Double.parseDouble(request.getParameter("block10sfpt"));
			block1mfpt = Double.parseDouble(request.getParameter("block1mfpt"));
			block1scmc = Double.parseDouble(request.getParameter("block1scmc"));
			block6scmc = Double.parseDouble(request.getParameter("block6scmc"));
			block10scmc = Double.parseDouble(request.getParameter("block10scmc"));
			block1mcmc = Double.parseDouble(request.getParameter("block1mcmc"));
			BangMa bm = new BangMa(loaicuocgoi, ten, maquyuoc, chieudai, block1sfpt, block6sfpt, block10sfpt, block1mfpt, block1scmc, block6scmc, block10scmc, block1mcmc);
			bmd.themBangMa(bm);
			url = "/admin_bangma-add.jsp";
			break;
		case "edit":
			maquyuoc = request.getParameter("maquyuoc");
			cd =request.getParameter("chieudai");
			request.setAttribute("maquyuoc", maquyuoc);
			request.setAttribute("chieudai", cd);
			url = "/admin_bangma-update.jsp";
			break;
		case "update":
			ten = request.getParameter("ten1");
			maquyuoc = request.getParameter("maquyuoc1");
			chieudai = Integer.parseInt(request.getParameter("chieudai1"));
			block1sfpt = Double.parseDouble(request.getParameter("block1sfpt"));
			loaicuocgoi = request.getParameter("loaicuocgoi1");
			block6sfpt = Double.parseDouble(request.getParameter("block6sfpt"));
			block10sfpt = Double.parseDouble(request.getParameter("block10sfpt"));
			block1mfpt = Double.parseDouble(request.getParameter("block1mfpt"));
			block1scmc = Double.parseDouble(request.getParameter("block1scmc"));
			block6scmc = Double.parseDouble(request.getParameter("block6scmc"));
			block10scmc = Double.parseDouble(request.getParameter("block10scmc"));
			block1mcmc = Double.parseDouble(request.getParameter("block1mcmc"));
			BangMa bm1 = new BangMa(loaicuocgoi, ten, maquyuoc, chieudai, block1sfpt, block6sfpt, block10sfpt, block1mfpt, block1scmc, block6scmc, block10scmc, block1mcmc);
			bmd.updateBangMa(maquyuoc, chieudai, bm1);
			url = "/admin_bangma.jsp";
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
