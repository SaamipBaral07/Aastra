<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.aastra.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Products</title>
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
                <li class="hovered">
                    <a href="${pageContext.request.contextPath}/AdminProductServlet">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
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
                    <a href="#">
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

            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Product Management</h2>
                        <a href="${pageContext.request.contextPath}/home/addproduct.jsp" class="btn-add">
                            <ion-icon name="add-circle-outline"></ion-icon>
                            Add New Product
                        </a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <td>Image</td>
                                <td>Product Name</td>
                                <td>Description</td>
                                <td>Price</td>
                                <td>Stock</td>
                                <td>Category</td>
                                <td>Actions</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>
                                        <img class="product-img" src="${empty product.imageUrl ? 'images/default.png' : product.imageUrl}" 
                                             alt="Product Image"/>
                                    </td>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
                                    <td>$${product.price}</td>
                                    <td>${product.stock}</td>
                                    <td>${product.categoryId}</td>
                                    <td>
                                        <div class="action-buttons">
                                            <form action="${pageContext.request.contextPath}/EditProductServlet" method="get">
                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                <button type="submit" class="btn-edit">
                                                    <ion-icon name="create-outline"></ion-icon> Edit
                                                </button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/DeleteProductServlet" method="post"
                                                  onsubmit="return confirm('Are you sure you want to delete this product?');">
                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                <button type="submit" class="btn-delete">
                                                    <ion-icon name="trash-outline"></ion-icon> Delete
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <style>
        /* Additional styles for action buttons */
        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: center;
        }
        
        .btn-edit, .btn-delete {
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-edit {
            background-color: #2a2185;
            color: white;
        }
        
        .btn-edit:hover {
            background-color: #1a1570;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        
        .btn-delete:hover {
            background-color: #d32f2f;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        
        /* Style for product image */
        .product-img {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        /* Improve table cell alignment */
        .details .recentOrders table tr td {
            vertical-align: middle;
        }
        
        /* Add button style */
        .btn-add {
            background-color: #2a2185;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-add:hover {
            background-color: #1a1570;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>

    <script>
        // Add toggle functionality for the sidebar
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');
        
        toggle.onclick = function() {
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
        
        // Add hovered class in selected list item
        let list = document.querySelectorAll('.navigation li');
        function activeLink() {
            list.forEach((item) => {
                item.classList.remove('hovered');
            });
            this.classList.add('hovered');
        }
        list.forEach((item) => {
            item.addEventListener('mouseover', activeLink);
        });
    </script>
    
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>