package com.weebtech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weebtech.blog.dao.UserDao;
import com.weebtech.blog.entities.User;
import com.weebtech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // out.println("<!DOCTYPE html>");
            // out.println("<html>");
            // out.println("<head>");
            // out.println("<title> Servlet One </title>");
            // out.println("</head>");
            // out.println("<body>");

            // Fetching data..........
            String check = request.getParameter("check");
            if (check == null) {
                out.println("Please agree our terms and condition");

            } else {
                // Baki ka data
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");

                // create user obj and set all data to that obj
                User user = new User(name, email, password, gender, about);

                // Creating UserDao obj
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                if (userDao.saveUser(user)) {
                    // Save
                    out.println("Done");
                } else {
                    out.println("Error");
                }

            }

            // out.println("</body>");
            // out.println("</html>");
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