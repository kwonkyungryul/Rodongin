package shop.mtcoding.rodongin.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class SendMail {

    @Autowired
    private JavaMailSender emailSender;

    private final String from = "kkr0787@gmail.com";

    
    public void sendMail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage(); 
        message.setFrom(from);
        message.setTo(to); 
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);
    }
}