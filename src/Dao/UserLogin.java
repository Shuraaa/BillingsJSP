package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.DatabaseSQLConnection;
import model.*;

public class UserLogin {

	// check Login
	public boolean checkLogin(String username, String userpass) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "SELECT * FROM taikhoan_nguoidung WHERE username ='" + username + "' and userpass = '" + userpass
				+ "' ";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// get User Info
	public TaiKhoan getUserInfo(String username) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "SELECT * FROM taikhoan_nguoidung WHERE username ='" + username + "' ";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TaiKhoan tk = new TaiKhoan();
				tk.setUserPass(rs.getString("userpass"));
				tk.setRole(rs.getInt("role"));
				tk.setCongTyID(rs.getString("congtyID"));
				return tk;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public CongTy getCompanyInfo(String username) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "SELECT * FROM congty c JOIN taikhoan_nguoidung t ON c.congtyID = t.congtyID WHERE username = '"
				+ username + "'";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CongTy ct = new CongTy();
				ct.setCongTyID(rs.getString("congtyID"));
				ct.setDiaChi(rs.getString("dia_chi"));
				ct.setDienThoai(rs.getString("dienthoai"));
				ct.setEmail(rs.getString("email"));
				ct.setLogo(rs.getBlob("logo"));
				ct.setMaSoThue(rs.getString("maso_thue"));
				ct.setTenCongTy(rs.getString("ten_congty"));
				ct.setTiLeMakeUp(rs.getInt("ti_le_make_up"));
				return ct;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}

	// set new password by username
	public void setNewPassByUsername(String username, String newpass) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "UPDATE taikhoan_nguoidung SET userpass = '" + newpass + "'" + "WHERE username='" + username + "'";
		PreparedStatement ps;
		try {
			if (newpass.length() >= 6) {
				ps = connection.prepareStatement(sql);
				ps.executeUpdate();
			} else {
				return;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateProfile(String iD, String email, String diaChi, String sdt, String mst) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "UPDATE congty SET email ='" + email + "'" + ",dia_chi ='" + diaChi + "'" + ", dienthoai ='" + sdt
				+ "'" + ",maso_thue='" + mst + "'" + "WHERE congtyID='" + iD + "'";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		UserLogin us = new UserLogin();
		us.updateProfile("ct02", "administrator@gmail.com", "Binh Thanh", "1114", "123456");

	}

}
