<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>View User</title>
<link rel="icon" href="img/logo1.jpg" type="image/x-icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="online puppy selling website" name="keywords">
<meta content="online puppy selling website" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Flaticon Font -->
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="./css/newindex.css" rel="stylesheet">
<style>
.table {
	border: solid black;
	margin: auto;
}
</style>
</head>

<body>
	<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		response.sendRedirect("index.html");
	}
	%>
	<!-- Topbar Start -->
	<div class="container-fluid">

		<div class="row py-3 px-lg-5">
			<div class="col-lg-4">
				<a href="adminhome.jsp" class="navbar-brand d-none d-lg-block">
					<h1 class="m-0 display-5 text-capitalize">
						<span class="text-primary">Pup</span>Care
					</h1>
				</a>
			</div>
			<div class="col-lg-8 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">

					<div
						class="d-inline-flex flex-column text-center px-3 border-right">
						<h6>Email Us</h6>
						<p class="m-0">pupcareindia2022@gmail.com</p>
					</div>
					<div class="d-inline-flex flex-column text-center pl-3">
						<h6>Call Us</h6>
						<p class="m-0">+91 79949 62059</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid p-0">
		<nav
			class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
			<a href="adminhome.jsp" class="navbar-brand d-block d-lg-none">
				<h1 class="m-0 display-5 text-capitalize font-italic text-white">
					<span class="text-primary">Pup</span>Care
				</h1>
			</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between px-3"
				id="navbarCollapse">
				<div class="navbar-nav mr-auto py-0">
					<a href="adminhome.jsp" class="nav-item nav-link">Home</a> <a
						href="viewuser.jsp" class="nav-item nav-link active">View User</a>
					<a href="sellingrequest.jsp" class="nav-item nav-link">Selling
						Request</a> <a href="viewfeedback.jsp" class="nav-item nav-link">View
						Feedback</a> <a href="logout.jsp"
						onclick="alert('Successfully signout');" class="nav-item nav-link">Sign
						out</a>

				</div>

			</div>
		</nav>
	</div>
	<!-- Navbar End -->


	<header class="w3-container  w3-center">

		<%@page import="demo.RegistrationDao,demo.*,java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div style="padding: 5px;">

			<center>
				<h4 style="color: black">
					<b><u>Users List</u></b>
				</h4>
			</center>


			<%
			List<User> list = RegistrationDao.getAllUsers();
			request.setAttribute("list", list);
			%>
			<div class="table-responsive">

				<table border="1" class="table table-striped table-hover"
					style="background-color: black; color: white;">
					<tr style="background-color: #ff6037; color: black;">
						<th>Id</th>
						<th>Name</th>
						<th>Age</th>
						<th>Address</th>
						<th>Phone number</th>
						<th>Email</th>
						<th>Location</th>
						<th>Gender</th>

					</tr>
					<c:forEach items="${list}" var="u">
						<tr>
							<td>${u.getId()}</td>
							<td>${u.getName()}</td>
							<td>${u.getAge()}</td>
							<td>${u.getAddress()}</td>
							<td>${u.getPhone()}</td>
							<td>${u.getEmail()}</td>
							<td>${u.getLocation()}</td>
							<td>${u.getGender()}</td>

							<%-- <td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
						<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td> --%>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br />



		</div>
	</header>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>