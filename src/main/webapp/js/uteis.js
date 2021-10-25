function mostrarTelaAlerta(texto) {
    $("#txtAlerta").html(texto);
    $('#tabelaClientes tbody').empty();
    $("#msgAlert").css("display", "block");
    setTimeout(function () {
        $("#msgAlert").css("display", "none");
    }, 3000);
}

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
                        console.log("Erro");
                    });
                }
            }