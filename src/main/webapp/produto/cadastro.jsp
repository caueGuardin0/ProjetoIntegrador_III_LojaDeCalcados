<%-- 
    Document   : cadastro
    Created on : 16/10/2021, 20:45:59
    Author     : caueg
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <h1>Cadastrar Produtos</h1>
        <form action="CadastroProdutosServlet" method="POST">
            <c:if test="${not empty produtoAtualizacao}">
                <input type="hidden" name="ope" value="1"/>
            </c:if>
            <div class="form-group">
                <label>ID</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="number" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.id}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>    
                </c:if>
            </div>
            <div class="form-group">
                <label>Marca</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="text" name="marcaProduto" value="${produtoAtualizacao.marca}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.marca}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Modelo</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="text" name="modeloProduto" value="${produtoAtualizacao.modelo}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.modelo}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Modalidade</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="text" name="modalidadeProduto" value="${produtoAtualizacao.modalidade}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.modalidade}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Preço</label>
                <input type="text" name="precoProduto" value="${produtoAtualizacao.preco}" required class="form-control"/></br>
            </div>
            <div class="form-group">
                <label>Cor</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="text" name="corProduto" value="${produtoAtualizacao.cor}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.cor}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Tamanho</label>
                <c:if test="${empty produtoAtualizacao}">
                    <input type="text" name="tamanhoProduto" value="${produtoAtualizacao.tamanho}" required class="form-control"/></br>
                </c:if>
                <c:if test="${not empty produtoAtualizacao}">
                    <label>${produtoAtualizacao.tamanho}</label>
                    <input type="hidden" name="idProduto" value="${produtoAtualizacao.id}" required class="form-control"/></br>  
                </c:if>
            </div>
            <div class="form-group">
                <label>Quantidade</label>
                <input type="text" name="quantidadeProduto" value="${produtoAtualizacao.quantidade}" required class="form-control"/></br>
            </div>       

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </body>
</html>
