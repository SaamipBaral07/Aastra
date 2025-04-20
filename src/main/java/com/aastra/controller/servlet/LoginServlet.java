package com.aastra.controller.servlet;
import com.aastra.controller.dao.UserDAO;
import com.aastra.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String emailToCheck = request.getParameter("login_garda_deko_email");
		String passwordToCheck = request.getParameter("login_garda_deko_password");
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.login(emailToCheck, passwordToCheck);
			if (user != null) {
				// Create a session for the logged-in user
				HttpSession session = request.getSession();
				session.setAttribute("userWithSession", user);
				session.setMaxInactiveInterval(60*60);
				// Redirect to the Dashboard or home page
				response.sendRedirect(request.getContextPath() + "/home/dashboard.jsp");

			} else {
				// If login fails, send an error message to the log in page
				request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
				request.getRequestDispatcher("/home/login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// Log the error properly in production (use a logger)
			 e.printStackTrace();
			request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
			request.getRequestDispatcher("/home/login.jsp").forward(request, response);
		} finally {
			if (out != null) {
				out.close();
			}
		}

	}

}
