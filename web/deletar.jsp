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
        <title>Deletar Filme</title>
    </head>
    <body>
        <h1>Filmes</h1>
        <%
            // Recebendo dados
            int id = (Integer.parseInt(request.getParameter("ident")));

            //Excluir!
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("delete from filmes where id = ?");
                comando.setInt(1, id);
                comando.execute();
                con.close();

                //Saída
                out.println("<b> Registro excluído com sucesso! </b>");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }


        %>
    </body>
</html>

