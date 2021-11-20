/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.dao.VendaDAO;
import br.senac.projetointegrador.entidades.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CadastroVendaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ope = request.getParameter("ope");

        // Recuperar os parametros
        String id_cliente = request.getParameter("idCliente");
        String id_produto = request.getParameter("idProduto");
        String qtd_produto = request.getParameter("qtdProduto");

        // Inserir no banco
        Venda venda = new Venda();
        venda.setIdCliente(id_cliente);
        venda.setIdProduto(id_produto);
        venda.setQtdProduto(qtd_produto);

        // Redirecionar para a tela de sucesso ou erro
        try {
                VendaDAO.inserirVenda(venda);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(CadastroVendaServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/uteis/erro.jsp");
        }

    }

}
