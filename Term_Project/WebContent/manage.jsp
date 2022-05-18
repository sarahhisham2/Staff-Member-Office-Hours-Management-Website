<%-- 
    Document   : manage
    Created on : Jan 12, 2021, 2:20:39 PM
    Author     : hp
<form action="managing">
            <label>slot :<input type="text" name="time"></label></br>
            <label>online/offline :<input type="text" name="status"></label></br> 
            <label>location :<input type="text" name="location" ></label></br>  
            <input type="submit" value="add slot">    
        </form>
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
        <p>Manage your office hours slots</p>
        <%
            String name = request.getParameter("studentname");
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
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String MemberID = "1";
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
        <form action="deletion.jsp" method="POST">
            <input type="submit" value="delete a slot">
        </form>
        <form action="addslot.jsp" method="POST">
            <input type="submit" value="add a new slot">
        </form>
        <form action="updateslot.jsp" method="POST">
            <input type="submit" value="update a slot">
        </form>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
