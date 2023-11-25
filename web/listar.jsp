<%-- 
Problema/Necessidade: Crud de Filmes
Data: 20/11/2023
Autor: 
Projeto: Controle de Filme
--%>

<%@page import="model.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Filme"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de filmes</title>
        
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td{
                padding: 6px;
                text-align: left;
                border: 1px solid #DDD;
            }
            tr:hover {background-color: #D6EEEE }
        </style>
        
    </head>
    <body>
        <h1>Filmes</h1>
        <%
            // Recebendo dados
            
            String id = request.getParameter("ident");                      
            
            //Consultar
            try{
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("select * from filmes");
                ResultSet rs = comando.executeQuery();
        %>
        <table style="width:100%"; border="1">
            <tr bgcolor="F5F5F5">
                <th> #</th>
                <th> Id</th>
                <th> Titulo</th>
                <th> Genero</th>
                <th> Diretor</th>
                <th> Ano</th>
                <th> Ator 1</th>
                <th> Ator 2</th>
                <th> Detalhes</th>
                <th> Alterar </th>
                <th> Excluir </th>
            </tr>
        
        
        <%    
                //Saída
                while (rs.next()){
        %>
            <tr>
                <td><%= rs.getRow() %></td>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("titulo") %></td>
                <td><%= rs.getString("genero") %></td>
                <td><%= rs.getString("diretor") %></td>
                <td><%= rs.getInt("ano") %></td>
                <td><%= rs.getString("ator1") %></td>
                <td><%= rs.getString("ator2") %></td>
                <td> <a href="consulta.jsp?ident=<%= rs.getInt("id")%>"><img src="imagem/plus.png" alt=""/> </td>
                <td> <a href="atualizar.jsp?ident=<%= rs.getInt("id")%>"><img src="imagem/edit.png" alt=""/> </td>
                <td> <a href="deletar.jsp?ident=<%= rs.getInt("id")%>"><img src="imagem/delete.png" alt=""/> </td>
        </tr> 
                    
        <%
                }             
        %>   
        </table>
        <%
                con.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }                 
        %>
    </body>
</html>

