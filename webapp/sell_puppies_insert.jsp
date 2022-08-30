<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Period"%>
<%@page import="demo.DogsDao"%>
<%@page import="demo.Dogs"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		response.sendRedirect("index.html");
	}
	%>
	<%
	try {
/* 		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
 */
		response.setContentType("text/html");
		PrintWriter outt = response.getWriter();

		String breed = request.getParameter("breed");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String number = request.getParameter("number");
		String location = request.getParameter("location");
		String price = request.getParameter("price");
		String kci = request.getParameter("kci");
		String photo = request.getParameter("photo");
		String description = request.getParameter("description");
		String userid = request.getParameter("id");
		String currentdate = request.getParameter("currentdate");

		//convert String to LocalDate
/* 		LocalDate dateBefore = LocalDate.parse(dob, formatter);
		LocalDate dateAfter = LocalDate.parse(currentdate, formatter);

		Period period = Period.between(dateBefore, dateAfter);
		long daysDiff = Math.abs(period.getDays());
		String ndays = Long.toString(daysDiff); */

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
		d.setUserid(userid);
		d.setCurrentdate(currentdate);
/* 		d.setNdays(ndays);
 */
		int status = DogsDao.save(d);
		if (status > 0) {
			request.getRequestDispatcher("success.jsp").include(request, response);
		} else {

		}

		out.close();
	} catch (Exception e) {
		System.out.println(e);// TODO: handle exception
	}
	%>
</body>
</html>