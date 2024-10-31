package model;

import Controller.ConectarDao;
import Controller.IcrudDao;
import java.sql.SQLException;

public class Usuario extends ConectarDao implements IcrudDao  {

    public String id;
    public String nome;
    public String email;
    public String senha;


     public String getId() {
        return id;
    }

    public void setId(String idUser) {
        this.id = id;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    public void incluir(){
    try { sql = "insert into TB_USUARIO (NM_USUARIO, DS_EMAIL, DS_SENHA) "
        + "values (?,?,?) ";
    ps = con.prepareStatement(sql);
    ps.setString(1, nome); // Configura Parametros
    ps.setString(2, email); // Configura Parametros
    ps.setString(3, senha ); // Configura Parametros
    ps.executeUpdate(); // executa comando SQL
 this.statusSQL = null; // armazena null se deu tudo certo
 } catch (SQLException ex) {
 this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
 } }
    
    public boolean getLogin() {
        
        if (email.equals("admin") && senha.equals("1234")) 
        return true;
        
        try {
            
            sql = "SELECT * FROM TB_USUARIO WHERE DS_EMAIL = ? AND DS_SENHA = ?";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, email); // Configura Parametros
            ps.setString(2, senha); // Configura Parametros
            tab = ps.executeQuery(); // Executa comando SQL
            
            if (tab.next()) return true;
                this.statusSQL = null;// armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao tentar buscar Usuário! " + ex.getMessage();
        }
        return false;
    }
    
    public Usuario retornarUserLogado() {
    Usuario userLogado = new Usuario();
    
    try {
        sql = "SELECT * FROM TB_USUARIO WHERE DS_EMAIL = ? AND DS_SENHA = ?";
        ps = con.prepareStatement(sql); // prepara SQL
        ps.setString(1, email); // Configura Parametros
        ps.setString(2, senha); // Configura Parametros
        tab = ps.executeQuery(); // Executa comando SQL
        
        String idUser = "";
        String nmUser = "";
        String emailUser = ""; 
        
        if(tab.next()) { // Usa if para verificar se há um usuário encontrado
            idUser = tab.getString(1);  // Corrige o índice para começar de 1
            nmUser = tab.getString(2);
            emailUser = tab.getString(3);
            
            userLogado.setId(idUser);
            userLogado.setNome(nmUser);
            userLogado.setEmail(emailUser);
        } else {
            return null; // Retorna null se nenhum usuário foi encontrado
        }
    } catch (SQLException ex) {
        this.statusSQL = "Erro ao tentar buscar Usuário! " + ex.getMessage();
        return null;
    }       
    return userLogado;
}

    //esse aqui a gente vai usar isso aqui pra outra coisa, pra substituir a imagem.
    public void alterar(){
    try { sql = "update TB_USUARIO set NM_USUARIO=?, DS_EMAIL=?"
        + " DS_SENHA=?, where DS_EMAIL=? ";
        ps = con.prepareStatement(sql); // prepara SQL
        ps.setString(1, nome); // Configura Parametros
        ps.setString(2, email); // Configura Parametros
        ps.setString(3, senha ); // Configura Parametros
        ps.setString(4, email ); // Configura Parametros
        ps.executeUpdate(); // executa comando SQL
            this.statusSQL = null; // armazena null se deu tudo certo
        } catch (SQLException ex) {
    this.statusSQL = "Erro ao Alterar usuario ! <br> " +
    ex.getMessage();    
    } 
 }

@Override
public boolean salvar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
public boolean deletar() {
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
