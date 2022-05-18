package messaging;

import java.io.IOException;
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

import ThePackage.Mailer;

/**
 * Servlet implementation class messagestaff
 */
@WebServlet("/messagestaff")
public class messagestaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session=request.getSession();
		  String from =session.getAttribute("useremail").toString();  
		  String sebj=request.getParameter("thesub");
		  String member= request.getParameter("tostaffn");
		  String mess=request.getParameter("cont");
		   try 
		   {
		   }
		   catch()
		   {
			   
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
