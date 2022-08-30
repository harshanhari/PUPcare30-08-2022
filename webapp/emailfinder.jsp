<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel="icon" href="img/logo1.jpg" type="image/x-icon">

</head>
<body>


	<%@ page import="java.sql.*"%>
	<%
	String email = request.getParameter("email");
	session.setAttribute("semail", email);

	if (email.contains("@") && email.contains(".")) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
			PreparedStatement ps = con.prepareStatement("select * from user_registration where user_registration_email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
		response.sendRedirect("email_exists.jsp");

			} else {
	%>
	<script type="text/javascript">
		alert("Please fill the details")
	</script>
	<%@ include file="registration.jsp"%>
	<!-- 		response.sendRedirect("email_success.jsp");
 -->
	<%
	}
	} catch (Exception e) {
	out.print(e);
	}
	} else {
	response.sendRedirect("email_empty.jsp");

	}
	%>

</body>
</html>