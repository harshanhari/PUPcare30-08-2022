package demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellDogsServlet
 */
@WebServlet("/SellDogsServlet")
public class SellDogsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SellDogsServlet() {
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
		try {
			
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			String breed = request.getParameter("breed");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String number = request.getParameter("number");
			String location = request.getParameter("location");
			String price = request.getParameter("price");
			String kci = request.getParameter("kci");
			String photo = request.getParameter("photo");
			String description = request.getParameter("description");

			Dogs d = new Dogs();
			d.setBreed(breed);
			d.setDob(dob);
			d.setGender(gender);
			d.setPhone(number);
			d.setLocation(location);
			d.setPrice(price);
			d.setRegistration(kci);
			d.setPhoto(photo);
			d.setDescription(description);

			int status = DogsDao.save(d);
			if (status > 0) {
				request.getRequestDispatcher("success.jsp").include(request, response);
			} else {

			}

			out.close();
		} catch (Exception e) {
			System.out.println(e);// TODO: handle exception
		}
	}

}
