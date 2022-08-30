package demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddFeedbackServlet1
 */
@WebServlet("/AddFeedbackServlet1")
public class AddFeedbackServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddFeedbackServlet1() {
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
		 */		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			String name = request.getParameter("name");
			String feedback = request.getParameter("feedback");
			AddFeedback f = new AddFeedback();

			f.setName(name);
			f.setFeedback(feedback);

			int status = AddFeedbackDao.save(f);
			if (status > 0) {
				request.getRequestDispatcher("feedback_success.jsp").include(request, response);

			} else {
				out.println("Sorry! unable to save record");

			}

			out.close();
		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
	}

}
