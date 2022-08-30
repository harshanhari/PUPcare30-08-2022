package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class AddFeedbackDao {
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

	public static int save(AddFeedback f) {
		int status = 0;
		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("insert into feedback ( feedback_name,feedback_content) values (?,?)");
			ps.setString(1, f.getName());
			ps.setString(2, f.getFeedback());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;

	}

	public static List<AddFeedback> getAllFeedback() {
		List<AddFeedback> list = new ArrayList<AddFeedback>();

		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from feedback");
			ResultSet rs = (ResultSet) ps.executeQuery();
			while (rs.next()) {
				AddFeedback u = new AddFeedback();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setFeedback(rs.getString(3));

				list.add(u);
			}
			con.close();

		} catch (Exception ea) {
			ea.printStackTrace();

		}
		return list;

	}
}
