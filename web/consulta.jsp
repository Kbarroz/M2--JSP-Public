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
        <title>Lista um Fiilme</title>
    </head>
    <body>
        <h1>Filme</h1>
        <%
            // Recebendo dados

            int id = (Integer.parseInt(request.getParameter("ident")));

            //Consultar
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("select * from filmes where id = ?");
                comando.setInt(1, id);
                ResultSet rs = comando.executeQuery();

                //Saída
                while (rs.next()) {
                    out.println("<b> Filme</b>");
                    out.println("<br> Identificação: " + rs.getInt("id"));
                    out.println("<br> Titulo...........: " + rs.getString("titulo"));
                    out.println("<br> Genero...........: " + rs.getString("genero"));
                    out.println("<br> Diretor..........: " + rs.getString("diretor"));
                    out.println("<br> Ano de Lançamento: " + rs.getInt("ano"));
                    out.println("<br> Ator 1...........: " + rs.getString("ator1"));
                    out.println("<br> Ator 2...........: " + rs.getString("ator2"));
                }

                con.close(); //fecha                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }


        %>
    </body>
</html>

