<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đổi mật khẩu</title>
  <link rel="stylesheet" href="./JSPWeb/CSS/Reset_Password_Style.css">
</head>
<body>
<div class="container">
  <form action="">
    <h1>Đổi mật khẩu</h1>
    <br>
    <p class="text-danger" style="text-align: center; color: #9b2805">
      <% if (request.getAttribute("mess") != null) { %>
      ${mess}
      <% } %>
    </p>
    <div class="form-group">
      <input name="currentPassword" type="password" id="Pass_Login" placeholder="Mật Khẩu Hiện Tại" required>
    </div>
    <div class="form-group">
      <input name="newPassword" type="password" id="Pass_Login" placeholder="Mật Khẩu Mới" required>
    </div>
    <div class="form-group">
      <input name="confirmPassword" type="password" id="Pass_Login" placeholder="Nhập Lại Mật Khẩu Mới" required>
    </div>
    <button type="submit" class="submit-btn"><a href="./HomePage.jsp">Đổi mật khẩu</a></button>
  </form>
</div>
<script src="../JS/Hide_Password.js"></script>
</body>
</html>