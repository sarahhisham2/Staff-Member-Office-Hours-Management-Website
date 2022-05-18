<%-- 
    Document   : updateslot
    Created on : Jan 15, 2021, 2:29:10 PM
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
        <form action="updating.jsp" method="POST">
            <p>Enter ID of the slot you want to update</p>
            <label>ID :<input type="text" name="ID"></label>
            <input type="submit" value="update">
        </form>
    </body>
</html>
