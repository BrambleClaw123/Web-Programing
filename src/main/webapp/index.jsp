<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Web Programming - Chọn bài</title>
    <link rel="stylesheet" href="<c:url value='/styles/main.css'/>" type="text/css"/>
    <style>
        .menu { list-style: none; padding: 0; max-width: 560px; }
        .menu li { margin: 0 0 12px 0; }
        .menu a { display: block; padding: 14px 18px; border: 1px solid #3E8CC8;
                  border-radius: 8px; text-decoration: none; color: #222; }
        .menu a:hover { background: #eaf3fb; }
        .menu strong { display: block; color: #3E8CC8; font-size: 12pt; }
    </style>
</head>
<body>
<h1>Web Programming</h1>
<p>Choose:</p>

<ul class="menu">
    <li>
        <a href="<c:url value='/emailList'/>">
            <strong>Chapter 8: Email List</strong>
        </a>
    </li>
    <li>
        <a href="<c:url value='/download'/>">
            <strong>Chapter 9: Download</strong>
        </a>
    </li>
    <li>
        <a href="<c:url value='/loadProducts'/>">
            <strong>Chapter 9: Cart</strong>
        </a>
    </li>
</ul>
</body>
</html>
