package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.PhongBan;
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
		// Them cac don hang vao danh sach bang cach thu cong

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

	public static void main(String[] args) {
		PhongBanDao a = new PhongBanDao();
		a.updatePhongBan("pb04", "phongban4");
		System.out.println(a.getListPBCongTy("ct01").size());
		// System.out.println(a.themPhongBan(new PhongBan("pb12", "phngban12",
		// "ct01")));
		// System.out.println(a.xoaPhongBan("pb02"));
		// System.out.println(a.addTaiKhoan("sad", "a", 1, "ct02"));
	}
}