package com.aastra.controller.servlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException; 
import java.util.List;

import com.aastra.controller.dao.UserDAO;
import com.aastra.model.User;


/**
 * Servlet implementation class CustomerServlet
 */

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        try {
            userDAO = new UserDAO(); // Handle exceptions properly
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Log the error (you can also use a logger)
            throw new RuntimeException("Failed to initialize UserDAO", e);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> activeUsers = userDAO.getAllCustomers(); // You should define this method
        request.setAttribute("userList", activeUsers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home/customer.jsp");
        dispatcher.forward(request, response);
    }
}

