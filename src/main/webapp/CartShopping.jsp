<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ page import="vn.edu.hcmuaf.fit.project.DAO.model.cartShopping" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- icon -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS -->
    <link rel="stylesheet" href="./JSPWeb/CSS/CSS_Shopping_Cart.css">
    <title>Shopping-Cart</title>
</head>

<body>
<header class="header_home_menu">
    <img src="/JSPWeb/IMG/logo.jpg" alt="" width="50">
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
            <a href="./ShowRoom.jsp">
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
            <a href="#">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </li>
    </ul>
</header>
    <%
        List<cartShopping> cartItems = (List<cartShopping>) request.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance();
    %>
<div class="layer2">
    <h1>Giỏ hàng của bạn</h1>
    <h1 style="font-weight: 1000;">______</h1>
</div>

<div class="Contain_shopping_Cart" style="width: 100%;">
    <div class="Left" style="width: 50%;">
        <div class="text_button">
            <div class="text">
                <h2>Giỏ hàng của bạn</h2>
            </div>
            <div id="cart-actions" style="margin-bottom: 10px;"></div>
        </div>
        <div class="container">
            <% if (cartItems.isEmpty()) { %>
            <p>Giỏ hàng của bạn hiện đang trống.</p>
            <% } else { %>
            <% int count = 1; %>
            <% for (cartShopping cartItem : cartItems) { %>
            <div class="product-item">
                <!-- Hiển thị checkbox để lựa chọn sản phẩm -->
                <input type="checkbox" class="select-product">
                <!-- Hiển thị ảnh sản phẩm -->
                <img src="<%= cartItem.getProductID().getImage() %>" alt="Ảnh sản phẩm" width="50">
                <!-- Hiển thị tên sản phẩm -->
                <span><%= cartItem.getProductID().getName() %></span>
                <!-- Hiển thị số lượng sản phẩm -->
                <input type="number" name="quantity" value="<%= cartItem.getQuanlity() %>" min="1" style="width: 50px;">
                <!-- Nút xóa sản phẩm -->
                <form action="CartShopping" method="post">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="productId" value="<%= cartItem.getProductID().getId() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                </form>
            </div>
            <% } %>
            <!-- Hiển thị tổng giá của giỏ hàng -->
            <h3>Tổng giá của giỏ hàng là: <%= numberFormat.format(cartItems.stream().mapToDouble(cartShopping::getTotalPrice).sum()) %></h3>
            <% } %>
        </div>
    </div>

    <div class="right" style="width: 50%;">
        <div class="Infor_shopping">
            <h2>Thông tin đơn hàng</h2>
            <div class="total" style="display: flex;">
                <h4>Tổng Tiền: <%= numberFormat.format(cartItems.stream().mapToDouble(cartShopping::getTotalPrice).sum()) %></h4>
            </div>
            <button type="submit" class="btn" onclick="redirectToCheckout()">Thanh toán</button>
        </div>
        <div class="Infor_text">
            <p>
                <span><i class='bx bx-check'></i> Không rủi ro. Đặt hàng trước, thanh toán
                    sau tại nhà. Miễn phí giao hàng
                    & lắp đặt</span> tại tất cả quận huyện thuộc TP.HCM, Hà Nội, Khu đô thị Ecopark, Biên Hòa và một
                số khu vực thuộc Bình Dương.
            </p>
            <p>
                <span><i class='bx bx-check'></i></span> Đơn hàng của quý khách sẽ được <span>giao hàng trong vòng 3
                    ngày</span>, vui lòng đợi nhân viên tư vấn xác nhận lịch giao hàng trước khi thực hiện chuyển khoản
                đơn hàng.
            </p>
            <p>
                <span><i class='bx bx-check'></i> Miễn phí 1 đổi 1 - Bảo hành 2 năm - Bảo trì trọn đời.</span>
            </p>
            <p>
                <span><i class='bx bx-check'></i></span> Tất cả sản phẩm được thiết kế bởi các chuyên gia thiết kế nội thất.
            </p>
            <p>
                <span><i class='bx bx-check'> Chất lượng Quốc Tế đảm bảo theo tiêu chuẩn</i></span> cho người dùng tại Việt Nam
            </p>

        </div>
    </div>
</div>

<div class="layer4">
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

<footer id="footer_pages" class="footer" style="width: 100%; color: black;">--%>
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
    <script src="./JSPWeb/js/deleteProduct.js"></script>
<script>
    function redirectToCheckout() {
        window.location.href = "./CheckOut.jsp";
    }
</script>
    </body>

    </html>
