package demo;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String userid = request.getParameter("id");
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
			String sql = "update user_registration set user_registration_name=?,user_registration_age=?,user_registration_address=?,user_registration_phone_no=?,user_registration_location=?,user_registration_gender=?,user_registration_pic=? where user_registration_id=?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, age);
			statement.setString(3, address);
			statement.setString(4, phone);
			statement.setString(5, location);
			statement.setString(6, gender);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(7, inputStream);
			}
			statement.setString(8, userid);

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				request.getRequestDispatcher("successEdit.jsp").include(request, response);

			} else {

			}

		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
			request.getRequestDispatcher("errorUpdate.jsp").include(request, response);

		}

	}

}
