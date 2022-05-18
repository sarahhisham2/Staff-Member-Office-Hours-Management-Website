package ThePackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.*;
import java.sql.*;
import java.util.*;
/**
 * Servlet implementation class notification_onTime
 */
@WebServlet("/notification_onTime")
public class notification_onTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LocalDate myObj = LocalDate.now();
		
	    PrintWriter out = response.getWriter(); 
		HttpSession session=request.getSession();
        String staffid=""; 
        String meetingtime="";
		 // Create a date object
		 //out.print(myObj);
		 String url = "jdbc:mysql://localhost:3306/staff";
		 String user = "sun";
		 String password = "2020100";
		 String Line;
		 Connection con = null;
		 Statement stmt = null;
		 ResultSet RS = null;
		 String logged_userid=session.getAttribute("member_id").toString();
		 String logged_mail=session.getAttribute("useremail").toString();
   
		 Mailer m=new Mailer();
		   try
			{
				Class.forName("com.mysql.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
				 stmt = con.createStatement();
		         //String Query="select * from staff where d = '"+logged_studentid+"'";
		          RS=stmt.executeQuery("select * from staff where d = '"+logged_userid+"'");
		          
		          while(RS.next());
		          {
		        	  staffid=RS.getString("StaffMemberID");
		        	  meetingtime=RS.getString("t");
		        	  String Sub="notification to remember meeting";
			          String msg="You have meeting today at  "+ meetingtime;
			          m.send("staff.office.hours@gmail.com" , "web55555" , logged_mail , Sub , msg);
		          }
			}
		 catch(Exception e){
				out.print(e);
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
