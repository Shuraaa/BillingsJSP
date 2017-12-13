package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.*;
import connection.DatabaseSQLConnection;

public class TaiKhoanDao {
	private static ArrayList<TaiKhoan> listTaiKhoan;
	public static ArrayList<TaiKhoan> getListTaiKhoan() {
		listTaiKhoan = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM taikhoan_nguoidung ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String username = rs.getString("username");
				String userpass = rs.getString("userpass");
				int role = rs.getInt("role");
				String congtyID = rs.getString("congtyID");
				

				listTaiKhoan.add(new TaiKhoan(username, userpass, role, congtyID) );
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return TaiKhoanDao.listTaiKhoan;
	}
	//update
	public void updataNumber(String username, String un) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "update taikhoan_nguoidung set username='" + username+ "'" + "where username='" + un + "'";
		try {

			PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	// insert
	public boolean themTaiKhoan(TaiKhoan tk) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "INSERT INTO taikhoan_nguoidung (username,userpass,role,congtyID) VALUES('"+tk.getUserName()+"','"+tk.getUserPass()+"',"+tk.getRole()+",'"+tk.getCongTyID()+"');";
		try {

			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("thanh cmn cong");
			return true;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return false;
	}
	//delete
	public boolean xoaTaiKhoan(String username) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "DELETE FROM taikhoan_nguoidung WHERE username = ?";
		try {
			PreparedStatement ps = (PreparedStatement) con.prepareCall(sql);
			ps.setString(1, username);
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static void main(String[] args) {
		
		//TaiKhoanDao.deleteTaiKhoan("admin");
		System.out.println(TaiKhoanDao.getListTaiKhoan().size());
		TaiKhoanDao a = new TaiKhoanDao();
		a.updataNumber( "cuccuc","admion");
		//System.out.println(a.themTaiKhoan(new TaiKhoan("adadad", "ada", 2, "ct01")));
		System.out.println(a.xoaTaiKhoan("dao"));
		//System.out.println(a.addTaiKhoan("sad", "a", 1, "ct02"));
	}
}
