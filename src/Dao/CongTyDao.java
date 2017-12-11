package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.*;
import connection.DatabaseSQLConnection;

public class CongTyDao {
	private static ArrayList<CongTy> listCongTy;

	public static ArrayList<CongTy> getListCongTy() {
		listCongTy = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM congty ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congTyID = rs.getString("congtyID");
				String ten_congty = rs.getString("ten_congty");
				String logo = rs.getString("logo");
				String maso_thue = rs.getString("maso_thue");
				String dia_chi = rs.getString("dia_chi");
				String dienthoai = rs.getString("dienthoai");
				String email = rs.getString("email");
				double ti_le_make_up = rs.getDouble("ti_le_make_up");

				listCongTy.add(
						new CongTy(congTyID, ten_congty, logo, maso_thue, dia_chi, dienthoai, email, ti_le_make_up));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return CongTyDao.listCongTy;
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
		// CongTyDao.getListCongTy().add(new TaiKhoan("aa", "d", 1, "ct7"));
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

	// Test
	public static void main(String[] args) {
		// TaiKhoanDao.deleteTaiKhoan("admin");
		System.out.println(CongTyDao.getListCongTy().size());
		// TaiKhoanDao a = new TaiKhoanDao();
		// System.out.println(a.addTaiKhoan("sad", "a", 1, "ct02"));
	}
}
