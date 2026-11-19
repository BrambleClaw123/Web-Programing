<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("cart");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Checkout</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>

<h1>Thank you for shopping</h1>
<br>
<a href="index.jsp">Continue Shopping</a>

</body>
</html>
