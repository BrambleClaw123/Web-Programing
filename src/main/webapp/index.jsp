<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html><head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css">
</head>
<body>

<h1>CD list</h1>
<table>
    <tbody><tr>
        <th>Description</th>
        <th class="right">Price</th>
        <th>&nbsp;</th>
    </tr>
    <tr>
        <td>86 (the band) - True Life Songs and Pictures</td>
        <td class="right">$13.95</td>
        <td><form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productCode" value="p01">
            <input type="submit" value="Add To Cart">
        </form></td>
    </tr>
    <tr>
        <td>Paddlefoot - The first CD</td>
        <td class="right">$12.95</td>
        <td><form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productCode" value="p02">
            <input type="submit" value="Add To Cart">
        </form></td>
    </tr>
    <tr>
        <td>Paddlefoot - The second CD</td>
        <td class="right">$11.95</td>
        <td><form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productCode" value="p03">
            <input type="submit" value="Add To Cart">
        </form></td>
    </tr>
    <tr>
        <td>Joe Rut - Genuine Wood Grained Finish</td>
        <td class="right">$10.95</td>
        <td><form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productCode" value="p04">
            <input type="submit" value="Add To Cart">
        </form></td>
    </tr>
    </tbody></table>


</body></html>