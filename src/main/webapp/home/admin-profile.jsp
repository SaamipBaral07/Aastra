<%@ page import="com.aastra.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/userprofile.css">
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <h1>Profile Details</h1>
            <p>View and manage your account information</p>
        </div>
        <div class="profile-card">
            <div class="profile-banner"></div>
            <div class="profile-content">
                <div class="profile-pic-container">
                    <img src="${pageContext.request.contextPath}/home/images/Userpanel.jpg" alt="Profile Picture" class="profile-pic">
                </div>
                <div class="profile-info">
                    <h2 class="profile-name"><%= user.getUserName() %></h2>
                    <p class="profile-role"><%= user.getRole() %></p>
                    
                    <div class="profile-details">
                        <div class="detail-item">
                            <div class="detail-icon">
                                <i class="fas fa-id-card"></i>
                            </div>
                            <div class="detail-content">
                                <div class="detail-label">User ID</div>
                                <div class="detail-value"><%= user.getUserId() %></div>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="detail-content">
                                <div class="detail-label">Email Address</div>
                                <div class="detail-value"><%= user.getEmail() %></div>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon">
                                <i class="fas fa-user-tag"></i>
                            </div>
                            <div class="detail-content">
                                <div class="detail-label">Account Type</div>
                                <div class="detail-value"><%= user.getRole() %></div>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div class="detail-content">
                                <div class="detail-label">Member Since</div>
                                <div class="detail-value"><%= user.getCreatedAt() %></div>
                            </div>
                        </div>
                    </div>
                    <!-- Update Username Form -->
		<div class="update-username-form">
    		<form action="${pageContext.request.contextPath}/UpdateUsernameServlet" method="post">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">
        <div class="form-group">
            <label for="newUsername">Update Username:</label>
            <input type="text" id="newUsername" name="newUsername" value="<%= user.getUserName() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Username</button>
  		  </form>
		</div>
                                
                    <div class="buttons">
                        <a href="${pageContext.request.contextPath}/AdminDashboardServlet" class="btn btn-primary">
                            <i class="fas fa-tachometer-alt"></i>Dashboard
                        </a>
                        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post" class="logout-form">
                            <button type="submit" class="btn btn-secondary">
                                <i class="fas fa-sign-out-alt"></i>Logout
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<style>
/* New Update Username Form Styles */
.update-username-form {
    background-color: var(--form-bg);
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 25px;
    border: 1px solid var(--border-color);
}

.form-group {
    margin-bottom: 15px;
    text-align: left;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    font-weight: 500;
    color: var(--text-color);
}

.form-group input {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 15px;
    transition: var(--transition);
    background-color: white;
    color: var(--text-color);
}

.form-group input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(58, 134, 255, 0.2);
}

.update-username-form .btn {
    margin-top: 5px;
    text-align: center;
    padding: 12px;
}

.update-username-form .btn-primary {
    background-color: var(--primary-color);
}
</style>
</html>