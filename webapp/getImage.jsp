<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.Blob"%>
	<%@page import="java.io.OutputStream"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.Connection"%>
	<%
	String id = request.getParameter("id");

	String connectionURL = "jdbc:mysql://localhost:3306/pupcare";
	String user = "root";
	String pass = "";

	Connection con = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connectionURL, user, pass);

		PreparedStatement ps = con.prepareStatement("select * from user_registration where user_registration_id=?");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("user_registration_pic");
			byte byteArray[] = blob.getBytes(1, (int) blob.length());
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArray);
			os.flush();
			os.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
		con.close();
			} catch (Exception e) {
		e.printStackTrace();
			}
		}
	}
	%>
</body>
</html>