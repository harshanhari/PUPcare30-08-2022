package demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();

		switch (username) {
		case "admin@gmail.com": {
			if (password.equals("Admin@123")) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				response.sendRedirect("admin_login_success.jsp");
				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
				 * rd.forward(request, response);
				 */

			} else {
				response.sendRedirect("login_fails.jsp");

				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("index.html");
				 * rd.forward(request, response); out.print("Invalid Entry");
				 */
			}
			break;
		}
		default: {

			Loginbean loginBean = new Loginbean();
			loginBean.setEmail(username);
			loginBean.setPassword(password);

			try {
				if (LoginDao.validate(loginBean)) {
					HttpSession session = request.getSession();

					session.setAttribute("username", username);
					response.sendRedirect("login_success.jsp");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("user", username);
					response.sendRedirect("login_fails.jsp");
					/*
					 * response.sendRedirect("index.html"); out.print("Invalid Entry");
					 */

				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		}
	}
}
