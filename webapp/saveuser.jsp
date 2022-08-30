<%@page import="demo.RegistrationDao"%>
<%@page import="demo.User"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<%
	try {
		response.setContentType("text/html");
		PrintWriter outt = response.getWriter();

		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String location = request.getParameter("location");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String pic = "pic";

		User u = new User();
		u.setName(name);
		u.setAge(age);
		u.setAddress(address);
		u.setPhone(phone);
		u.setLocation(location);
		u.setPassword(password);
		u.setGender(gender);
		u.setEmail(email);
		u.setPic(pic);

		int status = RegistrationDao.save(u);
		if (status > 0) {
			/*
			 * out.print("<p>Record saved successfully!</p>");
			 */ outt.println("<script type=\"text/javascript\">");
			outt.println("alert('Record added successfully');");
			outt.println("location='index.html';");
			outt.println("</script>");
			/*
			 * request.getRequestDispatcher("index.html").include(request, response);
			 */ } else {
			outt.println("Email already taken");
			request.getRequestDispatcher("registration.jsp").include(request, response);
		}

		outt.close();
	} catch (Exception e) {
		System.out.println(e);// TODO: handle exception
	}
	%>
</body>
</html>