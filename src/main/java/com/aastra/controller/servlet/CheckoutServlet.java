package com.aastra.controller.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.aastra.controller.dao.CartDAO;
import com.aastra.controller.dao.OrderDAO;
import com.aastra.model.CartItem;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        OrderDAO orderDAO = new OrderDAO();

        try {
            List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
            if (cartItems == null || cartItems.isEmpty()) {
                response.sendRedirect("cart.jsp");
                return;
            }

            // Calculate total
            double total = 0.0;
            for (CartItem item : cartItems) {
                total += item.getProduct().getPrice() * item.getQuantity();
            }

            // Insert into orders table
            int orderId = orderDAO.createOrder(userId, total);

            // Insert into order_items and update stock
            for (CartItem item : cartItems) {
                orderDAO.addOrderItem(orderId, item);
                orderDAO.updateProductStock(item.getProduct().getProductId(), item.getQuantity());
            }

            // Clear cart
            cartDAO.clearCart(userId);

         // ... after inserting into orders and order_items, updating stock, and clearing cart
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Your order has been placed');");
            response.getWriter().println("window.location.href = 'home/index.jsp';");
            response.getWriter().println("</script>");


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

