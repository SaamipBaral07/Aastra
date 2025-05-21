<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Orders</title>
    <!-- Using the existing admin-dashboard.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/admin-dashboard.css">
    <!-- Additional inline styles just for orders page -->
    <style>
        .order-container {
            background: var(--white);
            border-radius: 10px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }
        
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 1px solid #f0f0f0;
            padding-bottom: 10px;
        }
        
        .order-id {
            font-weight: 600;
            color: var(--blue);
        }
        
        .order-status {
            padding: 4px 8px;
            color: var(--white);
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .status-pending {
            background: #e9b10a;
        }
        
        .status-processing {
            background: #1795ce;
        }
        
        .status-delivered {
            background: #8de02c;
        }
        
        .status-cancelled {
            background: #f00;
        }
        
        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }
        
        .order-actions {
            margin-top: 15px;
            text-align: right;
        }
        
        .btn {
            padding: 8px 15px;
            border-radius: 6px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        
        .btn-primary {
            background: var(--blue);
            color: var(--white);
        }
        
        .btn-primary:hover {
            background: #1a1464;
        }
        
        .btn-success {
            background: #28a745;
            color: var(--white);
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        .btn-danger {
            background: #dc3545;
            color: var(--white);
        }
        
        .btn-danger:hover {
            background: #c82333;
        }
    </style>
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
                    <a href="${pageContext.request.contextPath}/home/admin-dashboard.jsp">
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
                <li class="hovered">
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
                        <input type="text" placeholder="Search orders...">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                    <a href="${pageContext.request.contextPath}/home/admin-profile.jsp" title="Admin Profile Page">
                        <ion-icon name="person-circle-outline"></ion-icon>
                    </a>
                </div>
            </div>

            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>All Orders</h2>
                        <a href="#" class="btn">View All</a>
                    </div>

                    <c:forEach var="order" items="${orders}">
                        <div class="order-container">
                            <div class="order-header">
                                <div>
                                    <span class="order-id">Order #${order.orderId}</span>
                                    <span> | User ID: ${order.userId}</span>
                                </div>
                                <div>
                                    <span class="order-status ${order.status == 'Pending' ? 'status-pending' : 
                                                              order.status == 'Processing' ? 'status-processing' : 
                                                              order.status == 'Delivered' ? 'status-delivered' : 
                                                              'status-cancelled'}">
                                        ${order.status}
                                    </span>
                                </div>
                            </div>
                            
                            <table>
                                <thead>
                                    <tr>
                                        <td>Product</td>
                                        <td>Image</td>
                                        <td>Qty</td>
                                        <td>Unit Price</td>
                                        <td>Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${order.items}">
                                        <tr>
                                            <td>${item.product.name}</td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${item.product.imageUrl}" 
                                                     alt="${item.product.name}" class="product-image" />
                                            </td>
                                            <td>${item.quantity}</td>
                                            <td>$${item.unitPrice}</td>
                                            <td>$${item.unitPrice * item.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="4" align="right"><strong>Total:</strong></td>
                                        <td><strong>$${order.totalAmount}</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <div class="order-actions">
                                <c:if test="${order.status == 'Pending'}">
                                    <button class="btn btn-primary">Process Order</button>
                                </c:if>
                                <c:if test="${order.status == 'Processing'}">
                                    <button class="btn btn-success">Mark as Delivered</button>
                                </c:if>
                                <c:if test="${order.status != 'Delivered' && order.status != 'Cancelled'}">
                                    <button class="btn btn-danger">Cancel Order</button>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Toggle menu
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');
        
        toggle.onclick = function() {
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
        
        // Add hovered class to selected list item
        let list = document.querySelectorAll('.navigation li');
        function activeLink() {
            list.forEach((item) => {
                item.classList.remove('hovered');
            });
            this.classList.add('hovered');
        }
        list.forEach((item) => item.addEventListener('mouseover', activeLink));
    </script>
    
    <!-- Add ionicons for icons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>