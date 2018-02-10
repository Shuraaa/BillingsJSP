package Dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.PreparedStatement;
import connection.DatabaseSQLConnection;
import model.LogCall;

public class LogCallDao {
	public static void insert(ArrayList<LogCall> list, String tenFile, int soDong) throws SQLException {
		Connection conn = DatabaseSQLConnection.getConnection();
		DateFormat dateFormat1 = new SimpleDateFormat("ddMMyyyyHHmmss");
		DateFormat dateFormat2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		String importID = dateFormat1.format(date);
		String ngayImport = dateFormat2.format(date);
		String sql1 = "insert into lich_su values(?,?,?,?)";

		int count = 0;

		try {
			conn.setAutoCommit(false);
			PreparedStatement pre1 = (PreparedStatement) conn.prepareCall(sql1);
			pre1.setString(1, importID);
			pre1.setString(2, ngayImport);
			pre1.setString(3, tenFile);
			pre1.setInt(4, soDong);
			pre1.execute();
			pre1.close();

			while (count < 100) {
				StringBuffer sql2 = new StringBuffer(
						"insert into log_call(extensionID,thuebaonhan,thoigian_goi,bat_dau,ketthuc,importID) values");

				for (int i = 0 + count * soDong / 100; i < (count + 1) * soDong / 100; i++) {
					if (i == ((count + 1) * soDong / 100) - 1) {
						sql2.append("('" + list.get(i).getExtensionID() + "','" + list.get(i).getThueBaoNhan() + "',"
								+ list.get(i).getThoiGianGoi() + ",'" + list.get(i).getThoiGianBatDau() + "','"
								+ list.get(i).getThoiGianKetThuc() + "'," + importID + ");");
					} else {
						sql2.append("('" + list.get(i).getExtensionID() + "','" + list.get(i).getThueBaoNhan() + "',"
								+ list.get(i).getThoiGianGoi() + ",'" + list.get(i).getThoiGianBatDau() + "','"
								+ list.get(i).getThoiGianKetThuc() + "'," + importID + "),");
					}
				}
				String s = sql2.toString();
				PreparedStatement pre2 = (PreparedStatement) conn.prepareCall(s);
				System.out.println(s);
				count = count + 1;
				System.out.println(count);
				pre2.execute();
				pre2.close();
			}
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("extension ko tồn tại");
			e.printStackTrace();
			conn.rollback();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	}

	public boolean deleteLogCallByDate(String importDate) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			String sql1 = "DELETE FROM log_call WHERE importid =?";
			String sql2 = "DELETE FROM lich_su where importid =?";
			PreparedStatement pre1 = (PreparedStatement) conn.prepareStatement(sql1);
			pre1.setString(1, importDate);
			pre1.execute();
			pre1.close();
			PreparedStatement pre2 = (PreparedStatement) conn.prepareStatement(sql2);
			pre2.setString(1, importDate);
			pre2.execute();
			pre2.close();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) throws Exception {

	}
}