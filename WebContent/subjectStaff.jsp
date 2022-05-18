<%-- 
    Document   : showProjects
    Created on : Oct 17, 2019, 3:14:02 PM
    Author     : ahmed
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
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT subject , name FROM staffmembers LIMIT 100;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="1">
            <tr>
                <th>Subject </th> 
                <th>Staff</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("subject")%></td>
                <td><%=RS.getString("name")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <a href="index.html">Back to Home</a>
    </body>
</html>

<%
    RS.close();
    Stmt.close();
    Con.close();
%>