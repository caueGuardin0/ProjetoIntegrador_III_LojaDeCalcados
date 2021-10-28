<%-- 
    Document   : busca
    Created on : 24/10/2021, 20:47:41
    Author     : caueg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Clientes</title>
        <script src="../js/uteis.js">
            <script type="text/javascript">
            function buscarClienteNome() {
                    var campoBusca = $("#nomeCliente");
            var nomeCliente = campoBusca.val();
            var tamanhoBusca = nomeCliente.length;
            if (tamanhoBusca < 3) {
                mostrarTelaAlerta("Digite pelo menos 3 ou mais caracteres");
            } else {

                $('#tabelaClientes tbody').empty();
                var url = "BuscaClienteServlet?nomeCliente=" + nomeCliente;
                $.ajax(url).done(function (resposta) {

                    // Retorno Servlet
                    var jsonClientes = JSON.parse(resposta);
                    if (jsonClientes.length === 0) {
                        mostrarTelaAlerta("Nenhum resultado foi encontrato com os parametros informados");
                    }
                    console.log(jsonClientes);
                    jsonClientes.forEach(function (cliente) {
                        // Adicionando resultado na lista
                        $("#tabelaClientes").find('tbody')
                                .append($('<tr>')
                                        .append($('<td>').append(cliente.cpf))
                                        .append($('<td>').append(cliente.nome))
                                        .append($('<td>').append(cliente.telefone))
                                        .append($('<td>').append(cliente.sexo))
                                        .append($('<td>').append(cliente.cep))
                                        .append($('<td>').append(cliente.cidade))
                                        .append($('<td>').append(cliente.logradouro))
                                        .append($('<td>').append(cliente.numero_log))
                                        .append($('<td>').append(cliente.complemento_log))
                                        .append($('<td>').append(cliente.email))
                                        .append($('<td>').append(cliente.data_nasc))
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

        <input type="text" id="nomeCliente" class="form-control"/></br>
        <button onclick="buscarClienteNome()" class="btn btn-primary">Buscar</button>

        <div id="msgAlert" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <table id="tabelaClientes" class="table">
            <thead>
            <th>CPF</th>
            <th>Nome</th>
            <th>Telefone</th>
            <th>Sexo</th>
            <th>Cep</th>
            <th>Cidade</th>
            <th>Logradouro</th>
            <th>Numero</th>
            <th>Complemento</th>
            <th>E-mail</th>
            <th>Data Nascimento</th>
        </thead>
        <tbody>
        </tbody>
    </table>

</body>
</html>
