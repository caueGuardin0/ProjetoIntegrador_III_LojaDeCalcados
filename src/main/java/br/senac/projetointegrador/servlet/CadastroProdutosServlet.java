/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.dao.ProdutoDAO;
import br.senac.projetointegrador.entidades.Produto;
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
public class CadastroProdutosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ope = request.getParameter("ope");

        // Recuperar os parametros
        String id = request.getParameter("idProduto");
        String marca = request.getParameter("marcaProduto");
        String modelo = request.getParameter("modeloProduto");
        String modalidade = request.getParameter("modalidadeProduto");
        String preco = request.getParameter("precoProduto");
        String cor = request.getParameter("corProduto");
        String tamanho = request.getParameter("tamanhoProduto");
        String quantidade = request.getParameter("quantidadeProduto");

        // Inserir no banco
        Produto produto = new Produto();
        produto.setId(id);
        produto.setMarca(marca);
        produto.setModelo(modelo);
        produto.setModalidade(modalidade);
        produto.setPreco(preco);
        produto.setCor(cor);
        produto.setTamanho(tamanho);
        produto.setQuantidade(quantidade);

        // Redirecionar para a tela de sucesso ou erro
        try {

            if ("1".equals(ope)) {
                ProdutoDAO.atualizarProduto(produto);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            } else {
                ProdutoDAO.inserirProdutos(produto);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CadastroProdutosServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/uteis/erro.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idProduto");
        String ope = req.getParameter("ope");
        // ope = 1 -> Atualização
        if ("1".equals(ope)) {
            Produto produto = ProdutoDAO.getProdutoPorId(id);
            req.setAttribute("produtoAtualizacao", produto);
            req.getRequestDispatcher("/produto/cadastro.jsp").forward(req, resp);
            
        } else {
            ProdutoDAO.deletarProdutos(id);
            //resp.sendRedirect(req.getContextPath() + "/produto/ListarProdutosServlet");
        }
    }
}