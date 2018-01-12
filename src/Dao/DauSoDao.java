package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.CongTy;
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
	// author: vinh
		public static ArrayList<DauSo> getList10DauSo(String congtyID, int firstResult)
				throws SQLException {
			Connection connection = DatabaseSQLConnection.getConnection();
			String sql = "SELECT * FROM dauso where congtyID = ? limit ?,10 ";
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setString(1, congtyID);
			ps.setInt(2, firstResult);
			ResultSet rs = ps.executeQuery();
			ArrayList<DauSo> list = new ArrayList<>();
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congTyID = rs.getString("congtyID");
				String nhaMangID = rs.getString("nhamang_id");
				list.add(new DauSo(congtyID,dauSoSuDung,nhaMangID));
			}
			ps.close();
			connection.close();
			return list;
		}

		public static int countDauSoByCompany(String congtyID ) {
			Connection connection = DatabaseSQLConnection.getConnection();
			String sql = "select count(dauso_sudung) from dauso where congtyID = '"+ congtyID+"'";
			int numberOfCompany = 0;
			try {
				Statement st = connection.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					numberOfCompany = rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return numberOfCompany;
		}

	// Test
	public static void main(String[] args) throws SQLException {
		//System.out.println(DauSoDao.getListDauSo().size());
		System.out.println(getList10DauSo("ct02", 0));
		System.out.println(countDauSoByCompany("ct02"));
	}
}
