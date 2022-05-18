<%-- 
    Document   : deletion
    Created on : Jan 13, 2021, 2:59:02 PM
    Author     : hp
Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifications", "root", "root");
        Statement s = connection.createStatement();
        ResultSet r = s.executeQuery("SELECT * FROM  sms");
        PreparedStatement st =connection.prepareStatement("DELETE FROM templates WHERE id =?");
        st.setString(1, String.valueOf(ID));
        st.executeUpdate();
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
       <p>Enter the ID off the slot you want to delete</p></br>
        <form action="deleting.jsp" method="POST">
            <label>ID :<input type="text" name="ID"></label></br>
        <input type="submit" value="delete" >
        </form>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
