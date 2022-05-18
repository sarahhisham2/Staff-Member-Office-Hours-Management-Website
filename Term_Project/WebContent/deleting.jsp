<%-- 
    Document   : deleting
    Created on : Jan 13, 2021, 3:07:29 PM
    Author     : hp
Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifications", "root", "root");
        Statement s = connection.createStatement();
        ResultSet r = s.executeQuery("SELECT * FROM  sms");
        PreparedStatement st =connection.prepareStatement("DELETE FROM templates WHERE id =?");
        st.setString(1, String.valueOf(ID));
        st.executeUpdate();
--%>
<%@page import="javafx.scene.input.KeyCode"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
           Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:127.0.0.1/staff";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet rs = null;
                try {
                String ID = request.getParameter("ID");
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                rs = Stmt.executeQuery("SELECT * FROM  OfficeHours");
                String sql = "DELETE FROM OfficeHours WHERE ID = ?;";
                try {
                    PreparedStatement statement = Con.prepareStatement(sql);
                    statement.setString(1,ID);
                    statement.executeUpdate();
                   
                 } catch (SQLException ex) {
                       //Logger.getLogger(staff.class.getName()).log(Level.SEVERE, null, ex);
                 }
                Stmt.close();
                Con.close();
                rs.close();
                Con.commit();
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }

               
       %>
        <p>your slot is deleted successfully</p>
        <a href="StaffHomePage.jsp">Back to Home</a>
    </body>
</html>
