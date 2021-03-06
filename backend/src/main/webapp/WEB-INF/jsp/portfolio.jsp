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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"></link>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/app.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <!-- CSS file link -->
    <link rel="stylesheet" href="css/portfolio.css">

    <!-- Font link -->

    <!-- Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Title of page -->
    <title>Portfolio</title>
</head>

<body>

    <!-- Header Bar-->
    <nav class="navbar">
       <!-- Logo -->
       <a href="/home"><img src="Resources/images/icons\logo.png" id="home-button"></a>
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
       <div class="row">
           <div class="col-md-6 build-portfolio">
                <h1>Build your Portfolio</h1>
                <div class="row">
                    <p>This is a tutorial!</p>
                    <p>Check and uncheck stocks to build your dream portfolio</p>
                    <br>
                    <br>
                    <div class="row">
                        <a href="#quiz"><button type="submit" name ="continue" id="continue">Start Experimenting</button></a>
                    </div>
                </div>
           </div>

           <div class="col-md-6 pichart">
                <div id="piechart" style="width: 500px; height: 500px;"></div>
            </div>

            <script type="text/javascript">
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);
          
                function drawChart() {
          
                  var data = google.visualization.arrayToDataTable([
                    ['Stocks', 'Total ESG'],
                    ['AMZN',     30],
                    ['AAPL',      16],
                    ['MSFT',  13],
                    ['NFLX', 17],
                    ['GOOG',    23]
                  ]);
          
                  var options = {
                    title: '',
                    slices: {
                        0: { color: '#E0BBE4' },
                        1: { color: '#957DAD' },
                        2: { color: '#BECAD3' },
                        3: { color: '#D291BC' },
                        4: { color: '#FEC8D8' }
                    },
                    legend: 'none'
                  };
          
                  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
          
                  chart.draw(data, options);
                }
              </script>
       </div>
    
   </section>

   <div class="background">
    <img src="Resources/images/background/stock-background.jpg" style="width:100%;height:80%;">
    </div>

    <section class="container">
        <div class="row stock-quiz" id="quiz">
            <div class="col-md-6">
                <h1>Find your ideal sustainable stocks</h1>
                <form class="quiz-form">   
                    <br>
                    <h3>How much will you spend on stocks per year?</h3>
                    <div class="form-check form-check-inline" id="money">
                        <input class="form-check-input" onclick="question1('$0-$50')" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="$0-50">
                        <label class="form-check-label" for="inlineRadio1">$0-$50</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" onclick="question1('$50-200')" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="$50-200">
                        <label class="form-check-label" for="inlineRadio2">$50-200</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" onclick="question1('$200-1000')" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="$200-1000">
                        <label class="form-check-label" for="inlineRadio3">$200-1000</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" onclick="question1('$1000-5000')" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="$1000-5000">
                        <label class="form-check-label" for="inlineRadio4">$1000-5000</label>
                    </div>

                      <h3>Which type of sustainability is most important to you?</h3>
                      <div class="form-check form-check-inline" id="money">
                      <input class="form-check-input" onclick="question2('Environment')" type="radio" name="inlineRadioOptions2" id="inlineRadio1" value="$0-50">
                      <label class="form-check-label" for="inlineRadio5">Environment</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" onclick="question2('Social')" type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="$50-200">
                      <label class="form-check-label" for="inlineRadio6">Social</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" onclick="question2('Governance')" type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="$200-1000">
                      <label class="form-check-label" for="inlineRadio7">Governance</label>
                    </div>

                      <h3>Long-term or Short-term stocks?</h3>
                      <div class="form-check form-check-inline" id="money">
                      <input class="form-check-input" onclick="question3('Long Term')" type="radio" name="inlineRadioOptions3" id="inlineRadio1" value="$0-50">
                        <label class="form-check-label" for="inlineRadio1">Long term</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" onclick="question3('Short Term')" type="radio" name="inlineRadioOptions3" id="inlineRadio2" value="$50-200">
                        <label class="form-check-label" for="inlineRadio2">Short Term</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" onclick="question3('Both')" type="radio" name="inlineRadioOptions3" id="inlineRadio3" value="$50-200">
                        <label class="form-check-label" for="inlineRadio3">Both</label>
                      </div>

                      <div class="row">
                        <a href="#quiz"><button type="button" onclick="doForm()" name ="continue" id="continue">Find My Stocks</button></a>
                    </div>
                </form>

                <h2 id="result"></h2>
                <h2 id="result2"></h2>

                <script>
                    var q1 = "";
                    var q2 = "";
                    var q3 = "";
                    var stocks;

                    function question1(input) {
                        q1 = input;
                    }

                    function question2(input) {
                        q2 = input;
                    }

                    function question3(input) {
                        q3 = input;
                    }

                    function doForm() {
                        //Stock Recommendations
                        if (q3 === 'Long Term' && q1 === '$0-$50') {
                            stocks  = new Array(['TX'],['KIM'],['ABG'], ['MT']);
                        } else if (q3 === 'Short Term' && q1 === '$0-$50') {
                            stocks  = new Array(['TX'],['KIM'],['BIIB'], ['MT']);
                        } else if (q3 === 'Long Term' && (q1 === '$50-200' || q1 === '$200-1000')) {
                            stocks  = new Array(['NEM'],['LIN'],['ABG'], ['MT']);
                        } else if (q3 === 'Short Term' && (q1 === '$50-200' || q1 === '$200-1000')) {
                            stocks  = new Array(['AMZN'],['BIIB'],['TX'], ['MT']);
                        } else if (q3 === 'Long Term' && q1 === '$1000-5000') {
                            stocks  = new Array(['LIN'],['BYND'],['HASI'], ['MSFT']);

                        } else if (q3 === 'Short Term' && q1 === '$1000-5000') {
                            stocks  = new Array(['BIIB'],['AAPL'],['NVDA'], ['AMZN']);

                        } else {
                            stocks  = new Array(['Please make your selection!'],[],[],[]);
                        }

                        document.getElementById("stock1").innerHTML = stocks[0];
                        document.getElementById("stock2").innerHTML = stocks[1];
                        document.getElementById("stock3").innerHTML = stocks[2];
                        document.getElementById("stock4").innerHTML = stocks[3];

                        //document.getElementById("result").innerHTML = "You have selected " + q1 + " " + q2 + " " +  q3 + " "; 
                    }
                </script>
                <br>

            </div>

            <div class="col-md-6 piechart">
                <h2><b>Your Stock Recommendations: </b></h2>
                <p id="stock1"></p>
                <p id="stock2"></p>
                <p id="stock3"></p>
                <p id="stock4"></p>


            </div>
        </div>

        <div class="row alladin">
            <div class="col"><h1>Want to drive innovation?</h1></div>
            <br>

            <p>Check out <a href="https://www.blackrock.com/aladdin/products/aladdin-studio">Aladdin Studio</a> for tips on
            how to improve your workspace whether you're a project manager or full-blown engineer.</p>
            
        </div>
    </section>

</body>