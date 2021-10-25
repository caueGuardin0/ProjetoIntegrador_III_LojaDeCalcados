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

    public static List<Cliente> getClientes() {

        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from cliente";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                String id = rs.getString("id");
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

                cliente.setId(id);
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

    public static void inserirClientes(Cliente cliente) throws SQLException {

        String query = "INSERT INTO cliente(id, cpf, nome, telefone, sexo, cep, cidade, numero_log, logradouro, complemento_log, email, data_nasc) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection con = Conexao.getConexao();

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getId());
        ps.setString(2, cliente.getCpf());
        ps.setString(3, cliente.getNome());
        ps.setString(4, cliente.getTelefone());
        ps.setString(5, cliente.getSexo());
        ps.setString(6, cliente.getCep());
        ps.setString(7, cliente.getCidade());
        ps.setString(8, cliente.getNumero_log());
        ps.setString(9, cliente.getLogradouro());
        ps.setString(10, cliente.getComplemento_log());
        ps.setString(11, cliente.getEmail());
        ps.setString(12, cliente.getData_nasc());
        ps.execute();
    }

    public static boolean deletarCliente(String id) {
        boolean ok = true;
        String query = "DELETE FROM cliente WHERE id =?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static Cliente getClientePorId(String id) {

        Cliente cliente = null;
        String query = "select * from cliente WHERE id = ?";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
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

                cliente.setId(id);
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;

    }

    public static Cliente getClientePorCpf(String cpf) {

        Cliente cliente = null;
        String query = "select * from cliente WHERE cpf = ?";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                String id = rs.getString("id");
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

                cliente.setId(id);
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;

    }

    public static List<Cliente> getClientePorNome(String nomeParam) {

        nomeParam = nomeParam.toUpperCase();
        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from cliente WHERE UPPER(nome) LIKE ?";

        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nomeParam + "%");
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

    public static boolean atualizarCliente(Cliente cliente) {
        boolean ok = true;
        String query = "UPDATE cliente SET nome=?, telefone=?, sexo=?, cep=?, cidade=?, numero_log=?, logradouro=?, complemento_log=?, email=? WHERE id =?";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getTelefone());
            ps.setString(3, cliente.getSexo());
            ps.setString(4, cliente.getCep());
            ps.setString(5, cliente.getCidade());
            ps.setString(6, cliente.getNumero_log());
            ps.setString(7, cliente.getLogradouro());
            ps.setString(8, cliente.getComplemento_log());
            ps.setString(9, cliente.getEmail());
            ps.setString(10, cliente.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

}
