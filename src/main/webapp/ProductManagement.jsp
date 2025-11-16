<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 19/01/2025
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./JSPWeb/CSS/ProductManagement.css">
  <title>Management System</title>
</head>
<body>
<header>
  <h1>Management System</h1>
</header>
<div class="main">
  <div class="sidebar">
    <h2>Navigation</h2>
    <ul>
      <li><a href="ProductManagement.html">Quản lý sản phẩm</a></li>
      <li><a href="./ClientManagement.html">Quản lý khách hàng</a></li>
      <li><a href="#information-management">Thông tin quản lý</a></li>
    </ul>
  </div>
  <div class="content">
    <section id="product-management">
      <h2>Quản lý sản phẩm</h2>
      <button class="btn-add" onclick="showAddProductForm()">Thêm sản phẩm mới</button>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Image</th>
          <th>Name</th>
          <th>Category</th>
          <th>Size</th>
          <th>Stock</th>
          <th>description</th>
          <th>Material</th>
          <th>Price</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productManagement}" var="pm">
          <tr>
            <td>${pm.id}</td>
            <td><img src="${pm.image}" alt="Product 1" width="50"></td>
            <td>${pm.name}</td>
            <td>${pm.categoryID.name}</td>
            <td>${pm.sizeID.size}</td>
            <td>${pm.stock}</td>
            <td>${pm.description}</td>
            <td>${pm.matarial}</td>
            <td>${pm.price}</td>
            <td><button class="btn-delete"><a href="delete?id=${pm.id}">Delete</a></button></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

      <div id="overlay"></div>
      <div id="add-product-form">
        <h3>Thêm sản phẩm mới</h3>
        <form action="addProduct" method="post">
          <div class="form-group">
            <label for="product-id">ID:</label>
            <input type="text" id="product-id" name="id">
          </div>

          <div class="form-group">
            <label for="product-img">Image:</label>
            <input type="text" id="product-img" placeholder="Image URL" name="img">
          </div>

          <div class="form-group">
            <label for="product-name">Name:</label>
            <input type="text" id="product-name" name="name">
          </div>

          <div class="form-group">
            <label for="product-Category">Category:</label>
            <select name="category" id="product-Category">
              <c:forEach var="cp" items="${CateProduct}">
                <option value="${cp.categoryId}">${cp.name}</option>
              </c:forEach>
            </select>
          </div>

          <div class="form-group">
            <label for="product-size">Size:</label>
            <select name="size" id="product-size">
              <c:forEach var="sp" items="${SizeProduct}">
                <option value="${sp.sizeID}">${sp.size}</option>
              </c:forEach>
            </select>
          </div>

          <div class="form-group">
            <label for="product-stock">Stock:</label>
            <input type="number" id="product-stock" name="stock">
          </div>

          <div class="form-group">
            <label for="product-description">Description:</label>
            <input type="text" id="product-description" name="description">
          </div>

          <div class="form-group">
            <label for="product-Material">Material:</label>
            <input type="text" id="product-Material" name="material">
          </div>

          <div class="form-group">
            <label for="product-price">Price:</label>
            <input type="text" id="product-price" name="price">
          </div>

          <button type="submit" class="btn-add">Thêm sản phẩm</button>
        </form>
<%--        <div class="form-group">--%>
<%--          <label for="product-id">ID:</label>--%>
<%--          <input type="text" id="product-id" name="id">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-img">Image:</label>--%>
<%--          <input type="text" id="product-img" placeholder="Image URL" name="img">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-name">Name:</label>--%>
<%--          <input type="text" id="product-name" name="name">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-Category">Category:</label>--%>
<%--          <select name="category" id="product-Category">--%>
<%--            <c:forEach var="cp" items="${CateProduct}">--%>
<%--              <option value="${cp.categoryId}">${cp.name}</option>--%>
<%--            </c:forEach>--%>
<%--          </select>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-size">Size:</label>--%>
<%--          <select name="size" id="product-size">--%>
<%--            <c:forEach var="sp" items="${SizeProduct}">--%>
<%--              <option value="${sp.sizeID}">${sp.size}</option>--%>
<%--            </c:forEach>--%>
<%--          </select>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-stock">Stock:</label>--%>
<%--          <input type="number" id="product-stock" name="stock">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-description">description:</label>--%>
<%--          <input type="text" id="product-description" name="description">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-Material">Material:</label>--%>
<%--          <input type="text" id="product-Material" name="material">--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--          <label for="product-price">Price:</label>--%>
<%--          <input type="text" id="product-price" name="price">--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        <input type="submit" class="btn-add" value="addProduct" onclick="addProduct()">&ndash;%&gt;--%>
<%--        <button type="submit" class="btn-add" value="addProduct" onclick="addProduct()">Thêm sản phẩm </button>--%>

      </div>
    </section>

    <section id="information-management">
      <h2>Information Management</h2>
      <p>Here you can manage additional information for your system. This section can be customized as needed.</p>
    </section>
  </div>
</div>

<script>
  function showAddProductForm() {
    const overlay = document.getElementById('overlay');
    const form = document.getElementById('add-product-form');
    overlay.style.display = 'block';
    form.style.display = 'block';
    setTimeout(() => {
      form.classList.add('show');
    }, 10);
  }

  function hideAddProductForm() {
    const overlay = document.getElementById('overlay');
    const form = document.getElementById('add-product-form');
    form.classList.remove('show');
    setTimeout(() => {
      form.style.display = 'none';
      overlay.style.display = 'none';
    }, 300);
  }

  // Khi click vào overlay sẽ ẩn bảng
  document.getElementById('overlay').addEventListener('click', hideAddProductForm);

</script>
</body>
</html>

