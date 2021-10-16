/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.conexaodb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author caueg
 */
public class Conexao {
    
    static { // Design Patterns -> Singleton
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConexao() {

        String url = "jdbc:derby://localhost:1527/LojaBD";
        String user = "heinz";
        String password = "Ketchup@2021";

        Connection con = null;
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;

    }
    
}
