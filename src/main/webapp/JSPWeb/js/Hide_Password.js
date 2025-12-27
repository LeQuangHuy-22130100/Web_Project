
const passwordLogin = (inputPass, InputIcon) => {
    const input = document.getElementById(inputPass),
        iconEye = document.getElementById(InputIcon)
    iconEye.addEventListener('click', () => {
        if (input.type === 'password') {
            input.type = 'text'; // Chuyển thành dạng hiển thị
            iconEye.classList.remove('ri-eye-off-fill');
            iconEye.classList.add('ri-eye-fill'); // Đổi biểu tượng
        } else {
            input.type = 'password'; // Chuyển thành dạng ẩn
            iconEye.classList.remove('ri-eye-fill');
            iconEye.classList.add('ri-eye-off-fill'); // Trở về biểu tượng ban đầu
        }
    });
}
// hide_Show Password login form
passwordLogin('Pass_Login', "Icon_Login")

// const passwordRegister = (inputPass, InputIcon) => {
//     const input = document.getElementById(inputPass),
//         iconEye = document.getElementById(InputIcon)
//     iconEye.addEventListener('click', () => {
//         if (input.type === 'password') {
//             input.type = 'text'; // Chuyển thành dạng hiển thị
//             iconEye.classList.remove('ri-eye-off-fill');
//             iconEye.classList.add('ri-eye-fill'); // Đổi biểu tượng
//         } else {
//             input.type = 'password'; // Chuyển thành dạng ẩn
//             iconEye.classList.remove('ri-eye-fill');
//             iconEye.classList.add('ri-eye-off-fill'); // Trở về biểu tượng ban đầu
//         }
//     });
// }
// hide_Show Password Register form
passwordLogin('Pass_Register', "Icon_Register")
passwordLogin('RePass_Register', "ReIcon_Register")

// Giao Thoa
const LoginAccess = document.getElementById('LoginAccess'),
      switchToRegister = document.getElementById('switchToRegister'),
      switchToLogin = document.getElementById('switchToLogin');

// Chuyển sang biểu mẫu đăng ký
switchToRegister.addEventListener('click', (e) => {
    e.preventDefault(); // Ngăn chặn việc tải lại trang
    LoginAccess.classList.add('active');
});

// Chuyển sang biểu mẫu đăng nhập
switchToLogin.addEventListener('click', (e) => {
    e.preventDefault(); // Ngăn chặn việc tải lại trang
    LoginAccess.classList.remove('active');
});



