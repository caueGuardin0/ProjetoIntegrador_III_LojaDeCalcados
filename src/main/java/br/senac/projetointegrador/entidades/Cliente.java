/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.projetointegrador.entidades;

import lombok.Getter;
import lombok.Setter;
/**
 *
 * @author caueg
 */
@Getter
@Setter
public class Cliente {
    
    private String cpf;
    private String nome;
    private String telefone;
    private String sexo;
    private String cep;
    private String cidade;
    private String logradouro;
    private String numero_log;
    private String complemento_log;
    private String email;
    private String data_nasc;
    
    @Override
    public String toString() {
        return "cpf=" + cpf + 
               ", nome=" + nome + 
               ", telefone=" + telefone + 
               ", sexo=" + sexo + 
               ", cep=" + cep + 
               ", cidade=" + cidade + 
               ", logradouro=" + logradouro + 
               ", numero_log=" + numero_log + 
               ", complemento_log=" + complemento_log + 
               ", email=" + email + 
               ", data_nasc=" + data_nasc;
    }
    
}
