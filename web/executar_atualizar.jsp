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
        <title>Atualizar</title>
    </head>
    <body>
        <h1>Filme</h1>
        <%            
             // Recebendo dados
            int id = Integer.parseInt(request.getParameter("ident"));
            String titulo = request.getParameter("titulo");
            String genero = request.getParameter("genero");
            String diretor = request.getParameter("diretor");
            int ano = Integer.parseInt(request.getParameter("ano"));
            String ator1 = request.getParameter("ator1");
            String ator2 = request.getParameter("ator2");
            
            //Alterar!
            try{
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("update filmes set titulo = ?, genero = ?, diretor = ?, ano = ?, ator1 = ?, ator2 = ? where id = ?");
                comando.setString(1, titulo);
                comando.setString(2, genero);
                comando.setString(3, diretor);
                comando.setInt(4, ano);
                comando.setString(5, ator1);
                comando.setString(6, ator2);
                comando.setInt(7, id);
                comando.execute();
                con.close(); //fecha

                //Saída
                out.println("<b> Registro alterado com sucesso! </b>");                 
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            //Saída
            out.println("<b> Registro - Alterado! </b>");
         

        %>
    </body>
</html>

