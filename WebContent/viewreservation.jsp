<%-- 
    Document   : viewreservation
    Created on : Jan 15, 2021, 12:00:45 AM
    Author     : hp
session.setAttribute("onestaffemail", usermail);
					   session.setAttribute("onestaffpassword",userpass);
					   session.setAttribute("member_id", result2.getString(1));
					   session.setAttribute("staffusername", result2.getString(2));
					   session.setAttribute("staffcontact", result2.getString(5));
					   session.setAttribute("one subject", result2.getString(6));
					   session.setAttribute("stafffullname", result2.getString(7));
					   
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
            //String name = request.getParameter("studentname");
            String url = "jdbc:mysql://127.0.0.1:3306/staff";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            String StaffMemberID = session.getAttribute("member_id").toString();//7asab el login
            try {
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT ID,t,day,status,location FROM OfficeHours WHERE StaffMemberID='"+StaffMemberID+"';");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

        %>
        <table border="1">
            <tr>
                <th>ID </th> 
                <th>time</th> 
                <th>Day </th> 
                <th>online/offline</th> 
                <th>location </th> 
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
        <form action="viewingR.jsp" method="POST">
            <p>Enter the ID of the slot you want to view</p>
            <label>ID :<input type="text" name="ID"></label>
            <input type="submit" value="view">
        </form>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
