<%-- 
    Document   : reserving
    Created on : Jan 14, 2021, 3:21:52 PM
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
                String ID = request.getParameter("ID");
                String StudentID = session.getAttribute("member_id").toString();//7asab el login
                rs = Stmt.executeQuery("SELECT StaffMemberID FROM OfficHours WHERE ID = '"+ID+" ';");
                String StaffMemberID = rs.getString("StaffMemberID");
                String officeHoursID;
                officeHoursID = ID;
                String d = request.getParameter("d");
                rs = Stmt.executeQuery("SELECT t FROM OfficeHours WHERE ID='"+ID+"';");
                String t = request.getParameter("time");
                String line = "INSERT INTO rsesrvation VALUES("
                        + "'" + StudentID + "',"
                        + "'" + officeHoursID + "',"
                        + "'" + d + "',"
                        + "'" + t + "'"
                        +"'"+ StaffMemberID+"')";
                int Rows = Stmt.executeUpdate(line);
                Stmt.close();
                Con.close();

       %>
        <p>your appointment is reserved  successfully</p>
        <a href="StudentsHomePage.jsp">Back to Home</a>
    </body>
</html>
