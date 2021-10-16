/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.dao;

import br.senac.projetointegrador.conexaodb.Conexao;
import br.senac.projetointegrador.entidades.Cliente;
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
public class ClienteDAO {
    
    public List<Cliente> getClientes(){
        
       List<Cliente> clientes = new ArrayList<>();
       String query = "select * from cliente";
       
       Connection con = Conexao.getConexao();
       try {
           PreparedStatement ps = con.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               Cliente cliente = new Cliente();
               String cpf = rs.getString("cpf");
               String nome = rs.getString("nome");
               String telefone = rs.getString("telefone");
               String sexo = rs.getString("sexo");
               String cep = rs.getString("cep");
               String cidade = rs.getString("cidade");
               String logradouro = rs.getString("logradouro");
               String numero_log = rs.getString("numero_log");
               String complemento_log = rs.getString("complemento_log");
               String email = rs.getString("email");
               String data_nasc = rs.getString("data_nasc");
               
               cliente.setCpf(cpf);
               cliente.setNome(nome);
               cliente.setTelefone(telefone);
               cliente.setSexo(sexo);
               cliente.setCep(cep);
               cliente.setCidade(cidade);
               cliente.setLogradouro(logradouro);
               cliente.setNumero_log(numero_log);
               cliente.setComplemento_log(complemento_log);
               cliente.setEmail(email);
               cliente.setData_nasc(data_nasc);
               clientes.add(cliente);
           }
       } catch (SQLException ex) {
           Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return clientes;
        
    }
    
}
