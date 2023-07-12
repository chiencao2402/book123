package BookShop.config;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mailer {
    public static void send(String from, String to, String subject, String body) throws MessagingException {
        // Configure the SMTP server and authentication details
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "your_smtp_host");
        properties.put("mail.smtp.port", "your_smtp_port");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.trust", "your_smtp_host");

        // Create a Session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("your_email", "your_password");
            }
        });

        // Create a MimeMessage
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setContent(body, "text/html");

        // Send the message
        Transport.send(message);
    }
}
