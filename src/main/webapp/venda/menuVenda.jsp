<%-- 
    Document   : menuVenda
    Created on : 19/11/2021, 19:37:32
    Author     : caue.gguardino
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda</title>
    </head>
    <body>
        <c:import url="../uteis/header.jsp"/>
        <div>Menu</div>
        <a href="${pageContext.request.contextPath}/venda/ListarClientesVendaServlet">Cadastrar Venda</a><br/>
    </body>
</html>
