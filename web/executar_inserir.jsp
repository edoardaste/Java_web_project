

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Usuario" %>
<%@page import="DAO.DAOUser" %>

<%  
    Usuario usu = new Usuario();
    DAOUser usd = new DAOUser();

    try{
    
        String nome = request.getParameter("name");
        String email = request.getParameter("email");
        String senha = request.getParameter("password");
        
        //valores MODEL
        
        usu.setNome_usuario(nome);
        usu.setEmail_usuario(email);
        usu.setSenha_usuario(senha);
        usd.InserirUsuario(usu);
        out.print("Usuario inserido com sucesso!");
        out.print("<meta http-equiv='refresh' content='3, url=index.jsp'>");
    
    
    }catch(Exception erro){
    
     throw new RuntimeException("Erro executar inserir:" + erro);
    }



%>