<%@page import="com.weebtech.blog.entities.Message"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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
            .banner-background {
            clip-path: polygon(50% 0%, 100% 0, 100% 84%, 76% 100%, 23% 94%, 0 100%, 0 0);
            }
        </style>
        <!-- CSS - SECTION-->

</head>

<body>
    <%-- Navbar --%>
    <%@include file="./mynavbar.jsp" %>

    <main class="d-flex align-items-center primary-background text-dark banner-background" style="height:70vh;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header primary-background text-dark text-center">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            <p>Login here</p>
                        </div>

                        <%
                            Message msg = (Message)session.getAttribute("msg");
                            if(msg != null){
                        %>
                            <div class="alert <%= msg.getCssClass() %>" role="alert">
                                <%= 
                                    msg.getContent()
                                %>
                            </div>
                        
                        <%
                            session.removeAttribute("msg");
                            }

                        %>

                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" required type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                        anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" required type="password" class="form-control" id="exampleInputPassword1"
                                        placeholder="Password">
                                </div>
                                <div class="container text-center">
                                <button type="submit" class="btn btn-warning">Submit</button>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </main>


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