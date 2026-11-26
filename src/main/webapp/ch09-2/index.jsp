<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>CD list</h1>
<table>
    <tr>
        <th>Description</th>
        <th class="right">Price</th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="product" items="${sessionScope.products}">
        <tr>
            <td><c:out value="${product.description}"/></td>
            <td class="right"><c:out value="${product.priceCurrencyFormat}"/></td>
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
<hr>
<p><a href="${pageContext.request.contextPath}/">&laquo; Back to list of chapter</a></p>
</body>
</html>
