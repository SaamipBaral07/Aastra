<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/productdetails.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/main.css">
</head>
<body>
<div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="${pageContext.request.contextPath}/home/images/small_llogo-1.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="${pageContext.request.contextPath}/home/index.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/ProductServlet" class=active>Products</a></li>
            <li><a href="${pageContext.request.contextPath}/home/contact.jsp">Contact</a></li> 
            <li><a href="${pageContext.request.contextPath}/home/about.jsp">About Us</a></li>
            <li><a href="#"></a></li>
          </ul>
        </nav>

	<div class="navbar-icons">
  		<button class="icon-button" title="Search" onclick="toggleSearchBar()">
    		<img src="${pageContext.request.contextPath}/home/images/search-icon.jpg" alt="Search" />
  		</button>
  		<button class="icon-button" title="Cart" onclick="goToCart()">
   			 <img src="${pageContext.request.contextPath}/home/images/cart-icon.png" alt="Cart" />
  		</button>
  		<button class="icon-button" title="User Profile" onclick="goToUserProfile()">
   		 <img src="${pageContext.request.contextPath}/home/images/user-icon1.png" alt="User" />
  		</button>
	</div>

        <div class="search-bar-container" id="searchBar">
          <input type="text" placeholder="Search..." />
        </div>
      </header>
    <div class="container">
        <!-- Option 1: Basic link with "Back" text (minimal styling) -->
        <div style="margin-bottom: 10px;">
            <a href="javascript:history.back()" class="simple-back">← Go Back</a>
        </div>

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
                <p>
                    <strong>Stock:</strong> ${product.stock} units
                    <c:choose>
                        <c:when test="${product.stock > 10}">
                            <span class="stock-indicator in-stock">In Stock</span>
                        </c:when>
                        <c:when test="${product.stock > 0}">
                            <span class="stock-indicator low-stock">Low Stock</span>
                        </c:when>
                        <c:otherwise>
                            <span class="stock-indicator out-of-stock">Out of Stock</span>
                        </c:otherwise>
                    </c:choose>
                </p>
                <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" value="1" min="1" max="${product.stock}" required>
                    <button type="submit" class="btn">Add to Cart</button>
                </form>
            </div>
        </div>
    </div>
    </div>
</body>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Get all thumbnail images
    const thumbnails = document.querySelectorAll('.product-images > div img');
    const mainImage = document.getElementById('mainImage');
    
    // Add click event to each thumbnail
    thumbnails.forEach(function(thumbnail) {
      thumbnail.addEventListener('click', function() {
        // Update main image
        mainImage.style.opacity = '0';
        
        setTimeout(function() {
          mainImage.src = thumbnail.src;
          mainImage.style.opacity = '1';
        }, 300);
        
        // Remove active class from all thumbnails
        thumbnails.forEach(function(thumb) {
          thumb.classList.remove('active');
        });
        
        // Add active class to clicked thumbnail
        thumbnail.classList.add('active');
      });
    });
    
    // Set first thumbnail as active by default
    if (thumbnails.length > 0) {
      thumbnails[0].classList.add('active');
    }
  });
</script>
</html>