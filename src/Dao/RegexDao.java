package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.BangMa;
import model.Regex;

import com.mysql.jdbc.PreparedStatement;

import connection.DatabaseSQLConnection;

public class RegexDao {
	private static ArrayList<Regex> listregex;

	//regex noihat
	public static ArrayList<Regex> getListRegex(String tenbang) {
		listregex = new ArrayList<>();

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM "+tenbang+" ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String ten = rs.getString("ten");
				String regex = rs.getString("regex");
				double block1sFPT = rs.getDouble("block1sFPT");
				double block6sFPT = rs.getDouble("block6sFPT");
				double block10sFPT = rs.getDouble("block10sFPT");
				double block1mFPT = rs.getDouble("block1mFPT");
				double block1sCMC = rs.getDouble("block1sCMC");
				double block6sCMC = rs.getDouble("block6sCMC");
				double block10sCMC = rs.getDouble("block10sCMC");
				double block1mCMC = rs.getDouble("block1mCMC");
				listregex.add(new Regex(ten, regex, block1sFPT, block6sFPT, block10sFPT, block1mFPT, block1sCMC, block6sCMC, block10sCMC, block1mCMC));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RegexDao.listregex;
	}

	// update
	public void updateRegex(String regex, String tenbang, Regex rg) {
		Connection connection = DatabaseSQLConnection.getConnection();
		String sql = "update "+tenbang+" set ten='" + rg.getTen()
				 + "',regex='" + rg.getRegex()
				+ "',block1sFPT=" + rg.getBlock1sFPT() + ",block6sFPT=" + rg.getBlock6sFPT()
				+ ",block10sFPT=" + rg.getBlock10sFPT() + ",block1mFPT=" + rg.getBlock1mFPT()
				+ ",block1sCMC=" + rg.getBlock1sCMC() + ",block6sCMC=" + rg.getBlock6sCMC()
				+ ",block10sCMC=" + rg.getBlock10sCMC() + ",block1mCMC=" + rg.getBlock1mCMC()
				+ "where regex='" + regex + "';";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("thanh cmn cong");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// insert
	public boolean themRegex(Regex rg,String tenbang ) {
		int n = RegexDao.getListRegex(tenbang).size();
		Connection con = DatabaseSQLConnection.getConnection();
		String sql = "insert into "+tenbang+" values ('"+ n + "','" + rg.getTen() + "','" + rg.getRegex() +"','" + rg.getBlock1sFPT() + "','"
				+ rg.getBlock6sFPT() + "','" + rg.getBlock10sFPT() + "','" + rg.getBlock1mFPT() + "','"
				+ rg.getBlock1sCMC() + "','" + rg.getBlock6sCMC() + "','" + rg.getBlock10sCMC() + "','"
				+ rg.getBlock1mCMC() + "');";
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
	public boolean xoaRegex(String regex, String tenbang) {
		Connection conn = DatabaseSQLConnection.getConnection();
		try {
			String sql = "delete from "+tenbang+" where regex = ? ";
			PreparedStatement pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, regex);
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
		public static Regex getRegex(String rg, String tenbang) {
			int id = 0;
			String ten = "";
			String regex = "";
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
				String sql = "SELECT * FROM "+tenbang+" where regex='" + rg + "' ;";
				ResultSet rs = statement.executeQuery(sql);
				while (rs.next()) {
					id = rs.getInt("idrg");
					ten = rs.getString("ten");
					regex = rs.getString("regex");
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
			return new Regex(ten, regex, block1sFPT, block6sFPT, block10sFPT, block1mFPT, block1sCMC, block6sCMC, block10sCMC, block1mCMC);
		}
	public static void main(String[] args) {
		RegexDao r = new RegexDao();
		System.out.println(RegexDao.getRegex("456787654345", "regexnoihat").getTen());
		Regex rg = new Regex("rrrr", "4354654t", 4, 5, 6, 7, 8, 8, 8, 8);
		r.updateRegex("456787654345", "regexnoihat", rg);
	}
	
}
