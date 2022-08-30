<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%
ResultSet resultset = null;
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Sell Puppies</title>
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
		var number_valid = /^[6-9]\d{9}$/;
		var location_valid = /^[a-zA-Z\s\,\''\-]*$/;
		var price_valid = /^[0-9]{4,6}$/;
		var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

		var breed = document.getElementById("breed");
		var option = document.getElementsByName('gender');
		var gender = document.getElementById("gender");
		var number = document.getElementById("number");
		var location = document.getElementById("location");
		var price = document.getElementById("price");
		var kci = document.getElementsByName('kci');
		var fileInput = document.getElementById("photo");
		var filePath = fileInput.value;
		var description = document.getElementById("description");

		if (breed.value == "" || breed.value == null
				|| breed.value == "Select breed") {
			alert("Select breed..!");
			breed.focus();
			return false;
		}
		if (dob.value == null || dob.value == "") {
			alert("Select puppy's Date of birth..!");
			dob.focus();
			return false;
		}
		if (!(option[0].checked || option[1].checked)) {
			alert("Please Select puppy's gender");
			return false;
		}
		if (!number_valid.test(number.value) || number.value == "") {
			alert("Enter valid Phone number..!");
			number.focus();
			return false;
		}
		if (!location_valid.test(location.value) || location.value == "") {
			alert("Enter valid Location..!");
			location.focus();
			return false;
		}
		if (!price_valid.test(price.value) || price.value == "") {
			alert("Enter valid amount..!");
			price.focus();
			return false;
		}
		if (!(kci[0].checked || kci[1].checked)) {
			alert("Please Select KCI status");
			return false;
		}
		if (!allowedExtensions.exec(filePath)) {
			alert('Only jpg, jpeg, png files are allowed');
			fileInput.value = '';
			fileInput.focus();
			return false;
		}
		if (description.value == "") {
			alert("Enter valid description..!");
			description.focus();
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
	<%
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	LocalDateTime now = LocalDateTime.now();
	String currentdate = dtf.format(now);
	%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/pupcare", "root", "");

		Statement statement = connection.createStatement();

		resultset = statement.executeQuery("select * from breed");
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
						href="sellpuppies.jsp" class="nav-item nav-link active">Sell
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
		<div class="card mb-3"
			style="border: solid black; width: 60%; margin: auto; padding: 20px;">
			<div class='signup'>
				<form name="form3" onsubmit="return validate()"
					action="uploadServlet" method="post" enctype="multipart/form-data">
					<h4>Select breed</h4>
					<select name="breed" id="breed">
						<%
						while (resultset.next()) {
						%>
						<option><%=resultset.getString(2)%></option>
						<%
						}
						%>
					</select>
					<hr>
					<h4>Enter date of birth</h4>
					<input type="date" id="dob" name="dob" min='2022-01-01'
						max='2022-08-26'
						style="display: block; margin-bottom: 10px; font-size: 1em;">
					<hr>
					<h4>Gender</h4>
					<input type="radio" name="gender" id="gender" value="male">
					Male <input type="radio" name="gender" id="gender" value="female">
					Female
					<hr>
					<h4>Contact number</h4>
					<input type="tel" id="number" name="number"
						placeholder="Enter your contact number"
						style="display: block; border-bottom: 1px solid rgba(0, 0, 0, .2); height: 25px; line-height: 25px; margin-bottom: 10px; font-size: 1em;">
					<hr>
					<h4>Location</h4>
					<input type="text" id="location" name="location"
						placeholder="Enter your location"
						style="display: block; border-bottom: 1px solid rgba(0, 0, 0, .2); height: 25px; line-height: 25px; margin-bottom: 10px; font-size: 1em;">
					<hr>
					<h4>Set price</h4>
					<input type="text" id="price" name="price"
						placeholder="Enter amount in INR"
						style="display: block; border-bottom: 1px solid rgba(0, 0, 0, .2); height: 25px; line-height: 25px; margin-bottom: 10px; font-size: 1em;">
					<hr>
					<h4>KCI registered</h4>
					<input type="radio" name="kci" id="kci" value="yes"> Yes <input
						type="radio" name="kci" id="kci" value="no"> No
					<hr>
					<h4>Add a photo</h4>
					<input type="file" id="photo" name="photo" size="50">

					<hr>
					<h4>Description</h4>
					<textarea name="description" id="description"
						placeholder="Please enter long unique discription"
						style="display: block; height: 100px; border-bottom: 1px solid rgba(0, 0, 0, .2); line-height: 25px; margin-bottom: 10px; font-size: 1em;"></textarea>
					<hr>
					<%@ page import="java.sql.*"%>
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pupcare", "root", "");
						PreparedStatement ps = con
						.prepareStatement("select user_registration_id from user_registration where user_registration_email=?");
						ps.setString(1, username);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
					%>
					<input type="hidden" id="id" name="id" value="<%=rs.getInt(1)%>">
					<%
					}
					} catch (Exception e) {
					out.print(e);
					}
					%>
					<%-- <%
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
					LocalDateTime now = LocalDateTime.now();
					String currentdate = dtf.format(now);
					%> --%>
					<input type="hidden" id="currentdate" name="currentdate"
						value="<%=currentdate%>"> <input type="submit" id="post"
						value="Post"
						style="background-color: #ff6037; border: none; color: white; padding: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: auto; cursor: pointer; border-radius: 4px; width: 200px;">
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
	<%
	//**Should I input the codes here?**
	} catch (Exception e) {
	out.println("wrong entry" + e);
	}
	%>
</body>

</html>