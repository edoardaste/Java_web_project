<%-- 
    Document   : index
    Created on : 20/01/2022, 07:44:29
    Author     : ianca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project TCS</title>
    </head>
    <body>
         <h1>Forms</h1>
        <form method="post" action="executar_inserir.jsp">
            <label for="name">NAME</label><br>
            <input type="text" name="name"/><br>
            <label for="email">EMAIL</label><br>
            <input type="email" name="email"/><br>
            <label for="password">PASSWORD</label><br>
            <input type="password" name="password"/><br>
            <br><input type="submit" value="SEND"/>
        </form><br>
        <a href="consultar_usuarios.jsp">Consultar Usuarios</a>
    </body>
</html>
