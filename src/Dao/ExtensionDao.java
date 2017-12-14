package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import model.*;
import connection.DatabaseSQLConnection;

public class ExtensionDao {
	private static ArrayList<Extension> listExtension;
	public static ArrayList<Extension> getListExtension() {
		listExtension = new ArrayList<>();
		// Them cac don hang vao danh sach bang cach thu cong

		try {
			Connection connection = DatabaseSQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM extension ;";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String extensionID = rs.getString("extensionID");
				String tenNguoiDung = rs.getString("tennguoidung");
				String dauSoSuDung = rs.getString("dauso_sudung");
				String phongBanID = rs.getString("phongbanID");
				listExtension.add(new Extension(extensionID, tenNguoiDung, dauSoSuDung, phongBanID) );
			}
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ExtensionDao.listExtension;
	}
	//update
			public void updateExtension(String idextension, Extension ext) {
				Connection connection = DatabaseSQLConnection.getConnection();
				String sql = "update extension set extensionID='" + ext.getExtensionID()+ "',dauso_sudung='"+ext.getDauSoSuDung()+ "',phongbanID='"+ext.getPhongBanID()+ "'where extensionID='" + idextension + "'";
				try {

					PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
					ps.executeUpdate();
					System.out.println("thanh cmn cong");
				} catch (SQLException e) {

					e.printStackTrace();
				}

			}
			// insert
			public boolean themExtension(Extension ext) {
				Connection con = DatabaseSQLConnection.getConnection();
				String sql = "insert into extension values ('"+ext.getExtensionID()+"','"+ext.getTenNguoiDung()+"','"+ext.getDauSoSuDung()+"','"+ext.getPhongBanID()+"');";
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
			public boolean xoaExtension(String extensionid) {
				Connection con = DatabaseSQLConnection.getConnection();
				String sql = "DELETE FROM extension WHERE extensionID = ?";
				try {
					PreparedStatement ps = (PreparedStatement) con.prepareCall(sql);
					ps.setString(1,extensionid);
					return ps.executeUpdate() == 1;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
			public static void main(String[] args) {
				ExtensionDao a = new ExtensionDao();
				//a.xoaExtension("842100");
				Extension e = new Extension("1212343323", "", "232233", "pb02");
				a.updateExtension("12123433", e);
			//	a.themExtension(e);
				//a.updatePhongBan("pb04", "phongban4");
//				System.out.println(a.themPhongBan(new PhongBan("pb12", "phngban12", "ct01")));
//				System.out.println(a.xoaPhongBan("pb02"));
				//System.out.println(a.addTaiKhoan("sad", "a", 1, "ct02"));
			}

}
