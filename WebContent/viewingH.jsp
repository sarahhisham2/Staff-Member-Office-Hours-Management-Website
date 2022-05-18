<%-- 
    Document   : viewingH
    Created on : Jan 15, 2021, 1:01:02 AM
    Author     : hp
select officeHoursID, d,t from reservation where StaffMemberID='1' and cast(d as date) between '2021-1-12' and '2021-1-14';

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
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String url = "jdbc:mysql://127.0.0.1:3306/staff";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            //HttpSession session = request.getSession(true);
           // session.setAttribute("name", name);
            
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                String StaffMemberID = "1";
                RS = Stmt.executeQuery("select officeHoursID, d,t from reservation where StaffMemberID='"+StaffMemberID+"' and cast(d as date) between '"+from+"' and '"+to+"';");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>time </th> 
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
        <br/>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
