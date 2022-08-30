package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import demo.Loginbean;

public class LoginDao {
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

	public static boolean validate(Loginbean loginBean) throws ClassNotFoundException {
		boolean status = false;
		try {
			Connection con = LoginDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"select user_registration_id,user_registration_email,user_registration_password from user_registration where user_registration_email = ? and user_registration_password = ? ");
			ps.setString(1, loginBean.getEmail());
			ps.setString(2, loginBean.getPassword());

			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			status = rs.next();

		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
		return status;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
