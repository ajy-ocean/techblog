package com.weebtech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weebtech.blog.dao.UserDao;
import com.weebtech.blog.entities.User;
import com.weebtech.blog.helper.ConnectionProvider;


@MultipartConfig
public class LoginServlet extends HttpServlet {
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

            //Fetching user name & password from request......
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
            if(user == null){
                //Login Error...........
                out.println("<h1>Invalid Details.. try again</h1>");

            }else{
                //Login success
                HttpSession httpSession = request.getSession(); 
                httpSession.setAttribute("currentUser", user);
                response.sendRedirect("profile.jsp");
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