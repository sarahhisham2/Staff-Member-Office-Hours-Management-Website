<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Sign UP</title>
<style>
.table{
.reveal-if-active {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  font-size: 16px;
  transform: scale(0.8);
  transition: 0.5s;
  
  label {
    display: block;
    margin: 0 0 3px 0;
  }
  input[type=text] {
    width: 100%;
  }
  
  input[type="radio"]:checked ~ &,
  input[type="checkbox"]:checked ~ & {
    opacity: 1;
    max-height: 100px;
    padding: 10px 20px;
    transform: scale(1);
    overflow: visible;
  }
  
}
}
</style>
<script src="https://www.google.com/recaptcha/api.js">
var FormStuff = {
		  
		  init: function() {
		    this.applyConditionalRequired();
		    this.bindUIActions();
		  },
		  
		  bindUIActions: function() {
		    $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
		  },
		  
		  applyConditionalRequired: function() {
		    
		    $(".require-if-active").each(function() {
		      var el = $(this);
		      if ($(el.data("require-pair")).is(":checked")) {
		        el.prop("required", true);
		      } else {
		        el.prop("required", false);
		      }
		    });
</script> 
</head>
<body>

<%
		String message=(String)session.getAttribute("message");
		
		if(message!=null){
		%>
				<%=message %>
		<%	session.removeAttribute("message");
		}
		%>

<form method="post" action="RegisterServlet">
     <table>
     <tr>Full Name:</tr>
     <br>
     <tr> <input type="text" name="full" id="full"  placeholder="User full name"> </tr>
     <br><br>
     
     <tr>User Name:</tr>
     <br>
     <tr> <input type="text" name="uname" id="uname"   placeholder="User Name"> </tr>
     <br><br>
     
     <tr>User Email:</tr>
     <br>
     <tr> <input type="text" name="email" id="mail"   placeholder="User Email"> </tr>
     <br><br>
     
      <tr>Contact Number:</tr>
     <br>
     <tr> <input type="text" name="contact" id="contact"   placeholder="User contact number"> </tr>
     <br><br>
     
     <tr> ID :</tr><br>
     <tr>
       <div>
       <input type="radio" id="Choice1" name="id" value="Student">
       <label for="Choice1">Student</label>
       <br>
       <div class="reveal-if-active">
        <label for="student_id">What's the Student id?</label>
        <input type="text" id="student_id" name="student_id" class="require-if-active"  data-require-pair="#Choice1">
      </div>
       </div>
       <br>
       <div>
       <input type="radio" id="Choice2"  name="id"  value="Staff" >
       <label for="Choice2">Staff</label>
       <div class="reveal-if-active">
        <label for="which-sub">What's the subject?</label>
        <input type="text" id="which-sub" name="which-sub" class="require-if-active" data-require-pair="#Choice2" >
        
         <label for="which-staffid">What's the staff ID?</label>
        <input type="text" id="which-staffid" name="which-staffid" class="require-if-active" data-require-pair="#Choice2" >
      </div>
      </div>
     </tr>
     </table>
     
     <%
     // ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LeIASgaAAAAAL0p3zSo9i84tR9eWSng3eof6TCS", "6LeIASgaAAAAADfZmKMRoVwJ0uBxelL3ODjBVB38", false);
      //out.print(c.createRecaptchaHtml(null, null));
   %>
     <div class="g-recaptcha"   data-sitekey="6Lf47CgaAAAAAMuDQPa9NVtWoCRb9t9iFakOvEiN " ></div>
     <br>
     <input type="submit" name="Sign" id="sign" value="Sign Up" >
</form>
</body>
</html>