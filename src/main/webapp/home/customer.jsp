<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    
    <!-- Link to your admin dashboard CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/admin-dashboard.css">
    
    <!-- Ionicons for the icons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
    <div class="container">
        <!-- Navigation -->
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="shirt-outline"></ion-icon>
                        </span>
                        <span class="title">VaasTra</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/AdminDashboardServlet">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li class="hovered">
                    <a href="${pageContext.request.contextPath}/CustomerServlet">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Customers</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/AdminProductServlet">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                        <span class="title">Products</span>
                    </a>
                </li>
               <li>
                    <a href="${pageContext.request.contextPath}/AdminOrderServlet">
                        <span class="icon">
                            <ion-icon name="cart-outline"></ion-icon>
                        </span>
                        <span class="title">Orders</span>
                    </a>
                </li>
                <li>
                     <a href="${pageContext.request.contextPath}/LogoutServlet">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main">
            <!-- Top Bar -->
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>               
                <!-- Search -->
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search customers...">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>
                
                <!-- User Image -->
                 <div class="user">
                <a href="${pageContext.request.contextPath}/home/admin-profile.jsp" title="Admin Profile Page">
                     <ion-icon name="person-circle-outline" style="font-size: 24px; color: #444;"></ion-icon>
                </a>

                </div>
            </div>

            <!-- Customer List -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Customer Management</h2>
                        
                    </div>
                    
                    <table>
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Username</td>
                                <td>Email</td>
                                <td>Role</td>
                                <td>Created At</td>
                                <td>Actions</td>
                            </tr>
                        </thead>
                        <tbody>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.email}</td>
           	<td>${user.role}</td>
          
            <td>${user.createdAt}</td>
            <td>
                <!-- View icon for future use -->
                <ion-icon name="eye-outline" style="font-size: 20px; color: #555;"></ion-icon>
            </td>
        </tr>
    </c:forEach>
</tbody>


                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Script for toggle menu -->
    <script>
        // add hovered class to selected list item
        let list = document.querySelectorAll(".navigation li");
        
        function activeLink() {
            list.forEach((item) => {
                item.classList.remove("hovered");
            });
            this.classList.add("hovered");
        }
        
        list.forEach((item) => item.addEventListener("mouseover", activeLink));
        
        // Menu Toggle
        let toggle = document.querySelector(".toggle");
        let navigation = document.querySelector(".navigation");
        let main = document.querySelector(".main");
        
        toggle.onclick = function () {
            navigation.classList.toggle("active");
            main.classList.toggle("active");
        };
    </script>
</body>
</html>