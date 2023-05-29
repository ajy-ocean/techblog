<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>

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
                clip-path: polygon(53% 0, 100% 0, 100% 35%, 100% 70%, 100% 100%, 67% 85%, 21% 100%, 0 87%, 0 34%, 0 0);
            }
        </style>
        <!-- CSS - SECTION-->

</head>

<body>
    <%-- Navbar....... --%>
    <%@include file="./mynavbar.jsp" %>

    <main class="primary-background banner-background" style="padding-bottom: 80px;" style="height:70vh;">
        <div class="container">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center primary-background text-dark">
                        <span class="fa fa-user-circle fa-3x"></span>
                        <br>
                        Register here
                    </div>
                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet" method="POST">
                            <div class="form-group">
                                <label for="user_name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name"
                                    aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small>
                            </div>


                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="user_password" type="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Enter Password">
                            </div>


                            <div class="form-group">
                                <label for="gender">Select Gender</label>
                                <br>
                                <input type="radio" id="mgender" name="gender" value="male"> Male
                                <input type="radio" id="fgender" name="gender" value="female"> Female
                            </div>

                            <div class="form-group">
                            <textarea name="about" class="form-control" rows="5" placeholder="Enter something about yourself...">
                            </textarea>
                            </div>
                            
                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree terms and conditons</label>
                            </div>
                            <br>

                            <div id="loader" class="container text-center" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait...</h4>
                            <br>
                            </div>

                            <button id="submit-btn" type="submit" class="btn btn-warning">Submit</button>
                        </form>
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

    <!-- SWEET ALERT-CDN:- JAVASCRIPT-LINK -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   


        <script>
          $(document).ready(function(){

                console.log("loaded...")

                $('#reg-form').on('submit',function(event){


                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("loader").show();


                    //send register servlet

                    $.ajax({

                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,

                        success: function(data, textStatus, jqXHR){
                            console.log(data)

                                $("#submit-btn").show();
                                $("loader").hide();

                                if(data.trim() === 'Done'){
                                    
                                    swal("Register Successfullly.....we are redirecting to login page")
                                        .then((value) => {
                                        window.location="./login.jsp"
                                    });
                                }else{

                                    swal(data);
                                    
                                }
                        },

                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(jqXHR)

                                 $("#submit-btn").show();
                                 $("loader").hide();

                                 swal("Something we wrong.. please try again");

                                 

                        },

                        processData: false,
                        contentType: false


                    });


                });

          });

        </script>
    <!-- JAVASCRIPT-SECTION -->
</body>

</html>