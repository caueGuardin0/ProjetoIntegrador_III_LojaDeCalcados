/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.dao;

import br.senac.projetointegrador.conexaodb.Conexao;
import br.senac.projetointegrador.entidades.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author caueg
 */
public class ProdutoDAO {
    
    public static List<Produto> getProdutos(){
        
       List<Produto> produtos = new ArrayList<>();
       String query = "select * from produto";
       
       Connection con = Conexao.getConexao();
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
           
           while (rs.next()) {
               Produto produto = new Produto();
               String id = rs.getString("id");
               String marca = rs.getString("marca");
               String modelo = rs.getString("modelo");
               String modalidade = rs.getString("modalidade");
               String preco = rs.getString("preco");
               String cor = rs.getString("cor");
               String tamanho = rs.getString("tamanho");
               String quantidade = rs.getString("quantidade");
               
               produto.setId(id);
               produto.setMarca(marca);
               produto.setModelo(modelo);
               produto.setModalidade(modalidade);
               produto.setPreco(preco);
               produto.setCor(cor);
               produto.setTamanho(tamanho);
               produto.setQuantidade(quantidade);
               produtos.add(produto);
               
           }
       } catch (SQLException ex) {
           Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return produtos;
        
    }
    
    public static void inserirProdutos(Produto produto) throws SQLException{
        
        String query = "INSERT INTO produto(id, marca, modelo, modalidade, preco, cor, tamanho, quantidade) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        Connection con = Conexao.getConexao();
        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, produto.getId());
        ps.setString(2, produto.getMarca());
        ps.setString(3, produto.getModelo());
        ps.setString(4, produto.getModalidade());
        ps.setString(5, produto.getPreco());
        ps.setString(6, produto.getCor());
        ps.setString(7, produto.getTamanho());
        ps.setString(8, produto.getQuantidade());
        ps.execute();
    }
    
    public static boolean deletarProdutos(String id){
        
        boolean ok = true;
        String query = "DELETE FROM produto WHERE id =?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static Produto getProdutoPorId(String id){
        
       Produto produto = null;
       String query = "select * from produto WHERE id = ?";
       
       Connection con = Conexao.getConexao();
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1, id);
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               produto = new Produto();
               String marca = rs.getString("marca");
               String modelo = rs.getString("modelo");
               String modalidade = rs.getString("modalidade");
               String preco = rs.getString("preco");
               String cor = rs.getString("cor");
               String tamanho = rs.getString("tamanho");
               String quantidade = rs.getString("quantidade");
               
               produto.setId(id);
               produto.setMarca(marca);
               produto.setModelo(modelo);
               produto.setModalidade(modalidade);
               produto.setPreco(preco);
               produto.setCor(cor);
               produto.setTamanho(tamanho);
               produto.setQuantidade(quantidade);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return produto;
        
    }
    
    public static boolean atualizarProduto(Produto produto){
        boolean ok = true;
        String query = "UPDATE produto SET preco=?, quantidade=? WHERE id =?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, produto.getPreco());
            ps.setString(2, produto.getQuantidade());
            ps.setString(3, produto.getId());
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
}
