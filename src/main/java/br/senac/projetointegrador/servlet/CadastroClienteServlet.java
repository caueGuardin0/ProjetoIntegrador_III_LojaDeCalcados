/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.dao.ClienteDAO;
import br.senac.projetointegrador.entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caueg
 */
public class CadastroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ope = request.getParameter("ope");

        // Recuperar os parametros
        String id = request.getParameter("idCliente");
        String cpf = request.getParameter("cpfCliente");
        String nome = request.getParameter("nomeCliente");
        String telefone = request.getParameter("telefoneCliente");
        String sexo = request.getParameter("sexoCliente");
        String cep = request.getParameter("cepCliente");
        String cidade = request.getParameter("cidadeCliente");
        String numero = request.getParameter("numeroCliente");
        String logradouro = request.getParameter("logradouroCliente");
        String complemento = request.getParameter("complementoCliente");
        String email = request.getParameter("emailCliente");
        String dataNasc = request.getParameter("dataNascCliente");

        // Inserir no banco
        Cliente cliente = new Cliente();
        cliente.setId(id);
        cliente.setCpf(cpf);
        cliente.setNome(nome);
        cliente.setTelefone(telefone);
        cliente.setSexo(sexo);
        cliente.setCep(cep);
        cliente.setCidade(cidade);
        cliente.setNumero_log(numero);
        cliente.setLogradouro(logradouro);
        cliente.setComplemento_log(complemento);
        cliente.setEmail(email);
        cliente.setData_nasc(dataNasc);

        // Redirecionar para a tela de sucesso ou erro
        try {

            if ("1".equals(ope)) {
                ClienteDAO.atualizarCliente(cliente);
            } else {
                ClienteDAO.inserirClientes(cliente);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/uteis/erro.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idUsuario");
        String ope = req.getParameter("ope");
        // ope = 1 -> Atualização
        if ("1".equals(ope)) {
            Cliente cliente = ClienteDAO.getClientePorId(id);
            req.setAttribute("clienteAtualizacao", cliente);
            req.getRequestDispatcher("/cliente/cadastro.jsp").forward(req, resp);
        } else {
            ClienteDAO.deletarCliente(id);
            resp.sendRedirect(req.getContextPath() + "/cliente/ListarClientesServlet");
        }
    }

}
