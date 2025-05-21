<%@ page import="com.aastra.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Product product = (Product) request.getAttribute("product");
%>

<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/admin-dashboard.css">
    <!-- Add Ionicons for consistent icons with your dashboard -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
    <div class="container">
        <!-- Keep your navigation here if needed -->
        
        <div class="main">
            
            
            <!-- Product Edit Form -->
            <div class="productDetails">
                <div class="cardHeader">
                    <h2>Edit Product</h2>
                </div>
                
                <form class="productForm" action="${pageContext.request.contextPath}/UpdateProductServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
                    
                    <div class="formRow">
                        <div class="formGroup">
                            <label for="name">Product Name:</label>
                            <input type="text" id="name" name="name" value="<%= product.getName() %>" required/>
                        </div>
                        
                        <div class="formGroup">
                            <label for="price">Price:</label>
                            <input type="number" id="price" step="0.01" name="price" value="<%= product.getPrice() %>" required/>
                        </div>
                    </div>
                    
                    <div class="formGroup">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" required><%= product.getDescription() %></textarea>
                    </div>
                    
                    <div class="formRow">
                        <div class="formGroup">
                            <label for="stock">Stock:</label>
                            <input type="number" id="stock" name="stock" value="<%= product.getStock() %>" required/>
                        </div>
                        
                        <div class="formGroup">
                            <label for="categoryId">Category ID:</label>
                            <input type="number" id="categoryId" name="categoryId" value="<%= product.getCategoryId() %>" required/>
                        </div>
                    </div>
                    
                    <div class="formGroup">
                        <label for="imageUrl">Image URL:</label>
                        <input type="text" id="imageUrl" name="imageUrl" value="<%= product.getImageUrl() %>" />
                    </div>
                    
                    <div class="formActions">
                        <button type="submit" class="btn-save">Update Product</button>
                        <a href="${pageContext.request.contextPath}/AdminProductServlet" class="btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <style>
    .container {
    display: flex;
    justify-content: center; /* Center the content horizontally */
    padding: 20px;
    background-color: #f4f6f8; /* Light background for the page */
    min-height: 100vh; /* Ensure the container takes at least the full viewport height */
    box-sizing: border-box;
}

.main {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    max-width: 700px; /* Slightly wider for better readability */
    margin-top: 40px; /* Add some top margin */
    padding: 25px;
    background-color: #fff; /* White background for the main content area */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* Softer shadow */
}

.productDetails {
    margin-bottom: 20px;
}

.cardHeader {
    background-color: #007bff; /* Primary blue color */
    color: white;
    padding: 15px 20px;
    border-radius: 6px 6px 0 0;
    margin-bottom: 20px;
}

.cardHeader h2 {
    margin: 0;
    font-size: 1.5em;
    font-weight: 500;
}

.productForm {
    padding: 20px;
}

.formRow {
    display: flex;
    gap: 20px; /* Space between form groups in a row */
    margin-bottom: 15px;
}

.formRow > .formGroup {
    flex: 1; /* Distribute space equally among form groups in a row */
}

.formGroup {
    margin-bottom: 15px;
}

.formGroup label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
    font-size: 0.9em;
}

.formGroup input[type="text"],
.formGroup input[type="number"],
.formGroup textarea {
    width: calc(100% - 12px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 1em;
}

.formGroup textarea {
    min-height: 100px;
    resize: vertical;
}

.formActions {
    display: flex;
    gap: 10px;
    justify-content: flex-end; /* Align buttons to the right */
}

.btn-save,
.btn-cancel {
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s ease;
}

.btn-save {
    background-color: #28a745; /* Success green */
    color: white;
}

.btn-save:hover {
    background-color: #1e7e34;
}

.btn-cancel {
    background-color: #dc3545; /* Danger red */
    color: white;
    text-decoration: none; /* Remove underline from the link */
}

.btn-cancel:hover {
    background-color: #c82333;
}
    </style>
</body>
</html>