
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="MODEL.Usuario"%>
<%@page import="DAO.DAOUser"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Consulta</h1>
        <form action="consultar_usuarios.jsp" method="post">
            <label> Pesquisar por nome</label><br>
            <input type="text" name="name" placeholder="Digite o Nome"/>
            <input type="submit" value="Pesquisar"/><br> </form> <br>
            <%
          out.print("<table border='1'>");
                   out.print("<tr>");
                    out.print("<th>ID</th>");
                    out.print("<th>NOME</th>");
                    out.print("<th>EMAIL</th>");
                    out.print("<th>SENHA</th>");
                    out.print("<th>EDITAR</th>");
                    out.print("<th>EXCLUIR</th>");     
                   out.print("</tr>");
                   
                    DAOUser usu = new DAOUser();
                    if(request.getParameter("name")== "" || request.getParameter("name")==null){
                       ArrayList<Usuario> lista = usu.listarUsuarios();
                       for(int i = 0;i<lista.size();i++){
                  out.print("<tr>");
                     out.print("<td>"+lista.get(i).getID()+"</td>");
                     out.print("<td>"+lista.get(i).getNome_usuario()+"</td>");
                     out.print("<td>"+lista.get(i).getEmail_usuario()+"</td>");
                     out.print("<td>"+lista.get(i).getSenha_usuario()+"</td>");
                     out.print("<td>click</td>");
                     out.print("<td>click</td>");
                  out.print("</tr>");}
                
                }else{
                    //pesquisa por nome
                     ArrayList<Usuario> lista = usu.listarUsuariosNome(request.getParameter("name"));
                       for(int i = 0;i<lista.size();i++){
                  out.print("<tr>");
                     out.print("<td>"+lista.get(i).getID()+"</td>");
                     out.print("<td>"+lista.get(i).getNome_usuario()+"</td>");
                     out.print("<td>"+lista.get(i).getEmail_usuario()+"</td>");
                     out.print("<td>"+lista.get(i).getSenha_usuario()+"</td>");
                     out.print("<td>click</td>");
                     out.print("<td>click</td>");
                  out.print("</tr>");}
                
                    }
               out.print("</table>");
            %>
    
        
    </body>
</html>
