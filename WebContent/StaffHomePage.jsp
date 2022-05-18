<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
  <%
    String staffname=session.getAttribute("stafffullname").toString();
    out.print("Welcome "+ staffname+" in Staff home page");
  %>
  <h1>welcome</h1>
         <form action="searchcontact.jsp" method="POST">
             <input type="submit" value="Search for a student and view his/her contact details"></br>
         </form>
        <form action="manage.jsp" method="POST">
            <input type="submit" value="Manage office hours slots "></br>
        </form>
        <form action="viewreservation.jsp" method="POST">
            <input type="submit" value="view reservations of a specific slot">
        </form>
        <form action="cancelslot.jsp" method="POST">
            <input type="submit" value="cancel reservation">
        </form>
        <form action="viewhistory.jsp" method="POST">
            <input type="submit" value="View history of reservations">
        </form>
        <form action="updateprofile.jsp" method="POST">
            <input type="submit" value="Update profile">
        </form>
  <a href="login.jsp">log out</a>
</body>
</html>