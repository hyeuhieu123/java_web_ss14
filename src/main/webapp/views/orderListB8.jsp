<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Danh sách đơn hàng</title></head>
<body>
<h2>Danh sách đơn hàng đã đặt</h2>

<table border="1">
    <tr><th>Tên người dùng</th><th>Sản phẩm</th><th>Số lượng</th></tr>
    <c:forEach var="order" items="${ordersB8}">
        <tr>
            <td>${order.username}</td>
            <td>${order.product}</td>
            <td>${order.quantity}</td>
        </tr>
    </c:forEach>
</table>

<p><a href="${pageContext.request.contextPath}/orderB8">Quay lại đặt hàng</a></p>
</body>
</html>
