package vn.edu.hcmuaf.fit.project.Service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
    private static final String USERNAME = "f2a5e34bfd350f";
    private static final String PASSWORD = "c4b355ca541d61";

    public static void sendOTP(String recipientEmail, String otp) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.mailtrap.io");
        properties.put("mail.smtp.port", "2525");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress("tongduykien6a1@gmail.com"));
            mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            mess.setSubject("Mã OTP khôi phục mật khẩu");
            mess.setText("Mã OTP của bạn là: " + otp);
            Transport.send(mess);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
