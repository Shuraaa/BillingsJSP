package Dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.PreparedStatement;

import connection.DatabaseSQLConnection;
import model.CongTy;

public class CongTyDao {
	private static ArrayList<CongTy> listCongTy;

	public static ArrayList<CongTy> getListCongTy() {
		listCongTy = new ArrayList<>();
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM congty ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congTyID = rs.getString("congtyID");
				String ten_congty = rs.getString("ten_congty");
				Blob logo = rs.getBlob("logo");
				String maso_thue = rs.getString("maso_thue");
				String dia_chi = rs.getString("dia_chi");
				String dienthoai = rs.getString("dienthoai");
				String email = rs.getString("email");
				double ti_le_make_up = rs.getDouble("ti_le_make_up");

				listCongTy.add(
						new CongTy(congTyID, ten_congty, logo, maso_thue, dia_chi, dienthoai, email, ti_le_make_up));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return CongTyDao.listCongTy;
	}

	public static boolean deleteCongTy(String congTyID) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			String sql1 = "delete from taikhoan_nguoidung where congtyid =?";
			PreparedStatement pre1 = (PreparedStatement) conn.prepareStatement(sql1);
			pre1.setString(1, congTyID);
			pre1.execute();

			String sql2 = "delete from log_call where extensionID in  (select extensionID from extension e join phongban p on e.phongbanID = p.phongbanID where  p.congtyID= ? )";
			PreparedStatement pre2 = (PreparedStatement) conn.prepareStatement(sql2);
			pre2.setString(1, congTyID);
			pre2.execute();

			String sql3 = "delete from extension where phongbanID in (select phongbanID from phongban where  congtyID= ?)";
			PreparedStatement pre3 = (PreparedStatement) conn.prepareStatement(sql3);
			pre3.setString(1, congTyID);
			pre3.execute();

			String sql4 = "delete from phongban where congtyid =?";
			PreparedStatement pre4 = (PreparedStatement) conn.prepareStatement(sql4);
			pre4.setString(1, congTyID);
			pre4.execute();
			//
			String sql5 = "delete from dauso where congtyid =?";
			PreparedStatement pre5 = (PreparedStatement) conn.prepareStatement(sql5);
			pre5.setString(1, congTyID);
			pre5.execute();

			String sql6 = "delete from congty where congtyid =?";
			PreparedStatement pre6 = (PreparedStatement) conn.prepareStatement(sql6);
			pre6.setString(1, congTyID);
			pre6.execute();

			pre1.close();
			pre2.close();
			pre3.close();
			pre4.close();
			pre5.close();
			pre6.close();

			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean addCongTy(CongTy congTy) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			String sql = "insert into congty values (?,?,?,?,?,?,?,?);";
			PreparedStatement pre = (PreparedStatement) conn.prepareStatement(sql);
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			// tạo 1 đối tượng có định dạng thời gian yyyy-MM-dd HH:mm:ss
			Date date = new Date(); // lấy thời gian hệ thống
			String stringDate = dateFormat.format(date);// Định dạng thời gian
														// theo trên
			pre.setString(1, stringDate);
			pre.setString(2, congTy.getTenCongTy());
			pre.setBlob(3, congTy.getLogo());
			pre.setString(4, congTy.getMaSoThue());
			pre.setString(5, congTy.getDiaChi());
			pre.setString(6, congTy.getDienThoai());
			pre.setString(7, congTy.getEmail());
			pre.setDouble(8, congTy.getTiLeMakeUp());
			pre.execute();
			pre.close();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("error");
			return false;
		}
	}

	public static boolean updateCongTy(CongTy congTy) {
		//
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			String sql = "update congty set ten_congty = ? , maso_thue = ?,dia_chi =?,dienthoai = ?,email = ?,ti_le_make_up = ? where congtyID = ?";
			PreparedStatement pre = (PreparedStatement) conn.prepareStatement(sql);

			pre.setString(1, congTy.getTenCongTy());
			// pre.setString(2, congTy.getLogo());
			pre.setString(2, congTy.getMaSoThue());
			pre.setString(3, congTy.getDiaChi());
			pre.setString(4, congTy.getDienThoai());
			pre.setString(5, congTy.getEmail());
			pre.setDouble(6, congTy.getTiLeMakeUp());
			pre.setString(7, congTy.getCongTyID());
			pre.execute();
			pre.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}
	}

	public static int countAllOfCompany() {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "SELECT count(congtyID) FROM congty";
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

	// lay ra ti le make up cua cong ty
	public static double getTiLeMakeUp(String idcongty) {
		double tile_makeup = 0;
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.ti_le_make_up from congty ct where ct.congtyID = '" + idcongty + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				tile_makeup = rs.getDouble("ti_le_make_up");
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tile_makeup;
	}

	public static boolean addTaiKhoan(String userName, String userPass, int role, String congTyID) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			Statement stmt = conn.createStatement();
			// String sql = "insert into taikhoan_nguoidung values
			// ('"+userName+"','"+userPass+"',"+role+",'"+congTyID+"');";
			String sql = "   insert into taikhoan_nguoidung (username,userpass,role,congtyID) values ('user 4.1','123',0,'ct03');";
			ResultSet rs = stmt.executeQuery(sql);
			stmt.close();
			conn.close();
			// return true;
			// System.out.println("a");
			return true;
		} catch (Exception e) {
			System.err.println("error");
			return false;
		}
	}
	public static void main(String[] args) {
		CongTyDao ctd = new CongTyDao();
		System.out.println(ctd.getTiLeMakeUp("ct01"));
	}
}