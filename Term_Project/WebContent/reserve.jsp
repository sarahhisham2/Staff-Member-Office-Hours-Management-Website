<%-- 
    Document   : reserve
    Created on : Jan 14, 2021, 3:14:08 PM
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
            String name = request.getParameter("name");
            String url = "jdbc:mysql://127.0.0.1:3306/staff";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT name , ID ,status , t,day ,location FROM StaffMembers , OfficeHours WHERE name='"+name+"' and MemberID = OfficeHours.StaffMemberID;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>Staff member </th> 
                <th>ID</th>
                <th>time</th>
                <th>day</th>
                <th>online/offline</th>
                <th>location</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("name")%></td>
                <td><%=RS.getString("ID")%></td>
                <td><%=RS.getString("t")%></td>
                <td><%=RS.getString("day")%></td>
                <td><%=RS.getString("status")%></td>
                <td><%=RS.getString("location")%></td>
            </tr>
            <%}%>
        </table>
        <form action="reserving.jsp" method="post">
            <p>Enter the ID and date of the slot you want to reserve</p>
            <label>ID :<input type="text" name="ID"></label>
            <label>Date :<input type="text" name="d"></label>
            <input type="submit" value="reserve">
        </form>
        <br/>
        <a href="StudentsHomePage.jsp">Back to Home</a>
    </body>
</html>
