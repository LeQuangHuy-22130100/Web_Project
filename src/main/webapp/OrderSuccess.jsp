
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <link rel="stylesheet" href="./JSPWeb/CSS/OrderSuccessCSS.css">
</head>
<body>
<div class="container">
    <div class="icon">✔</div>
    <div class="message">Thanh toán thành công</div>
    <div class="description">
        Đơn hàng của quý khách đã thanh toán thành công. Chúng tôi sẽ sớm liên hệ để giao sản phẩm, dịch vụ.
    </div>
    <button class="button" onclick="redirectToCart()">Đóng</button>

</div>
<script>
    function redirectToCart() {
        window.location.href = "CartShopping.jsp";
    }
</script>

</body>
</html>