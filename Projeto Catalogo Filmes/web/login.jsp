<%@page import="model.Usuario"%>
<%
 String email = request.getParameter("email"); // captura email do form
 String senha = request.getParameter("senha"); // captura senha do form

 Usuario user = new Usuario();// instancia Usuario
 
 user.setEmail(email); // mude para user.setEmail(email);
 user.setSenha(senha); // mude para user.setSenha(senha); 
 
 if ( user.getLogin() == true) { // faz o login no objeto user
    
   Usuario userLogado = user.retornarUserLogado();
   session.setAttribute("usuarioLogado", userLogado);
   response.sendRedirect("Home.jsp");// carrega a página de sistema
   
 } else{
    String sHTML="<center>Opa! Login ou Senha não encontrados! Tente Novamente! <br>"
    + "<a href = 'login.html'> Voltar </a></center>";
    out.println(sHTML);
   }
 %>


