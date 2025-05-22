<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aastra.controller.dao.ProductDAO" %>
<%@ page import="com.aastra.model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    try {
        ProductDAO dao = new ProductDAO();
        List<Product> topPicks = dao.getTopSellingProducts(3);
        request.setAttribute("topPicks", topPicks);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VaasTra</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Poppins:wght@200;400;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/main.css"/>
  </head>
   <body>
    <div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="images/small_llogo.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="#" class="active">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/ProductServlet">Products</a></li>
            <li><a href="contact.jsp">Contact</a></li> 
            <li><a href="about.jsp">About Us</a></li>
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

      <main>
        <div class="left-col">
          <h1>Dress Bold. Stay Real. Be You.</h1>
          <p class="subhead">
            Wear your vibe, not just a brand — VaasTra makes every outfit count
          </p>

          <div class="cta-btns">
            <a href="${pageContext.request.contextPath}/ProductServlet" class="primary-cta">Browse our collection</a>
            <a href="${pageContext.request.contextPath}/ProductServlet" class="secondary-cta"><span>Latest Added Collection</span></a>
          </div>

          <div class="news">
            <p class="employees">50K</p>
            <p class="details">
              We’re proud to announce that we now employ a workforce of over
              <strong>50,000</strong>. It’s all possible because of you.
            </p>
          </div>
        </div>

        <div class="right-col">
          <div class="card card1">
            <div class="card-details">
              <div>
                <a href="#" class="product-title">Women Tank Tops</a>
                <p>Authentic Cotton</p>
              </div>
              <p class="product-price">$59.99</p>
            </div>
          </div>
          <div class="card card2">
            <div class="card-details">
              <div>
                <a href="#" class="product-title">Kids Sporty Hoodies</a>
                <p>Unisex Hoodies - GREY</p>
              </div>
              <p class="product-price">$60</p>
            </div>
          </div>
          <div class="card card3">
            <div class="card-details">
              <div>
                <a href="#" class="product-title">Men's Polo-Neck</a>
                <p>Zip Closure T-Shirt</p>
              </div>
              <p class="product-price">$77.77</p>
            </div>
          </div>
        </div>
        </main>

<<section class="top-picks-section">
  <h2>Top Picks</h2>
  <c:choose>
    <c:when test="${not empty topPicks}">
      <div class="top-picks-container">
        <c:forEach var="product" items="${topPicks}">
          <div class="top-pick-card">
<img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" />

            <div class="top-pick-info">
              <p class="product-name">${product.name}</p>
              <p class="price">$${product.price}</p>
              <p class="stock">In Stock: ${product.stock}</p>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <p style="color:red;text-align:center;">No top picks available</p>
    </c:otherwise>
  </c:choose>
</section>



	</div>	
    <jsp:include page="footer.jsp" />
    
    
    <script>
  function toggleSearchBar() {
    const searchBar = document.getElementById('searchBar');
    searchBar.classList.toggle('show');
  }

  function goToCart() {
    window.location.href = 'cart.jsp';
  }
  function goToUserProfile() {
	    window.location.href = "userprofile.jsp";
	  }
</script>
<style>
/* Ensure main content layout stays side-by-side */
.main-content {
  display: flex;
  justify-content: space-between;
  padding: 2em;
}
.icon-button img {
  width: 40px; 
  height: 40px;
  transition: transform 0.2s ease-in-out;
}
/* Top Picks below main-content, full-width */
.top-picks-section {
  margin-top: 5em;
  padding: 2em;
}

.top-picks-section h2 {
  font-size: 2.8rem;
  margin-bottom: 1em;
  text-align: center;
  font-family: "Playfair Display";
}

.top-picks-container {
  display: flex;
  gap: 2em;
  justify-content: center;
  flex-wrap: wrap;
}

.top-pick-card {
  background: #fff;
  border-radius: 1em;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  overflow: hidden;
  width: 250px;
  transition: transform 0.3s ease;
}

.top-pick-card:hover {
  transform: translateY(-10px);
}

.top-pick-card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.top-pick-info {
  padding: 1em;
  text-align: center;
}

/* New styles for product name */
.top-pick-info .product-name {
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 0.5em;
  color: #333;
  font-family: "Playfair Display", serif;
}

.top-pick-info .price {
  font-size: 1.6rem;
  font-weight: bold;
}

.top-pick-info .stock {
  font-size: 1.4rem;
  color: #666;
}



</style>
</body>
</html>

