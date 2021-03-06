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
    <link rel="stylesheet" href="css/login.css">

    <!-- Font link -->

    <!-- Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Title of page -->
    <title>Login</title>
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

                <!-- Right Column (Login Box)-->
                <div class="col">
                    <div class="login-box">
                        <!-- Nav Bar for switching from Login to Registration-->
                        <div class="nav nav-pills nav-fill">
                            <!-- Login Button -->
                            <li class="nav-item">
                                <a class="nav-link active" href="/login"><h2>Login</h2></a>
                            </li>
                            <!-- Registration Button -->
                            <li class="nav-item">
                                <a class="nav-link" href="/register"><h2>Registration</h2></a>
                            </li>
                        </div>

                        <br>
                        <br>

                        <!-- Form -->
                        <form class="login-form" action="/userLoginControllerServlet">
                        <h3 style="color:burlywood" align="center">${confirm}</h3>
                        <h3 style="color:burlywood" align="center">${emailConfirm}</h3>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" required>
                                <label for="floatingInput">Email address*</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
                                <label for="floatingPassword">Password*</label>
                            </div>

                        <br>
                        <br>
                        <!-- Submit Button -->
                        <div class= "form-group">
                            <button type="submit" name ="login">Log In</button>
                        </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>


</body>

</html>