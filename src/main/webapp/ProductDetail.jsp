<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 24/12/2024
  Time: 5:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm</title>
    <script src="./JSPWeb/js/product_detail.js"></script>
    <link rel="stylesheet" href="./JSPWeb/CSS/product_style.css">
</head>
<body>
<header>
    <img src="./JSPWeb/IMG/headerimage.jpg" alt="Sofa Shop Header">
</header>
<main class="container">
    <div class="product-detail">
        <div class="product-images">
            <img id="product-image" src="${ProductDetail.image}" alt="Product Image">
        </div>
        <div class="product-info">
            <h2 id="product-name"></h2>
            <p><strong>Giá: $${ProductDetail.price}</strong> <span id="product-price"></span></p>
            <p><strong>Kích thước: ${ProductDetail.size.size}</strong> <span id="product-dimensions"></span></p>
            <p><strong>Chất liệu: ${ProductDetail.matarial}</strong> <span id="product-material"></span></p>
            <div id="product-notes">${ProductDetail.description}</div>
            <div class="product-buttons">
                <form action="CartShopping" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${p.id}">
                    <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
                </form>
                <button id="buy-now-button">Mua ngay</button>
            </div>
        </div>
    </div>
    <button onclick="window.history.back()">Quay lại</button>
</main>
<footer>
    <p>&copy; 2024 Sofa Shop. All rights reserved.</p>
</footer>
<script src="./JSPWeb/js/product_detail.js"></script>
</body>
</html>

