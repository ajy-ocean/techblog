package com.weebtech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.weebtech.blog.dao.UserDao;
import com.weebtech.blog.entities.User;
import com.weebtech.blog.helper.ConnectionProvider;

@MultipartConfig
public class EditServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title> Servlet One </title>");
            out.println("</head>");
            out.println("<body>");

            //Fetching data from the form
            String userEmail = request.getParameter("userEmail");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String userAbout = request.getParameter("userAbout");
            Part part = request.getPart("userPic");
            String picName = part.getSubmittedFileName();

            //Geting user details from the session object
            HttpSession httpSession = request.getSession();
            User user = (User)httpSession.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            user.setProfile(picName);

            //Updata user data to db
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean value = userDao.updateUser(user);

            if(value){
                out.println("Profile update successfully");
            }else{
                out.println("Failed to Update profile");
            }


            out.println("</body>");
            out.println("</html>");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}