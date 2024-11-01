<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario user = new Usuario(); // Instancia o objeto Usuario 

 if ( !(user.statusSQL == null) ) out.println(user.statusSQL);
 // preenche os atributos do objeto usuario
    String senhas = request.getParameter("senha");
    String rpsenhas = request.getParameter("rpsenha");
    String buttonval = request.getParameter("oper");
    
    
    if(senhas != null && rpsenhas != null && senhas.equals(rpsenhas) && "1".equals(buttonval)){
        user.nome = request.getParameter("nome");
        user.email = request.getParameter("email");
        user.senha = senhas;
        user.incluir(); // chama o método para fazer a inclusão no banco de dados
        
        if(user.getLogin() == true){
            response.sendRedirect("login.html");
        }
        
    }
%>
