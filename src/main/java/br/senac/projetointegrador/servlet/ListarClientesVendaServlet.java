/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.dao.ClienteDAO;
import br.senac.projetointegrador.entidades.Cliente;
import br.senac.projetointegrador.dao.ProdutoDAO;
import br.senac.projetointegrador.entidades.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListarClientesVendaServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Cliente> clientes = ClienteDAO.getClientes();
        request.setAttribute("listaClientes", clientes);

        List<Produto> produtos = ProdutoDAO.getProdutos();
        request.setAttribute("listaProdutos", produtos);
        
        // Reaproveita os objetos Request e Response
        
        String url = "/venda/cadastro.jsp";
        request.getRequestDispatcher(url).forward(request, response);

        
    }
    

}