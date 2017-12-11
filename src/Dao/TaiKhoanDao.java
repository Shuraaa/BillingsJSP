package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

				listTaiKhoan.add(new TaiKhoan(username, userpass, role, congtyID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return TaiKhoanDao.listTaiKhoan;
	}

	public static void deleteTaiKhoan(String userName) {
		// try {
		// Connection conn = DatabaseSQLConnection.getConnection();
		// Statement stmt = conn.createStatement();
		// String sql = " insert into taikhoan_nguoidung
		// (username,userpass,role,congtyID) values ('admin','123',1,'ct01');";
		// ResultSet ra = stmt.executeQuery(sql);
		// stmt.close();
		// conn.close();
		TaiKhoanDao.getListTaiKhoan().add(new TaiKhoan("aa", "d", 1, "ct7"));
		// }catch (Exception e) {
		// e.printStackTrace();
		// }
	}

	public static boolean addTaiKhoan(String userName, String userPass, int role, String congTyID) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			Statement stmt = conn.createStatement();
			// String sql = "insert into taikhoan_nguoidung values
			// ('"+userName+"','"+userPass+"',"+role+",'"+congTyID+"');";
			String sql = "   insert into taikhoan_nguoidung (username,userpass,role,congtyID) values ('user 4.1','123',0,'ct03');";
			ResultSet rs = stmt.executeQuery(sql);
			stmt.close();
			conn.close();
			// return true;
			// System.out.println("a");
			return true;
		} catch (Exception e) {
			System.err.println("error");
			return false;
		}

	}
}
