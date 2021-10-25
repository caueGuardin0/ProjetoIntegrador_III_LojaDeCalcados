<%-- 
    Document   : menuClientes
    Created on : 16/10/2021, 17:31:33
    Author     : caueg
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
    <body>
        <c:import url="../uteis/header.jsp"/>
        <div>Menu</div>
        <a href="${pageContext.request.contextPath}/cliente/cadastro.jsp">Cadastrar clientes</a><br/>
        <a href="${pageContext.request.contextPath}/cliente/ListarClientesServlet">Listar clientes</a><br/>
        <a href="${pageContext.request.contextPath}/cliente/busca.jsp">Buscar clientes</a>
    </body>
</body></br></br>
<a href="${pageContext.request.contextPath}/index.jsp">Voltar</a>
</html>
