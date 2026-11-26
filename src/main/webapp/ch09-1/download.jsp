<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
<h1>Download page</h1>
<p>Thanks for registering, <c:out value="${sessionScope.user.firstName}"/>.</p>
<p>Product code: <c:out value="${sessionScope.productCode}"/></p>
<p>Your download would start here.</p>
<p><a href="${pageContext.request.contextPath}/download?action=viewAlbums">Return to the list of albums</a></p>
<hr>
<p><a href="${pageContext.request.contextPath}/">&laquo; Back to list of chapter</a></p>
</body>
</html>
