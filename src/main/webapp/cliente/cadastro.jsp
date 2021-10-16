<%-- 
    Document   : cadastro
    Created on : 16/10/2021, 10:03:40
    Author     : caueg
--%>

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
            <label>ID</label>
            <input type="number" name="idCliente"/></br>
            <label>CPF</label>
            <input type="text" name="cpfCliente"/></br>
            <label>Nome</label>
            <input type="text" name="nomeCliente"/></br>
            <label>Telefone</label>
            <input type="text" name="telefoneCliente"/></br>
            <label>Sexo</label>
            <input type="text" name="sexoCliente"/></br>
            <label>Cep</label>
            <input type="text" name="cepCliente"/></br>
            <label>Cidade</label>
            <input type="text" name="cidadeCliente"/></br>
            <label>Numero</label>
            <input type="text" name="numeroCliente"/></br>
            <label>Logradouro</label>
            <input type="text" name="logradouroCliente"/></br>
            <label>Complemento</label>
            <input type="text" name="complementoCliente"/></br>
            <label>E-mail</label>
            <input type="text" name="emailCliente"/></br>
            <label>Data Nascimento</label>
            <input type="date" name="dataNascCliente"/></br>
            
            <button type="submit">Salvar</button>
        </form>
    </body>
</html>
