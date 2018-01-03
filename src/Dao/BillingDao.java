package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.*;
import connection.DatabaseSQLConnection;

public class BillingDao {
	private static ArrayList<LogCall> listLogCall_CT;
	private static ArrayList<LogCall> listLogCall_PB;
	private static ArrayList<LogCall> listLogCall_EX;
	private static ArrayList<LogCall> listLogCall_DV;

	// lay danh sach billing theo cong ty
	public static ArrayList<LogCall> getListLogCall_CT(String idcongty) {
		listLogCall_CT = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi, lc.loai_cuocgoi, lc.gia_tien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where  ct.congtyID ='"
					+ idcongty + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");

				listLogCall_CT.add(new LogCall(congtyid, tencongty,
						extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, null, loai_cuocgoi, gia_tien));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return BillingDao.listLogCall_CT;
	}

	// lay danh sach billing theo phong ban
	public static ArrayList<LogCall> getListLogCall_PB(String idphongban) {
		listLogCall_PB = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi, lc.loai_cuocgoi, lc.gia_tien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where pb.phongbanID ='"
					+ idphongban + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");

				listLogCall_PB.add(new LogCall(congtyid, tencongty,
						extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, null, loai_cuocgoi, gia_tien));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// listTaiKhoan.add(new TaiKhoan("admin", "123", 1, "cty1"));
		// listTaiKhoan.add(new TaiKhoan("nguoidung", "123", 1, "cty2"));
		//
		return BillingDao.listLogCall_PB;
	}

	// lay danh sach billing theo extension
	public static ArrayList<LogCall> getListLogCall_EX(String idextension) {
		listLogCall_EX = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi, lc.loai_cuocgoi, lc.gia_tien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where ex.extensionID ='"
					+ idextension + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");

				listLogCall_EX.add(new LogCall(congtyid, tencongty,
						extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, null, loai_cuocgoi, gia_tien));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_EX;
	}

	// lay danh sach billing theo dich vu
	public static double tinhtongtien(String loaicuocgoi, String congtyid) {
		double tongtien = 0;

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID where loai_cuocgoi = '"+loaicuocgoi+"'and pb.congtyID = '"+congtyid+"' group by loai_cuocgoi;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				tongtien = rs.getDouble("tongtien");
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tongtien;
	}

	// lay danh sach billing theo dich vu
	public static ArrayList<LogCall> getListLogCall_DV(String dichvu) {
		listLogCall_DV = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi, lc.loai_cuocgoi, lc.gia_tien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where lc.loai_cuocgoi ='"
					+ dichvu + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");

				listLogCall_DV.add(new LogCall(congtyid, tencongty,
						extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, null, loai_cuocgoi, gia_tien));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_DV;
	}

	public static void main(String[] args) {
		BillingDao bl = new BillingDao();
		// System.out.println(bl.getListLogCall_CT("ct01"));
		//System.out.println(bl.getListLogCall_EX("84285105"));
		System.out.println(bl.tinhtongtien("A", "ct01"));
		// System.out.println(bl.getListLogCall_PB("pb02"));
	}
}
