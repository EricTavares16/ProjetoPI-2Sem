/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import Controller.ConectarDao;
import Controller.IcrudDao;
import static java.lang.System.out;
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
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getDuracao() {
        return duracao;
    }

    public void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    public String getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(String dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }

    public int getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(int classificacao) {
        this.classificacao = classificacao;
    }

    public int getPkuser() {
        return pkuser;
    }

    public void setPkuser(int pkuser) {
        this.pkuser = pkuser;
    }
    
    
    public void incluirFilme(){

    try { sql = "insert into TB_FILME (NM_FILME, DS_SINOPSE, HR_DURACAO, DT_LANCAMENTO, VL_AVALIACAO,"
            + "NR_CLASSIFICACAO_INDICATIVA) "
        + "values (?,?,?,?,?,?) ";
    ps = con.prepareStatement(sql);
    ps.setString(1, nome); // Configura Parametros
    ps.setString(2, sinopse); // Configura Parametros
    ps.setString(3, duracao ); // Configura Parametros
    ps.setString(4, dataLancamento ); // Configura Parametros
    ps.setDouble(5, avaliacao ); // Configura Parametros
    ps.setInt(6, classificacao ); // Configura Parametros
    ps.executeUpdate(); // executa comando SQL
    this.statusSQL = null; // armazena null se deu tudo certo
    
 } catch (SQLException ex) {
 this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
 }
    
    }
        
   public void deletar(){
       try{ sql = "DELETE FROM TB_FILME WHERE UCASE(TRIM(NM_FILME)) = UCASE(TRIM(?))";
        ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ps.executeUpdate();
            this.statusSQL = null;
       }catch (SQLException ex){
           this.statusSQL = "Errro ao encontrar  usuario ! <br>" + ex.getMessage();
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
