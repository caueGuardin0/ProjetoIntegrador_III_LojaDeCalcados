<%-- 
    Document   : cadastro
    Created on : 19/11/2021, 19:38:40
    Author     : caue.gguardino
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Venda</title>
    </head>
    <body>
        <body class="container-fluid">
        <c:import url="../uteis/header.jsp"></c:import>
        <h1>Clientes</h1>
        <table class="table">
                <thead class="table-bordered">
                <td>ID</td><td>CPF</td><td>Nome</td><td>Telefone</td><td>Sexo</td><td>Cep</td><td>Cidade</td><td>Numero</td><td>Logradouro</td><td>Complemento</td><td>E-mail</td><td>Data Nascimento</td>
            </thead>
            <tbody>
            <c:forEach var="cliente" items="${listaClientes}">
                <tr>
                    <td>${cliente.id}</td>
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
                </tr>
            </c:forEach>
        </tbody>
    </table>
        
    <h1>Produtos</h1>
    
    <table class="table">
                <thead class="table-bordered">
                <td>ID</td><td>Marca</td><td>Modelo</td><td>Modalidade</td><td>Preço</td><td>Cor</td><td>Tamanho</td><td>Quantidade</td>
            </thead>
            <tbody>
            <c:forEach var="produto" items="${listaProdutos}">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.marca}</td>
                    <td>${produto.modelo}</td>
                    <td>${produto.modalidade}</td>
                    <td>${produto.preco}</td>
                    <td>${produto.cor}</td>
                    <td>${produto.tamanho}</td>
                    <td>${produto.quantidade}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <h1>Cadastro venda</h1>
    <br>
    <div class="form-group">
    <label>Id Cliente</label>
    <input type="text" name="idCliente" required class="form-control"/></br>
    </div>
    <div class="form-group">
    <label>Id Produto</label>
    <input type="text" name="idProduto" required class="form-control"/></br>
    </div>
    <div class="form-group">
    <label>Quantidade</label>
    <input type="text" name="qtdProduto" required class="form-control"/></br>
    </div>
</body>
<a href="${pageContext.request.contextPath}/venda/menuVenda.jsp">Voltar</a>
    </body>
</html>
