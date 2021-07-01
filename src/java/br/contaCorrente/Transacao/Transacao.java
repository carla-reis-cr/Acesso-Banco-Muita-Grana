package br.contaCorrente.Transacao;

import javax.swing.JFormattedTextField;
import javax.swing.text.MaskFormatter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Carla Reis
 */
public class Transacao {
    private Integer id;
    private Integer conta;
    private String tipoTransacao;
    private String data;
    private Double valor;

    MaskFormatter formater = new MaskFormatter();
    JFormattedTextField field = new JFormattedTextField();
    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the conta
     */
    public Integer getConta() {
        return conta;
    }

    /**
     * @param conta the conta to set
     */
    public void setConta(Integer conta) {
        this.conta = conta;
    }

    /**
     * @return the tipoTransacao
     */
    public String getTipoTransacao() {
        return tipoTransacao;
    }
    
    public int getTipoTransacaoBoolean(){
        
        if(getTipoTransacao().equals("C")){
            return 1;
        }
        return 0;
    }

    /**
     * @param tipoTransacao the tipoTransacao to set
     */
    public void setTipoTransacao(String tipoTransacao) {
        this.tipoTransacao = tipoTransacao;
    }

    /**
     * @return the data
     */
    public String getData() {
   
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(String data) {
        this.data = data;
    }

    /**
     * @return the valor
     */
    public Double getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(Double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return conta + tipoTransacao +valor; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
