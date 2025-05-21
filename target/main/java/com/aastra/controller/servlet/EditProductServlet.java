package com.aastra.controller.servlet;

import com.aastra.controller.dao.ProductDAO;
import com.aastra.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/home/edit-product.jsp").forward(request, response);
    }
}
