package ThePackage;

import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;

public class SendEmail 
{

	public static void sendEmail(String fromUser, String fromUserEmailPassword) throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";		
		
		Transport transport = CreateEmail.mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(CreateEmail.emailMessage, CreateEmail.emailMessage.getAllRecipients());
		transport.close();
		System.out.println("please check your Email to see sent mail.");
	}
	
}
