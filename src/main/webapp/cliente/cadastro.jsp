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
        <title>Cadastro de Clientes</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <h1>Cadastrar Clientes</h1>
        <form action="CadastroClienteServlet" method="POST">
            <c:if test="${not empty clienteAtualizacao}">
                <input type="hidden" name="ope" value="1"/>
            </c:if>
            <div class="form-group">
                <label>ID</label>
                <c:if test="${empty clienteAtualizacao}">
                <input type="number" name="idCliente" value="${clienteAtualizacao.id}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty clienteAtualizacao}">
                    <label>${clienteAtualizacao.id}</label>
                    <input type="hidden" name="idCliente" value="${clienteAtualizacao.id}" required class="form-control"/></br>    
                </c:if>
            </div>
            <div class="form-group">
                <label>CPF</label>
                <c:if test="${empty clienteAtualizacao}">
                <input type="text" name="cpfCliente" value="${clienteAtualizacao.cpf}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty clienteAtualizacao}">
                    <label>${clienteAtualizacao.cpf}</label>
                    <input type="hidden" name="idCliente" value="${clienteAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Nome</label>
                <input type="text" name="nomeCliente" value="${clienteAtualizacao.nome}" required class="form-control"/></br>
            </div>
            <div class="form-group">
                <label>Telefone</label>
                <input type="text" name="telefoneCliente" value="${clienteAtualizacao.telefone}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Sexo</label>
                <input type="text" name="sexoCliente" value="${clienteAtualizacao.sexo}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Cep</label>
                <input type="text" name="cepCliente" value="${clienteAtualizacao.cep}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Cidade</label>
                <input type="text" name="cidadeCliente" value="${clienteAtualizacao.cidade}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Numero</label>
                <input type="text" name="numeroCliente" value="${clienteAtualizacao.numero_log}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Logradouro</label>
                <input type="text" name="logradouroCliente" value="${clienteAtualizacao.logradouro}" required class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>Complemento</label>
                <input type="text" name="complementoCliente" value="${clienteAtualizacao.complemento_log}" class="form-control"/></br>
            </div>    
            <div class="form-group">
                <label>E-mail</label>
                <input type="text" name="emailCliente" value="${clienteAtualizacao.email}" required class="form-control"/></br>
            </div>    
            <div>
                <label>Data Nascimento</label>
                <c:if test="${empty clienteAtualizacao}">
                <input type="date" name="dataNascCliente" value="${clienteAtualizacao.data_nasc}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty clienteAtualizacao}">
                    <label>${clienteAtualizacao.data_nasc}</label>
                    <input type="hidden" name="idCliente" value="${clienteAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
                
            </div>    

                <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </body>
</html>
