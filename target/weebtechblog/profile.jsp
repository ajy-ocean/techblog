<%@page import="com.weebtech.blog.entities.Message"%>
<%@page errorPage="./errorpage.jsp" %>

<%@page import="com.weebtech.blog.entities.User" %>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>

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
    <%-- navbar-start --%>
    <nav class="navbar navbar-expand-lg navbar-light primary-background">
        <a class="navbar-brand" href="./index.jsp"> <span class="	fa fa-headphones"></span> Weebtech</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#"><span class="fa fa-music"></span> Learn with weeb <span class="sr-only">(current)</span></a>
            </li>    
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="fa fa-reorder"></span> Categories
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Programming Language</a>
                <a class="dropdown-item" href="#">Project Implementation</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Data Structure</a>
              </div>
            </li>    
            <li class="nav-item">
              <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
            </li>  
          </ul>
          <ul class="navbar-nav mr-right">
              <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
            </li>   

            <li class="nav-item">
              <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
            </li>     
          </ul>
        </div>
      </nav>
    <%-- navbar-end --%>

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
     
      <%-- Profile Modal - Start --%>

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header primary-background text-dark text-center">
        <h5 class="modal-title" id="exampleModalLabel"> weebtech </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
              <div class = "container text-center">
                  <img src="./pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:150px;">
                  <h5 class="modal-title mt-3" id="exampleModalLabel"> 
                    <%= user.getName() %>
                   </h5>

                    <%-- User Details --%>
                  <div id="profile-details">
                    <table class="table">
                    <tbody>
                      <tr>
                        <th scope="row">Id</th>
                        <td> <%= user.getId()%> </td>
                      </tr>
                      <tr>
                        <th scope="row">Email</th>
                        <td> <%= user.getEmail()%> </td>
                      </tr>
                      <tr>
                        <th scope="row">Gender</th>
                        <td> <%= user.getGender()%> </td>
                      </tr>
                      <tr>
                        <th scope="row">About</th>
                        <td> <%= user.getAbout()%> </td>
                      </tr>
                      <tr>
                        <th scope="row">Registered on</th>
                        <td> <%= user.getDateTime().toString() %> </td>
                      </tr>
                    </tbody>
                    </table>
                  </div>

                  <%-- Profile-editing --%>
                  <div id="profile-edit" style="display: none;">
                    <h3 class="mt-2">Edit cautiously</h3>
                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                      <table class="table">
                       <tr>
                          <td>Id</td>
                          <td> <%= user.getId()%> </td>
                        </tr>

                         <tr>
                          <td>Email</td>
                          <td> 
                            <input class="form-control" type="email" name="userEmail" value="<%= user.getEmail()%>"> 
                          </td>
                        </tr>

                        <tr>
                          <td>Name</td>
                          <td> 
                            <input class="form-control" type="text" name="userName" value="<%= user.getName()%>"> 
                          </td>
                        </tr>

                        <tr>
                          <td>Password</td>
                          <td> 
                            <input class="form-control" type="password" name="userPassword" value="<%= user.getPassword()%>"> 
                          </td>
                        </tr>

                        <tr>
                          <td>Gender</td>
                          <td> <%= user.getGender().toUpperCase() %> </td>
                        </tr>

                        <tr>
                          <td>About</td>
                          <td> 
                            <textarea rows="2" name="userAbout" class="form-control"><%=user.getAbout()%>
                            </textarea>
                          </td>
                        </tr>

                        <tr>
                          <td>New Profile</td>
                          <td> 
                            <input type="file" name="userPic" class="form-control">
                          </td>
                        </tr>
                      </table>

                      <div class="container">
                        <button type="submit" class="btn btn-warning">
                          Save
                        </button>
                      </div>

                    </form> 
                  </div>
              </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button id="edit-profile-button" type="button" class="btn btn-warning">Edit</button>
        </div>
      </div>
    </div>
  </div>
     
      <%-- Profile Modal - End --%>

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

              <script>
                $(document).ready(function(){
                  let editStatus = false;

                  $('#edit-profile-button').click(function(){
                    if(editStatus == false){
                        //hiding and showing form after edit button click
                        $("#profile-details").hide()
                        $("#profile-edit").show()
                        editStatus = true;
                        $(this).text("Back")
                    }else{
                      //showing and hiding form if condition is not true
                        $("#profile-details").show()
                        $("#profile-edit").hide()
                        editStatus = false;
                        $(this).text("Edit")
                    }
                  })
                });
              </script>

              <!-- JAVASCRIPT-SECTION -->
</body>
</html>