<%-- 
    Document   : viewbydate
    Created on : Jan 15, 2021, 12:56:20 AM
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
        <form action="viewingH.jsp" method="POST">
            <label>from date :<input type="text" name="from"></label>
            <label>to date :<input type="text" name="to"></label>
            <input type="submit" value="view">
        </form>
    </body>
</html>
