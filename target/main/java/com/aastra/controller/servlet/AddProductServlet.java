package com.aastra.controller.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.aastra.controller.dao.ProductDAO;
import com.aastra.model.Product;
/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get product details from form
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String stockStr = request.getParameter("stock");
        String categoryIdStr = request.getParameter("category_id");
        String imageUrl = request.getParameter("image_url");

        // Input validation (basic)
        if (name == null || name.trim().isEmpty() || priceStr == null || stockStr == null) {
            request.setAttribute("error", "Please fill in all required fields.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);
            int categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty())
                    ? Integer.parseInt(categoryIdStr)
                    : 0;

            // Create Product object
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStock(stock);
            product.setCategoryId(categoryId);
            product.setImageUrl(imageUrl);

            // Save to DB
            ProductDAO dao = new ProductDAO();
            boolean success = dao.addProduct(product);

            if (success) {
            	response.sendRedirect(request.getContextPath() + "/AdminProductServlet");


            } else {
                request.setAttribute("error", "Failed to add product.");
                request.getRequestDispatcher("/home/addproduct.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format for price or stock.");
            request.getRequestDispatcher("/home/addproduct.jsp").forward(request, response);
        }
    }
}