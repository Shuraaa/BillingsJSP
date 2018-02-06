package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.BangMa;
import model.Extension;

import com.mysql.jdbc.PreparedStatement;

import connection.DatabaseSQLConnection;

public class BangMaDao {
	private static ArrayList<BangMa> listbangma;

	// danh sach bang ma theo loai cuoc
	public static ArrayList<BangMa> getListBangMa(String loaicuocgoi) {
		listbangma = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM bangma where loai_cuocgoi='" + loaicuocgoi + "' ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String maquyuoc = rs.getString("maquyuoc");
				String loaicg = rs.getString("loai_cuocgoi");
				String ten = rs.getString("ten");
				int chieudai = rs.getInt("chieudai");
				double block1sFPT = rs.getDouble("block1sFPT");
				double block6sFPT = rs.getDouble("block6sFPT");
				double block10sFPT = rs.getDouble("block10sFPT");
				double block1mFPT = rs.getDouble("block1mFPT");
				double block1sCMC = rs.getDouble("block1sCMC");
				double block6sCMC = rs.getDouble("block6sCMC");
				double block10sCMC = rs.getDouble("block10sCMC");
				double block1mCMC = rs.getDouble("block1mCMC");
				listbangma.add(new BangMa(loaicg, ten, maquyuoc, chieudai, block1sFPT, block6sFPT, block10sFPT,
						block1mFPT, block1sCMC, block6sCMC, block10sCMC, block1mCMC));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BangMaDao.listbangma;
	}

	// update
	public void updateBangMa(String maquyuoc, double chieudai, BangMa bangma) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "update bangma set maquyuoc='" + bangma.getMaQuyUoc() + "',ten='" + bangma.getTen()
				+ "',chieudai='" + bangma.getChieuDai() + "',loai_cuocgoi='" + bangma.getLoaiCuocGoi()
				+ "',block1sFPT='" + bangma.getBlock1sFPT() + "',block6sFPT='" + bangma.getBlock6sFPT()
				+ "',block10sFPT='" + bangma.getBlock10sFPT() + "',block1mFPT='" + bangma.getBlock1mFPT()
				+ "',block1sCMC='" + bangma.getBlock1sCMC() + "',block6sCMC='" + bangma.getBlock6sCMC()
				+ "',block10sCMC='" + bangma.getBlock10sCMC() + "',block1mCMC='" + bangma.getBlock1mCMC()
				+ "'where maquyuoc='" + maquyuoc + "'and chieudai='" + chieudai + "'";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("thanh cmn cong");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// insert
	public boolean themBangMa(BangMa bangma) {
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "insert into bangma values ('" + bangma.getMaQuyUoc() + "','" + bangma.getChieuDai() + "','"
				+ bangma.getLoaiCuocGoi() + "','" + bangma.getTen() + "','" + bangma.getBlock1sFPT() + "','"
				+ bangma.getBlock6sFPT() + "','" + bangma.getBlock10sFPT() + "','" + bangma.getBlock1mFPT() + "','"
				+ bangma.getBlock1sCMC() + "','" + bangma.getBlock6sCMC() + "','" + bangma.getBlock10sCMC() + "','"
				+ bangma.getBlock1mCMC() + "');";
		try {
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.executeUpdate();
			// System.out.println("thanh cmn cong");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// delete
	public boolean xoaBangMa(String maquyuoc, int chieudai) {
		Connection conn = DatabaseSQLConnection.getConnection();
		try {
			String sql = "delete from  bangma where maquyuoc = ? and chieudai= ? ";
			PreparedStatement pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, maquyuoc);
			pre.setInt(2, chieudai);
			pre.execute();
			pre.close();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// lay thong tin của mot ma cuoc goi
	public static BangMa getBangMa(String maqu, int cdai) {
		String maquyuoc = "";
		String loaicg = "";
		String ten = "";
		int chieudai = 0;
		double block1sFPT = 0;
		double block6sFPT = 0;
		double block10sFPT = 0;
		double block1mFPT = 0;
		double block1sCMC = 0;
		double block6sCMC = 0;
		double block10sCMC = 0;
		double block1mCMC = 0;
		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM bangma where maquyuoc='" + maqu + "'and chieudai=" + cdai + " ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				maquyuoc = rs.getString("maquyuoc");
				loaicg = rs.getString("loai_cuocgoi");
				ten = rs.getString("ten");
				chieudai = rs.getInt("chieudai");
				block1sFPT = rs.getDouble("block1sFPT");
				block6sFPT = rs.getDouble("block6sFPT");
				block10sFPT = rs.getDouble("block10sFPT");
				block1mFPT = rs.getDouble("block1mFPT");
				block1sCMC = rs.getDouble("block1sCMC");
				block6sCMC = rs.getDouble("block6sCMC");
				block10sCMC = rs.getDouble("block10sCMC");
				block1mCMC = rs.getDouble("block1mCMC");
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new BangMa(loaicg, ten, maquyuoc, chieudai, block1sFPT, block6sFPT, block10sFPT, block1mFPT, block1sCMC,
				block6sCMC, block10sCMC, block1mCMC);
	}

	public static void main(String[] args) {
		BangMaDao bmd = new BangMaDao();
		BangMa bm = new BangMa("A", "dao", "24", 10, 12, 12, 11, 11, 11, 34, 11, 44);
		bmd.updateBangMa("24", 10, bm);
	}
}