package com.aastra.controller.servlet;

import com.aastra.controller.dao.ProductDAO;
import com.aastra.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String imageUrl = request.getParameter("imageUrl");

        Product updatedProduct = new Product();
        updatedProduct.setProductId(productId);
        updatedProduct.setName(name);
        updatedProduct.setDescription(description);
        updatedProduct.setPrice(price);
        updatedProduct.setStock(stock);
        updatedProduct.setCategoryId(categoryId);
        updatedProduct.setImageUrl(imageUrl);

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(updatedProduct);

        response.sendRedirect("AdminProductServlet");
    }
}
