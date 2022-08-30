<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<link rel="icon" href="img/logo1.jpg"
	type="image/x-icon">
</head>
<body>


	<%
	PrintWriter in = response.getWriter();

	// Set the content type of response to "text/html"
	response.setContentType("text/html");

	// For understanding purpose, print the session object in the console before
	// invalidating the session.
	System.out.println("Session before invalidate: " + request.getSession(false));

	// Invalidate the session.
	request.getSession(false).invalidate();

	// Print the session object in the console after invalidating the session.
	System.out.println("Session after invalidate: " + request.getSession(false));

	// Print success message to the user and close the print writer object.
	response.sendRedirect("index.html");

	in.close();
	%>
	<!-- <script type="text/javascript">
		function alertName() {
			alert("Successfully signout");
		}
	</script> -->
</body>
</html>