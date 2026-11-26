<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Downloads</h1>

<%-- Show the welcome message only if the first name cookie has a value --%>
<c:if test="${cookie.firstNameCookie.value != null}">
    <p>Welcome back, <c:out value="${cookie.firstNameCookie.value}"/>!</p>
</c:if>

<h2>List of albums</h2>
<ul>
    <li><a href="download?action=checkUser&amp;productCode=8601">86 (the band) - True Life Songs and Pictures</a></li>
    <li><a href="download?action=checkUser&amp;productCode=pf01">Paddlefoot - The first CD</a></li>
    <li><a href="download?action=checkUser&amp;productCode=pf02">Paddlefoot - The second CD</a></li>
    <li><a href="download?action=checkUser&amp;productCode=jr01">Joe Rut - Genuine Wood Grained Finish</a></li>
</ul>

<p><a href="download?action=viewCookies">View all cookies</a> |
   <a href="download?action=deleteCookies">Delete cookies</a></p>
</body>
</html>
