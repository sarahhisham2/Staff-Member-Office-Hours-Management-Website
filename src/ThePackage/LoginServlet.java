package ThePackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String usermail=request.getParameter("theMail");
		String userpass=request.getParameter("thePass");
		HttpSession session=request.getSession();
		boolean flag1=false;
		boolean flag2=false;


		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
			Statement stt=conn.createStatement();
			ResultSet result1=stt.executeQuery("Select * from Students  where email ='"+usermail+"' AND password ='"+userpass+"'");
			ResultSet result2;

		    
				if(result1.next())
				{
					session.setAttribute("useremail", usermail);
					session.setAttribute("userpassword",userpass);
					session.setAttribute("member_id", result1.getString(1));
					session.setAttribute("studusename", result1.getString(2));
					session.setAttribute("studcontact", result1.getString(5));
					session.setAttribute("studfullname", result1.getString(6));
					flag1=true;
					response.sendRedirect("StudentsHomePage.jsp");
				}
				else if(result1.next()==false)
				{
					stt=null;
					 result2=stt.executeQuery("Select * from StaffMembers where email ='"+usermail+"' AND password ='"+userpass+"'");
					 if(result2.next())
					 {
					   session.setAttribute("onestaffemail", usermail);
					   session.setAttribute("onestaffpassword",userpass);
					   session.setAttribute("member_id", result2.getString(1));
					   session.setAttribute("staffusername", result2.getString(2));
					   session.setAttribute("staffcontact", result2.getString(5));
					   session.setAttribute("one subject", result2.getString(6));
					   session.setAttribute("stafffullname", result2.getString(7));
					   
					   flag2=true;
					   
					   response.sendRedirect("StaffHomePage.jsp");	
					 }
				}
							
			if(flag1==false && flag2==false)
			{
				out.print("Invalid user , ID or Password are wrong");
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
