package ThePackage;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class CreateEmail {
	static Session mailSession;
	static MimeMessage emailMessage;

	public static void createEmailMessage(String reciever, String emailSubject, String emailBody) throws AddressException, MessagingException {
		

		mailSession = Session.getDefaultInstance(SNMPSetup.emailProperties, null);
		emailMessage = new MimeMessage(mailSession);

		
		emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(reciever));
		

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html"); // for a HTML email
	}

}
