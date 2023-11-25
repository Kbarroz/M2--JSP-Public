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
        <title>Cadastrar Filmes</title>
    </head>
    <body>
        <h1>Filme</h1>
        <%
            // Recebendo dados
            Filme fil = new Filme();  //instância

            fil.setTitulo(request.getParameter("titulo"));
            fil.setGenero(request.getParameter("genero"));
            fil.setDiretor(request.getParameter("diretor"));
            fil.setAno(Integer.parseInt(request.getParameter("ano")));
            fil.setAtor1(request.getParameter("ator1"));
            fil.setAtor2(request.getParameter("ator2"));

            //GRAVAR!
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("insert into filmes (titulo, genero, diretor, ano, ator1, ator2) values(?,?,?,?,?,?)"); //defin instr. SQL
                comando.setString(1, fil.getTitulo());
                comando.setString(2, fil.getGenero());
                comando.setString(3, fil.getDiretor());
                comando.setInt(4, fil.getAno());
                comando.setString(5, fil.getAtor1());
                comando.setString(6, fil.getAtor2());
                comando.execute();
                con.close();
                //fecha                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }

            //Saída
            out.println("<b> Filme Registrado </b>");
            out.println("<br> Titulo...........: " + fil.getTitulo());
            out.println("<br> Genero...........: " + fil.getGenero());
            out.println("<br> Diretor..........: " + fil.getDiretor());
            out.println("<br> Ano de Lançamento: " + fil.getAno());
            out.println("<br> Ator 1...........: " + fil.getAtor1());
            out.println("<br> Ator 2...........: " + fil.getAtor2());
        %>
    </body>
</html>

