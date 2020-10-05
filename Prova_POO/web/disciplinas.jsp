<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 00:29:10
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Disciplinas" %>
<%
    String msg = "";
    double nota;
    int indice;
    Disciplinas lista = (Disciplinas)application.getAttribute("lista");
    if (lista == null) {
        lista = new Disciplinas();
    }
    try {
        nota = Double.parseDouble(request.getParameter("nota"));
        indice = Integer.parseInt(request.getParameter("indice"));
    } catch(Exception e) {
        nota = -1;
        indice = -1;
    }
    
    if (nota > -1) {
        if (nota > 10) {
        msg = "Nota não pode ser maior que 10, a nota da disciplina"+lista.getLista().get(indice).getNome()+" não foi alterada";
        }
     else {
        msg = "Nota da Disciplina "+lista.getLista().get(indice).getNome()+" foi alterada com sucesso";
        lista.addNota(indice, nota);
    }
   } else {
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Disciplinas</h1>
        <div><%= msg %></div>
        <table border="1">
            <tr>
                <th>Disciplinas</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
            </tr>
            <%
                for (int i=0; i<lista.getLista().size(); i++) {
            %>
            <tr>
                <% Disciplinas u = lista.getLista().get(i);%>
                <th><%= u.getNome()%></th>
                <th><%= u.getEmenta()%></th>
                <th><%= u.getCiclo()%></th>
            <form method="get">
                <th><input type="text" name="nota" value="<%= u.getNota()%>"></th>
                <input type="hidden" name="indice" value="<%= i%>">
                <th><input type="submit" value="Adicionar nota"></th>
            </form>
            <tr>
                <%}%>
        </table>
    </body>
</html>
