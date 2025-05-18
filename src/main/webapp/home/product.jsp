<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aastra.model.Product" %>
<%@ page import="com.aastra.controller.dao.ProductDAO" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    ProductDAO productDAO = new ProductDAO();
    String selectedCategory = request.getParameter("category");
    List<Product> productList;

    if (selectedCategory == null || selectedCategory.equals("all")) {
        productList = productDAO.getAllProductsWithImages();
    } else {
    	productList = productDAO.getProductsByCategoryName(selectedCategory);
    }

    DecimalFormat df = new DecimalFormat("#0.00");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Poppins:wght@200;400;700&display=swap"
      rel="stylesheet"
    />
<link rel="stylesheet" href="css/main.css"/>
	
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
      
    </style>
</head>
<body>
 <div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="images/small_llogo.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#" class=active>Products</a></li>
            <li><a href="contact.jsp">Contact</a></li> 
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="#"></a></li>
          </ul>
        </nav>

	<div class="navbar-icons">
  		<button class="icon-button" title="Search" onclick="toggleSearchBar()">
    		<img src="images/search-icon1.png" alt="Search" />
  		</button>
  		<button class="icon-button" title="Cart" onclick="goToCart()">
   			 <img src="images/cart-icon.png" alt="Cart" />
  		</button>
  		<button class="icon-button" title="User Profile" onclick="goToUserProfile()">
   		 <img src="images/user-icon.jpg" alt="User" />
  		</button>
	</div>

        <div class="search-bar-container" id="searchBar">
          <input type="text" placeholder="Search..." />
        </div>
      </header>
     <div class="category-filter-container">
    <form method="get" action="product.jsp" class="category-filter-form">
        <label for="category" class="category-label">Filter by Category:</label>
        <select name="category" id="category" class="category-select" onchange="this.form.submit()">
            <option value="all" <%= "all".equals(request.getParameter("category")) ? "selected" : "" %>>All</option>
            <option value="men" <%= "men".equals(request.getParameter("category")) ? "selected" : "" %>>Men</option>
            <option value="women" <%= "women".equals(request.getParameter("category")) ? "selected" : "" %>>Women</option>
            <option value="kids" <%= "kids".equals(request.getParameter("category")) ? "selected" : "" %>>Kids</option>
        </select>
    </form>
</div>


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
</body>
<script> 

</script>
</html>
