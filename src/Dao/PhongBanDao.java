package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.PhongBan;
import model.TaiKhoan;
import connection.DatabaseSQLConnection;

public class PhongBanDao {
	private static ArrayList<PhongBan> listPhongBan;

	public static ArrayList<PhongBan> getListPhongBan() {
		listPhongBan = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM phongban ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String phongBanID = rs.getString("phongbanID");
				String tenPhongBan = rs.getString("ten_phongban");
				String congtyID = rs.getString("congtyID");

				listPhongBan.add(new PhongBan(phongBanID, tenPhongBan, congtyID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return PhongBanDao.listPhongBan;
	}

	// Test
	public static void main(String[] args) {
		System.out.println(PhongBanDao.getListPhongBan().size());
	}
}
