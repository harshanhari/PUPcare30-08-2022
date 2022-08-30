package demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveServlet
 */
@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * doGet(request, response);
		 */
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String location = request.getParameter("location");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");

			User u = new User();
			u.setName(name);
			u.setAge(age);
			u.setAddress(address);
			u.setPhone(phone);
			u.setLocation(location);
			u.setPassword(password);
			u.setGender(gender);
			u.setEmail(email);


			int status = RegistrationDao.save(u);
			if (status > 0) {
				/*
				 * out.print("<p>Record saved successfully!</p>");
				 */ out.println("<script type=\"text/javascript\">");
				out.println("alert('Record added successfully');");
				out.println("location='index.html';");
				out.println("</script>");
				/*
				 * request.getRequestDispatcher("index.html").include(request, response);
				 */			} else {
				out.println("Email already taken");
				request.getRequestDispatcher("registration.jsp").include(request, response);
			}

			out.close();
		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
	}

}
