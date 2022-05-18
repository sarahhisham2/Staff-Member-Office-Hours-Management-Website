<%-- 
    Document   : addslot
    Created on : Jan 13, 2021, 9:28:09 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Fill the slot details</p>
        <form action =" managing.jsp" method="POST">
            <label>time (HH:MM:SS) :<input type="text" name="t"></label></br>
            <label>day :<input type="text" name="day"></label></br>
            <label>online/offline :<input type="text" name="status"></label></br>
            <label>location :<input type="text" name="location"></label></br>
            <input type="submit" value="add slot">
        </form>
        <a href="StaffHomePage.jsp">Back home</a>
    </body>
</html>
