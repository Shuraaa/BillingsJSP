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
		String sql2 = "insert into log_call(extensionID,thuebaonhan,thoigian_goi,bat_dau,ketthuc,importID) values(?,?,?,?,?,?)";
		try {
			conn.setAutoCommit(false);
			PreparedStatement pre1 = (PreparedStatement) conn.prepareCall(sql1);
			pre1.setString(1, importID);
			pre1.setString(2, ngayImport);
			pre1.setString(3, tenFile);
			pre1.setInt(4, soDong);
			pre1.execute();
			pre1.close();
			for (LogCall logCall : list) {
				PreparedStatement pre2 = (PreparedStatement) conn.prepareCall(sql2);
				pre2.setString(1, logCall.getExtensionID());
				pre2.setString(2, logCall.getThueBaoNhan());
				pre2.setInt(3, logCall.getThoiGianGoi());
				pre2.setString(4, logCall.getThoiGianBatDau());
				pre2.setString(5, logCall.getThoiGianKetThuc());
				pre2.setString(6, importID);
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
			String sql = "DELETE FROM log_call WHERE importid =?";
			PreparedStatement pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, importDate);
			pre.execute();

			pre.close();

			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) throws Exception {
		ArrayList<LogCall> list = new ArrayList<>();
		LogCall l1 = new LogCall("84285100", "0989490403", 101, "2016-04-01 08:36:39", "2016-04-01 08:36:49", "");
		LogCall l2 = new LogCall("84285100", "0989490402", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49", "");
		LogCall l3 = new LogCall("84285100", "0989490401", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49", "");
		LogCall l4 = new LogCall("84285100", "0989490404", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49", "");
		list.add(l1);
		list.add(l2);
		list.add(l3);
		list.add(l4);
		insert(list, "demo", 200);

		System.out.println("zb");

	}
}
