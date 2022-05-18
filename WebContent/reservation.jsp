<%-- 
    Document   : reservation
    Created on : Jan 14, 2021, 3:10:39 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Enter the name of the staff member that you want to reserve with</p></br>
        <form action="reserve.jsp" method="POST">
        <input type="text" name="name">
        <input type="submit" value="search" >
        </form>
        <a href="StudentsHomePage.jsp">Back to Home</a>
    </body>
</html>
