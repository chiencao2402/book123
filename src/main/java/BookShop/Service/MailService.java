package BookShop.Service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import BookShop.bean.MailInfo;



@Service
public class MailService {
    @Autowired
    private JavaMailSender mailSender;

    public void send(MailInfo mail) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom(mail.getFrom());
        helper.setTo(mail.getTo());
        helper.setSubject(mail.getSubject());
        helper.setText(mail.getBody(), true);
        helper.setReplyTo(mail.getFrom());

        if (mail.getCc() != null) {
            helper.setCc(mail.getCc());
        }
        if (mail.getBcc() != null) {
            helper.setBcc(mail.getBcc());
        }
        if (mail.getFiles() != null) {
            String[] paths = mail.getFiles().split(";");
            for (String path : paths) {
                File file = new File(path);
                helper.addAttachment(file.getName(), file);
            }
        }
        mailSender.send(message);
    }
}
