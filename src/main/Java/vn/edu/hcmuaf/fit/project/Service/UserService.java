package vn.edu.hcmuaf.fit.project.Service;

import vn.edu.hcmuaf.fit.project.DAO.dao.userDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.User;
import vn.edu.hcmuaf.fit.project.OTP.OTPGenerator;

import java.sql.SQLException;

public class UserService {
    static userDAO userDao = new userDAO();

    public User login(String username, String password) throws SQLException, ClassNotFoundException {
        return userDao.login(username,password);
    }

    public void Signin(String username, String password) throws SQLException, ClassNotFoundException {
        userDao.signin(username,password);
    }

    public User checkUser(String username) throws SQLException, ClassNotFoundException {
        return userDao.checkUser(username);
    }

    public User checkPower(String isAdmin) throws SQLException, ClassNotFoundException {
        return userDao.checkPower(isAdmin);
    }

    static userDAO userDAO = new userDAO();
    static EmailService emailService  = new EmailService();

    public User resetPassword(String username, String currentPassword, String newPassword) throws SQLException, ClassNotFoundException {
        return userDAO.resetPassword(username, currentPassword, newPassword);
    }

    public boolean emailPasswordRecovery(String email, String newPassword) throws SQLException, ClassNotFoundException {
        return userDAO.emailPasswordRecovery(email, newPassword);
    }

    public String generateAndSendOTP(String email) throws SQLException, ClassNotFoundException {
        User user = userDAO.findByEmail(email);
        if (user == null) {
            return null;
        }

        String otp = OTPGenerator.generateOTP();
        emailService.sendOTP(email, otp);
        return otp;
    }

}
