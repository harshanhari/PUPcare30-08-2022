package demo;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {

	/*
	 * // database connection settings private String dbURL =
	 * "jdbc:mysql://192.168.18.245:3306/javadbtest"; private String dbUser =
	 * "javadbtest"; private String dbPass = "GFW5sdwfxt";
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		String breed = request.getParameter("breed");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String number = request.getParameter("number");
		String location = request.getParameter("location");
		String price = request.getParameter("price");
		String kci = request.getParameter("kci");
		String description = request.getParameter("description");
		String userid = request.getParameter("id");
		String currentdate = request.getParameter("currentdate");
		InputStream inputStream = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		Connection conn = null; // connection to the database
		String message = null; // message will be sent back to client

		try {
			// connects to the database
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");

			// constructs SQL statement
			String sql = "insert into dog_details ( dog_details_breed,dog_details_date_of_birth,dog_details_gender,dog_details_selling_request,dog_details_price,dog_details_post_date,dog_details_kci_certificate,dog_details_location,dog_details_contact_no,dog_details_description,dog_details_user_id,dog_details_pic) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, breed);
			statement.setString(2, dob);
			statement.setString(3, gender);
			statement.setString(4, "Awaiting for approval");
			statement.setString(5, price);
			statement.setString(6, currentdate);
			statement.setString(7, kci);
			statement.setString(8, location);
			statement.setString(9, number);
			statement.setString(10, description);
			statement.setString(11, userid);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(12, inputStream);
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				request.getRequestDispatcher("success.jsp").include(request, response);

			} else {

			}

		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
			request.getRequestDispatcher("error.jsp").include(request, response);

		}
	}
}