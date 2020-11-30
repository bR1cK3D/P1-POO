<%-- 
    Document   : index
    Created on : 5 de out de 2020, 00:28:56
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Disciplinas" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Bruno Ricardo dos Santos Melo Costa</h1>
        <h2>RA: 1290481912004</h2>
        <h3>Quantidade de disciplinas cursadas:<%out.print(Disciplinas.getList().size());%> </h3>
    </body>
</html>
