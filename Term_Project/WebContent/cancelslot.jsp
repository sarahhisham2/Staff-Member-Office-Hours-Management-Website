<%-- 
    Document   : cancelslot
    Created on : Jan 15, 2021, 12:23:37 AM
    Author     : hp
--%>

<%-- 
    Document   : showstudentcontact
    Created on : Jan 12, 2021, 2:03:42 PM
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
            String name = request.getParameter("studentname");
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
                String MemberID = session.getAttribute("member_id").toString();//7asab el login
                RS = Stmt.executeQuery("SELECT ID,t,day,status,location FROM OfficeHours WHERE StaffMemberID='"+MemberID+"';");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>ID </th> 
                <th>time</th>
                <th>day</th>
                <th>online/offline</th>
                <th>location</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("ID")%></td>
                <td><%=RS.getString("t")%></td>
                <td><%=RS.getString("day")%></td>
                <td><%=RS.getString("status")%></td>
                <td><%=RS.getString("location")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <form action="cancel.jsp" method="POST">
        <label>Enter the date you want to cancel its reservation</label>
        <label>Date (YYYY-MM-DD):<input type="text" name="d"></label>
        <label>ID :<input type="text" name="ID"></label>
        <br/>
        <input type="submit" value="cancel">
        </form>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
