package com.aastra.controller.servlet;

import com.aastra.controller.dao.UserDAO;
import com.aastra.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String emailToCheck = request.getParameter("login_garda_deko_email");
        String passwordToCheck = request.getParameter("login_garda_deko_password");

        try {
            UserDAO userdao = new UserDAO();
            User user = userdao.login(emailToCheck, passwordToCheck);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user); // Store user object in session
                session.setAttribute("userId", user.getUserId());
                session.setMaxInactiveInterval(60 * 60); // 1 hour session timeout

                String role = user.getRole(); // Get role from user object

                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/home/admin-dashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home/index.jsp");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                response.sendRedirect(request.getContextPath() + "/home/login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "A system error occurred. Please try again later.");
            response.sendRedirect(request.getContextPath() + "/home/login.jsp");
        }
    }
}
