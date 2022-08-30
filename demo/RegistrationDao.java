package demo;

import java.util.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class RegistrationDao {

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

	public static int save(User u) {
		int status = 0;
		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"insert into user_registration ( user_registration_name,user_registration_age,user_registration_address,user_registration_phone_no,user_registration_location,user_registration_password,user_registration_gender,user_registration_email,user_registration_pic) values (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setString(2, u.getAge());
			ps.setString(3, u.getAddress());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getLocation());
			ps.setString(6, u.getPassword());
			ps.setString(7, u.getGender());
			ps.setString(8, u.getEmail());
			ps.setString(9, u.getPic());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;

	}

	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"select user_registration_id,user_registration_name,user_registration_age,user_registration_address,user_registration_phone_no,user_registration_email,user_registration_location,user_registration_gender from user_registration");
			ResultSet rs = (ResultSet) ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setAge(rs.getString(3));
				u.setAddress(rs.getString(4));
				u.setPhone(rs.getString(5));
				u.setEmail(rs.getString(6));
				u.setLocation(rs.getString(7));
				u.setGender(rs.getString(8));

				list.add(u);
			}
			con.close();

		} catch (Exception ea) {
			ea.printStackTrace();

		}
		return list;

	}

	
	/*
	 * public static List<User> getAllEmail() { List<User> list = new
	 * ArrayList<User>();
	 * 
	 * try { Connection con = RegistrationDao.getConnection(); PreparedStatement ps
	 * = (PreparedStatement) con
	 * .prepareStatement("select user_registration_email from user_registration");
	 * ResultSet rs = (ResultSet) ps.executeQuery(); while (rs.next()) { User u =
	 * new User();
	 * 
	 * u.setEmail(rs.getString(1));
	 * 
	 * list.add(u); } con.close();
	 * 
	 * } catch (Exception ea) { ea.printStackTrace();
	 * 
	 * } return list;
	 * 
	 * }
	 */
	/*
	 * public static int update(User e) { int status = 0; try { Connection con =
	 * RegistrationDao.getConnection(); PreparedStatement ps = (PreparedStatement)
	 * con
	 * .prepareStatement("update Userloyee_details set name=?,password=?,email=?,country=? where id=?"
	 * ); ps.setString(1, e.getName()); ps.setString(2, e.getPassword());
	 * ps.setString(3, e.getEmail()); ps.setString(4, e.getCountry());
	 * 
	 * status = ps.executeUpdate();
	 * 
	 * con.close();
	 * 
	 * } catch (Exception ep) { ep.printStackTrace();
	 * 
	 * } return status; }
	 * 
	 * public static int delete(int id) { int status = 0; try { Connection con =
	 * RegistrationDao.getConnection(); PreparedStatement ps = (PreparedStatement)
	 * con.prepareStatement("delete form Userloyee_details where id=?");
	 * ps.setInt(1, id); status = ps.executeUpdate();
	 * 
	 * con.close(); } catch (Exception ew) { ew.printStackTrace();
	 * 
	 * } return status; }
	 * 
	 * public static User getUserloyeebyid(int id) { User e = new User();
	 * 
	 * try { Connection con = RegistrationDao.getConnection(); PreparedStatement ps
	 * = (PreparedStatement) con
	 * .prepareStatement("select * from Userloyee_details where id=?"); ps.setInt(1,
	 * id); ResultSet rs = (ResultSet) ps.executeQuery(); if (rs.next()) {
	 * e.setId(rs.getInt(1)); e.setName(rs.getString(2));
	 * e.setPassword(rs.getString(3)); e.setEmail(rs.getString(4));
	 * e.setCountry(rs.getString(5)); } con.close();
	 * 
	 * } catch (Exception eq) { eq.printStackTrace();
	 * 
	 * } return e; }
	 */

}
