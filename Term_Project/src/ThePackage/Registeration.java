package ThePackage;

import java.util.Random;

public class Registeration 
{
	private String fullName;
	private String UserName;
	private String email;
	private String identity;
	private String Password;
	private String thecontact;
	private String subject;
	private String staffuserid;
	private String studentuserid;

	 
	 public void setFullName(String fullName) 
	 {
		 this.fullName = fullName;
	 } 
	 
	 public void setuserName(String un) 
	 {
		 this.UserName=un;
	 } 
	 
	 public String getuserName() 
	 {
		 return UserName;
	 } 
	 
	 public void setusercontact(String cont) 
	 {
		 this.thecontact=cont;
	 } 
	 
	 public String getusercontact() 
	 {
		 return thecontact;
	 } 
	 
	 public void setEmail(String email) 
	 {
		 this.email = email;
	 }
	 
    public String getFullName() 
    {
		 return fullName;
    }
    
   public String getEmail() 
   {
	   return email;
   }
   
   public void setID(String id)
   {
	   this.identity=id;
   }
   
   public void setSubject(String sub)
   {
	   this.subject=sub;
   }
   
   public void setStaffUserid(String si)
   {
	   this.staffuserid=si;
   }
   
   public void setStudentUserid(String si)
   {
	   this.studentuserid=si;
   }
   
   
   public String getID()
   {
	   return identity;
   }
    
  public void setPassword(String passw)
  {
	  this.Password= passw;
  }
  
  public void setContactnom(String cont)
  {
	  this.thecontact=cont;
  }
  
  public String getPassword()
  {
	  return Password;
  }
  
  public String getSubject()
  {
	   return subject;
  }
  
  public String getStaffUserid()
  {
	   return staffuserid;
  }
  
  public String getetStudentUserid()
  {
	   return studentuserid;
  }

}
