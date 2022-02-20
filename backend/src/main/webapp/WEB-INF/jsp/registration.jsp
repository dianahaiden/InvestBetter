<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype HTML>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS file link -->
    <link rel="stylesheet" href="/css/registration.css">

    <!-- Font link -->

    <!-- Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Title of page -->
    <title>Registration</title>
</head>

<body>

    <!-- Background of page -->
    <section class="background" style="background-image: url('Resources/images/background/background.jpg')">

        <!-- Header Bar-->
        <nav class="navbar">
            <a href="/home"><img src="Resources/images/icons\logo.png" id="home-button"></a>
        </nav>


        <!-- Conatiner for main body -->
        <div class="body-section">
            <!-- Row that Login Box will be in -->
            <div class="row">
                <!-- Left Column (Blank)-->
                <div class="col"></div>

                <!-- Right Column (Registration Box)-->
                <div class="col">
                    <div class="registration-box">
                        <!-- Nav Bar for switching from Login to Registration-->
                        <div class="nav nav-pills nav-fill">
                            <!-- Login Button -->
                            <li class="nav-item">
                                <a class="nav-link" href="/login"><h2>Login</h2></a>
                            </li>
                            <!-- Registration Button -->
                            <li class="nav-item">
                                <a class="nav-link active" href="/register"><h2>Registration</h2></a>
                            </li>
                        </div>

                        <br>
                        <br>
                        
                        <!-- Form -->
                        <form class="registration-form" action="/registerConfirmation" method="post">
                            <!-- Row with two items-->
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="firstName" placeholder="First Name" name="fNameReg" pattern="[A-Za-z]{2,20}" title="Alphabetic Characters Only" required>
                                        <label for="floatingInput">First Name*</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="lastName" placeholder="Last Name" name="lNameReg" pattern="[A-Za-z]{2,20}" title="Alphabetic Characters Only" required>
                                        <label for="floatingInput">Last Name*</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" placeholder="name@example.com" name="emailReg" pattern="^[a-z0-9._%+-]+@(?:[a-z0-9-]+\.)+[a-z]{2,}$" title="Enter a valid email address" required>
                                <label for="floatingInput">Email address*</label>
                            </div>
                            <div class="row g-2">
	                            <div class="col-md">
		                            <div class="form-floating mb-3">
		                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="passwordReg" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]){8,16}" title="Must include: at least 1 lowercase letter, 1 uppercase letter, one special symbol [!@#$%^&*]" required>
		                                <label for="floatingPassword">Password*</label>
		                            </div>
	                            </div>
	                            <div class="col-md">
		                            <div class="form-floating mb-3">
		                                <input type="password" class="form-control" id="floatingConfirmPassword" placeholder="Confirm Password" name="cpasswordReg" required>
		                                <label for="floatingConfirmPassword">Confirm Password*</label>
		                            </div>
	                            </div>
                            </div>

                        <br>
                        <br>
                        <!-- Submit Button -->
                        <div class= "form-group">
                            <button type="submit" name ="login">Register</button>
                        </div>
                        </form>
                        <!--JavaScript for matching password and confirm password-->
    <script>
      function match() {
        var firstPword = document.getElementById("floatingPassword").value;
        var confPword = document.getElementById("floatingConfirmPassword").value;
        if (firstPword.localeCompare(confPword) == -1) {
          alert("Passwords do not match");
        } else {
          document.RegForm.submit();
        } //if-else for passwords matching
      }
    </script>

                    </div>
                </div>
            </div>
        </div>

    </section>


</body>

</html>