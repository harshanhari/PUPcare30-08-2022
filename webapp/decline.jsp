<%@page import="demo.Dogs"%>
<%@page import="demo.DogsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Decline page</title>



</head>

<body>


	<%
	String id = request.getParameter("id");
	Dogs d = new Dogs();

	try {
		Connection con = DogsDao.getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(
		"select dog_details_id,dog_details_selling_request from dog_details where dog_details_id=?");
		ps.setString(1, id);
		ResultSet rs = (ResultSet) ps.executeQuery();
		if (rs.next()) {
			d.setId(rs.getInt(1));
			d.setReq(rs.getString(2));

		}
		con.close();

	} catch (Exception eq) {
		eq.printStackTrace();

	}
	%>
	<input type="hidden" name="id" value="<%=d.getId()%>" />

	<%@ page import="java.sql.*"%>

	<%
	int status = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
		PreparedStatement ps = con.prepareStatement(
		"update dog_details set dog_details_selling_request=? where dog_details_id=?");
		ps.setString(1, "Decline");
		ps.setInt(2, d.getId());
		
		status = ps.executeUpdate();
		if (status > 0) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Decline successfully');");
			out.println("location='sellingrequest.jsp';");
			out.println("</script>");
			/* 			response.sendRedirect("userhome.jsp");
			 */
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Decline failed');");
			out.println("location='sellingrequest.jsp';");
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