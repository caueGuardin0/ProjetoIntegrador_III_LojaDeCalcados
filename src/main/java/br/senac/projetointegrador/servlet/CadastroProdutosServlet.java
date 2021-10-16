/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.entidades.Produto;
import java.io.IOException;
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
        //try {

            if ("1".equals(ope)) {
                //ProdutoDAO.atualizarProduto(produto);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            } else {
                //ProdutoDAO.inserirProduto(produto);
                response.sendRedirect(request.getContextPath() + "/uteis/sucesso.jsp");
            }
        } //catch (SQLException ex) {
            //Logger.getLogger(CadastroClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            //response.sendRedirect(request.getContextPath() + "/uteis/erro.jsp");
        //}
}
