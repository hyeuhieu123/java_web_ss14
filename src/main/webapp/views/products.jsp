<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Giá</th>
        <th>Hành động</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                <a href="deleteProduct/${product.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="addProduct">Thêm sản phẩm mới</a>
</body>
</html>
