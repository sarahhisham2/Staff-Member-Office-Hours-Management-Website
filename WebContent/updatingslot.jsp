<%-- 
    Document   : managing
    Created on : Jan 12, 2021, 6:07:49 PM
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
       <%
           Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:127.0.0.1/staff";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet rs = null;
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                String StaffMemberID = session.getAttribute("member_id").toString();
                String ID = session.getAttribute("ID").toString();               
                 String t = request.getParameter("t");
                  String day = request.getParameter("day");
                String status = request.getParameter("status");
                String location = request.getParameter("location");

                String line = "INSERT INTO OfficeHours VALUES("
                        + "'" + ID + "',"
                        + "'" + t + "','"+day+"',"
                        + "'" + status + "',"
                        + "'" + location + "')";
                int Rows = Stmt.executeUpdate(line);
                Stmt.close();
                Con.close();

       %>
        <p>your slot is added successfully</p>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
