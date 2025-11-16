<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 23/12/2024
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./JSPWeb/CSS/CSS_Showroom.css">

</head>

<body>
<div class="img_Background">
    <img src="./JSPWeb/IMG/9333e5e69a6da08cf73cb50419f68a1f.jpg" alt="">
</div>

<header class="header_home_menu">
    <img src="./JSPWeb/IMG/logo.jpg" alt="" width="50">
    <ul class="menu">
        <li>
            <a href="HomePage">
                <span class="text_header"> TRANG CHỦ</span>
            </a>
        </li>
        <li>
            <a href="Products">
                <span class="text_header"> SẢN PHẨM</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="text_header"> SHOWROOM</span>
            </a>
        </li>
        <li>
            <a href="contactUs">
                <span class="text_header"> LIÊN HỆ </span>
            </a>
        </li>
    </ul>

    <ul class="social_icon">
        <%--        logout--%>
        <c:if test="${sessionScope.acc != null}">
            <li>
                <i class="fa-solid fa-user" style="color: rgb(255, 255, 255);"></i>
                <ul class="dropdown">
                    <li><i class="bi bi-person-circle"></i><span>${sessionScope.acc.username}</span></li>
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li>
                            <h5>Hello ${sessionScope.acc.username} (admin)</h5>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.acc.isClient == 1}">
                        <li>
                            <h5>SĐT: +84 xxx.xxx.xxx</h5>
                        </li>
                    </c:if>

                    <li><i class="bi bi-box-arrow-right"></i> <span><a href="Login.jsp">Đăng Xuất</a></span></li>
                </ul>
            </li>
        </c:if>

        <%--        login--%>
        <c:if test="${sessionScope.acc == null}">
            <li>
                <i class="fa-solid fa-user" style="color: rgb(255, 255, 255);"></i>
                <ul class="dropdown">
                    <li><i class="bi bi-box-arrow-right"></i> <span><a href="./Login.jsp">Đăng Nhập</a></span></li>
                </ul>
            </li>
        </c:if>
        <li>
            <i class="fa-solid fa-heart" style="color: #ffffff;"></i>
        </li>
        <li>
            <a href="CartShopping">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </li>
    </ul>
</header>

<div class="layer2">
    <h2>SHOWROOM NỘI THẤT SOFA</h2>
</div>
<c:forEach items="${ShowRoom}" var="sr">
    <div class="layer3">
            <div class="text">
                <h3>${sr.name}</h3> <br>
                <h4>${sr.address}</h4><br>
                <h4>${sr.description}</h4> <br>
                <p>${sr.hotline} <br></p>
            </div>
            <div class="ggMap">
                <img src="${sr.image}" alt="">
            </div>
    </div>
</c:forEach>

<footer id="footer_pages" class="footer" style="width: 100%; color: black;">
    <div class="showroom_footer">
        <h2>SHOWROOM</h2>
        <ul>
            <li>Trụ sở & Showroom 1: Tòa nhà Kenli, Số 2 Dịch Vọng Hậu, Q. Cầu Giấy</li>
            <li>Showroom 2: Số 4 Dịch Vọng Hậu, Q. Cầu Giấy</li>
            <li>Trụ sở & Showroom: 69 - 71 Nguyễn Cơ Thạch, Khu đô thị Sala, An Lợi Đông, Quận 2</li>
            <li>Email: xxxxxxx@gmail.com</li>
            <li>Thời gian làm việc : T2 - CN 8h30 - 22h</li>
        </ul>
    </div>

    <div class="suport_footter">
        <h2>HỖ TRỢ KHÁCH HÀNG</h2>
        <ul>
            <li>Hướng Dẫn Mua Hàng</li>
            <li>Chính Sách Bảo Mật</li>
            <li>Chính Sách Đổi Trả Hàng</li>
            <li>Phương Thức Thanh Toán</li>
            <li>Vận Chuyển Lắp Đặt</li>
            <li>Dịch Vụ Bảo Hành</li>
        </ul>
    </div>

    <div class="follow_footer">
        <h2>LIÊN HỆ - THEO DÕI</h2>
        <div class="icon_footer">
            <i class="fa-brands fa-facebook" style="color: #005eff;  font-size: 30px;"></i>
            <i class="fa-brands fa-twitter" style="color: #005eff; font-size: 30px"></i>
            <i class="fa-brands fa-instagram" style="color: #fb1818; font-size: 30px"></i>
        </div>
    </div>
</footer>


<script src="./JSPWeb/js/scoller_header.js"></script>
</body>

</html>
