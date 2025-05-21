<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/admin-dashboard.css">
</head>

<body>
    <div class="container">
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
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li>
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

        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                <a href="${pageContext.request.contextPath}/home/admin-profile.jsp" title="Admin Profile Page">
                     <ion-icon name="person-circle-outline" style="font-size: 24px; color: #444;"></ion-icon>
                </a>

                </div>
            </div>

            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">${totalUsers}</div>
                        <div class="cardName">Total Users</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="people-circle-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">${totalOrders}</div>
                        <div class="cardName">Orders</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">${totalProducts}</div>
                        <div class="cardName">Products</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="cube-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">$${totalEarnings}</div>
                        <div class="cardName">Earning</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="cash-outline"></ion-icon>
                    </div>
                </div>
            </div>

            <div class="details">
    <!-- Recent Orders -->
    <div class="recentOrders">
        <div class="cardHeader">
            <h2>Recent Orders</h2>
            <a href="#" class="btn">View All</a>
        </div>

        <table>
            <thead>
                <tr>
                    <td>User ID</td>
                    <td>Product Name</td>
                    <td>Quantity</td>
                    <td>Amount</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${recentOrders}">
                    <tr>
                        <td>#U${order[0]}</td>
                        <td>${order[1]}</td>
                        <td>${order[2]}</td>
                        <td>$${order[3]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Recent Customers -->
    <div class="recentCustomers">
        <div class="cardHeader">
            <h2>Recent Customers</h2>
        </div>

        <table>
            <c:forEach var="user" items="${recentCustomers}">
                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <ion-icon name="person-circle-outline" style="font-size: 40px;"></ion-icon>
                        </div>
                    </td>
                    <td>
                        <h4>${user.userName} <br> <span>${user.email}</span></h4>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
        </div>
    </div>

    <script src="admin-dashboard.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>