package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Extension;

import com.mysql.jdbc.PreparedStatement;

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

	// update
	public void updateExtension(String idextension, Extension ext) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "update extension set extensionID='" + ext.getExtensionID() + "',dauso_sudung='"
				+ ext.getDauSoSuDung() + "',phongbanID='" + ext.getPhongBanID() + "'where extensionID='" + idextension
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
	public boolean themExtension(Extension ext) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "insert into extension values ('" + ext.getExtensionID() + "','" + ext.getTenNguoiDung() + "','"
				+ ext.getDauSoSuDung() + "','" + ext.getPhongBanID() + "');";
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
	public boolean xoaExtension(String extensionid) {
		Connection conn = DatabaseSQLConnection.getConnection();
		try {
			String sql2 = "delete from  log_call where extensionID = ?";
			PreparedStatement pre2 = (PreparedStatement) conn.prepareStatement(sql2);
			pre2.setString(1, extensionid);
			pre2.execute();

			String sql3 = "DELETE FROM extension WHERE extensionID = ?";
			PreparedStatement pre3 = (PreparedStatement) conn.prepareStatement(sql3);
			pre3.setString(1, extensionid);
			pre3.execute();

			pre2.close();
			pre3.close();

			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// kiểm tra extension có tồn tại hay không
	public static boolean kiemTraExtension(String extension, String dauso) {
		ArrayList<Extension> listEx = new ArrayList<>();
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM extension where extensionID='" + extension + "' and dauso_sudung = '" + dauso
					+ "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listEx.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listEx.size() == 1;
	}

	// get extension cua phong ban
	public static ArrayList<Extension> getListEXPhongBan(String phongbanid) {
		ArrayList<Extension> listexphongban = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM extension where phongbanID ='" + phongbanid + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listexphongban.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listexphongban;
	}

	// get extension cua CONG TY
	public static ArrayList<Extension> getListEXCongTy(String congtyid) {
		ArrayList<Extension> listexcongty = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = " SELECT e.extensionID, e.tennguoidung, e.dauso_sudung, e.phongbanID FROM extension e join phongban pb on e.phongbanID = pb.phongbanID  where congtyID = '"
					+ congtyid + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listexcongty.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listexcongty;
	}

	// get extension theo dau so
	public static ArrayList<Extension> getListEXDauSo(String dauso) {
		ArrayList<Extension> listexdauso = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM extension where dauso_sudung ='" + dauso + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listexdauso.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listexdauso;
	}
}