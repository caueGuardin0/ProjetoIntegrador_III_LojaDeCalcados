<%-- 
    Document   : menuProduto
    Created on : 16/10/2021, 20:44:55
    Author     : caueg
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
    </head>
    <body>
        <c:import url="../uteis/header.jsp"/>
        <div>Menu</div>
        <a href="${pageContext.request.contextPath}/produto/cadastro.jsp">Cadastrar Produtos</a><br/>
        <a href="${pageContext.request.contextPath}/produto/ListarProdutosServlet">Listar Produtos</a></br>
        <a href="${pageContext.request.contextPath}/produto/busca.jsp">Buscar Produtos</a>
    </body>
</html>
