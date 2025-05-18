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
</head>
<body>

<h2>Your Shopping Cart</h2>

<c:choose>
    <c:when test="${not empty cartItems}">
        <table border="1" cellpadding="10">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.product.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.product.price * item.quantity}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p>Your cart is empty.</p>
    </c:otherwise>
</c:choose>

</body>
</html>
