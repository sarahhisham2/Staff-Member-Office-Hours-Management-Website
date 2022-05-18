<%-- 
    Document   : cancel
    Created on : Jan 14, 2021, 4:20:04 PM
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
            
            String url = "jdbc:mysql://127.0.0.1:3306/staff";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            String StudentID = session.getAttribute("member_id").toString();//7asab el login
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT officeHoursID,t, d  FROM reservation WHERE StudentID='"+StudentID+"' ;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>time</th>
                <th>date</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("officeHoursID")%></td>
                <td><%=RS.getString("t")%></td>
                <td><%=RS.getString("d")%></td>
            </tr>
            <%}%>
        </table>
        <form action="cancellation.jsp" method="post">
            <p>Enter the ID the slot you want to cancel</p>
            <label>ID :<input type="text" name="ID"></label>
            <input type="submit" value="cancel resrvation">
        </form>
        <br/>
        <a href="StudentsHomePage.jsp">Back to Home</a>
    </body>
</html>
