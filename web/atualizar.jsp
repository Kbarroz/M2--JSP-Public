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
        <title>Atualização</title>
    </head>
    <body>
        <h1>Atualizar Filme</h1>
        <%
            // Recebendo dados
            
            int id = (Integer.parseInt(request.getParameter("ident")));                     
            
            //Consultar
            try{
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("select * from filmes where id = ?");
                comando.setInt(1, id);
                ResultSet rs = comando.executeQuery();
                
                //Saída
                while (rs.next()){
        %>        
        <h1>Atualização de Filme</h1>
              <form method="post" action="executar_atualizar.jsp">
                  Identificação: <input type="text" name="ident" readonly="true" value="<%= rs.getInt("id") %>"> <p>
                  Titulo: <input type="text" name="titulo" value="<%= rs.getString("titulo") %>"> <p>
                  Genero: <input type="text" name="genero" value="<%= rs.getString("genero") %>"> <p>
                  Diretor: <input type="text" name="diretor" value="<%= rs.getString("diretor") %>"><p>
                  Ano: <input type="number" name="ano" value="<%= rs.getInt("ano") %>"><p>
                  Ator 1:<input type="text" name="ator1" value="<%= rs.getString("ator1") %>"><p>
                  Ator 2:<input type="text" name="ator2" value="<%= rs.getString("ator2") %>"><p>
                  <input type="submit" name="salvar" value="Salvar">
              </form>
        <%
                }                                        
                con.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }            
        %>
    </body>
</html>

