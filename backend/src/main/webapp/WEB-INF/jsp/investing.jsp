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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <!-- CSS file link -->
    <link rel="stylesheet" href="css/investing.css">

    <!-- Font link -->

    <!-- Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Title of page -->
    <title>Investing</title>
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
       <a href="/investing" id="start-investing"><h5>Begin Investing</h5></a>

        <!-- My Portfolio -->
       <a href="/portfolio" id="portfolio"><h5>My Portfolio</h5></a>


    </nav>
   
   <!-- Divider under Header-->
   <div class="h-divider"></div>

   <section class="container">
    <!-- Main Body of page -->
    <div class="home-quote">
        <div class="row">
            <h1>What kind of investments are you looking for?</h1>
        </div>

        <br>
        <div class="row button-row">
            <div class="col">
                <a href="#short-term"><button type="submit" name ="continue" id="continue">Short Term</button></a>
            </div>
            <div class="col">
                <a href="#long-term"><button type="submit" name ="continue" id="continue">Long Term</button></a>
            </div>
        </div>
    </div>
    </section>

    <div class="background">
        <img src="Resources/images/background/short-invest-background.jpg" style="width:100%;height:80%;">
    </div>

    <section class="container" id="short-term">
        <div class="row short-term-investments">
            <div class="col-md-6">
                <h1>Short Term Investments</h1>
                <br>
                <p>Contrary to popular belief, sustainable investing doesn't have to be just long term. In fact, by investing
                    short-term in sustainable companies, you, as an investor can help support these businesses.
                </p>

                <br>

                <h2><b>What's Hot:</b></h2>

                <!-- Stock Table -->
                <div class="feature-nav-bar">
                    <!-- Nav Bar for switching from Login to Registration-->
                    <div class="nav nav-pills nav-fill">
                        <!-- Login Button -->
                        <li class="nav-item">
                            <a class="nav-link active" href="#our-feautres" onclick="openTab(event, 'ss1')" id="defaultOpen"><h3>Apple</h3></a>
                        </li>
                        <!-- Registration Button -->
                        <li class="nav-item">
                            <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'ss2')"><h3>Nvidia</h3></a>
                        </li>
                        <!-- Registration Button -->
                        <li class="nav-item">
                            <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'ss3')"><h3>Amazon</h3></a>
                        </li>
                    </div>
                      
                      <div id="ss1" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 16</p>
                                <p>Industry: Computer Software-Desktop</p>
                                <p>ROE: 147.4%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>
                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Apple is a great short term investment. While their ESG Score is currenlty not very good, they are still one of the big tech
                                    companies, so grabbing some of this stock for a short term investment can be very sustainable. 
                                </p>
                                <br>
                            </div>
                        </div>
                      </div>
                      
                      <div id="ss2" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 12.8</p>
                                <p>Industry: Computer Hardware</p>
                                <p>ROE: 40.72%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>
                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Nvidia also does not have a very high ESG Score, but according to their <a href="https://www.nvidia.com/en-us/csr/">website</a>, they 
                                    are currently improving on their corporate social responsibility.</p>
                                <br>
                            </div>
                        </div>
                      </div>
                      
                      <div id="ss3" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 30</p>
                                <p>Industry: Online Marketplae</p>
                                <p>ROE: 24.31%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>

                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Amazon's sustainability is up and on the rise and their <a href="https://www.aboutamazon.com/planet">webiste</a>
                                    has a lot of plans for improving their ESG in the future. In fact, by 2040, Amazon plans to be at net-zero carbon.</p>
                                <br>
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
				
            </div>
            <div class="col-md-6 pichart">
                <!-- Insert some sort of diagram here -->
                <div id="piechart" style="width: 500px; height: 500px;"></div>
            	</div>
                <script type="text/javascript">
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);
          
                function drawChart() {
          
                  var data = google.visualization.arrayToDataTable([
                    ['Stocks', 'Total ESG'],
                    ['AAPL',     16],
                    ['NVIDIA',      12.8],
                    ['AMZN',  30]
                  ]);
          
                  var options = {
                    title: '',
                    slices: {
                        0: { color: '#E0BBE4' },
                        1: { color: '#957DAD' },
                        2: { color: '#BECAD3' },
                        3: { color: '#D291BC' }
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
        <img src="Resources/images/background/home-background.jpg" style="width:100%;height:80%;">
    </div>

    <section class="container" id="#long-term">
        <div class="row long-term-investments" id="long-term">
            <div class="col-md-6 pichart">
                <!-- Insert some sort of diagram here -->
                <div id="piechart" style="width: 500px; height: 500px;"></div>
            	</div>
                <script type="text/javascript">
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);
          
                function drawChart() {
          
                  var data = google.visualization.arrayToDataTable([
                    ['Stocks', 'Total ESG'],
                    ['MSFT',     76.3],
                    ['LIN',      76],
                    ['ACN',  75.95]
                  ]);
          
                  var options = {
                    title: '',
                    slices: {
                        0: { color: '#E0BBE4' },
                        1: { color: '#957DAD' },
                        2: { color: '#FEC8D8' },
                        3: { color: '#D291BC' }
                    },
                    legend: 'none'
                  };
          
                  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
          
                  chart.draw(data, options);
                }
              </script>
            </div>
            <div class="col-md-6">
                <h1>Long Term Investments</h1>
                <br>
                <p>Our future depends on sustainability and companies that practice this actually perform better than those who don't! Don't believe me? Check out this <a href="https://www.forbes.com/sites/newyorklifeinvestments/2020/08/17/dispelling-the-5-myths-of-sustainable-investing/?sh=733707e5703f">Link</a>
                    ! And invest in yourself and the future.
                </p>

                <br>

                <h2><b>What's Hot:</b></h2>
                <br>

                <!-- Stock Table -->
                <div class="feature-nav-bar">
                    <!-- Nav Bar for switching from Login to Registration-->
                    <div class="nav nav-pills nav-fill">
                        <!-- Login Button -->
                        <li class="nav-item">
                            <a class="nav-link active" href="#our-feautres" onclick="openTab(event, 'Portfolio')"><h3>Microsoft</h3></a>
                        </li>
                        <!-- Registration Button -->
                        <li class="nav-item">
                            <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'Stocks')"><h3>Linde</h3></a>
                        </li>
                        <!-- Registration Button -->
                        <li class="nav-item">
                            <a class="nav-link" href="#our-feautres" onclick="openTab(event, 'Sustainable')"><h3>Accenture</h3></a>
                        </li>
                    </div>
                      
                      <div id="Portfolio" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 76.30</p>
                                <p>Industry: Computer Software-Desktop</p>
                                <p>ROE: 47%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>
                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Recently, Microsoft has focused on increasing their sustainability. According to <a href="https://www.investors.com/news/technology/microsoft-stock-attracts-esg-investing-interest/#:~:text=Microsoft's%20highest%20risk%20in%20ESG,Microsoft%2C%22%20she%20told%20IBD.">investors.com</a> Microsoft has
                                stepped up for social causes, and their only major ESG risk is data privacy and security risks.</p>
                                <br>
                            </div>
                        </div>
                      </div>
                      
                      <div id="Stocks" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 76.00</p>
                                <p>Industry: Chemicals-Specialty</p>
                                <p>ROE: 9%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>
                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Lindle is different from its other competitors, because they focus greatly on minimizing their carbon emissions. According to <a href="https://www.investors.com/news/why-this-stock-in-high-carbon-emitting-industry-ranks-as-top-2021-esg-pick/">investors.com</a> Lindle is 
                                    developing and commercializing carbon caputure technologies and lists "helping to sustain the planet" as their driving mission.</p>
                                <br>
                            </div>
                        </div>
                      </div>
                      
                      <div id="Sustainable" class="tabcontent">
                        <div class="row">
                            <div class="col">
                                <br>
                                <p><b>Stats:</b></p>
                                <br>
                                <p>ESG Score: 75.95</p>
                                <p>Industry: Computer-Tech Services</p>
                                <p>ROE: 33%</p>
                                <br>
                                <a href="#searches"><button type="submit" name ="learn-more" id="learn-more">Add to Portfolio</button></a>

                            </div>
                            <div class="col">
                                <br>
                                <p><b>About</b></p>
                                <p>Accenture makes it part of their greater mission to be a more sustainable company. According to their <a href="https://www.accenture.com/us-en/services/sustainability-index">webiste</a>,
                                    Accenture plans for net-zero transitions, sustainable value chain, sustainable technology, and much more.</p>
                                <br>
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

            </div>
        </div>
    </section>

</html>