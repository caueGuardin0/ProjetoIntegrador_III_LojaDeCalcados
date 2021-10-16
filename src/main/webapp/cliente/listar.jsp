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
        <script type="text/javascript">

            var idRemocao;
            function confirmarRemocao(nome, id) {
                console.log("Confirmar exclusão ", nome, id);
                idRemocao = id;
                var paragrafoCliente = $("#campoTextoExclusao");
                paragrafoCliente.html(nome + " - " + id);

                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.show();
            }

            function fecharModal() {
                var modalConfirmacao = $("#modalExclusao");
                modalConfirmacao.hide();
            }
            function deletar() {
                console.log("Excluindo cliente", idRemocao);
                fecharModal();
                var url = "CadastroClienteServlet?idUsuario=" + idRemocao;
                $.ajax(url).done(function () {
                    console.log("Cliente removido!");
                    var alerta = $("#alerta");
                    alerta.css("display", "block");
                    setTimeout(function () {
                        alerta.css("display", "none");
                        location.reload();
                    }, 2000);
                }).fail(function () {
                    console.log("Erro ao remover Cliente");
                });   
            }
        </script>
    </head>
    <body class="container-fluid">
        <c:import url="../uteis/header.jsp"></c:import>
            <div id="alerta" class="alert alert-success" role="alert" style="display:none">
                Cliente removido com sucesso!
            </div>
            <h1>Clientes</h1>

            <!-- Modal confirmação de exclusão -->
            <div class="modal" tabindex="-1" role="dialog" id="modalExclusao">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirmar Exclusão</h5>                       
                        </div>
                        <div class="modal-body">
                            <p>Confirmar exclusão do usuário abaixo?</p>
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
                    <td><button onclick="confirmarRemocao('${cliente.nome}', '${cliente.id}')" class="btn btn-link">Deletar</button></td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<a href="${pageContext.request.contextPath}/cliente/menuClientes.jsp">Voltar</a>
</html>
