<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <style>
        /* Define your custom color variables */
        :root {
            --blue: #2a2185;
            --white: #fff;
            --gray: #ccc;
        }

        /* Improved Base Styles using the defined colors */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0e0e0, #f0f2f0);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: var(--white);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            width: 90%;
            max-width: 600px;
        }

        h2 {
            color: var(--blue);
            text-align: center;
            margin-bottom: 35px;
            font-weight: 500;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 25px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: var(--blue);
            color: var(--white);
            padding: 14px 24px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 6px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1e185e;
        }

        .error {
            color: #dc3545;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .back-button {
            margin-top: 20px;
            text-align: center; /* Center the button */
        }

        .back-button a {
            display: inline-block; /* Important for applying padding and other styles */
            background-color: var(--gray);  /* Grey background for back button */
            color: #333;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
            border: none; /* Remove the default border */
            cursor: pointer;
        }

        .back-button a:hover {
            background-color: #b0b0b0; /* Darker grey on hover */
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
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4"></textarea>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" required>

        <label for="category_id">Category ID:</label>
        <input type="number" id="category_id" name="category_id">

        <label for="image_url">Image URL:</label>
        <input type="text" id="image_url" name="image_url">

        <input type="submit" value="Add Product">
    </form>

    <div class="back-button">
        <a href="${pageContext.request.contextPath}/AdminProductServlet">Go Back</a>
    </div>
</div>
</body>
</html>
