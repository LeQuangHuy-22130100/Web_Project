<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="./JSPWeb/CSS/Forgot_Password_Style.css">
</head>
<body>
<!-- Form nhập email -->
<div class="email-container active">
    <form id="emailForm">
        <h1>Bạn quên mật khẩu?</h1>
        <div class="email-form-group">
            <input name="email" type="email" placeholder="Email" required>
        </div>
        <button type="submit" class="btn" id="sendOTPBtn">Gửi</button>
    </form>
    <div id="notification1" class="notification"></div>
</div>

<!-- Form nhập OTP -->
<div class="OTP-container">
    <form id="OTPForm">
        <h1>Mã OTP</h1>
        <div class="OTP-form-group">
            <input name="otp" type="text" placeholder="OTP" maxlength="6" required>
        </div>
        <button type="submit" class="btn" id="verifyOTPBtn">Xác nhận</button>
    </form>
    <div id="notification2" class="notification"></div>
</div>

<!-- Form đặt lại mậ khẩu -->
<div class="recovery-container">
    <form id="passwordRecoveryForm">
        <h1>Khôi phục mật khẩu</h1>
        <div class="recovery-form-group">
            <input name="newPassword" type="password" placeholder="Mật Khẩu Mới" required>
        </div>
        <div class="recovery-form-group">
            <input name="confirmPassword" type="password" placeholder="Nhập Lại Mật Khẩu Mới" required>
        </div>
        <button type="submit" class="btn" id="resetPasswordBtn">Đặt lại</button>
    </form>
    <div id="notification" class="notification"></div>
</div>
<script type="./JS/PasswordRecoveryLogic.js"></script>
</body>
</html>