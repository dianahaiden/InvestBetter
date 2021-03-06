<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  
 <%@ page import="java.util.Arrays" %>
 <%@ page import="java.util.List" %>
<!doctype HTML>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous"></link>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-DBjhmceckmzwrnMMrjI7BvG2FmRuxQVaTfFYHgfnrdfqMhxKt445b7j3KBQLolRl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha384-xBuQ/xzmlsLoJpyjoggmTEz8OWUFM0/RC5BsqQBDX2v5cMvDHcMakNTNrHIW2I5f" crossorigin="anonymous"></script>
    <script type="text/javascript" src="Scripts/app.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!-- CSS file link -->
    <link rel="stylesheet" type="text/css" href="css/home.css">

    <!-- Font link -->

    <!-- Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Title of page -->
    <title>Home</title>
</head>

<body>

     <!-- Header Bar-->
     <nav class="navbar">
        <!-- Logo -->
        <a href="/home"><img src="Resources/images/icons/logo.png" id="home-button"></a>
       <c:choose> 
    <c:when test="${empty emailID}">
        <!-- Sign Up Button -->
        <a href="/register"><button type="submit" name ="sign-up" id="sign-up">Sign Up</button></a>

        <!-- Log in Button-->
        <a href="/login" id="login"><h2>Login</h2></a>
       </c:when>
       <c:otherwise>
        	<!-- Log out Button-->
        <a href="/logout" ><button type="submit" name ="logout" id="logout">Logout</button></a>
        </c:otherwise>
       </c:choose>
        <!-- Short Term Invester -->
        <a href="/investing" id="start-investing"><h2>Begin Investing</h2></a>

         <!-- My Portfolio -->
       <a href="/portfolio" id="portfolio"><h2>My Portfolio</h2></a>
    </nav>
    
    <!-- Divider under Header-->
    <div class="h-divider"></div>



    <section class="container">
        <!-- Main Body of page -->
        <div class="home-quote" id="start-of-page">
            <div class="row">
                <h1>Start Investing Sustainably</h1>
            </div>

            <div class="summary-info row">
                <p>Ethical investing is in!</p>
                <p>Use InvestBetter to invest in progess and invest in yourself</p>
            </div>

            <br>
            <div class="row">
                <a href="#our-feautres"><button type="submit" name ="continue" id="continue">Start Learning</button></a>
            </div>
        </div>
    </section>

    <div class="background">
        <img src="Resources/images/background/home-background.jpg" style="width:100%;height:80%;">
    </div>
    
    <br>

    <section class="container">
        <div class="row g-2 our-stuff" id="our-feautres">
            <div class="features col-md-4">
                <h1>What is sustainable investing?</h1>

                <br>

                <div class="">
                    <h3>These three criteria are compiled into a rating.</h3>
                    <h3>Invest with a company that will last and will do good.</h3>
                </div>

                <br>

                <div class="row">
                    <a href="#searches"><button type="submit" name ="continue" id="continue">Find ESG Ratings</button></a>
                </div>
            </div>

            <div class="feature-nav-bar col-md-8">
                <!-- Nav Bar for switching from Login to Registration-->
                <div class="nav nav-pills nav-fill">
                    <!-- Login Button -->
                    <li class="nav-item">
                        <a class="nav-link active" href="#our-feautres" onclick="openTab(event, 'Portfolio')" id="defaultOpen"><h2>Environment</h2></a>
                    </li>
                    <!-- Registration Button -->
                    <li class="nav-item">
                        <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'Stocks')"><h2>Social</h2></a>
                    </li>
                    <!-- Registration Button -->
                    <li class="nav-item">
                        <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'Sustainable')"><h2>Governance</h2></a>
                    </li>
                </div>
                  
                  <div id="Portfolio" class="tabcontent">
                    <div class="row">
                        <div class="col">
                            <img src="Resources/images/icons/portfolio.jpg" style="width:100%;height:90%;">
                        </div>
                        <div class="col">
                            <p><b>Conserving the natural world</b></p>
                            <p>This criteria looks at factors such as carbon emissions, air and water pollution, biodiversity, deforestation, energy efficiency, and waste management.</p>
                            <br>
                            <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Learn More</button></a>
                        </div>
                    </div>
                  </div>
                  
                  <div id="Stocks" class="tabcontent">
                    <div class="row">
                        <div class="col">
                            <img src="Resources/images/icons/social.jpg" style="width:90%;height:90%;">
                        </div>
                        <div class="col">
                            <p><b>Maintaining a good relationship with people</b></p>
                            <p>This criteria looks at factors such as customer satisfaction, data protection and privacy, gender and diversity, employee engagements, human rights, and much more.</p>
                            <br>
                            <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Learn More</button></a>
                        </div>
                    </div>
                  </div>
                  
                  <div id="Sustainable" class="tabcontent">
                    <div class="row">
                        <div class="col">
                            <img src="Resources/images/icons/governance.jpg" style="width:100%;height:90%;">
                        </div>
                        <div class="col">
                            <p><b>Having good standards for running a company</b></p>
                            <p>This critera looks at factors such as board composition, bribery and corruption, political contributions, and audit commitee structure.</p>
                            <br>
                            <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Learn More</button></a>
                        </div>
                    </div>
                  </div>
                  
                  <script>
                  function openTab(evt, tabName) {
                    var i, tabcontent, navlinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                      tabcontent[i].style.display = "none";
                    }
                    navlinks = document.getElementsByClassName("nav-link");
                    for (i = 0; i < navlinks.length; i++) {
                      navlinks[i].className = navlinks[i].className.replace(" active", "");
                    }
                    document.getElementById(tabName).style.display = "block";
                    evt.currentTarget.className += " active";
                  }
                  
                  // Get the element with id="defaultOpen" and click on it
                  document.getElementById("defaultOpen").click();
                  </script>
        </div>
    </section>

    <div class="background">
        <img src="Resources/images/background/stock-background.jpg" style="width:100%;height:80%;">
    </div>

    <section class="container">
        <div class="row g-2 our-stuff" id="searches">
            <div class="search col-md-8">
                <!-- Table of stocks that are "in" and search bar-->
                    <form action="" class="">
                        <div class="input-group mb-3">
                            <input id = "search-input" type="text" class="form-control form-control-lg" id="input" placeholder="Search Here">
                            <button onclick="getData()" id="search-button" class="input-group-text btn-success"><i class="bi bi-search me-2"></i> Search</button>
                        </div>
                    </form>

                    <div class="results">
                        <div class="row">
                            <div class="col">
                                <p>Total ESG Score: </p>
                                <p>ESG Performance: </p>    
                            </div>
                            <div class="col">
                                <p id="totalESG"></p>
                                <p id="esgPerformance"></p>
                            </div>
                        </div>
                    </div>

                    <script>
                        var axios = require("axios").default;
                        function getData() {
                            let input = document.getElementById('search-input').value;
                        
                            var options = {
                                method: 'GET',
                                url: 'https://yh-finance.p.rapidapi.com/stock/v2/get-summary',
                                params: {symbol: input, region: 'US'},
                                headers: {
                                'x-rapidapi-host': 'yh-finance.p.rapidapi.com',
                                'x-rapidapi-key': '222f753218msh13f6a309fdd7a67p17497bjsnc7776f4f2159'
                                }
                            };
                            
                            axios.request(options).then(function (response) {

                                document.getElementById("totalESG").innerHTML = response.data.esgScores.totalEsg.raw;
                                document.getElementById("esgPerformance").innerHTML = response.data.esgScores.esgPerformance;
                               
                                
                                //console.log(response.data.esgScores.totalEsg.raw); 
                                console.log(response.data.esgScores.totalEsg.raw)

                            }).catch(function (error) {
                                console.error(error);
                            });
 
                        }
                        
                    </script>
            </div>

            <div class="feature-nav-bar col-md-4">
                <h1>Find ESG Ratings Now!</h1>
                <br>
                <p>Want to browse some Ratings? Learn more about your favorite companies!</p>

            </div>

            <a href="#esg-info"><button type="submit" class=""name ="continue" id="continue">What does this mean?</button></a>
        </div>
    </section>

    <div class="background">
        <img src="Resources/images/background/computer-background.jpg" style="width:100%;height:80%;">
    </div>

    <section class="container">
        <div class="row g-2 our-stuff" id="esg-info">
            <!-- one -->
            <div class="col-md-6 yay-info">
                <h1>ESG Rating</h1>
                <p>MSCI ESG ratings are calculated by the use of a rules-based methodology, with companies - as 
                    well as countries, mutual funds, and ETFs - rated on a scale of AAA to CCC as per their exposure to ESG risks, as well as how well the company manages those risks compared to their counterparts.</p>
            </div>
            <!-- two -->
            <div class="col-md-6 yay-info">
                <h1>ESG Performance</h1>
                <p>Sustainalytics??? ESG Risk Ratings assess the degree to which a company???s enterprise business value is at risk driven by environmental, 
                    social and governance issues. The rating employs a two-dimensional framework that combines an assessment of a company???s exposure to industry-specific material ESG issues with an assessment of how well the company 
                    is managing those issues. The final ESG Risk Ratings scores are a measure of unmanaged risk on an absolute scale of 0-100, with a lower score signaling less unmanaged ESG Risk.
                </p>
            </div>
        </div>
    </section>

</body>
</html>