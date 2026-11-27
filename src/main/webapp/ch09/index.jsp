<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>Shopping</h1>

<%-- Show the welcome message only if the first name cookie has a value --%>
<c:if test="${cookie.firstNameCookie.value != null}">
    <p>Welcome back, <c:out value="${cookie.firstNameCookie.value}"/>!</p>
</c:if>

<h2>List of albums</h2>
<table>
    <tr>
        <th>Album</th>
        <th>Price</th>
        <th>Download</th>
        <th>Cart</th>
    </tr>
    <c:forEach var="product" items="${sessionScope.products}">
        <tr>
            <td><c:out value="${product.description}"/></td>
            <td><c:out value="${product.priceCurrencyFormat}"/></td>
            <td>
                <a href="<c:url value='/download'>
                             <c:param name='action' value='checkUser'/>
                             <c:param name='productCode' value='${product.code}'/>
                         </c:url>">Download</a>
            </td>
            <td>
                <form action="<c:url value='/cart'/>" method="post">
                    <input type="hidden" name="productCode"
                           value="<c:out value='${product.code}'/>">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<p><a href="<c:url value='/cart'/>">View Cart</a></p>

<p><a href="<c:url value='/download'><c:param name='action' value='viewCookies'/></c:url>">View all cookies</a> |
   <a href="<c:url value='/download'><c:param name='action' value='deleteCookies'/></c:url>">Delete cookies</a></p>

<p><a href="<c:url value='/emailList'/>">Email Register</a></p>
</body>
</html>
