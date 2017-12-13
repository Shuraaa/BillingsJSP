package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.DatabaseSQLConnection;

public class UserLogin {

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
}
