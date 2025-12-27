<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 23/12/2024
  Time: 9:49 AM
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
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./JSPWeb/CSS/CSS_TrangChu.css">
    <title>Sofa Web App</title>
</head>

<body>
<div class="img_Background" >
    <img src="./JSPWeb/IMG/minotti-seymour-sofa-italian.jpg">
</div>

<header class="header_home_menu">
    <img src="./JSPWeb/IMG/logo.jpg" alt="" width="50">
    <ul class="menu">
        <li>
            <a href="#">
                <span class="text_header"> TRANG CHỦ</span>
            </a>
        </li>
        <li>
            <a href="Products">
                <span class="text_header"> SẢN PHẨM</span>
            </a>
        </li>
        <li>
            <a href="ShowRoom">
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

                    <li><i class="bi bi-box-arrow-right"></i> <span><a href="./Login.jsp">Đăng Xuất</a></span></li>
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



<div class="layer_2">
    <div class="cerfiticate">
        <i class="fa-solid fa-award fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text" style="color: #9b2805;">BẢO HÀNH</span> <br>Tới 2 Năm
        </h5>
    </div>

    <div class="freeship">
        <i class="fa-solid fa-truck-fast fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text"  style="color: #9b2805;">FREE SHIP</span> <br> Order Over 1.500.000 <span class="vnd">đ</span>
        </h5>
    </div>

    <div class="support">
        <i class="fa-solid fa-headset fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text"  style="color: #9b2805;">24 / 7 Support</span> <br>Sẫn Sàng Hỗ Trợ
        </h5>
    </div>
</div>

<div class="product-carousel">
    <h2 style="text-align: center; color: white;">DANH MỤC SẢN PHẨM</h2>
    <div class="carousel-wrapper">
        <!-- Nút điều hướng trái -->
        <button class="carousel-btn left-btn">
            <i class="fa fa-chevron-left"></i>
        </button>

        <!-- Khu vực sản phẩm -->
        <div class="carousel-container">
            <div class="product-items">
                <!-- Sản phẩm 1 -->
                <c:forEach var="listnew" items="${listnewProduct}">
                    <div class="product-item">
                        <img src="${listnew.image}" alt="Sản phẩm 1">
                        <h3>${listnew.name}</h3>
                        <p class="price">${listnew.price}</p>
                        <div class="btn-group">
                            <form action="CartShopping" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${listnew.id}">
                                <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
                            </form>
                            <button class="view-details">
                                <a href="ProductDetail?ProductID=${listnew.id}">Chi tiết</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Nút điều hướng phải -->
        <button class="carousel-btn right-btn">
            <i class="fa fa-chevron-right"></i>
        </button>
    </div>
</div>


<div class="layer_3">
    <div class="text_layer3">
        <h2>SẢN PHẨM GHẾ SOFA TỪ <strong style="color: yellow;">CHÚNG TÔI</strong></h2>
        <br>
        <p style="color: yellow;">____________________________________________</p>
        <br>
    </div>

    <div class="text_layer3">
        <p style="color: #e3e4e6;">Bộ sưu tập những sản phẩm Sofa nhập khẩu. Từ phòng khách cho đến phòng ngủ nhập khẩu cao cấp.</p>
    </div>
</div>

<div class="layer_4">
    <div class="Lay4_col_1_rowspan_2_pic_1">
        <img class="sofa_background" src="https://noithatkenli.vn/wp-content/uploads/2018/05/bbb-1.jpg"
             alt="Sofa da thật italia nội thất kenli" width="455" height="580"
             data-lazy-src="https://noithatkenli.vn/wp-content/uploads/2018/05/bbb-1.jpg" data-ll-status="loaded">

        <div class="text_layer4_1">
            <Strong style="color: #ffffff;">Sang Trọng - Đẳng Cấp</Strong>
        </div>
    </div>

    <div class="lay4_col_2">
        <div class="lay4_row_1">
            <div class="pic_2">
                <img src="./JSPWeb/IMG/modern-living-room-interior-with-sofa-blue-wall-background_802770-306.jpg"
                     class="pic2" alt="">
                <div class="text_layer4_2">
                    <Strong style="color: #ffffff;">Phong Cách - Tinh Tế</Strong>
                </div>
            </div>

            <div class="pic_3">
                <img src="./JSPWeb/IMG/Butterfly-Design-Light-Luxury-Wall-Decoration-Metal-Wall-Decoration-Sofa-Background-Wall-Pendant.jpg"
                     alt="" class="pic3" >
                <div class="text_layer4_3">
                    <Strong style="color: #ffffff;">Hiện Đại - Khác Biệt</Strong>
                </div>
            </div>
        </div>

        <div class="lay4_row_2_pic_4">
            <img src="./JSPWeb/IMG/Ghế-Sofa-Ngoài-Trời-PKD-05-.jpg" width="680px" height="436px" alt="">
            <div class="text_layer4_4">
                <Strong style="color: #ffffff;">Tiện Nghi - Bền Bỉ</Strong>
            </div>
        </div>
    </div>
</div>

<div class="layer_3">
    <div class="text_layer3">
        <h2 style="color: white;">KHÔNG GIAN THỰC TẾ</h2>
        <br>
        <p style="color: yellow;">____________________________________</p>
        <br>
    </div>

    <div class="img_layer3">
        <p style="color: #e3e4e6;">Tổng hợp những hình ảnh Sofa cao cấp. Những bộ ảnh chân thật thể hiện nét đẹp sống động của những bộ Sofa
            nhập khẩu hàng đầu.</p>
    </div>
</div>
<br>

<div class="layer_5">
    <div class="col_1_rowspan2">
        <img src="./JSPWeb/IMG/sofa_deco1.-.jpg" alt="">
    </div>

    <div class="col_2">
        <div class="img_row2_pic1">
            <img src="./JSPWeb/IMG/sofa_deco2.jpg" alt="">
        </div>
        <div class="img_row2_pic2">
            <img src="./JSPWeb/IMG/sofa_deco3.jpg" alt="">
        </div>
    </div>
</div>

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
<script src="./JSPWeb/js/MovingLeftRight.js"></script>
</body>

</html>
