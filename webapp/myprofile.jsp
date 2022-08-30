<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>My Profile</title>
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
<script type="text/javascript">
	function validate() {
		var name_valid = /^[a-z A-Z]+$/;
		var address_valid = /^[a-zA-Z0-9\s\,\''\-]*$/;
		var phone_valid = /^[6-9]\d{9}$/;
		var location_valid = /^[a-zA-Z\s\,\''\-]*$/;

		var name = document.getElementById("name");
		var age = document.getElementById("age");
		var phone = document.getElementById("phone");
		var location = document.getElementById("location");
		var address = document.getElementById("address");
		var option = document.getElementsByName('gender');

		if (!name_valid.test(name.value) || name.value == "") {

			alert("Enter your Name, alphabets only..!");
			name.focus();
			return false;
		}

		if (age.value == null || age.value == "") {
			alert("Select your Date of birth..!");
			age.focus();
			return false;
		}
		if (!(option[0].checked || option[1].checked || option[2].checked)) {
			alert("Please Select Your Gender");
			return false;
		}
		if (!address_valid.test(address.value) || address.value == "") {
			alert("Enter valid Address..!");
			address.focus();
			return false;
		}

		if (!phone_valid.test(phone.value) || phone.value == "") {
			alert("Enter valid Phone number..!");
			phone.focus();
			return false;
		}

		if (!location_valid.test(location.value) || location.value == "") {
			alert("Enter valid Location..!");
			location.focus();
			return false;
		}

	}
</script>
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
						href="myprofile.jsp" class="nav-item nav-link active">My
						profile</a> <a href="buy_puppy.jsp" class="nav-item nav-link">Buy
						Puppies</a> <a href="sellpuppies.jsp" class="nav-item nav-link">Sell
						Puppies</a> <a href="selling_status.jsp" class="nav-item nav-link">Selling
						Status</a><a href="aboutus.jsp" class="nav-item nav-link">About</a>

					<!-- <div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-toggle="dropdown">Pages</a>
						<div class="dropdown-menu rounded-0 m-0">
							<a href="blog.html" class="dropdown-item">Blog Grid</a> <a
								href="single.html" class="dropdown-item">Blog Detail</a>
						</div>
					</div> -->
					<a href="contact.jsp" class="nav-item nav-link">Contact</a> <a
						href="addfeedback.jsp" class="nav-item nav-link">Feedback</a> <a
						href="logout.jsp" onclick="alert('Successfully signout');"
						class="nav-item nav-link">Sign out</a>

				</div>

			</div>
		</nav>
	</div>
	<!-- Navbar End -->



	<div class="col-md-8" style="padding-top: 20px; margin: auto;">
		<div class="card mb-3" style="border: solid black; margin: auto;">

			<div class="card-body">
				<%@ page import="java.sql.*"%>
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
					PreparedStatement ps = con.prepareStatement(
					"select user_registration_name,user_registration_age,user_registration_address,user_registration_phone_no,user_registration_location,user_registration_id from user_registration where user_registration_email=?");
					ps.setString(1, username);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<form name="form3" onsubmit="return validate()"
					action="UploadServlet" method="post" enctype="multipart/form-data">
					<div class="row">

						<div class="col-sm-9 text-secondary">

							<img src="getImage.jsp?id=<%=rs.getInt(6)%>" alt="no profile picture added"
								style="border-radius: 500px; width: 200px; height: 200px; margin-bottom: 50px;">

						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Update your profile pic</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<input type="file" name="photo" id="photo"
								style="padding-top: 10px; background-size: 15px; width: 250px;">

						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>NAME</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<input type="text" value="<%=rs.getString(1)%>"
								placeholder="Enter youe name" name="name"
								style="background-color: transparent; width: 350px;" id="name"
								class="name-field">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Age</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<center>
								<input type="date" id="age" name="age"
									value="<%=rs.getString(2)%>" placeholder="Enter your age"
									style="background-color: transparent; margin-right: 600px;"
									class="name-field">
							</center>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Gender</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">

							<input type="radio" name="gender" id="gender" value="male"
								style="color: black;"> Male <input type="radio"
								name="gender" id="gender" value="female" style="color: black;">
							Female <input type="radio" name="gender" id="gender"
								value="other" style="color: black;"> Other
							<%-- <input type="text" size="50" id="gender"
							placeholder="Enter your gender"
							style="background-color: transparent; width: 350px;"
							value="<%=rs.getString(6)%>" class="name-field"> --%>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Address</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<input type="text" value="<%=rs.getString(3)%>" size="50"
								id="address" name="address" placeholder="Enter your address"
								style="background-color: transparent; width: 350px;"
								class="name-field">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Phone</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<input type="tel" id="phone" name="phone"
								value="<%=rs.getString(4)%>"
								placeholder="Enter your phone number"
								style="width: 200px; background-color: transparent; width: 350px;"
								class="name-field">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h4 class="mb-0">
								<b>Location</b>
							</h4>
						</div>
						<div class="col-sm-9 text-secondary">
							<input type="text" size="50" id="location" name="location"
								placeholder="Enter your location"
								style="background-color: transparent; width: 350px;"
								value="<%=rs.getString(5)%>" class="name-field">
						</div>
						<input type="hidden" id="id" name="id" value="<%=rs.getInt(6)%>">
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<input class="button" type="submit" value="Save Changes"
								id="edit"
								style="background-color: #ff6037; border: none; color: white; padding: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: auto; cursor: pointer; border-radius: 4px;">
						</div>
					</div>
					<%
					}
					} catch (Exception e) {
					out.print(e);
					}
					%>
				</form>

			</div>
		</div>
	</div>


	<!-- Carousel Start -->
	<!-- <div class="container-fluid p-0">
		<div id="header-carousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100" src="img/carousel-1.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<h3 class="text-white mb-3 d-none d-sm-block">Best Puppy
								Services</h3>
							<h1 class="display-3 text-white mb-3">Keep Your Pup Happy</h1>
							<h5 class="text-white mb-3 d-none d-sm-block">Happiness is a
								warm puppy</h5>

						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="img/carousel-2.jpg" alt="Image">
					<div
						class="carousel-caption d-flex flex-column align-items-center justify-content-center">
						<div class="p-3" style="max-width: 900px;">
							<h3 class="text-white mb-3 d-none d-sm-block">Best Pet
								Services</h3>
							<h1 class="display-3 text-white mb-3">Pup Selling & Buying</h1>
							<h5 class="text-white mb-3 d-none d-sm-block">A dog is the
								only thing on earth that loves you more than he loves himself</h5>

						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#header-carousel"
				data-slide="prev">
				<div class="btn btn-primary rounded"
					style="width: 45px; height: 45px;">
					<span class="carousel-control-prev-icon mb-n2"></span>
				</div>
			</a> <a class="carousel-control-next" href="#header-carousel"
				data-slide="next">
				<div class="btn btn-primary rounded"
					style="width: 45px; height: 45px;">
					<span class="carousel-control-next-icon mb-n2"></span>
				</div>
			</a>
		</div>
	</div> -->
	<!-- Carousel End -->
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