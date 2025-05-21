package com.aastra.controller.servlet;

import com.aastra.controller.dao.UserDAO;
import com.aastra.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.aastra.util.EncryptDecrypt;


import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		User user = new User();
		user.setUserName(username);
		user.setEmail(email);
		user.setPassword(EncryptDecrypt.encrypt(password)); // Encrypt before saving
 // Note: In production, hash the password!
		user.setRole(role);

		try {
			UserDAO userDAO = new UserDAO();
			boolean isRegistered = userDAO.register(user);
			if (isRegistered) {
				request.setAttribute("successMessage", "Registration successful. You can now log in.");
				request.getRequestDispatcher("/home/login.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("errorMessage", "Email already exists");
				response.sendRedirect("home/register.jsp");
				return;

			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred. Please try again.");
			request.getRequestDispatcher("/home/register.jsp").forward(request, response);
		}
	}
}
