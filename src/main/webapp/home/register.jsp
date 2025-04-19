<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom CSS -->
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="container">
        <!-- Left Panel: Registration Form -->
        <div class="left-panel">
            <!-- Logo on the left side -->
            <div class="logo-container">
                <img src="images/small_llogo.png" alt="Brand Logo" class="brand-logo">
            </div>

            <div class="card p-4 shadow" style="width: 25rem;">
                <h3 class="text-center">Register</h3>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" name="role">
                            <option value="customer">Customer</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success w-100 btn-hover">Register</button>
                    <p class="mt-2 text-center">Already have an account? <a href="login.jsp">Login</a></p>
                </form>
            </div>
        </div>

        <!-- Right Panel: Branding Logo & Welcome Text -->
        <div class="right-panel">
            
    </div>
</body>
</html>
