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
	private static ArrayList<LogCall> listLogCall_DVPB;
	private static ArrayList<LogCall> listLogCall_DVEX;

	// lay danh sach billing theo cong ty
	public static ArrayList<LogCall> getListLogCall_CT(String idcongty) {
		listLogCall_CT = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where  ct.congtyID ='"
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
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_CT.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
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
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where pb.phongbanID ='"
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
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_PB.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
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
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where ex.extensionID ='"
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
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_EX.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_EX;
	}

	// lay danh sach logcall cua cong ty theo dich vu
	public static ArrayList<LogCall> getListLogCall_DV(String dichvu, String idcongty) {
		listLogCall_DV = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where lc.loai_cuocgoi ='"
					+ dichvu + "'and ct.congtyID='" + idcongty + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_DV.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid, ten_phongban,
						thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
				;
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_DV;
	}

	// lay danh sach logcall cua phong ban theo dich vu
	public static ArrayList<LogCall> getListLogCall_DVPB(String dichvu, String idphongban) {
		listLogCall_DVPB = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where lc.loai_cuocgoi ='"
					+ dichvu + "'and pb.phongbanID='" + idphongban + "';";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_DVPB.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid,
						ten_phongban, thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_DVPB;
	}

	// lay danh sach logcall cua extension theo dich vu
	public static ArrayList<LogCall> getListLogCall_DVEX(String dichvu, String extension) {
		listLogCall_DVEX = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select ct.congtyID, ct.ten_congty, ex.extensionID, lc.thuebaonhan, pb.phongbanID, pb.ten_phongban,lc.thoigian_goi,lc.thang_nam, lc.loai_cuocgoi, lc.gia_tien,lc.bat_dau,lc.ketthuc from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID join congty ct on pb.congtyID = ct.congtyID where lc.loai_cuocgoi ='"
					+ dichvu + "'and ex.extensionID=" + extension + ";";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String congtyid = rs.getString("congtyID");
				String tencongty = rs.getString("ten_congty");
				String extensionID = rs.getString("extensionID");
				String thuebaonhan = rs.getString("thuebaonhan");
				String phongbanid = rs.getString("phongbanID");
				String ten_phongban = rs.getString("ten_phongban");
				int thoigian_goi = rs.getInt("thoigian_goi");
				int thang = Integer.parseInt(rs.getString("thang_nam"));
				String loai_cuocgoi = rs.getString("loai_cuocgoi");
				double gia_tien = rs.getDouble("gia_tien");
				String thoigianbatdau = rs.getString("bat_dau");
				String thoigianketthuc = rs.getString("ketthuc");

				listLogCall_DVEX.add(new LogCall(congtyid, tencongty, extensionID, thuebaonhan, phongbanid,
						ten_phongban, thoigian_goi, thang, loai_cuocgoi, gia_tien, thoigianbatdau, thoigianketthuc));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BillingDao.listLogCall_DVEX;
	}

	// TINH TONG TIEN CUA CONG TY theo dich vu
	public static double tinhtongtien(String loaicuocgoi, String congtyid) {
		double tongtien = 0;

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID where loai_cuocgoi = '"
					+ loaicuocgoi + "'and pb.congtyID = '" + congtyid + "' group by loai_cuocgoi;";
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

	// TINH TONG TIEN CUA tung phong ban theo dich vu
	public static double tinhtongtienpb(String loaicuocgoi, String phongbanid) {
		double tongtien = 0;

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID where loai_cuocgoi = '"
					+ loaicuocgoi + "'and pb.phongbanID = '" + phongbanid + "' group by loai_cuocgoi;";
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

	// TINH TONG TIEN CUA tung extension theo dich vu
	public static double tinhtongtienex(String loaicuocgoi, String extension) {
		double tongtien = 0;

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID where loai_cuocgoi = '"
					+ loaicuocgoi + "'and ex.extensionID = '" + extension + "' group by loai_cuocgoi;";
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

	// TINH TONG TIEN cua tat ca cong ty theo dich vu
	public static double tinhtongtienall(String loaicuocgoi) {
		double tongtien = 0;

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID join phongban pb on ex.phongbanID = pb.phongbanID where loai_cuocgoi = '"
					+ loaicuocgoi + "'group by loai_cuocgoi;";
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

	// TINH TONG TIEN MA CONG TY PHAI TRA (DA BAO GOM MAKEUP + VAT)
	public static double totalct(String idcongty, int thang) {
		double tilemakeup = CongTyDao.getTiLeMakeUp(idcongty);
		double noihat = BillingDao.tinhtongtien("A", idcongty);
		double tiennoihat = (double) Math.round(noihat * 100) / 100;
		double tiennoihatma = (double) Math.round((tiennoihat * (1 + tilemakeup)) * 100) / 100;

		double lientinh = BillingDao.tinhtongtien("C", idcongty);
		double tienlientinh = (double) Math.round(lientinh * 100) / 100;
		double tienlientinhma = (double) Math.round((tienlientinh * (1 + tilemakeup)) * 100) / 100;

		double didong = BillingDao.tinhtongtien("B", idcongty);
		double tiendidong = (double) Math.round(didong * 100) / 100;
		double tiendidongma = (double) Math.round((tiendidong * (1 + tilemakeup)) * 100) / 100;

		double quocte = BillingDao.tinhtongtien("D", idcongty);
		double tienquocte = (double) Math.round(quocte * 100) / 100;
		double tienquoctema = (double) Math.round((tienquocte * (1 + tilemakeup)) * 100) / 100;

		double dichvu = BillingDao.tinhtongtien("E", idcongty);
		double tiendichvu = (double) Math.round(dichvu * 100) / 100;
		double tiendichvuma = (double) Math.round((tiendichvu * (1 + tilemakeup)) * 100) / 100;

		double tongcuocp = 20000 + tiennoihatma + tienlientinhma + tiendidongma + tienquoctema + tiendichvuma;
		double tongcuoc7 = (double) Math.round(tongcuocp * 100) / 100;
		double phiphucvu8 = (double) Math.round((tongcuoc7 * 5 / 100) * 100) / 100;
		;
		double tongcongcuoc9 = (double) Math.round((tongcuoc7 + phiphucvu8) * 100) / 100;
		double thueVAT = (double) Math.round((tongcongcuoc9 * 10 / 100) * 100) / 100;
		double tongthanhtoan = (double) Math.round((tongcongcuoc9 + thueVAT) * 100) / 100;
		return tongthanhtoan;
	}

	// TINH TONG TIEN MA TONG CONG TY THU LAI
	public static double total(int thang) {
		ArrayList<CongTy> listCongTy = new ArrayList<CongTy>();
		listCongTy = CongTyDao.getListCongTy();
		double total = 0;
		for (int i = 0; i < listCongTy.size(); i++) {
			total += BillingDao.totalct(listCongTy.get(i).getCongTyID(), thang);
		}
		return total;
	}

	// TINH TONG TIEN cuoc goc cua dau so theo nha mang
	public static double tongcuocdausonm(String dauso, String nhamang, int thang) {
		double tongtien = 0;
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select  sum(gia_tien) tongtien from log_call lc join extension ex on lc.extensionID = ex.extensionID where nhamang_id = '"
					+ nhamang + "' and dauso_sudung = '" + dauso + "'  group by dauso_sudung;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				tongtien = rs.getDouble("tongtien");
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		tongtien = (double) Math.round(tongtien * 100) / 100;
		return tongtien;
	}

	// TINH TONG TIEN cua nha mang
	public static double tongcuocnhamang(String nhamang, int thang) {
		ArrayList<DauSo> listDauso = new ArrayList<DauSo>();
		listDauso = DauSoDao.getListDauSoNhaMang(nhamang);
		double total = 0;
		for (int i = 0; i < listDauso.size(); i++) {
			total += (20000 + BillingDao.tongcuocdausonm(listDauso.get(i).getDauSoSuDung(), nhamang, thang));
		}
		total = (double) Math.round(total * 100) / 100;
		return total;
	}

	public static void main(String[] args) {
		BillingDao bl = new BillingDao();
		// System.out.println(bl.getListLogCall_CT("ct01"));
		// System.out.println(bl.getListLogCall_EX("84285105"));
		// System.out.println(bl.tinhtongtien("A", "ct01"));
		// System.out.println(bl.getListLogCall_PB("pb02"));
		System.out.println(bl.tinhtongtienall("A"));
	}
}