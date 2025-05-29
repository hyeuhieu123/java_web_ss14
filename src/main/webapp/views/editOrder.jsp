<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Chỉnh sửa đơn hàng</h2>
<form action="${pageContext.request.contextPath}/orders/editOrder" method="post">
    <label>Mã đơn hàng:</label><br>
    <input type="text" name="id" value="${order.id}" readonly><br><br>

    <label>Tên sản phẩm:</label><br>
    <input type="text" name="productName" value="${order.productName}" required><br><br>

    <label>Số lượng:</label><br>
    <input type="number" name="quantity" min="1" value="${order.quantity}" required><br><br>

    <button type="submit">Cập nhật</button>
</form>
<br>
<a href="${pageContext.request.contextPath}/orders">Quay lại danh sách</a>
</body>
</html>
