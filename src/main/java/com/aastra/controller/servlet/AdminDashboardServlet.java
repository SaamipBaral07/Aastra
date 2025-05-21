package com.aastra.controller.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.aastra.controller.dao.AdminStatsDAO;
import com.aastra.controller.dao.OrderDAO;
import com.aastra.controller.dao.UserDAO;

/**
 * Servlet implementation class AdminDashboardServlet
 */
@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminStatsDAO dao = new AdminStatsDAO();
			UserDAO userDAO = null;
			try {
				userDAO = new UserDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
        OrderDAO orderDAO = new OrderDAO();
        

        try {
            request.setAttribute("totalUsers", dao.getTotalUsers());
            request.setAttribute("totalOrders", dao.getTotalOrders());
            request.setAttribute("totalProducts", dao.getTotalProducts());
            request.setAttribute("totalEarnings", dao.getTotalEarnings());
            request.setAttribute("recentOrders", orderDAO.getRecentOrders(5));
            request.setAttribute("recentCustomers", userDAO.getRecentCustomers(5));
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("home/admin-dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
