/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Controller.ConectarDao;
import Controller.IcrudDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Megas-XRL8
 */
public class Comentario extends ConectarDao implements IcrudDao {
    
    public int idComent;
    public int idFilme;
    public int idUser;
    public String comentario;
    public String dataComentario;
    
    
    
    public void IncluiComentarios(){
        try{setSql("insert into TB_COMENTARIO (ID_FILME, ID_USUARIO, DS_COMENTARIO, DT_COMENTARIO)"
             + "values (?,?,?,?);");
     setPs(getCon().prepareStatement(getSql()));
     getPs().setInt(1, idFilme); // Configura Parametros
     getPs().setInt(2, idUser); // Configura Parametros
     getPs().setString(3,comentario); // Configura Parametros
     getPs().setString(4, dataComentario); // Configura Parametros
     getPs().executeUpdate(); // executa comando SQL
        this.setStatusSQL(null);
            
        }catch(SQLException ex){
            this.setStatusSQL("Erro ao incluir Comentario ! <br> " + ex.getMessage());
        }
    
    }

    public int getIdComent() {
        return idComent;
    }

    public void setIdComent(int idComent) {
        this.idComent = idComent;
    }

    public int getIdFilme() {
        return idFilme;
    }

    public void setIdFilme(int idFilme) {
        this.idFilme = idFilme;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getDataComentario() {
        return dataComentario;
    }

    public void setDataComentario(String dataComentario) {
        this.dataComentario = dataComentario;
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

    public ResultSet getTab() {
        return tab;
    }

    public void setTab(ResultSet tab) {
        this.tab = tab;
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
    
        public int buscarUltimoComent(){
        try{
            setSql("SELECT * FROM TB_COMENTARIO ORDER BY ID_FILME DESC LIMIT 1;");
        setPs(getCon().prepareStatement(getSql()));
        setTab(getPs().executeQuery());

        if (getTab().next()) {
            return getTab().getInt("ID_COMENTARIO");
        }
            
        }catch (SQLException e) {
        e.printStackTrace(); // Log do erro
    } finally {
        try {
            if (getTab() != null) getTab().close();
            if (getPs() != null) getPs().close();
        } catch (SQLException e) {
            e.printStackTrace(); // Log para erros ao fechar os recursos
        }
    }
    return 0;
        }
        
        
        
        
        
        

    public int getId() {
        return idComent;
    }

    public void setId(int idComent) {
        this.idComent = idComent;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
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