package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.*;
import connection.DatabaseSQLConnection;

public class DauSoDao {
	private static ArrayList<DauSo> listDauSo;

	public static ArrayList<DauSo> getListDauSo() {
		listDauSo = new ArrayList<>();
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

	// lấy ra list đầu số tương ứng với công ty
	public static ArrayList<DauSo> getListDauSoCongTy(String idcongty) {
		ArrayList<DauSo> listDS = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso where congtyID='" + idcongty + "' ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDS.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDS;
	}

	// insert
	public boolean themDauSo(DauSo dauso) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "  insert into dauso values ('" + dauso.getDauSoSuDung() + "','" + dauso.getCongTyID() + "','"
				+ dauso.getNhaMangID() + "');";
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

	// delete
	public boolean xoaDauSo(String dauso) {
		Connection conn = DatabaseSQLConnection.getConnection();
		try {
			String sql2 = "delete from  log_call where extensionID in (select extensionID from extension where dauso_sudung = ?);";
			PreparedStatement pre2 = (PreparedStatement) conn.prepareStatement(sql2);
			pre2.setString(1, dauso);
			pre2.execute();

			String sql3 = "DELETE FROM extension WHERE dauso_sudung = ?";
			PreparedStatement pre3 = (PreparedStatement) conn.prepareStatement(sql3);
			pre3.setString(1, dauso);
			pre3.execute();

			String sql4 = "DELETE FROM dauso WHERE dauso_sudung = ?";
			PreparedStatement pre4 = (PreparedStatement) conn.prepareStatement(sql4);
			pre4.setString(1, dauso);
			pre4.execute();

			pre2.close();
			pre3.close();
			pre4.close();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// kiểm tra đầu số tồn tại hay chưa
	public static boolean kiemTraDauSo(String dauso) {
		ArrayList<DauSo> listDS = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso where dauso_sudung ='" + dauso + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDS.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDS.size() == 1;
	}

	// lấy ra list đầu số tương ứng với nha mang
	public static ArrayList<DauSo> getListDauSoNhaMang(String nhamang) {
		ArrayList<DauSo> listDS = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso where nhamang_id='" + nhamang + "' ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDS.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDS;
	}
}