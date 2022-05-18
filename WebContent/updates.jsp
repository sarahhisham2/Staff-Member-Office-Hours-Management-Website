<%-- 
    Document   : managing
    Created on : Jan 12, 2021, 6:07:49 PM
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
           Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:127.0.0.1/staff";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet rs = null;
                Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","sun", "20201010");
                Stmt = Con.createStatement();
                String MemberID = session.getAttribute("member_id").toString();
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String Password = request.getParameter("password");
                String contact = request.getParameter("contact");
                String confirmpassword = request.getParameter("confirmpassword");
                String sql = "SELECT UserName FROM Students";
                rs = Stmt.executeQuery(sql);
                while(rs.next())
                {
                    String UserName = rs.getString("UserName");
                    if(UserName==username)
                    {
                        %>
                        <p>user name already exists</p>
                        <a href="updateprofiles.jsp">go back and enter a valid user name</a>
                        <%
                    }
                }
                if(password!=confirmpassword)
                {
                     %>
                        <p>invalid password check the password and the confirm password you entered</p>
                        <a href="updateprofiles.jsp">go back and enter a valid password and confirm password</a>
                     <%
                }
                else
                {
                   %>
                    <p>your profile is updated successfully</p>
                        <a href="StudentsHomePage.jsp">Back to home</a>
                   <%
                }
                String line = "INSERT Students VALUES("
                        + "'" + MemberID + "',"
                        + "'" + username + "','"+password+"',"
                        + "'" + email+ "',"
                        + "'" + contact + "','"+name+")";
                int Rows = Stmt.executeUpdate(line);
                Stmt.close();
                Con.close();

       %>
        <a href="updateprofiles.jsp">Back</a>
    </body>
</html>
