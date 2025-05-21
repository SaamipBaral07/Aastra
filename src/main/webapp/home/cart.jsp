<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aastra.model.CartItem" %>
<%@ page import="com.aastra.controller.dao.CartDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}
CartDAO cartDAO = new CartDAO();
List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
request.setAttribute("cartItems", cartItems);
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/cart.css">
   <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Your Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<body>

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
        <div class="header">
            <h1 class="cart-title">Shopping Cart</h1>
            <c:choose>
                <c:when test="${not empty cartItems}">
                    <p class="items-count">${cartItems.size()} Items</p>
                </c:when>
                <c:otherwise>
                    <p class="items-count">0 Items</p>
                </c:otherwise>
            </c:choose>
        </div>
        
        <c:if test="${not empty sessionScope.error}">
            <div class="error-message">
                ${sessionScope.error}
                <c:remove var="error" scope="session"/>
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${not empty cartItems}">
                <div class="cart-grid">
                    <div class="cart-items">
                        <!-- Column Headers -->
                        <div class="item column-headers">
                            <div class="header-product">Product</div>
                            <div class="header-price">Price</div>
                            <div class="header-quantity">Quantity</div>
                            <div class="header-total">Total</div>
                            <div class="header-action">Action</div>
                        </div>
                        
                        <c:set var="cartTotal" value="0" />
                        <c:forEach var="item" items="${cartItems}">
                            <c:set var="itemTotal" value="${item.product.price * item.quantity}" />
                            <c:set var="cartTotal" value="${cartTotal + itemTotal}" />
                            
                            <div class="item">
                                <div class="item-product">
                                    <div class="item-image">
                                        <img src="${pageContext.request.contextPath}/${item.product.imageUrl}" alt="${item.product.name}">
                                    </div>
                                    <div class="item-details">
                                        <h4>${item.product.name}</h4>
                                    </div>
                                </div>
                                
                                <div class="item-price">
                                    ${item.product.price}
                                </div>
                                
                                <div class="item-quantity">
                                    <form action="${pageContext.request.contextPath}/UpdateCartServlet" method="post">
                                        <input type="hidden" name="productId" value="${item.product.productId}" />
                                        <div class="quantity-control">
                                            <button type="submit" name="action" value="decrease" class="quantity-btn">-</button>
                                            <input type="text" value="${item.quantity}" class="quantity-value" readonly>
                                            <button type="submit" name="action" value="increase" class="quantity-btn">+</button>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="item-total">
                                    ${itemTotal}
                                </div>
                                
                                <div class="item-action">
                                    <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post">
                                        <input type="hidden" name="productId" value="${item.product.productId}" />
                                        <button type="submit" class="item-remove">Remove</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                        
                        <a href="${pageContext.request.contextPath}/ProductServlet" class="continue-shopping">← Continue Shopping</a>
                    </div>
                    
                    <div class="cart-summary">
                        <h3 class="summary-title">Order Summary</h3>
                        
                        <div class="summary-row">
                            <span class="summary-label">Items (${cartItems.size()})</span>
                            <span class="summary-value">${cartTotal}</span>
                        </div>
                        
                        <div class="total-row">
                            <span class="total-label">Total Cost</span>
                            <span class="total-value">$${cartTotal}</span>
                        </div>
                        
                        <form action="${pageContext.request.contextPath}/CheckoutServlet" method="post">
                            <button type="submit" class="checkout-btn">CHECKOUT</button>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-cart">
                    <p>Your cart is empty.</p>
                    <a href="${pageContext.request.contextPath}/ProductServlet" class="continue-shopping">← Continue Shopping</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    </div>
</body>
</html>