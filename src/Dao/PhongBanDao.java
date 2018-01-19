package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.*;
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
		return PhongBanDao.listPhongBan;
	}

	// update
	public void updatePhongBan(String idphongban, String tenPhongBanUpdate) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "update phongban set ten_phongban='" + tenPhongBanUpdate + "'" + "where phongbanID='" + idphongban
				+ "'";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("thanh cmn cong");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// insert
	public boolean themPhongBan(PhongBan pb) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "  insert into phongban values ('" + pb.getPhongBanID() + "','" + pb.getTenPhongBan() + "','"
				+ pb.getCongTyID() + "');";
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
	public boolean xoaPhongBan(String phongbanid) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "DELETE FROM phongban WHERE phongbanID = ?";
		String sql1 = "DELETE FROM extension WHERE phongbanID = ?";
		try {
			PreparedStatement ps = (PreparedStatement) con.prepareCall(sql);
			PreparedStatement ps1 = (PreparedStatement) con.prepareCall(sql1);
			ps.setString(1, phongbanid);
			ps1.setString(1, phongbanid);
			return (ps.executeUpdate() == 1 && ps1.executeUpdate() == 1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	// get phong ban cua cong ty
	public static ArrayList<PhongBan> getListPBCongTy(String congtyid) {
		ArrayList<PhongBan> listpbcongty = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM phongban where congtyID ='" + congtyid + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String phongBanID = rs.getString("phongbanID");
				String tenPhongBan = rs.getString("ten_phongban");
				String congtyID = rs.getString("congtyID");
				listpbcongty.add(new PhongBan(phongBanID, tenPhongBan, congtyID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listpbcongty;
	}

	// kiểm tra phòng ban nhập vào đã tồn tại hay không
	public static boolean kiemTraPhongBan(String congtyid, String tenphongban) {
		ArrayList<PhongBan> listPB = new ArrayList<>();
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM phongban where congtyID='" + congtyid + "'and ten_phongban='" + tenphongban
					+ "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String phongBanID = rs.getString("phongbanID");
				String tenPhongBan = rs.getString("ten_phongban");
				String congtyID = rs.getString("congtyID");
				listPB.add(new PhongBan(phongBanID, tenPhongBan, congtyID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPB.size() == 1;
	}

	// lấy id cong ty khi biết phòng ban
	public static String getIDCongTy(String phongbanid) {
		String congtyID = "";
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM phongban where phongbanID='" + phongbanid + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String phongBanID = rs.getString("phongbanID");
				String tenPhongBan = rs.getString("ten_phongban");
				congtyID = rs.getString("congtyID");
				// listPB.add(new PhongBan(phongBanID, tenPhongBan, congtyID) );
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return congtyID;
	}

	// lấy ten phong ban khi biết id phòng ban
	public static String getTenPhongBan(String phongbanid) {
		String tenPhongBan = "";
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM phongban where phongbanID='" + phongbanid + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String phongBanID = rs.getString("phongbanID");
				tenPhongBan = rs.getString("ten_phongban");
				String congtyID = rs.getString("congtyID");
				// listPB.add(new PhongBan(phongBanID, tenPhongBan, congtyID) );
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tenPhongBan;
	}

	public static int countPhongBanByCompany() {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "select count(phongbanID) from phongban";
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
}