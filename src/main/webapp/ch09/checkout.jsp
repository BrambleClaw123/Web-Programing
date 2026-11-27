<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>Checkout</h1>
<p>You have <c:out value="${cart.count}"/> item(s) in your cart.</p>
<p>The checkout process is not implemented in this exercise.</p>
<form action="<c:url value='/cart'/>" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>
</body>
</html>
