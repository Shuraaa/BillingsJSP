/**
 * 
 * @author VinhPhu
 *
 */
package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connection.DatabaseSQLConnection;
import model.LichSu;

/**
 * @author pc
 *
 */
public class LichSuDAO {
	public static ArrayList<LichSu> getListOfLichSu() {
		ArrayList<LichSu> list = new ArrayList<>();
		Connection conn = (Connection) DatabaseSQLConnection.getConnection();
		String sql = "select * from lich_su";
		try {
			Statement st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				String importID = rs.getString("importID");
				String ngayImport = rs.getString("ngayImport");
				String tenFile = rs.getString("tenFile");
				int soDong = rs.getInt("soDong");
				list.add(new LichSu(importID, ngayImport, tenFile, soDong));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static void addLichSu(LichSu lichSu) {
		Connection conn = (Connection) DatabaseSQLConnection.getConnection();
		String sql = "INSERT INTO LICH_SU VALUES (?,?,?,?,?)";

	}
}