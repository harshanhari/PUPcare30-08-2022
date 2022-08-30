<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		response.sendRedirect("index.html");
	}
	%>
	<%@ page import="java.sql.*"%>

	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String location = request.getParameter("location");
	int status = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
		PreparedStatement ps = con.prepareStatement(
		"update user_registration set user_registration_name=?,user_registration_age=?,user_registration_address=?,user_registration_phone_no=?,user_registration_location=?,user_registration_gender=? where user_registration_email=?");
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, address);
		ps.setString(4, phone);
		ps.setString(5, location);
		ps.setString(6, gender);
		ps.setString(7, username);
		status = ps.executeUpdate();
		if (status > 0) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Profile updated successfully');");
			out.println("location='userhome.jsp';");
			out.println("</script>");
			/* 			response.sendRedirect("userhome.jsp");
			 */
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Profile updation failed');");
			out.println("location='myprofile.jsp';");
			out.println("</script>");
			/* 			response.sendRedirect("myprofile.jsp");
			 */
		}
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>