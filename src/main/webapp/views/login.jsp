<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<c:if test="${not empty message}">
    <p class="error">${message}</p>
</c:if>
<form action="login" method="post">
    Tên đăng nhập: <input type="text" name="username" id="username">
    Mật khẩu: <input type="text" name="password" id="password">
    <button type="submit">Đăng nhập</button>
</form>
</body>
</html>
