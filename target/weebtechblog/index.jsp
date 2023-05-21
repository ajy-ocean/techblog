<%@page import="java.sql.*" %>
  <%@page import="com.weebtech.blog.helper.ConnectionProvider" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>weebtech</title>
      <!-- CSS - SECTION-->
      <!-- BOOTSTRAP-4:- CSS-LINK -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <!-- BOOTSTRAP-4:- CSS-LINK -->

      <%-- FONT AWESOME ICON LINK --%>
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="./css/mystyle.css">

        <style>
          .banner-background{
             clip-path: polygon(53% 0, 100% 0, 100% 35%, 100% 70%, 100% 100%, 67% 85%, 21% 100%, 0 87%, 0 34%, 0 0);
          }
        </style>
        <!-- CSS - SECTION-->
        
    </head>

    <body>
      <%-- ADDING NAVBAR USING INCLUDE DIRECTIVE --%>
        <%@include file="mynavbar.jsp" %>

          <%-- Banner....... --%>
            <div class="container-fluid p-0 m-0">
              <div class="jumbotron primary-background text-dark banner-background">
                <div class="container">
                  <h3 class="display-3">Welcome to Weebtech</h3>
                  <p>Welcome to out technical blog, world of technology
                    A programming language is a system of notation for writing computer programs.Most programming
                    languages are text-based formal languages, but they may also be graphical. They are a kind of
                    computer language.
                  </p>
                  <p>Programming language theory is the subfield of computer science that studies the design,
                    implementation, analysis, characterization, and classification of programming languages.
                  </p>

                  <button class="btn btn-outline-dark btn-lg"><span class="fa fa-map-signs"></span> Start!!..It's
                    FREE</button>

                  <a href="./login.jsp" class="btn btn-outline-dark btn-lg"><span class="fa fa-paper-plane-o fa-spin"></span>
                    Login</a>
                </div>
              </div>
            </div>

            <%-- Cards..... --%>
              <div class="container">

                <div class="row mb-2">

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                </div>

                <div class="row">

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                          the card's content.</p>
                        <a href="#" class="btn primary-background text-dark">Read me</a>
                      </div>
                    </div>
                  </div>

                </div>

              </div>

              <!-- JAVASCRIPT-SECTION -->
              <!-- BOOTSTRAP-4:- JAVASCRIPT-LINK -->
              <script src="https://code.jquery.com/jquery-3.6.4.min.js"
                integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

              <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>

              <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
              <!-- BOOTSTRAP-4:- JAVASCRIPT-LINK -->

              <script src="./js/myjs.js"></script>

              <!-- JAVASCRIPT-SECTION -->
    </body>

    </html>