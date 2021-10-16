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
public class Produto {

    private String id;
    private String marca;
    private String modelo;
    private String modalidade;
    private String preco;
    private String cor;
    private String tamanho;
    private String quantidade;
}
