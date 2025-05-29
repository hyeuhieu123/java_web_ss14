<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form method="post" modelAttribute="product" action="addProduct">
        Tên sản phẩm: <form:input path="name" id="name"/> <br>
        Giá: <form:input path="price" id="price"/> <br>
        <button type="submit">Thêm mới</button>
    </form:form>
</body>
</html>
