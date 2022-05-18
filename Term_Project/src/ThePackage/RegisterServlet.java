package ThePackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import org.json.simple.*;
//import javax.json.*;
//import org.json.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import net.tanesha.recaptcha.ReCaptchaImpl;
//import net.tanesha.recaptcha.ReCaptchaResponse;
import javax.servlet.http.HttpSession;

import com.chillyfacts.com.utils.VerifyRecaptcha;
  

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public String getSaltString() 
	  {
	       String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	       StringBuilder salt = new StringBuilder();
	       Random rnd = new Random();
	       while (salt.length() < 18) // length of the random string.
	       { 
	           int index = (int) (rnd.nextFloat() * SALTCHARS.length());
	           salt.append(SALTCHARS.charAt(index));
	       }
	       String saltStr = salt.toString();
	       return saltStr;

	   }
	  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();  
		 HttpSession session=request.getSession();
	    String iden="";
	  String fullname= request.getParameter("full");
	  String user_name =request.getParameter("uname");
	  String email=request.getParameter("email");
	  String contactnom=request.getParameter("contact");
	  String passw=getSaltString();
	  iden=request.getParameter("id");
	  
	  String SID;
	  String subject;
	  String Staffid;
	  
	  Registeration reg=new Registeration();
	  
	  reg.setFullName(fullname);
	  reg.setuserName(user_name);
	  reg.setEmail(email);
	  reg.setID(iden);
	  reg.setPassword(passw);
      reg.setusercontact(contactnom);
      
      session.setAttribute("userfull", fullname);
      session.setAttribute("userworkname", user_name);
 	 session.setAttribute("useremail", email);
 	 session.setAttribute("useriden", iden);
 	 session.setAttribute("usercontact", contactnom);

      
	  if(iden.equalsIgnoreCase("Student"))
	  {
		  SID=request.getParameter("student_id");
		  reg.setStudentUserid(SID);
		  session.setAttribute("studentid", SID);
	  }
	  else
	  {
		   subject=request.getParameter("which-sub");
		   Staffid=request.getParameter("which-staffid");
		   reg.setSubject(subject);
		   reg.setStaffUserid(Staffid); 
		  session.setAttribute("staffsubject", subject);
		  session.setAttribute("staffuserid_no", Staffid);
	  }
	   
	 session.setAttribute("userfull", fullname);
	 session.setAttribute("useremail", email);
	 session.setAttribute("useriden", iden);

	  registerData RD=new registerData(); 
	 // EmailClass emm=new EmailClass();
		//Mailer mailer=new Mailer();
	  	   
	  String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
	  System.out.println(gRecaptchaResponse);
		//boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
	  
		String sub="User Account Password" ;
		String msg="Dear "+fullname+" Your Account Password in Staff Office Hours is "+passw;
	    String registered=RD.UserRegister(reg);
	  	if(registered.equals("SUCCESS"))
	  	 {
	  	    out.println("<center><h2 style='color:green;'>Registeration done Successfully.</h2>");
	  	   //SNMPSetup.setMailServerProperties();
		  	   response.sendRedirect("Email.java");
			/*try {
			  	   SNMPSetup.setMailServerProperties();
			  	   CreateEmail.createEmailMessage(email, sub, msg);
				   SendEmail.sendEmail("staff.office.hours@gmail.com", "web55555");
				   System. out.print("check your mail to find your Password then log in");
			  	   response.sendRedirect("login.jsp");
			}catch (MessagingException e) {
				
				e.printStackTrace();
			}*/
	  		  
        //Mailer.send("staff.office.hours@gmail.com","web55555",email, sub, msg);
	  	       
	  	     //out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");    
	  	 }
	  	 else
	  	 {
	  	     out.print("Error in registeration is occured , please try again");
	  	     response.sendRedirect("register.jsp");
	  	 }
	  
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
