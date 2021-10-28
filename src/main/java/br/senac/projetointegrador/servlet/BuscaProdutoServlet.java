/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.servlet;

import br.senac.projetointegrador.dao.ProdutoDAO;
import br.senac.projetointegrador.entidades.Produto;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caueg
 */
public class BuscaProdutoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String marcaProduto = request.getParameter("marcaProduto");
        List<Produto> produtos = ProdutoDAO.getProdutoPorMarca(marcaProduto);
        String produtosJson = new Gson().toJson(produtos);
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.write(produtosJson);
    }



}
