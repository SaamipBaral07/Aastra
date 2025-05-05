<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>

    <!-- Bootstrap CSS (keep it for buttons, alert, etc.) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Your custom CSS -->
    <link rel="stylesheet" href="css/login.css">
    
</head>
<body>
    <div class="container">
   
        <!-- Left Panel: Login Form -->
        <div class="left-panel">
            <!-- Logo on the left side -->
            <div class="logo-container">
                <img src="images/logoo.png" alt="Brand Logo" class="brand-logo">
            </div>

            <div class="card p-4 shadow" style="max-width: 400px; width: 100%; margin: auto;">
                <h3 class="text-center">Log In</h3>

                <!-- Error Message Display --> 
                <% 
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= errorMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
       session.removeAttribute("errorMessage"); // Clear message after showing
    }
%>

                <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="user@example.com" name="login_garda_deko_email">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="login_garda_deko_password">
                    </div>
                    <button type="submit" class="btn btn-primary w-100 btn-hover">Log In</button>
                    <p class="mt-2 text-center">Don't have an account? 
                        <a href="register.jsp">Register</a>
                    </p>
                </form>
            </div>
        </div>

        <!-- Right Panel: Branding Logo & Welcome Text -->
        <div class="right-panel">
            
        </div>
    </div>

</body>
</html>
