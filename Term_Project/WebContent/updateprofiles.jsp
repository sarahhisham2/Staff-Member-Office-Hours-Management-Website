<%-- 
    Document   : addProject
    Created on : Oct 17, 2019, 2:58:05 PM
    Author     : ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addProject</title>
    </head>
    <body>
        <h1>Update your profile information</h1><br/>
        <form action="updates.jsp">
            <table border="1">
                <tr> 
                    <td>User Name:</td>
                    <td><input type="text" name="username"  /></td>  
                </tr>
                <tr> 
                    <td>Email:</td>
                    <td><input type="text" name="email"  /></td>  
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><input type="text" name="name" /></td>   
                </tr>
                <tr> 
                    <td>Contact :</td>
                    <td><input type="text" name="contact"  /></td>   
                </tr>
                <tr> 
                    <td>password :</td>
                    <td><input type="text" name="password"  /></td>   
                </tr>
                <tr> 
                    <td>confirm password :</td>
                    <td><input type="text" name="confirmpassword"  /></td>   
                </tr>
                <tr>
                    <td colspan="2"> <input type="submit" value="add" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>