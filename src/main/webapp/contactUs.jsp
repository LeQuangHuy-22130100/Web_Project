<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 12/01/2025
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ</title>
    <link rel="stylesheet" href="JSPWeb/CSS/ContactUs.css">
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

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


<form method="POST" action="ContactServlet">
    <label for="name">Tên:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="email">Email:</label>
    <input type="text" id="email" name="email" required><br><br>

    <label for="message">Phản hồi:</label><br>
    <textarea id="message" name="message" rows="6" cols="40" required></textarea>

    <input type="submit" value="Gửi">
</form>

<div id="popup" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border-radius: 8px; text-align: center;">
    <p id="popupMessage"></p>
    <button onclick="closePopup()">Đóng</button>
</div>

<footer style="margin-top: 50px; text-align: center; font-size: 14px; color: gray;">
    <hr>
    <p>&copy; Sofa 2025. All ready reserved.</p>
</footer>

<script src="./JSPWeb/js/scoller_header.js"></script>
</body>
</html>
