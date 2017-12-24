package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.DauSo;
import model.PhongBan;
import connection.DatabaseSQLConnection;

public class DauSoDao {
	private static ArrayList<DauSo> listDauSo;

	public static ArrayList<DauSo> getListDauSo() {
		listDauSo = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDauSo.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return DauSoDao.listDauSo;
	}
	// lấy ra list đầu số tương ứng với công ty
	public static ArrayList<DauSo> getListDauSoCongTy(String idcongty) {
		ArrayList<DauSo> listDS = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM dauso where congtyID='"+idcongty+"' ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String dauSoSuDung = rs.getString("dauso_sudung");
				String congtyID = rs.getString("congtyID");
				String nhamangID = rs.getString("nhamang_ID");
				listDS.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDS;
	}
	
			// insert
			public boolean themDauSo(DauSo dauso) {
				Connection con = DatabaseSQLConnection.getConnection();
				String sql = "  insert into dauso values ('"+dauso.getDauSoSuDung()+"','"+dauso.getCongTyID()+"','"+dauso.getNhaMangID()+"');";
				try {

					PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
					ps.executeUpdate();
					System.out.println("thanh cmn cong");
					return true;
				} catch (SQLException e) {

					e.printStackTrace();
				}
				return false;
			}
			//delete
			public boolean xoaDauSo(String dauso) {
				Connection con = DatabaseSQLConnection.getConnection();
				String sql = "DELETE FROM dauso WHERE dauso_sudung = ?";
				//String sql1 = "DELETE FROM extension WHERE dauso_sudung = ?";
				try {
					PreparedStatement ps = (PreparedStatement) con.prepareCall(sql);
					//PreparedStatement ps1 = (PreparedStatement) con.prepareCall(sql1);
					ps.setString(1,dauso);
					//ps1.setString(1,dauso);
					return ps.executeUpdate() == 1;
							//&& ps1.executeUpdate() == 1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
			// kiểm tra đầu số tồn tại hay chưa
			public static boolean kiemTraDauSo(String dauso) {
				ArrayList<DauSo> listDS = new ArrayList<>();
				// Them cac don hang vao danh sach bang cach thu cong

				try {
					Connection connection = DatabaseSQLConnection.getConnection();
					Statement statement = connection.createStatement();
					String sql = "SELECT * FROM dauso where dauso_sudung ='"+dauso+"';";
					ResultSet rs = statement.executeQuery(sql);
					while (rs.next()) {
						String dauSoSuDung = rs.getString("dauso_sudung");
						String congtyID = rs.getString("congtyID");
						String nhamangID = rs.getString("nhamang_ID");
						listDS.add(new DauSo(dauSoSuDung, congtyID, nhamangID));
					}
					statement.close();
					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return listDS.size()==1;
			}

	// Test
	public static void main(String[] args) {
		DauSoDao ds = new DauSoDao();
		//System.out.println(ds.xoaDauSo("087323690"));
		DauSo d = new DauSo("0987678", "ct01", "FPT");
		//ds.themDauSo(d);
		System.out.println(ds.kiemTraDauSo("087323691"));
		//System.out.println(ds.getListDauSoCongTy("ct01").size());
		//System.out.println(DauSoDao.getListDauSo().size());
	}
}
