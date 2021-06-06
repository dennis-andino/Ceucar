package controlador;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author Dennis_Andino
 */
public class ClienteCorreo {

    private final Properties properties = new Properties();

    private String password;

    private Session session;

    private void init() {

        properties.put("mail.smtp.host", "mail.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.mail.sender", "denism.andino@gmail.com");
        properties.put("mail.smtp.user", "denism.andino");
        properties.put("mail.smtp.auth", "true");

        session = Session.getDefaultInstance(properties);
    }

    public void enviarCorreo() {

        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("denism.andino@gmail.com"));
            message.setSubject("Prueba");
            message.setText("Texto");
            Transport t = session.getTransport("smtp");
            t.connect((String) properties.get("mail.smtp.user"), "Incorrecta001");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (MessagingException me) {

        }

    }

}
