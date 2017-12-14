package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.*;
import connection.DatabaseSQLConnection;

public class CongTyDao {
	private static ArrayList<CongTy> listCongTy;

	public static ArrayList<CongTy> getListCongTy() {
		listCongTy = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM congty ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congTyID = rs.getString("congtyID");
				String ten_congty = rs.getString("ten_congty");
				String logo = rs.getString("logo");
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

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return CongTyDao.listCongTy;
	}

	public static boolean deleteCongTy(String congTyID) {
		try {
			Connection conn = DatabaseSQLConnection.getConnection();
			String sql1 = "delete from taikhoan_nguoidung where congtyid =?";
			PreparedStatement pre1 = (PreparedStatement) conn.prepareStatement(sql1);
			pre1.setString(1, congTyID);
			pre1.execute();

			String sql2 = "delete from dauso where congtyid =?";
			PreparedStatement pre2 = (PreparedStatement) conn.prepareStatement(sql2);
			pre2.setString(1, congTyID);
			pre2.execute();

			String sql3 = "delete from phongban where congtyid =?";
			PreparedStatement pre3 = (PreparedStatement) conn.prepareStatement(sql3);
			pre3.setString(1, congTyID);
			pre3.execute();

//			String sql4 = "delete from phongban where congtyid =?";
//			PreparedStatement pre4 = (PreparedStatement) conn.prepareStatement(sql4);
//			pre4.setString(1, congTyID);
//			pre4.execute();
//
//			String sql5 = "delete from dauso where congtyid =?";
//			PreparedStatement pre5 = (PreparedStatement) conn.prepareStatement(sql5);
//			pre5.setString(1, congTyID);
//			pre5.execute();

			String sql6 = "delete from congty where congtyid =?";
			PreparedStatement pre6 = (PreparedStatement) conn.prepareStatement(sql6);
			pre6.setString(1, congTyID);
			pre6.execute();

			pre1.close();
			pre2.close();
			pre3.close();
//			pre4.close();
//			pre5.close();
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
			pre.setString(1, congTy.getCongTyID());
			pre.setString(2, congTy.getTenCongTy());
			pre.setString(3, congTy.getLogo());
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

	// Test
	public static void main(String[] args) {
		//System.out.println(addTaiKhoan(new CongTy("ct05", "c", "c", "c", "c", "c", "c", 0.1)));
		System.out.println(deleteCongTy("ct04"));
	}
}
