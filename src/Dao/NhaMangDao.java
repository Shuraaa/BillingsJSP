package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import connection.DatabaseSQLConnection;
import model.NhaMang;

public class NhaMangDao {
	private static ArrayList<NhaMang> listNhaMang;

	public static ArrayList<NhaMang> getListNhaMang() {
		listNhaMang = new ArrayList<>();
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM nhamang ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String nhaMangID = rs.getString("nhamang_id");
				String tenNhaMang = rs.getString("ten_nhamang");
				listNhaMang.add(new NhaMang(nhaMangID, tenNhaMang));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NhaMangDao.listNhaMang;
	}
}
