package ThePackage;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class Email {
	public static void main(String args[]) throws AddressException {
		//, MessagingException
		
		SNMPSetup.setMailServerProperties();
		try {
			
			CreateEmail.createEmailMessage("staff.office.hours@gmail.com", "TestSubject", "TestBody");
			SendEmail.sendEmail("senderwebtestmail@gmail.com", "web55555");
		} catch ( Exception e) {
			//MessagingException
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}