/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import Controller.ConectarDao;
import Controller.IcrudDao;
import java.sql.SQLException;
/**
 *
 * @author Megas-XRL8
 */
public class Filme extends ConectarDao implements IcrudDao   {
    
    public String nome;
    public String sinopse;
    public String duracao;
    public String dataLancamento;
    public double avaliacao;
    public int classificacao;
    public int pkuser;
    

        public void incluir(){
        
    try { sql = "insert into TB_FILME (NM_USUARIO, DS_EMAIL, DS_SENHA) "
        + "values (?,?,?) ";
    ps = con.prepareStatement(sql);
    ps.setString(1, nome); // Configura Parametros
  //  ps.setString(2, email); // Configura Parametros
  //  ps.setString(3, senha ); // Configura Parametros
    ps.executeUpdate(); // executa comando SQL
 this.statusSQL = null; // armazena null se deu tudo certo
 } catch (SQLException ex) {
 this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
 }
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
