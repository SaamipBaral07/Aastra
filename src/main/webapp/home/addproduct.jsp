<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Product</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <form method="post" action="${pageContext.request.contextPath}/AddProductServlet">
        <label>Product Name:</label>
        <input type="text" name="name" required>

        <label>Description:</label>
        <textarea name="description" rows="4"></textarea>

        <label>Price:</label>
        <input type="number" name="price" step="0.01" required>

        <label>Stock:</label>
        <input type="number" name="stock" required>

        <label>Category ID:</label>
        <input type="number" name="category_id">

        <label>Image URL:</label>
        <input type="text" name="image_url">

        <input type="submit" value="Add Product">
    </form>
</div>
</body>
</html>
