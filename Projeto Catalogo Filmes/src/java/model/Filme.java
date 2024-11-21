/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import Controller.ConectarDao;
import Controller.IcrudDao;
import com.mysql.cj.jdbc.Blob;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
/**
 *
 * @author Megas-XRL8
 */
public class Filme extends ConectarDao implements IcrudDao   {
    
    public int id;
    public String nome;
    public String sinopse;
    public String duracao;
    public String dataLancamento;
    public double avaliacao;
    public int classificacao;
    public int pkuser;
    public InputStream capa; // Imagem guardada no InputStream
    public long capatamanho; // Guarda o tamanho da imagem em bytes
    public String capaimagemBase64; 
    public InputStream banner; // Imagem guardada no InputStream
    public long bannertamanho; // Guarda o tamanho da imagem em bytes
    public String bannerimagemBase64;

    
     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getCapaimagemBase64() {
        return capaimagemBase64;
    }

    public void setCapaimagemBase64(String capaimagemBase64) {
        this.capaimagemBase64 = capaimagemBase64;
    }

    public String getBannerimagemBase64() {
        return bannerimagemBase64;
    }

    public void setBannerimagemBase64(String bannerimagemBase64) {
        this.bannerimagemBase64 = bannerimagemBase64;
    }
    
        public ResultSet getTab() {
        return tab;
    }

    public void setTab(ResultSet tab) {
        this.tab = tab;
    }
    
    public Filme(int id, String nome, String sinopse, String duracao, String dataLancamento, double avaliacao, int classificacao, String capaimagemBase64) {
        this.id = id;
        this.nome = nome;
        this.sinopse = sinopse;
        this.duracao = duracao;
        this.dataLancamento = dataLancamento;
        this.avaliacao = avaliacao;
        this.classificacao = classificacao;
        this.capaimagemBase64 = capaimagemBase64;
    }
    
      public Filme() {
    }
    
    
    public void incluirFilme(){

    try { sql = "INSERT INTO TB_FILME (NM_FILME, DS_SINOPSE, HR_DURACAO, DT_LANCAMENTO, VL_AVALIACAO, NR_CLASSIFICACAO_INDICATIVA, IMG_CAPA, IMG_BANNER) VALUES (?,?,?,?,?,?,?,?)";

    ps = con.prepareStatement(sql);
    ps.setString(1, nome); // Configura Parametros
    ps.setString(2, sinopse); // Configura Parametros
    ps.setString(3, duracao ); // Configura Parametros
    ps.setString(4, dataLancamento ); // Configura Parametros
    ps.setDouble(5, avaliacao ); // Configura Parametros
    ps.setInt(6, classificacao ); // Configura Parametros
    
    if (capatamanho > 0) { 
            ps.setBlob(7, capa, capatamanho); // foto
        } else { 
            ps.setNull(7, java.sql.Types.BLOB);}
    if (bannertamanho > 0) { 
            ps.setBlob(8, banner, bannertamanho); // foto
        } else { 
            ps.setNull(8, java.sql.Types.BLOB);}
    ps.executeUpdate();
    this.statusSQL = null;
    
 } catch (SQLException ex) {
 this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
 }
    
    }
    
    public ArrayList<Filme> listarFilmes(){
        
        ArrayList<Filme> filmes = new ArrayList<>();
        
        try { 

            sql = "SELECT * FROM TB_FILME";

            ps = con.prepareStatement(sql);
           
            tab = ps.executeQuery();
            
            String fotinho = "";

            while(tab.next()){
                int id = tab.getInt(1);
                String nome = tab.getString(2);
                String sinopse = tab.getString(3);
                String duracao = tab.getString(4);
                String dtLancamento = tab.getString(5);
                double avaliacao = tab.getDouble(6);
                int classificacao = tab.getInt(7);
                Blob blob = (Blob) tab.getBlob(8);
                
                if (blob == null) {
                    capaimagemBase64 = null; }
                else {
                    capa = blob.getBinaryStream();
                    byte[] buffer = new byte[(int) blob.length()];
                    capa.read(buffer);
                    fotinho = capaimagemBase64 = Base64.getEncoder().encodeToString(buffer);
                }
                
                filmes.add(new Filme(id, nome, sinopse, duracao, dtLancamento, avaliacao, classificacao, fotinho));
            }

            this.statusSQL = null; 
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
        } catch (IOException ex) {
            Logger.getLogger(Filme.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return filmes;
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
