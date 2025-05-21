package com.aastra.controller.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.aastra.controller.dao.CartDAO;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null && action != null) {
            CartDAO dao = new CartDAO();
            int currentQuantity = dao.getCartItemQuantity(userId, productId);
            int stock = dao.getProductStock(productId);

            if ("increase".equals(action)) {
                if (currentQuantity < stock) {
                    dao.updateCartItem(userId, productId, currentQuantity + 1);
                    session.removeAttribute("error");
                } else {
                    session.setAttribute("error", "Cannot add more than available stock.");
                }
            } else if ("decrease".equals(action)) {
                if (currentQuantity > 1) {
                    dao.updateCartItem(userId, productId, currentQuantity - 1);
                    session.removeAttribute("error");
                } else {
                    session.setAttribute("error", "Quantity cannot be less than 1.");
                }
            }
        }

        response.sendRedirect("home/cart.jsp");
    }
}


