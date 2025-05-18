package com.aastra.controller.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.aastra.model.Product;
import com.aastra.model.CartItem;
import com.aastra.controller.dao.CartDAO;
import com.aastra.controller.dao.ProductDAO;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/home/login.jsp"); // use context path
            return;
        }

        CartDAO cartDAO = new CartDAO();
        try {
            cartDAO.addToCart(userId, productId, quantity);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/home/cart.jsp"); // use correct path

    }

}


