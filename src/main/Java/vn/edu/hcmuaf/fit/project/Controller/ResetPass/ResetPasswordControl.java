package vn.edu.hcmuaf.fit.project.Controller.ResetPass;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.project.Service.UserService;

import vn.edu.hcmuaf.fit.project.DAO.model.User;
import vn.edu.hcmuaf.fit.project.Service.UserService;

/**
 * Servlet implementation class ResetPasswordControl
 */
@WebServlet(name = "ResetPasswordControl", value = "/reset_password")
public class ResetPasswordControl extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getSession().getAttribute("username").toString();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("mess", "Mật khẩu mới không khớp");
                request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
                return;
            }

            User user = userService.resetPassword(username, currentPassword, newPassword);

            if (user != null) {
                response.sendRedirect("HomePage.jsp");
            } else {
                request.setAttribute("mess", "Mật khẩu hiện tại không chính xác");
                request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("mess", "Có lỗi xảy ra");
            request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
        }
    }

}