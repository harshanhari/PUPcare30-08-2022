package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewUserServlet
 */
@WebServlet("/ViewUserServlet")
public class ViewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1>User List</h1>");

			List<User> list = RegistrationDao.getAllUsers();
			out.print("<table border='1' width='100%'>");
			out.print(
					"<tr><th>Id</th><th>Name</th><th>Age</th><th>Address</th><th>Phone number</th><th>Email</th><th>Location</th><th>Gender</th></tr>");
			for (User u : list) {
				out.print("<tr><td>" + u.getId() + "</td><td>" + u.getName() + "</td><td>" + u.getAge() + "</td><td>"
						+ u.getAddress() + "</td><td>" + u.getPhone() + "</td><td>" + u.getEmail() + "</td><td>"
						+ u.getLocation() + "</td><td>" + u.getGender() + "</td></tr>");
			}
			out.print("</table>");

			out.close();
		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub doGet(request, response); }
	 */

}
