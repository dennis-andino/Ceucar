package controlador;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 * @author Dennis
 */
public class CeuMail {

    Properties propiedad;
    MimeMessage mail;
    Session sesion;
    String correoEnvia;
    String contrasena;
    String destinatario;
    String asunto;
    String mensaje;

    public CeuMail(String destinatario) {
        correoEnvia = "denism.andino@gmail.com";
        contrasena = "Incorrecta001";
        this.destinatario=destinatario;
        propiedad = new Properties();
        propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
        propiedad.setProperty("mail.smtp.starttls.enable", "true");
        propiedad.setProperty("mail.smtp.port", "587");
        propiedad.setProperty("mail.smtp.auth", "true");
        sesion = Session.getDefaultInstance(propiedad);
        mail = new MimeMessage(sesion);
    }

    public void enviarMensaje(String asunto,String mensaje) {
        this.asunto=asunto;
        this.mensaje=mensaje;
        try {
            mail.setFrom(new InternetAddress(correoEnvia));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            mail.setSubject(asunto);
            mail.setText(mensaje);
            Transport transporte = sesion.getTransport("smtp");
            transporte.connect(correoEnvia, contrasena);
            transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            transporte.close();
            JOptionPane.showMessageDialog(null, "Correo enviado");
        } catch (AddressException ex) {
            ex.printStackTrace();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }
}
