package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class DogsDao {
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

	public static int save(Dogs d) {
		int status = 0;
		try {
			Connection con = RegistrationDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"insert into dog_details ( dog_details_breed,dog_details_date_of_birth,dog_details_gender,dog_details_pic,dog_details_selling_request,dog_details_price,dog_details_post_date,dog_details_kci_certificate,dog_details_location,dog_details_contact_no,dog_details_description,dog_details_user_id) values (?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, d.getBreed());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getGender());
			ps.setString(4, d.getPhoto());
			ps.setString(5, "Awaiting for approval");
			ps.setString(6, d.getPrice());
			ps.setString(7, d.getCurrentdate());
			ps.setString(8, d.getRegistration());
			ps.setString(9, d.getLocation());
			ps.setString(10, d.getPhone());
			ps.setString(11, d.getDescription());
			ps.setString(12, d.getUserid());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;

	}

	public static List<Dogs> getAllDogs() {
		List<Dogs> list = new ArrayList<Dogs>();

		try {
			Connection con = DogsDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"select dog_details_id,dog_details_breed,dog_details_date_of_birth,dog_details_gender,dog_details_pic,dog_details_selling_request,dog_details_price,dog_details_post_date,dog_details_kci_certificate,dog_details_location,dog_details_contact_no,dog_details_description from dog_details");
			ResultSet rs = (ResultSet) ps.executeQuery();
			while (rs.next()) {
				Dogs d = new Dogs();
				d.setId(rs.getInt(1));
				d.setBreed(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setGender(rs.getString(4));
				d.setPhoto(rs.getString(5));
				d.setReq(rs.getString(6));
				d.setPrice(rs.getString(7));
				d.setCurrentdate(rs.getString(8));
				d.setRegistration(rs.getString(9));
				d.setLocation(rs.getString(10));
				d.setPhone(rs.getString(11));
				d.setDescription(rs.getString(12));

				list.add(d);
			}
			con.close();

		} catch (Exception ea) {
			ea.printStackTrace();

		}
		return list;

	}

	public static Dogs getRecordById(int id) {
		Dogs d = new Dogs();

		try {
			Connection con = DogsDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"select dog_details_id,dog_details_selling_request from dog_details where dog_details_id=?");
			ps.setInt(1, id);
			ResultSet rs = (ResultSet) ps.executeQuery();
			if (rs.next()) {
				d.setId(rs.getInt(1));
				d.setReq(rs.getString(2));

			}
			con.close();

		} catch (Exception eq) {
			eq.printStackTrace();

		}
		return d;
	}

	public static int update(Dogs d) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("update dog_details set dog_details_selling_request=? where dog_details_id=?");
			ps.setString(1, d.getReq());

			ps.setInt(2, d.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static List<Dogs> getSellingStatus() {
		List<Dogs> grp = new ArrayList<Dogs>();

		try {
			Connection con = DogsDao.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"SELECT dog_details.dog_details_id,dog_details.dog_details_breed,dog_details.dog_details_date_of_birth,dog_details.dog_details_gender,dog_details.dog_details_pic,dog_details.dog_details_selling_request,dog_details.dog_details_price,dog_details.dog_details_kci_certificate,dog_details.dog_details_location,dog_details.dog_details_contact_no,dog_details.dog_details_description,user_registration.user_registration_email FROM dog_details LEFT JOIN user_registration\r\n"
							+ "ON dog_details.dog_details_user_id = user_registration.user_registration_id;");
			ResultSet rs = (ResultSet) ps.executeQuery();
			while (rs.next()) {
				Dogs d = new Dogs();
				d.setId(rs.getInt(1));
				d.setBreed(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setGender(rs.getString(4));
				d.setPhoto(rs.getString(5));
				d.setReq(rs.getString(6));
				d.setPrice(rs.getString(7));
				d.setRegistration(rs.getString(9));
				d.setLocation(rs.getString(10));
				d.setPhone(rs.getString(11));
				d.setDescription(rs.getString(12));
				d.setEmail(rs.getString(13));

				grp.add(d);
			}
			con.close();

		} catch (Exception ea) {
			ea.printStackTrace();

		}
		return grp;

	}

}
