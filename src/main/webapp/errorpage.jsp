<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Sorry ! Something went wrong</title>
                    <!-- CSS - SECTION-->
                    <!-- BOOTSTRAP-4:- CSS-LINK -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                        <!-- BOOTSTRAP-4:- CSS-LINK -->

                        <%-- FONT AWESOME ICON LINK --%>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

                            <link rel="stylesheet" href="./css/mystyle.css">

                    <style>
                        .banner-background{
                                clip-path: polygon(53% 0, 100% 0, 100% 35%, 100% 70%, 100% 100%, 67% 85%, 21% 100%, 0 87%, 0 34%, 0 0);
                            }
                    </style>
                                <!-- CSS - SECTION-->
                    </head>
                        <body>
                            <div class="container text-center" style="padding-top: 23px;">
                                <img src="./image/error.png" class="img-fluid" alt="Error...." style="width:350px;">
                                <h3 class="display-4 ">Sorry ! Something went wrong</h3>

                                <%-- Showing error --%>
                                <%= exception%>
                                <a href="./index.jsp" class="btn primary-background btn-lg mt-3 text-dark">Home</a>
                            </div>
                        </body>
                    </html>