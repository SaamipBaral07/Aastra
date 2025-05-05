package com.aastra.controller.servlet;

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
 * Servlet implementation class AdminProductServlet
 */
@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	ProductDAO productDAO = new ProductDAO();
    	List<Product> products = productDAO.getAllProductsWithImages();

    	if (products.isEmpty()) {
    	    System.out.println("No products found!");
    	} else {
    	    System.out.println("Found " + products.size() + " products.");
    	}

    	request.setAttribute("products", products);
    	request.getRequestDispatcher("/home/admin-product.jsp").forward(request, response);    }
}