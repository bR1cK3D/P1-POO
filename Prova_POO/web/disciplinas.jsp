<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 00:29:10
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Disciplinas" %>
<%
   String msg = "";
   double nota = 0.0;
   String nome = "";
   String ciclo = "";
   String ementa = "";
   if(request.getParameter("formNota") != null) {
       try {
           nota = Double.parseDouble(request.getParameter("nota"));
           nome = request.getParameter("nome");
           msg = "Nota não pode ser menor que 0";
       } catch(Exception e) {
           nota = -1;
           nome = "";
           msg="Nota falhou";
       }
       if(nota > -1) {
           msg = "Nota não pode ser menor que 0";
           if(nota > 10) {
               msg = "Nota não pode ser maior que 10";
           } else {
               Disciplinas.alterarNota(nome, nota);
               msg = "Nota alterada com sucesso";
           }
       }
   }
   if (request.getParameter("formAdicionar") != null) {
       try {
           nome = request.getParameter("nomeDisciplina");
           ementa = request.getParameter("ementa");
           ciclo = request.getParameter("ciclo");
           nota = Double.parseDouble(request.getParameter("nota"));
           Disciplinas.inserirDisciplina(nome, ementa, ciclo, nota);
           msg = "Disciplina Adicionada";
           response.sendRedirect(request.getRequestURI());
       } catch (Exception ex) {
           msg = ex.getLocalizedMessage()+" puts";
       }
   }
   
   if(request.getParameter("remover") != null) {
       try {
           nome = request.getParameter("nome");
           Disciplinas.excluirDisciplina(nome);
           
       } catch(Exception ex) {
           msg=ex.getLocalizedMessage();
       }
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
                for (int i=0; i<Disciplinas.getList().size(); i++) {
            %>
            <tr>
                <% Disciplinas u = Disciplinas.getList().get(i);%>
                <th><%= u.getNome()%></th>
                <th><%= u.getEmenta()%></th>
                <th><%= u.getCiclo()%></th>
            <form method="POST">
                <th><input type="text" name="nota" value="<%= u.getNota()%>"></th>
                <input type="hidden" name="nome" value="<%= u.getNome() %>">
                <th><input type="submit" name="formNota" value="Adicionar nota"></th>
                <th><input type="submit" name="remover" value="remover Disciplina"></th>
            </form>
            </tr>
                <%}%>
        </table>
        <br><br>
        <div>
            <fieldset>
                <legend>Adicionar disciplina</legend>
                <form method="POST">
                    <div>Nome da disciplina:</div>
                    <div><input type="text" name="nomeDisciplina"/></div>
                    <div>Ementa:</div>
                    <div><input type="text" name="ementa"/></div>
                    <div>Ciclo:</div>
                    <div><input type="text" name="ciclo"/></div>
                    <div>Nota:</div>
                    <div><input type="text" name="nota"/></div>
                    <hr/>
                    <div>
                        <input type="submit" name="formAdicionar" value="Adicionar">
                        <input type="submit" name="Cancelar" value="Cancelar">
                    </div>
                </form>
            </fieldset>
        </div>
    </body>
</html>
