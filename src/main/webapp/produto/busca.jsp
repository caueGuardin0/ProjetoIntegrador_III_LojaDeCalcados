<%-- 
    Document   : busca
    Created on : 28/10/2021, 20:10:05
    Author     : caueg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Produtos</title>
        <script src="../js/uteis.js">
            <script type="text/javascript">
            function buscarProdutoMarca() {
                    var campoBusca = $("#marcaProduto");
            var marcaProduto = campoBusca.val();
            var tamanhoBusca = marcaProduto.length;
            if (tamanhoBusca < 3) {
                mostrarTelaAlertaP("Digite pelo menos 3 ou mais caracteres");
            } else {

                $('#tabelaProdutos tbody').empty();
                var url = "BuscaProdutoServlet?marcaProduto=" + marcaProduto;
                $.ajax(url).done(function (resposta) {

                    // Retorno Servlet
                    var jsonProdutos = JSON.parse(resposta);
                    if (jsonProdutos.length === 0) {
                        mostrarTelaAlertaP("Nenhum resultado foi encontrato com os parametros informados");
                    }
                    console.log(jsonProdutos);
                    jsonProdutos.forEach(function (produto) {
                        // Adicionando resultado na lista
                        $("#tabelaProdutos").find('tbody')
                                .append($('<tr>')
                                        .append($('<td>').append(produto.marca))
                                        .append($('<td>').append(produto.modelo))
                                        .append($('<td>').append(produto.modalidade))
                                        .append($('<td>').append(produto.preco))
                                        .append($('<td>').append(produto.cor))
                                        .append($('<td>').append(produto.tamanho))
                                        .append($('<td>').append(produto.quantidade))
                                        );
                    });
                }).fail(function () {
                        console.log(resposta);
                    });
                }
                                        }
        </script>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>

        <input type="text" id="marcaProduto" class="form-control"/></br>
        <button onclick="buscarProdutoMarca()" class="btn btn-primary">Buscar</button>

        <div id="msgAlert" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <table id="tabelaProdutos" class="table">
            <thead>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Modalidade</th>
            <th>Preço</th>
            <th>Cor</th>
            <th>Tamanho</th>
            <th>Quantidade</th>
        </thead>
        <tbody>
        </tbody>
    </table>

</body>
</html>
