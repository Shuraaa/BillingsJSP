package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;
import com.sun.glass.ui.Window.Level;
import com.sun.istack.internal.logging.Logger;

import connection.DatabaseSQLConnection;

/**
 * Servlet implementation class ManagerDisplayImg
 */
@WebServlet("/ManagerDisplayImg")
public class ManagerDisplayImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerDisplayImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		String sql = null;
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		InputStream in = null;

		response.setContentType("image/jpeg");
		ServletOutputStream out;
		out = response.getOutputStream();
		Connection conn = DatabaseSQLConnection.getConnection();

		String ID = request.getParameter("congtyid");
		try {
			stmt = (Statement) conn.createStatement();
			sql = "SELECT * FROM congty WHERE congtyID='"+ID+"'";
			ResultSet result = stmt.executeQuery(sql);
			if (result.next()) {
				in = result.getBinaryStream(3);
			}
			bin = new BufferedInputStream(in);
			bout = new BufferedOutputStream(out);
			int ch = 0;
			while ((ch = bin.read()) != -1) {
				bout.write(ch);
			}

		} catch (SQLException ex) {

		} finally {
			try {
				if (bin != null)
					bin.close();
				if (in != null)
					in.close();
				if (bout != null)
					bout.close();
				if (out != null)
					out.close();
				if (conn != null)
					conn.close();
			} catch (IOException | SQLException ex) {
				System.out.println("Error : " + ex.getMessage());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
