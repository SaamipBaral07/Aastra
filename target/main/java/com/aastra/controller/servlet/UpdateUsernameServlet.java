package com.aastra.controller.servlet;

import com.aastra.controller.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateUsernameServlet")
public class UpdateUsernameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String newUsername = request.getParameter("newUsername");

        try {
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.updateUsername(userId, newUsername);

            HttpSession session = request.getSession(false);
            if (session != null) {
                com.aastra.model.User user = (com.aastra.model.User) session.getAttribute("user");
                if (user != null && success) {
                    user.setUserName(newUsername);
                    session.setAttribute("user", user);

                    // Redirect based on role
                    String role = user.getRole();
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("home/admin-profile.jsp?status=updated");
                    } else {
                        response.sendRedirect("home/userprofile.jsp?status=updated");
                    }
                    return;
                }
            }

            // If user/session is null or update failed
            response.sendRedirect("home/userprofile.jsp?status=failed");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("home/userprofile.jsp?status=error");
        }
    }
}

