<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css">
</head>
<body>

<h1>Your cart</h1>

<table>
    <tbody>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>

    <c:forEach var="item" items="${sessionScope.cart.items}">
        <tr>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="${item.product.code}">
                    <input type="text" name="quantity" value="${item.quantity}">
                    <input type="submit" value="Update">
                </form>
            </td>
            <td>${item.product.description}</td>
            <td>$<fmt:formatNumber value="${item.product.price}" pattern="0.00"/></td>
            <td>$<fmt:formatNumber value="${item.total}" pattern="0.00"/></td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="${item.product.code}">
                    <input type="hidden" name="quantity" value="0">
                    <input type="submit" value="Remove Item">
                </form>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<p><b>To change the quantity</b>, enter the new quantity
    and click on the Update button.</p>

<form action="cart" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>

<form action="checkout.jsp" method="post">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Checkout">
</form>

</body>
</html>