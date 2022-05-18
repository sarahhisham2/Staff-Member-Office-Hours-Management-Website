<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
 
 <form action="messagestaff">
 Mail of staff Member: <input type="text" name="tostaffn" required="" >
  <br><br>
  Subject:<input type="text" name="thesub" required=""  >
  <br> <br>
  Content:<input type="text" name="content" required=""  >
  <br> <br>
 Password of Student mail: <input type="Password" name="cont" Value="Content">
 <br><br>
 <input type="submit" Value="Send">
  </form>
</body>
</html>