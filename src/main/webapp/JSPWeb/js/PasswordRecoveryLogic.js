/**
 *
 */

document.addEventListener("DOMContentLoaded", function () {
    // Lấy các form
    const forms = document.querySelectorAll("#passwordRecoveryForm, #OTPForm, #resetPasswordForm");
    const passwordRecoveryForm = document.getElementById("passwordRecoveryForm");
    const OTPForm = document.getElementById("OTPForm");
    const resetPasswordForm = document.getElementById("resetPasswordForm");

    // Lấy các nút
    const sendOTPBtn = document.getElementById("sendOTPBtn");
    const verifyOTPBtn = document.getElementById("verifyOTPBtn");
    const resetPasswordBtn = document.getElementById("resetPasswordBtn");

    // Hiển thị form đầu tiên, ẩn các form còn lại
    forms.forEach((form, index) => {
        if (index === 0) {
            form.classList.add("active");
        } else {
            form.classList.remove("active");
        }
    });

    // Chuyển từ form email -> form OTP
    sendOTPBtn.addEventListener("click", function () {
        const emailInput = document.querySelector("input[name='email']");
        const email = emailInput.value.trim();

        if (!validateEmail(email)) {
            alert("Vui lòng nhập email hợp lệ.");
            return;
        }

        passwordRecoveryForm.classList.remove("active");
        OTPForm.classList.add("active");
    });

    // Chuyển từ form OTP -> form đặt lại mật khẩu
    verifyOTPBtn.addEventListener("click", function () {
        const otpInput = document.querySelector("input[name='otp']");
        const otp = otpInput.value.trim();

        if (otp.length !== 6) {
            alert("OTP phải có 6 ký tự.");
            return;
        }

        OTPForm.classList.remove("active");
        resetPasswordForm.classList.add("active");
    });

    // Đặt lại mật khẩu
    resetPasswordBtn.addEventListener("click", function () {
        alert("Mật khẩu đã được đặt lại thành công!");
        // Reset về form đầu tiên
        forms.forEach((form, index) => {
            form.classList.remove("active");
            if (index === 0) {
                form.classList.add("active");
            }
        });
    });

    // Hàm kiểm tra email hợp lệ
    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
});