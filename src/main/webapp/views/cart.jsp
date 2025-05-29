<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Giỏ hàng</h2>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <th>Tên sản phẩm</th>
    <th>Giá</th>
    <th>Số lượng</th>
    <th>Tổng tiền</th>
    <th>Thao tác</th>
  </tr>
  <c:forEach var="item" items="${cartItems}">
    <tr>
      <td>${item.product.name}</td>
      <td>${item.product.price}</td>
      <td>${item.quantity}</td>
      <td>${item.product.price * item.quantity}</td>
      <td>
        <a href="${pageContext.request.contextPath}/cart/deleteCart/${item.product.id}">Xóa</a>
      </td>
    </tr>
  </c:forEach>
</table>

<h3>Thêm sản phẩm vào giỏ hàng</h3>
<form action="${pageContext.request.contextPath}/cart/addToCart" method="post">
  <label for="productId">Sản phẩm:</label>
  <select name="productId" id="productId" required>
    <option value="">--Chọn sản phẩm--</option>
    <c:forEach var="p" items="${products}">
      <option value="${p.id}">${p.name} - Giá: ${p.price}</option>
    </c:forEach>
  </select>
  <br><br>
  <label for="quantity">Số lượng:</label>
  <input type="number" id="quantity" name="quantity" value="1" min="1" required>
  <br><br>
  <button type="submit">Thêm vào giỏ</button>
</form>
</body>
</html>
