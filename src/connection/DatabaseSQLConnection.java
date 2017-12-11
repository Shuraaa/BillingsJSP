package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseSQLConnection {
	public static Connection getConnection() {
		Connection connection = null;
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/billings";
		String user = "root";
		String pass = "01667781178";
		
//		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//		String url = "jdbc:sqlserver://localhost:1433;databaseName=WEB";
//		String user = "sa";
//		String pass = "12345";
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) { // Orther err e.printStackTrace();

		}
		return connection;
	}

	public static void main(String[] args) {
		Connection connection = DatabaseSQLConnection.getConnection();
		if (connection != null) {
			System.out.println("ket noi thanh cong");
		} else {
			System.out.println("ket noi that bai");
		}
	}
}
