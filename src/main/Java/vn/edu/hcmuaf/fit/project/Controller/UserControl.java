package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.User;
import vn.edu.hcmuaf.fit.project.Service.UserService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserControl", value = "/login")
public class UserControl extends HttpServlet { ;
    @SneakyThrows
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User userLogin = null;
        try {
            userLogin = userService.login(username,password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        if(userLogin == null){
            request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", userLogin);//0
            request.getRequestDispatcher("HomePage").forward(request, response);
        }

        //Signin
        User userSignin = null;
        String signusername = request.getParameter("Signusername");
        String signpassword = request.getParameter("Signpassword");
        String repass = request.getParameter("repass");
        if(!signpassword.equals(repass)){
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else {
            userSignin = userService.checkUser(username);
            if (userSignin == null) {
                userService.Signin(signusername, signpassword);
                request.getRequestDispatcher("HomePage.jsp").forward(request, response);
            }else {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            request.getRequestDispatcher("HomePage.jsp").forward(request, response);
        }


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
