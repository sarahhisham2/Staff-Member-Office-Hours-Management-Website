<%-- 
    Document   : officeHours
    Created on : Jan 8, 2021, 5:05:35 PM
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
            //String name = request.getParameter("name");
            String url = "jdbc:mysql://127.0.0.1:3306/staff";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            //HttpSession session = request.getSession(true);
            String name = session.getAttribute("name").toString();
            
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT name ,status , t,day,location FROM StaffMembers , OfficeHours WHERE name='"+name+"' and MemberID = OfficeHours.StaffMemberID;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>Staff member </th> 
                <th>time</th>
                <th>day</th>
                <th>online/offline</th>
                <th>location</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("name")%></td>
                <td><%=RS.getString("t")%></td>
                <td><%=RS.getString("day")%></td>
                <td><%=RS.getString("status")%></td>
                <td><%=RS.getString("location")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <a href="index.html">Back to Home</a>
    </body>
</html>
