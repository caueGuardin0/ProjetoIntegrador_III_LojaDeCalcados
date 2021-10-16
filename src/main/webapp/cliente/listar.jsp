<%-- 
    Document   : listar
    Created on : 16/10/2021, 11:54:13
    Author     : caueg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de clientes</title>
    </head>
    <body>
        <h1>Clientes</h1>
        <table>
            <thead>
            <td>CPF</td><td>Nome</td><td>Telefone</td><td>Sexo</td><td>Cep</td><td>Cidade</td><td>Numero</td><td>Logradouro</td><td>Complemento</td><td>E-mail</td><td>Data Nascimento</td>
        </thead>
        <tbody>
            <c:forEach var="cliente" items="${listaClientes}">
                <tr>
                    <td>${cliente.cpf}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.telefone}</td>
                    <td>${cliente.sexo}</td>
                    <td>${cliente.cep}</td>
                    <td>${cliente.cidade}</td>
                    <td>${cliente.numero_log}</td>
                    <td>${cliente.logradouro}</td>
                    <td>${cliente.complemento_log}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.data_nasc}</td>
                    <td><a href="CadastroClienteServlet?idUsuario=${cliente.id}&ope=1">Atualizar</a></td>
                    <td><a href="CadastroClienteServlet?idUsuario=${cliente.id}">Deletar</a></td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<a href="${pageContext.request.contextPath}/index.jsp">Voltar</a>
</html>
