
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sofa Shop</title>
    <link rel="stylesheet" href="JSPWeb/CSS/Product.css">
    <link rel="stylesheet" href="JSPWeb/CSS/PageActive.css">
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="./JSPWeb/js/scoller_header.js" ></script>
<%--    <script src="./JSPWeb/dropdown.js" ></script>--%>
</head>

<body>
    <div class="img_Background">
    <img src="./JSPWeb/IMG/headerimage.jpg" alt="Sofa Shop Header">
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
            <a href="#">
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
        <%--logout--%>
        <c:if test="${sessionScope.acc != null}">
            <li>
                <i class="fa-solid fa-user" style="color: rgb(255, 255, 255);"></i>
                <ul class="dropdown">
                    <li><i class="bi bi-person-circle"></i><span>${sessionScope.acc.username}</span></li>
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li>
                            <h5>Hello ${sessionScope.acc.username}</h5>
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

        <%--login--%>
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

    <main class="container">
        <div class="filters">
            <ul>
                <li>
                    <a href="#"> Bộ Sản Phẩm</a>
                    <ul class="dropdown" >
                        <c:forEach items="${CateProduct}" var="cp">
                            <li><a href="Categories?cateID=${cp.categoryId}">${cp.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                    <a href="#"> Kích Thước</a>
                    <ul class="dropdown">
                        <c:forEach items="${SizeProduct}" var="sp">
                            <li><a href="Sizes?SizeRange=${sp.sizeID}">${sp.size}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                    <a href="#"> Khoảng Giá</a>
                    <ul class="dropdown">
                        <c:forEach items="${PriceProduct}" var="pp">
<%--                            <li><a href="PriceRange?minPrice=${pp.priceMin}&maxPrice=${pp.priceMax}">$${pp.priceMin} - $${pp.priceMax}</a></li>--%>
                            <li><a href="PriceRange?priceID=${pp.priceID}">$${pp.priceMin} - $${pp.priceMax}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <div class="search-bar">
                    <form action="FindName" method="get">
                        <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." required>
                        <button type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="sort-options">
                    <form action="SortProduct" method="get">
                        <label for="sortOption">Sắp xếp theo:</label>
                        <select name="sortOption" id="sortOption">
                            <option value="price_asc">Giá tăng dần</option>
                            <option value="price_desc">Giá giảm dần</option>
                            <option value="">Không sắp xếp</option> <!-- Lựa chọn không sắp xếp -->
                        </select>
                        <button type="submit">Sắp xếp</button>
                    </form>
                </div>
            </ul>
        </div>
        <div id="products" class="products">
            <!-- Sản phẩm -->
                <c:forEach items="${ProductControl}" var="p">
                    <div class="product">
                        <img src="${p.image}">
                        <h2>${p.name}</h2>
                        <p class="price">$${p.price}</p>
                        <p class="description">${p.description}</p>
                        <div class="product-buttons">
                            <form action="CartShopping" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${p.id}">
                                <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
                            </form>
                            <button class="view-details">
                                <a href="ProductDetail?ProductID=${p.id}">Chi tiết</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
        </div>
<%--        <div class="pagination">--%>
<%--            <c:forEach var="i" begin="1" end="${endPage}">--%>
<%--                <a href="Products?pageIndex=${i}"--%>
<%--                   class="${i == stayPage ? 'active' : ''}">--%>
<%--                        ${i}--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${endPage}">
                <a href="
                    <c:choose>
                        <c:when test="${not empty cateID}">
                            Categories?pageIndex=${i}&cateID=${cateID}
                        </c:when>
                        <c:when test="${not empty SizeRange}">
                            Sizes?pageIndex=${i}&SizeRange=${SizeRange}
                        </c:when>
                        <c:when test="${not empty PriceRangeID}">
                            PriceRange?pageIndex=${i}&PriceRangeID=${PriceRangeID}
                        </c:when>
                        <c:otherwise>
                            Products?pageIndex=${i}
                        </c:otherwise>
                    </c:choose>"
                           class="${i == stayPage ? 'active' : ''}">
                                ${i}
                        </a>
            </c:forEach>
        </div>

    </main>
<footer>
    <p>&copy; 2024 Sofa Shop. All rights reserved.</p>
</footer>
<%--<script src="./JSPWeb/js/scoller_header.js"></script>--%>
<%--<script src="./JSPWeb/dropdown.js"></script>--%>
</body>
</html>