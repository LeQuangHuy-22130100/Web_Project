<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.project.DAO.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.project.DAO.dao.*" %>

<%
//  HttpSession sessionObj = request.getSession();
//  List<CartItem> cart = (List<CartItem>) sessionObj.getAttribute("cart");
//  User currentUser = (User) sessionObj.getAttribute("user");
//
//  double totalAmount = 0;
//  double taxes = 4.82; // Giả định thuế cố định
//  double shippingFee = 0; // Miễn phí vận chuyển
//
//  DecimalFormat df = new DecimalFormat("#,##0.00");
//
//  if (cart != null) {
//    for (CartItem item : cart) {
//      if (item.getProductID() != null) {
//        totalAmount += item.getProductID().getPrice() * item.getQuantity();
//      }
//    }
//  }
  HttpSession sessionObj = request.getSession();
  List<cartShopping> cart = (List<cartShopping>) sessionObj.getAttribute("cart");
  User currentUser = (User) sessionObj.getAttribute("user");

  double totalAmount = 0;
  double taxes = 4.82; // Giả định thuế cố định
  double shippingFee = 0; // Miễn phí vận chuyển

  DecimalFormat df = new DecimalFormat("#,##0.00");

  if (cart != null) {
    for (cartShopping item : cart) {
      if (item.getProductID() != null) {
        totalAmount += item.getProductID().getPrice() * item.getQuanlity();
      }
    }
  }

  double finalAmount = totalAmount + taxes + shippingFee;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- icon -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="./JSPWeb/CSS/CheckOutCSS.css">
  <title>Payment</title>
</head>
<body>
<header class="header_home_menu">
  <img src="./JSPWeb/IMG/logo.jpg" alt="" width="50">
  <ul class="menu">
    <li>
      <a href="./HomePage.jsp">
        <span class="text_header"> TRANG CHỦ</span>
      </a>
    </li>
    <li>
      <a href="./Product.jsp">
        <span class="text_header"> SẢN PHẨM</span>
      </a>
    </li>
    <li>
      <a href="./ShowRoom.jsp">
        <span class="text_header"> SHOWROOM</span>
      </a>
    </li>
    <li>
      <a href="#">
        <span class="text_header"> LIÊN HỆ </span>
      </a>
    </li>
  </ul>

  <ul class="social_icon">
    <li>
      <i class="fa-solid fa-user" style="color: rgb(255, 255, 255);"></i>
      <ul class="dropdown">
        <li><i class="bi bi-person-circle"></i> <span>Ten</span></li>
        <li>
          <h5>SĐT: +84 xxx.xxx.xxx</h5>
        </li>
        <li><i class="bi bi-box-arrow-right"></i> <span><a href="./Login.jsp">Đăng Xuất</a></span></li>
      </ul>
    </li>
    <li>
      <i class="fa-solid fa-heart" style="color: #ffffff;"></i>
    </li>
    <li>
      <a href="#">
        <i class="fas fa-shopping-cart"></i>
      </a>
    </li>
  </ul>
</header>
<div class="checkout-container">

  <a href="./CartShopping.jsp" class="back-link">&lt; Back to merchant’s site</a>

  <div class="checkout-content">
    <div class="payment-methods">
      <h3>How would you like to pay?</h3>
      <div class="payment-options">
        <img src="./JSPWeb/IMG/visa.png" alt="Visa">
        <img src="./JSPWeb/IMG/mastercard.png" alt="MasterCard">
        <img src="./JSPWeb/IMG/paypal.png" alt="PayPal">
      </div>
    </div>

    <div class="order-summary">
      <h3>Order Summary</h3>
      <% if (cart == null || cart.isEmpty()) { %>
      <p style="color: red; font-weight: bold;">Your cart is empty.</p>
      <% } else { %>
      <ul>
        <% for (cartShopping item : cart) { %>
        <li>
          <span><%= item.getProductID().getName() %> (x<%= item.getQuanlity() %>)</span>
          <span>€<%= df.format(item.getProductID().getPrice() * item.getQuanlity()) %></span>
        </li>
        <% } %>
      </ul>

      <p>Shipping: <strong>Free</strong></p>
      <p>Taxes: <strong>€<%= df.format(taxes) %></strong></p>
      <p>Total: <strong>€<%= df.format(finalAmount) %></strong></p>

      <form action="PaymentServlet" method="post">
        <input type="hidden" name="totalAmount" value="<%= finalAmount %>">
        <button type="submit" class="btn-pay">Continue to secure payment</button>
      </form>
      <% } %>

      <a href="./CartShopping.jsp" class="btn-cancel">Back to cart</a>
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
</body>
</html>