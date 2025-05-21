<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aastra.model.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Poppins:wght@200;400;700&display=swap"
          rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home/css/main.css">
    
    <title>Available Products</title>
    <style>
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
        .search-bar-container {
  			display: none; /* hide by default */
  			position: absolute;
  			top: 160px; /* adjust based on your header height */
  			right: 100px;
  			background-color: white;
  			padding: 10px 20px;
 			 box-shadow: 0 4px 8px rgba(0,0,0,0.1);
 			 border-radius: 8px;
 			 transition: opacity 0.3s ease;
 			 opacity: 0;
  			z-index: 1000;
			}
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="wrapper">
        <header>
            <a href="#"><img src="${pageContext.request.contextPath}/home/images/small_llogo.png" alt="VaasTra Logo" /></a>

            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home/index.jsp">Home</a></li>
                    <li><a href="#" class=active>Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/home/contact.jsp">Contact</a></li>
                    <li><a href="${pageContext.request.contextPath}/home/about.jsp">About Us</a></li>
                    <li><a href="#"></a></li>
                </ul>
            </nav>

            <div class="navbar-icons">
                <button class="icon-button" title="Search" onclick="toggleSearchBar()">
                    <img src="${pageContext.request.contextPath}/home/images/search-icon1.png" alt="Search" />
                </button>
                <button class="icon-button" title="Cart" onclick="goToCart()">
                    <img src="${pageContext.request.contextPath}/home/images/cart-icon.png" alt="Cart" />
                </button>
                <button class="icon-button" title="User Profile" onclick="goToUserProfile()">
                    <img src="${pageContext.request.contextPath}/home/images/user-icon.jpg" alt="User" />
                </button>
            </div>

            <div class="search-bar-container" id="searchBar">
    		<form method="get" action="${pageContext.request.contextPath}/ProductServlet">
        		<input type="text" name="search" placeholder="Search by name..." />
        		<button type="submit">Search</button>
    			</form>
			</div>

        </header>
        
        <div class="category-filter-container">
            <form method="get" action="${pageContext.request.contextPath}/ProductServlet" class="category-filter-form">
                <label for="category" class="category-label">Filter by Category:</label>
                <select name="category" id="category" class="category-select" onchange="this.form.submit()">
                    <option value="all" ${selectedCategory == null || selectedCategory == 'all' ? 'selected' : ''}>All</option>
                    <option value="men" ${selectedCategory == 'men' ? 'selected' : ''}>Men</option>
                    <option value="women" ${selectedCategory == 'women' ? 'selected' : ''}>Women</option>
                    <option value="kids" ${selectedCategory == 'kids' ? 'selected' : ''}>Kids</option>
                </select>
            </form>
        </div>

        <h1>Available Products</h1>
        <div class="product-container">
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                DecimalFormat df = new DecimalFormat("#0.00");
                
                if (productList != null && !productList.isEmpty()) {
                    for (Product p : productList) {
            %>
            <div class="product-card">
                <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>" alt="Product Image">
                <div class="product-name"><%= p.getName() %></div>
                <div class="product-price">$<%= df.format(p.getPrice()) %></div>
                <form action="${pageContext.request.contextPath}/ProductDetailsServlet" method="get">
                    <input type="hidden" name="productId" value="<%= p.getProductId() %>" />
                    <button type="submit">Buy Now</button>
                </form>
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
    </div>

    <script>
        function toggleSearchBar() {
            const searchBar = document.getElementById('searchBar');
            searchBar.classList.toggle('show');
        }
        
        function goToCart() {
            window.location.href = "${pageContext.request.contextPath}/home/cart.jsp";
        }
        
        function goToUserProfile() {
            window.location.href = "${pageContext.request.contextPath}/home/userprofile.jsp";
        }
    </script>
</body>
</html>