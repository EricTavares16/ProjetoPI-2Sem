/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Controller.ConectarDao;
import Controller.IcrudDao;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Megas-XRL8
 */
public class Ator extends ConectarDao implements IcrudDao {

    public String nomeAtor;
    public int idade;
    
    public InputStream capa; // Imagem guardada no InputStream
    public long capatamanho; // Guarda o tamanho da imagem em bytes
    public String capaimagemBase64;
    
    public void IncluirAtor(){
            try{setSql("INSERT INTO TB_ATOR (NM_ATOR, NR_IDADE, IMG_CAPA)"
             + "VALUES (?,?,?);");
     setPs(getCon().prepareStatement(getSql()));
     getPs().setString(1, nomeAtor); // Configura Parametros
     getPs().setInt(2, idade); // Configura Parametros

     if(capatamanho > 0){
                getPs().setBlob(3, capa, capatamanho);
            }else{
                getPs().setNull(3, java.sql.Types.BLOB);
            }

        getPs().executeUpdate(); // executa comando SQL
        this.setStatusSQL(null);
            
        }catch(SQLException ex){
            this.setStatusSQL("Erro ao incluir Ator ! <br> " + ex.getMessage());
        }
    }
    
        public void deletar() {
        try {
            setSql("DELETE FROM TB_ATOR WHERE UCASE(TRIM(NM_ATOR)) = UCASE(TRIM(?))");
            setPs(getCon().prepareStatement(getSql()));
            getPs().setString(1, nomeAtor);
            getPs().executeUpdate();
            this.setStatusSQL(null);
        } catch (SQLException ex) {
            this.setStatusSQL("Errro ao encontrar Ator ! <br>" + ex.getMessage());
        }
    }

    public String getNomeAtor() {
        return nomeAtor;
    }

    public void setNomeAtor(String nomeAtor) {
        this.nomeAtor = nomeAtor;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
        public String getCapaimagemBase64() {
        return capaimagemBase64;
    }

    public void setCapaimagemBase64(String capaimagemBase64) {
        this.capaimagemBase64 = capaimagemBase64;
    }

    public ResultSet getTab() {
        return getTab();
    }

    public void setTab(ResultSet tab) {
        this.setTab(tab);
    }

    public InputStream getCapa() {
        return capa;
    }

    public void setCapa(InputStream capa) {
        this.capa = capa;
    }

    public long getCapatamanho() {
        return capatamanho;
    }

    public void setCapatamanho(long capatamanho) {
        this.capatamanho = capatamanho;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public PreparedStatement getPs() {
        return ps;
    }

    public void setPs(PreparedStatement ps) {
        this.ps = ps;
    }

    public String getHtmlError() {
        return htmlError;
    }

    public void setHtmlError(String htmlError) {
        this.htmlError = htmlError;
    }

    public String getMeuBanco() {
        return MeuBanco;
    }

    public void setMeuBanco(String MeuBanco) {
        this.MeuBanco = MeuBanco;
    }

    public String getStatusSQL() {
        return statusSQL;
    }

    public void setStatusSQL(String statusSQL) {
        this.statusSQL = statusSQL;
    }
    
    @Override
    public boolean salvar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean buscar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean buscarSQL() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
