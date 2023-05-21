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
</head>
<body>
    <h1> UserName: <%= user.getName() %> </h1>
    <h1> EmailId: <%= user.getEmail() %> </h1>
    <h1>About: <%= user.getAbout() %> </h1>
</body>
</html>