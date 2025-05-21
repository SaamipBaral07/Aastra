package com.aastra.controller.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.aastra.controller.dao.ProductDAO;
import com.aastra.model.Product;

/**
 * Servlet implementation class ProductServlet
 */

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    
    public ProductServlet() {
        super();
        productDAO = new ProductDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        try {
            String selectedCategory = request.getParameter("category");
            String searchQuery = request.getParameter("search");
            List<Product> productList;

            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                // Handle search
                productList = productDAO.searchProductsByName(searchQuery.trim());
            } else if (selectedCategory == null || selectedCategory.equals("all")) {
                // Show all products
                productList = productDAO.getAllProductsWithImages();
            } else {
                // Filter by category
                productList = productDAO.getProductsByCategoryName(selectedCategory);
            }

            request.setAttribute("productList", productList);
            request.setAttribute("selectedCategory", selectedCategory);
            request.setAttribute("searchQuery", searchQuery);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/home/product.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred processing your request");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // For now, just redirect to doGet as we're only handling display functionality
        doGet(request, response);
    }
}