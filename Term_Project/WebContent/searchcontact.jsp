<%-- 
    Document   : searchcontact
    Created on : Jan 12, 2021, 2:00:25 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Enter the name of the student member that you want his contact</p></br>
        <form action="showstudentcontact.jsp" method="POST">
        <input type="text" name="studentname">
        <input type="submit" value="search" >
        </form>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
