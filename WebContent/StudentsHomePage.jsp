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
    String StudentName=session.getAttribute("fullnameofuser").toString();
    out.print("Welcome "+ StudentName+" in students home page");
  %>
  <form  action="subjectStaff.jsp" method="POST">
             <input type="submit" value="Find staff of each subject and message them"></br>
         </form>
         <form action="contactStaff.html" method="POST">
             <input type="submit" value="Find the contact for a specific staff member"></br>
         </form>
        <form action="officeHours.jsp" method="POST">
            <input type="submit" value="View the office hours schedule for the staff member"></br>
        </form>
         <form action="reservation.jsp" method="POST">
            <input type="submit" value="Reserve an appointment with staff member at specific slot and date"></br>
        </form>
         <form action="cancel.jsp" method="POST">
            <input type="submit" value="Cancel meeting reservation"></br>
        </form>
  <form action="updateprofiles.jsp" method="POST">
      <input type="submit" value="Update profile">
  </form>
  <a href="login.jsp">log out</a>
</body>
</html>