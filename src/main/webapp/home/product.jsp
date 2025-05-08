<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aastra.model.Product" %>
<%@ page import="com.aastra.controller.dao.ProductDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = productDAO.getAllProductsWithImages();
    DecimalFormat df = new DecimalFormat("#0.00");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f6f6;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            width: 250px;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
        }
        .product-card img {
            max-width: 100%;
            height: 200px;
            object-fit: contain;
            border-radius: 5px;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            color: #2c3e50;
            margin: 10px 0 5px;
        }
        .product-price {
            color: #27ae60;
            font-weight: bold;
        }
        .product-desc {
            font-size: 14px;
            color: #555;
            margin: 10px 0;
        }
        .product-stock {
            font-size: 13px;
            color: #888;
        }
    </style>
</head>
<body>
<h1>Available Products</h1>
<div class="product-container">
    <%
        if (productList != null && !productList.isEmpty()) {
            for (Product p : productList) {
    %>
    <div class="product-card">
        <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>" alt="Product Image">
        <div class="product-name"><%= p.getName() %></div>
        <div class="product-price">$<%= df.format(p.getPrice()) %></div>
        <div class="product-desc"><%= p.getDescription() %></div>
        <div class="product-stock">Stock: <%= p.getStock() %></div>
    </div>
    <%
            }
        } else {
    %>
    <p>No products available.</p>
    <%
        }
    %>
</div>
</body>
</html>
