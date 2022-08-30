<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Selling Status</title>
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
				<a href="userhome.jsp" class="navbar-brand d-none d-lg-block">
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
			<a href="userhome.jsp" class="navbar-brand d-block d-lg-none">
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
					<a href="userhome.jsp" class="nav-item nav-link">Home</a> <a
						href="myprofile.jsp" class="nav-item nav-link">My profile</a> <a
						href="buy_puppy.jsp" class="nav-item nav-link">Buy Puppies</a> <a
						href="sellpuppies.jsp" class="nav-item nav-link">Sell Puppies</a>
					<a href="selling_status.jsp" class="nav-item nav-link active">Selling
						Status</a><a href="aboutus.jsp" class="nav-item nav-link">About</a>

					<!-- <div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-toggle="dropdown">Pages</a>
						<div class="dropdown-menu rounded-0 m-0">
							<a href="blog.html" class="dropdown-item">Blog Grid</a> <a
								href="single.html" class="dropdown-item">Blog Detail</a>
						</div>
					</div> -->
					<a href="contact.jsp" onclick="msg()" class="nav-item nav-link">Contact</a>
					<a href="addfeedback.jsp" class="nav-item nav-link">Feedback</a> <a
						href="logout.jsp" id="confirmation"
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

		<div class="card-body">
			<%@ page import="java.sql.*"%>
			<%
			List<Dogs> list = new ArrayList<Dogs>();

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
				PreparedStatement ps = con.prepareStatement(
				"SELECT dog_details.dog_details_id,dog_details.dog_details_breed,dog_details.dog_details_date_of_birth,dog_details.dog_details_gender,dog_details.dog_details_pic,dog_details.dog_details_selling_request,dog_details.dog_details_price,dog_details.dog_details_kci_certificate,dog_details.dog_details_location,dog_details.dog_details_contact_no,dog_details.dog_details_description FROM dog_details LEFT JOIN user_registration ON dog_details.dog_details_user_id = user_registration.user_registration_id WHERE user_registration.user_registration_email=?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Dogs d = new Dogs();
					d.setId(rs.getInt(1));
					d.setBreed(rs.getString(2));
					d.setDob(rs.getString(3));
					d.setGender(rs.getString(4));
					d.setPhoto(rs.getString(5));
					d.setReq(rs.getString(6));
					d.setPrice(rs.getString(7));
					d.setRegistration(rs.getString(8));
					d.setLocation(rs.getString(9));
					d.setPhone(rs.getString(10));
					d.setDescription(rs.getString(11));

					list.add(d);
				}
				con.close();
				request.setAttribute("list", list);
			%>
			<div class="table-responsive">
				<table id="dtBasicExample" border="1"
					class="table table-striped table-hover table-sm"
					style="background-color: black; color: white;">
					<tr style="background-color: #ff6037; color: black;">
						<th>Id</th>
						<th>Breed</th>
						<th>Date of birth</th>
						<th>Gender</th>
						<th>Price</th>
						<th>KCI certificate</th>
						<th>Location</th>
						<th>Contact number</th>
						<th>Description</th>
						<th>Approval status</th>
						<th>Photo</th>




					</tr>
					<c:forEach items="${list}" var="d">
						<tr>
							<td>${d.getId()}</td>
							<td>${d.getBreed()}</td>
							<td>${d.getDob()}</td>
							<td>${d.getGender()}</td>
							<td>${d.getPrice()}</td>
							<td>${d.getRegistration()}</td>
							<td>${d.getLocation()}</td>
							<td>${d.getPhone()}</td>
							<td>${d.getDescription()}</td>
							<td>${d.getReq()}</td>
							<td>
								<center>
									<img alt="img"
										src="pupImage.jsp?id=${d.getId()}
										style="
										width="150" height="150"margin-bottom: 50px;">
								</center>
							</td>

						</tr>
					</c:forEach>
				</table>
				<script type="text/javascript">
					$(document).ready(function() {
						$('#dtBasicExample').DataTable();
						$('.dataTables_length').addClass('bs-select');
					});
				</script>
			</div>
			<br />
			<%
			} catch (Exception e) {
			out.print(e);
			}
			%>


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