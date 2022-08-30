package demo;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.PreparedStatement;

public class EmailDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(JdbcConnection.driverClass);
			con = DriverManager.getConnection(JdbcConnection.connectionUrl, JdbcConnection.username,
					JdbcConnection.password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;

	}

	public static int email(Emailbean e) {
		int status = 0;
		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("insert into user_registration (user_registration_email) values (?)");
			ps.setString(1, e.getEmail());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;

	}

}
