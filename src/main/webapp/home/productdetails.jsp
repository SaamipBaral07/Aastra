<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <style>
        .product-detail { max-width: 800px; margin: auto; padding: 20px; display: flex; gap: 30px; }
        .product-images img { width: 100px; height: 100px; object-fit: contain; margin: 5px; border: 1px solid #ccc; cursor: pointer; }
        .main-image { width: 300px; height: 300px; object-fit: contain; margin-bottom: 15px; }
        .product-info { flex: 1; }
        .btn { padding: 10px 20px; background-color: #27ae60; color: white; border: none; margin-top: 10px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="product-detail">
        <div class="product-images">
            <c:choose>
                <c:when test="${not empty imageUrls}">
                    <img class="main-image" id="mainImage" src="${pageContext.request.contextPath}/${imageUrls[0]}" alt="Main Image">
                    <div>
                        <c:forEach var="img" items="${imageUrls}">
                            <img src="${pageContext.request.contextPath}/${img}" alt="Thumbnail" onclick="document.getElementById('mainImage').src=this.src;">
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <img class="main-image" src="images/no-image.png" alt="No Image Available">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="product-info">
            <h2>${product.name}</h2>
            <p><strong>Description:</strong> ${product.description}</p>
            <p><strong>Price:</strong> $${product.price}</p>
            <p><strong>Stock:</strong> ${product.stock} units</p>
            <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post">
                <input type="hidden" name="productId" value="${product.productId}">
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" value="1" min="1" max="${product.stock}" required>
                <button type="submit" class="btn">Add to Cart</button>
            </form>
        </div>
    </div>
</body>
</html>
