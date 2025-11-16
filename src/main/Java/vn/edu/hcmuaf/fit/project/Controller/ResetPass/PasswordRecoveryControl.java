package vn.edu.hcmuaf.fit.project.Controller.ResetPass;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.project.Service.UserService;

@WebServlet(name = "PasswordRecoveryControl", value = "/forgot_password")
public class PasswordRecoveryControl extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("fogotPass.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        try {
            switch(action) {
                case "sendOTP":
                    handleSendOTP(request, response, session);
                    break;
                case "verifyOTP":
                    handleVerifyOTP(request, response, session);
                    break;
                case "resetPassword":
                    handleResetPassword(request, response, session);
                    break;
                default:
                    out.print("Invalid action");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void handleSendOTP(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String email = request.getParameter("email");
        String otp = generateOTP(); // Generate OTP here
        PrintWriter out = response.getWriter();

        session.setAttribute("generatedOTP", otp);
        session.setAttribute("userEmail", email);

        out.print("Gửi mã OTP thành công");
    }

    private String generateOTP() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(999999));
    }

    private void handleVerifyOTP(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String userOTP = request.getParameter("otp");
        String generatedOTP = (String) session.getAttribute("generatedOTP");
        PrintWriter out = response.getWriter();

        if (userOTP.equals(generatedOTP)) {
            out.print("OTP verified");
        } else {
            out.print("Invalid OTP");
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ClassNotFoundException, SQLException {
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = (String) session.getAttribute("userEmail");
        PrintWriter out = response.getWriter();

        if (!newPassword.equals(confirmPassword)) {
            out.print("Mật khẩu không khớp");
            return;
        }

        boolean success = userService.emailPasswordRecovery(email, newPassword);

        if (!success) {
            out.print("Khôi phục mật khẩu thất bại");
            return;
        }

        out.print("Khôi phục mật khẩu thành công");

        session.removeAttribute("generateOTP");
        session.removeAttribute("userEmail");
    }

}
