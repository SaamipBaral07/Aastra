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
    <title>Your Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<body>
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
                            <span class="total-value">£${cartTotal}</span>
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
</body>
</html>