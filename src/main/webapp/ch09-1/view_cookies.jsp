<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>Cookies</h1>
<p>Here's a table with all of this browser's persistent cookies:</p>

<table>
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <c:forEach var="c" items="${cookie}">
        <tr>
            <td><c:out value="${c.value.name}"/></td>
            <td><c:out value="${c.value.value}"/></td>
        </tr>
    </c:forEach>
</table>

<p><a href="${pageContext.request.contextPath}/download?action=viewAlbums">View list of albums</a></p>
<hr>
<p><a href="${pageContext.request.contextPath}/">&laquo; Back to list of chapter</a></p>
</body>
</html>
