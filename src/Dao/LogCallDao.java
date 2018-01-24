package Dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.PreparedStatement;
import connection.DatabaseSQLConnection;
import model.LogCall;

public class LogCallDao {
	public static void insert(String extensionID, String thuebaonhan,int thoigian_goi,String d1,String d12) throws SQLException {
		Connection conn = DatabaseSQLConnection.getConnection();
		String sql = "insert into log_call(extensionID,thuebaonhan,thoigian_goi,bat_dau,ketthuc) values(?,?,?,?,?)";
//		try {
//			conn.setAutoCommit(false);
//			for (LogCall logCall : list) {
//				PreparedStatement pre = (PreparedStatement) conn.prepareCall(sql);
//				pre.setString(1, logCall.getExtensionID());
//				pre.setString(2, logCall.getThueBaoNhan());
//				pre.setInt(3, logCall.getThoiGianGoi());
//				pre.setString(4, logCall.getThoiGianBatDau());
//				pre.setString(5, logCall.getThoiGianKetThuc());
//				pre.execute();
//				pre.close();
//			}
//			conn.commit();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			System.out.println("extension ko tồn tại");
//			e.printStackTrace();
//			conn.rollback();
//		} finally {
//			if (conn != null) {
//				conn.close();
//			}
//		}
		 try {
		 PreparedStatement pre = (PreparedStatement)
		 conn.prepareStatement(sql);
		 pre.setString(1, extensionID);
		 pre.setString(2, thuebaonhan);
		 pre.setInt(3, thoigian_goi);
		 pre.setString(4, d1);
		 pre.setString(5, d12);
		 pre.execute();
		 pre.close();
		 conn.close();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 System.out.println("error");
		 e.printStackTrace();
		 }

	}

	public static void main(String[] args) throws Exception {
		ArrayList<LogCall> list = new ArrayList<>();
		LogCall l1 = new LogCall("84285107", "0989490403", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49");
		LogCall l2 = new LogCall("84285107", "0989490402", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49");
		LogCall l3 = new LogCall("84285107", "0989490401", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49");
		LogCall l4 = new LogCall("84285105", "0989490404", 10, "2016-04-01 08:36:39", "2016-04-01 08:36:49");
		list.add(l1);
		list.add(l2);
		list.add(l3);
		list.add(l4);
	//	insert(list);
		System.out.println();

	}
}
