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
    <title>Your Cart</title>
    <style>
        img.product-img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            display: block;
            margin-bottom: 5px;
        }
        .quantity-buttons button {
            width: 30px;
            height: 30px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
        }
        table, th, td {
            border: 1px solid gray;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>

<h2>Your Shopping Cart</h2>
<c:if test="${not empty sessionScope.error}">
    <p style="color: red;">${sessionScope.error}</p>
    <c:remove var="error" scope="session"/>
</c:if>


<c:choose>
    <c:when test="${not empty cartItems}">
        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <c:set var="cartTotal" value="0" />
            <c:forEach var="item" items="${cartItems}">
                <c:set var="itemTotal" value="${item.product.price * item.quantity}" />
                <c:set var="cartTotal" value="${cartTotal + itemTotal}" />
                <tr>
                    <td>
                        <img src="${pageContext.request.contextPath}/${item.product.imageUrl}" alt="Product Image" class="product-img"/>
                        ${item.product.name}
                    </td>
                    <td>${item.product.price}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/UpdateCartServlet" method="post" class="quantity-buttons">
                            <input type="hidden" name="productId" value="${item.product.productId}" />
                            <button type="submit" name="action" value="decrease">-</button>
                            ${item.quantity}
                            <button type="submit" name="action" value="increase">+</button>
                        </form>
                    </td>
                    <td>${itemTotal}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post">
                            <input type="hidden" name="productId" value="${item.product.productId}" />
                            <button type="submit">Remove</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3" align="right"><strong>Cart Total:</strong></td>
                <td colspan="2"><strong>${cartTotal}</strong></td>
            </tr>
        </table>

        <form action="${pageContext.request.contextPath}/CheckoutServlet" method="post">
            <button type="submit">Proceed to Checkout</button>
        </form>
    </c:when>
    <c:otherwise>
        <p>Your cart is empty.</p>
    </c:otherwise>
</c:choose>

</body>
</html>
