/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.senac.projetointegrador.dao;

import br.senac.projetointegrador.conexaodb.Conexao;
import br.senac.projetointegrador.entidades.Venda;
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
 * @author caue.gguardino
 */
public class VendaDAO {

public static void inserirVenda(Venda venda) throws SQLException {

        String query = "INSERT INTO venda(id_cliente, id_produto, qtd_produto) VALUES (?, ?, ?)";

        Connection con = Conexao.getConexao();

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, venda.getIdCliente());
        ps.setString(2, venda.getIdProduto());
        ps.setString(3, venda.getQtdProduto());
        ps.execute();
    }
}
