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
            String ID = request.getParameter("ID");
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
                RS = Stmt.executeQuery("SELECT t,d FROM reservation WHERE officeHoursID='"+ID+"';");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>time </th> 
                <th>date</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("t")%></td>
                <td><%=RS.getString("d")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
