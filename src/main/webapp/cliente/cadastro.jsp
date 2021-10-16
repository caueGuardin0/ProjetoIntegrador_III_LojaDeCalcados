<%-- 
    Document   : cadastro
    Created on : 16/10/2021, 10:03:40
    Author     : caueg
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de clientes</title>
    </head>
    <body>
        <h1>Cadastrar Clientes</h1>
        <form action="CadastroClienteServlet" method="POST">
            <c:if test="${not empty clienteAtualizacao}">
                <input type="hidden" name="ope" value="1"/>
            </c:if>
            <label>ID</label>
            <input type="number" name="idCliente" value="${clienteAtualizacao.id}" required/></br>
            <label>CPF</label>
            <input type="text" name="cpfCliente" value="${clienteAtualizacao.cpf}" required/></br>
            <label>Nome</label>
            <input type="text" name="nomeCliente" value="${clienteAtualizacao.nome}" required/></br>
            <label>Telefone</label>
            <input type="text" name="telefoneCliente" value="${clienteAtualizacao.telefone}" required/></br>
            <label>Sexo</label>
            <input type="text" name="sexoCliente" value="${clienteAtualizacao.sexo}" required/></br>
            <label>Cep</label>
            <input type="text" name="cepCliente" value="${clienteAtualizacao.cep}" required/></br>
            <label>Cidade</label>
            <input type="text" name="cidadeCliente" value="${clienteAtualizacao.cidade}" required/></br>
            <label>Numero</label>
            <input type="text" name="numeroCliente" value="${clienteAtualizacao.numero_log}" required/></br>
            <label>Logradouro</label>
            <input type="text" name="logradouroCliente" value="${clienteAtualizacao.logradouro}" required/></br>
            <label>Complemento</label>
            <input type="text" name="complementoCliente" value="${clienteAtualizacao.complemento_log}"/></br>
            <label>E-mail</label>
            <input type="text" name="emailCliente" value="${clienteAtualizacao.email}" required/></br>
            <label>Data Nascimento</label>
            <input type="date" name="dataNascCliente" value="${clienteAtualizacao.data_nasc}" required/></br>

            <button type="submit">Salvar</button>
        </form>
    </body>
</html>
