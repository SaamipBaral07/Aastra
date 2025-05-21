package com.aastra.filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/home/*" }) // Filter only paths under /home/
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthenticationFilter initialized");
    }

    @Override
    public void destroy() {
        System.out.println("AuthenticationFilter destroyed");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        boolean allowedWithoutLogin =
        	    uri.equals(contextPath + "/home/login.jsp") ||
        	    uri.equals(contextPath + "/home/register.jsp") ||
        	    uri.equals(contextPath + "/LoginServlet") ||
        	    uri.equals(contextPath + "/RegisterServlet") ||
        	    uri.endsWith(".css") ||  // allow all CSS files
        	    uri.endsWith(".js") ||   // allow all JS files
        	    uri.endsWith(".png") ||
        	    uri.endsWith(".jpg") ||
        	    uri.endsWith(".ico") ||
        	    uri.contains("/images/") || 
        	    uri.contains("/assets/"); // optional for general static folders


        if (loggedIn || allowedWithoutLogin) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(contextPath + "/home/login.jsp");
        }
    }
}