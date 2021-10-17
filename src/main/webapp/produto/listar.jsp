<%-- 
    Document   : listar
    Created on : 17/10/2021, 12:00:08
    Author     : caueg
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
        <script type="text/javascript">

            var idRemocao;
            function confirmarRemocao(nome, id) {
                console.log("Confirmar exclusão ", nome, id);
                idRemocao = id;
                var paragrafoProduto = $("#campoTextoExclusao");
                paragrafoProduto.html(nome + " - " + id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }
            function deletar() {
                console.log("Excluindo produto", idRemocao);
                fecharModal();
                var url = "CadastroProdutosServlet?idProduto=" + idRemocao;
                $.ajax(url).done(function () {
                    console.log("Produto removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 2000);
                }).fail(function () {
                    console.log("Erro ao remover Produto");
                });   
            }
        </script>
    </head>
    <body class="container-fluid">
        <c:import url="../uteis/header.jsp"></c:import>
            <div id="alerta" class="alert alert-success" role="alert" style="display:none">
                Produto removido com sucesso!
            </div>
            <h1>Produtos</h1>

            <!-- Modal confirmação de exclusão -->
            <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirmar Exclusão</h5>                       
                        </div>
                        <div class="modal-body">
                            <p>Confirmar exclusão do produto abaixo?</p>
                            <p id="campoTextoExclusao"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="fecharModal()">Cancelar</button>
                            <button type="button" class="btn btn-primary" onclick="deletar()">Confirmar</button>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table">
                <thead class="table-bordered">
                <td>Marca</td><td>Modelo</td><td>Modalidade</td><td>Preço</td><td>Cor</td><td>Tamanho</td><td>Quantidade</td>
            </thead>
            <tbody>
            <c:forEach var="produto" items="${listaProdutos}">
                <tr>
                    <td>${produto.marca}</td>
                    <td>${produto.modelo}</td>
                    <td>${produto.modalidade}</td>
                    <td>${produto.preco}</td>
                    <td>${produto.cor}</td>
                    <td>${produto.tamanho}</td>
                    <td>${produto.quantidade}</td>
                    <td><a href="CadastroProdutosServlet?idProduto=${produto.id}&ope=1">Atualizar</a></td>
                    <td><button onclick="confirmarRemocao('${produto.marca}', '${produto.id}')" class="btn btn-link">Deletar</button></td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<a href="${pageContext.request.contextPath}/produto/menuProduto.jsp">Voltar</a>
</html>
