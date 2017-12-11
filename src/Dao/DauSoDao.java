package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.DauSo;
import connection.DatabaseSQLConnection;

public class DauSoDao {
	private static ArrayList<DauSo> listDauSo;

	public static ArrayList<DauSo> getListDauSo() {
		listDauSo = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDauSo.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return DauSoDao.listDauSo;
	}

	// Test
	public static void main(String[] args) {
		System.out.println(DauSoDao.getListDauSo().size());
	}
}
