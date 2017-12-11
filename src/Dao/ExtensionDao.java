package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.*;
import connection.DatabaseSQLConnection;

public class ExtensionDao {
	private static ArrayList<Extension> listExtension;

	public static ArrayList<Extension> getListExtension() {
		listExtension = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM extension ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listExtension.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ExtensionDao.listExtension;
	}

	// Test
	public static void main(String[] args) {
		System.out.println(ExtensionDao.getListExtension().size());
	}

}
