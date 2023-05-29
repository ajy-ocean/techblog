package com.weebtech.blog.servlets;

import java.io.File;
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
import com.weebtech.blog.entities.Message;
import com.weebtech.blog.entities.User;
import com.weebtech.blog.helper.ConnectionProvider;
import com.weebtech.blog.helper.Helper;

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

            // Fetching data from the form
            String userEmail = request.getParameter("userEmail");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String userAbout = request.getParameter("userAbout");
            Part part = request.getPart("userPic");
            String picName = part.getSubmittedFileName();

            // Geting user details from the session object
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            user.setProfile(picName);

            // Updata user data to db
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean value = userDao.updateUser(user);

            if (value) {
                // Getting pics folder paths
                String path = "/home/blankocean/codingstuff/myJavaProjects/weebtechblog/src/main/webapp/pics"+File.separator+user.getProfile();

                Helper.deleteFile(path);

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile update successfully");

                    Message msg = new Message("Profile update successfully", "success", "alert-success");
                    httpSession.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Something went wrong!!! Failed to Update profile", "error","alert-danger");
                    httpSession.setAttribute("msg", msg);

                }
            } else {
                out.println("Failed to Update profile");
                Message msg = new Message("Something went wrong!!! Failed to Update profile", "error", "alert-danger");
                httpSession.setAttribute("msg", msg);
            }

            response.sendRedirect("profile.jsp");

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