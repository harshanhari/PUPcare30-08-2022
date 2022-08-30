<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Registration</title>
<link rel="icon" href="img/logo1.jpg" type="image/x-icon">
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
		/* 		var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
		 */var location_valid = /^[a-zA-Z\s\,\''\-]*$/;
		var password_valid = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;

		var name = document.getElementById("name");
		var age = document.getElementById("age");
		var option = document.getElementsByName('gender');
		var phone = document.getElementById("phone");
		/* 		var email = document.getElementById("email");
		 */var location = document.getElementById("location");
		var password = document.getElementById("password");

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
			alert("Please Select your gender");
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

		/* if (!email_valid.test(email.value) || email.value == "") {
			alert("Enter valid Email..!");
			email.focus();
			return false;
		} */

		if (!location_valid.test(location.value) || location.value == "") {
			alert("Enter valid Location..!");
			location.focus();
			return false;
		}
		if (!password_valid.test(password.value) || password.value == "") {
			alert("Password must be 6 to 12 and allowed character are !@#$%&*()<> ");
			password.focus();

			return false;
		}
	}
</script>
</head>

<body>

	<%-- <%
	String valuefrom_jsp1 = (String) session.getAttribute("textboxval");
	%> --%>
	<!-- Topbar Start -->
	<div class="container-fluid">

		<div class="row py-3 px-lg-5">
			<div class="col-lg-4">
				<a href="index.html" class="navbar-brand d-none d-lg-block">
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
			<a href="index.html" class="navbar-brand d-block d-lg-none">
				<h1 class="m-0 display-5 text-capitalize font-italic text-white">
					<span class="text-primary">Pup</span>Care
				</h1>
			</a>


		</nav>
	</div>
	<!-- Navbar End -->

	<div class="card mb-3"
		style="border: solid black; margin: auto; padding: 20px; width: 400px; margin-top: 10px;">

		<h2 style="color: Black; text-align: center;">
			<u>Registration Here</u>

		</h2>
		<div class='signup' style="text-align: center;">

			<form name="form3" onsubmit="return validate()" action="saveuser.jsp"
				method="post">


				<br> <label style="margin-left: 30px; color: black;"> <b>Name
						: </b>
				</label> <input type='text' placeholder='Enter your name' id="name"
					name="name" style="margin-left: 27px;"><br> <br>
				<label style="margin-left: 30px; color: black;"> <b>Age
						: </b>
				</label> <input type="date" placeholder='Enter your age :' id="age"
					name="age" min='1956-01-01' max='2004-12-30'
					style="margin-left: 78px;"> <br> <br> <label
					for="gender" style="margin-right: 195px; color: black;"><b>Gender
						: </b> </label><br> <input type="radio" name="gender" id="gender"
					value="male" style="color: black;"> Male
				<input type="radio" name="gender" id="gender" value="female"
					style="color: black;"> Female <input type="radio"
					name="gender" id="gender" value="other" style="color: black;">
				Other<br> <br> <label
					style="margin-left: 30px; color: black;"> <b>Address :
				</b>
				</label> <input type='text' placeholder='Enter your address' / id="address"
					name="address" style="margin-left: 10px;"><br> <label
					style="margin-left: 30px; color: black;"><br> <b>Phone
						no : </b> </label> <input type="tel" placeholder='Enter your phone no'
					/ id="phone" name="phone" style="margin-left: 2.5px;"><br>
				<br>
				<!-- 	<label style="margin-left: 30px; color: black;"> <b>Email
						: </b>
				</label> -->

				<input type="hidden" /id="email" name="email"
					value="<%=session.getAttribute("semail")%>">
				<!-- <input type='email' placeholder='Enter your email' /id="email"
					name="email" style="margin-left: 30.5px;"><span
					id="mylocation"></span> <br> <br> -->
				<label style="margin-left: 30px; color: black;"> <b>Location
						: </b>
				</label> <input type="text" placeholder='Enter your location'
					/ id="location" name="location" style="margin-left: 10px;"><br>
				<br> <label style="margin-left: 30px; color: black;"> <b>Password
						: </b>
				</label> <input type="password" placeholder='Enter your password'
					/id="password" name="password"><br> <br> <label
					style="margin-left: 5px; color: black;"> <b>Re-Password
						: </b>
				</label> <input type="password" placeholder='Renter your password'
					/id="rpassword" name="rpassword"><br> <br> <input
					type='submit' id="save" value="Save" onclick="return Password()"
					style="background-color: #ff6037; border: none; color: white; padding: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: auto; margin-left: 32px; cursor: pointer; border-radius: 4px; width: 150px;">
				<script type="text/javascript">
					function Password() {
						var password = document.getElementById("password").value;
						var confirmPassword = document
								.getElementById("rpassword").value;
						if (password != confirmPassword) {
							alert("Passwords do not match.");
							rpassword.focus();

							return false;
						}
						return true;
					}
				</script>
				<input type='reset' placeholder='RESET' /id="reset"
					style="background-color: #ff6037; border: none; color: white; padding: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: auto; margin-left: 30px; cursor: pointer; border-radius: 4px; width: 100px;">
			</form>
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