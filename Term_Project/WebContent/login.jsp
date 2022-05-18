<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
   <form  action="LoginServlet">
     <table>
      <tr>
     <label> <b>Email: </b> </label>
     </tr>
     <tr>
     <input type="text"  name="theMail"  id="mail"  required=""   placeholder="User-Email">
     </tr>
     <br><br>
     <tr>
     <label> <b>Password:</b> </label>
     </tr>
     <tr>
     <input type="password" name="thePass" id="password" required="" placeholder="User-Password">
     </tr>
     <br><br>
     </table>
     <input type="submit" name="log" id="log" value="LogIn">
     <a href="register.jsp">Sign Up</a>
  </form>
</body>
</html>