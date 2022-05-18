package ThePackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class registerData {
	public String UserRegister(Registeration r)
	{
		String fullName=r.getFullName();
		String themail=r.getEmail();
		String identity=r.getID();
		String password=r.getPassword();
		String username=r.getuserName();
		String ucont=r.getusercontact();
		
		String StudID="";
		String staff_sub="";
		String staffuid="";
		String realtable="";
		String INSERT_USERS_SQL="";
		Connection con;
		PreparedStatement state ;
		if(identity=="Student")
		{
			realtable="Students";
			StudID=r.getetStudentUserid();
			INSERT_USERS_SQL = "INSERT INTO "+ realtable + " (MemberID , UserName ,password, email, contact , name)  VALUES ('"+StudID+"', '"+
					username+"' , '"+password+"' , '"+themail+"' , '"+ucont+"' , '"+fullName+"' )" ;
 
		}
		
		else
		{
			realtable="StaffMembers";
			 staffuid=r.getStaffUserid();
			 staff_sub=r.getSubject();
			 
			 INSERT_USERS_SQL = "INSERT INTO "+ realtable + " (MemberID , UserName ,password, email, contact ,subject ,name)  VALUES ('"+staffuid+"' , '"+
						username+"' , '"+password+"' , '"+themail+"' , '"+ucont+"' , '"+staff_sub+"' , '"+fullName+"' )" ;
	 
		}
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
			//Statement stt=conn.createStatement();
			
			//String query = "insert into  users (FullName , Email ,Pass, ID) values ('"+fullName+"'"+", '"+themail+"' , '"+password+"' , '"+id+"');\r\n";
					//Insert user details into the table 'USERS'
			//state=con.prepareStatement(query);
			state=con.prepareStatement(INSERT_USERS_SQL);
			/*state.setString(1,fullName);
			state.setString(2, themail);
			state.setString(3,password);
            state.setString(4, identity);*/
			int x=state.executeUpdate(INSERT_USERS_SQL);
			if(x!=0)
			{
				return "SUCCESS";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Oops.. Something went wrong in registeration....!";
	}

}
