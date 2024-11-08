
<%@page import="model.Usuario"%>
<%Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
    String nomeLogado = userLogado.getNome();
    String emailLogado = userLogado.getEmail();
    int pkUserLogado = userLogado.getPkuser();
    String fotoUserLogado = userLogado.getFoto();
    if (userLogado == null) response.sendRedirect("./login.html");

    

    String foto = "", nome = "", email = "", senha = "", sHTML = "";
    String pkuser = "";
    Usuario user = new Usuario(); // Instancia o objeto Usuario
    String fotoCaminho = " ";
    if (fotoUserLogado == null){ fotoUserLogado = " ";
    fotoCaminho = "./imgs/foto34.png";
    }else{
    fotoCaminho = "./imgs" + "&#92;" + fotoUserLogado.trim();
    fotoCaminho = fotoCaminho.trim();}
    
    
 
     String oper = request.getParameter("oper");
     /* Para gravar pega as requisições e faz a consistência */
    if ("Atualizar".equals(oper) && sHTML.isBlank()) {
        user.foto = fotoUserLogado;
     if (!user.buscarEmail()) {
     user.incluir(); } else { user.alterar(); }
    }


    if (!(user.statusSQL == null)) out.println(user.statusSQL);%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página do usuário: nome do usuário</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="userPage.css">
</head>
<body>
    <div class="container flex-center">

        <div class="user_content flex-center">

            <div class="avatar_container flex-center">
                <img src="<%= fotoCaminho %>" alt="FotoLogado">
            </div>
            <div class="flex">
                <h1><%= userLogado.getNome() %></h1> 
                <button class="edit_button" id="edit_user_info_button" onclick="openCloseModal('.modal_edit_user_info')">edit</button>
            </div>
            <div class="label">
                <h4>Email:</h4>
                <p><%= userLogado.getEmail() %></p>
            </div>
            <div class="flex-center actions_buttons">
                <button class="input_style" onclick="window.location.href='Home.jsp'">Voltar para home</button>
               <button class="input_style" onclick="window.location.href='logout.jsp'">Logout</button>

            </div>

        </div>

    </div>

    <div class="modal modal_edit_user_info hidden">
        <div class="modal_header">
            <p>Editar usuário</p>
            <button class="close" data-modal-close>X</button>
        </div>
        <div class="modal_content">
            <form class="flex" action="./Upload" name = formFoto method=post enctype="multipart/form-data">  

                <input type="hidden" name = pkuser value ="<%=pkUserLogado%>" >
                <input type="hidden" name = email value ="<%=emailLogado%>" >
                
                <div class="avatar flex-center">
                    <div class="avatar_img flex-center">
                        <img src="<%= fotoCaminho %>" alt="Avatar">
                    </div>
                    <label class="avatar_input">
                        <input type="file" class="input_style" name="arquivo" id = "arq">
                    </label>
                </div>
                <label class="new_name_label">
                    <span>Novo nome:</span>
                    <input type="text" name="" id="" class="input_style">
                </label>
                    <input type="button" value="Atualizar" class="input_style update_button" onclick=" 
                        if(formFoto.arquivo.files.length > 0){
                            submit();formreg.oper.value = 'Atualizar'; submit(); 
               } else { 
                 formreg.oper.value = 'Atualizar';
                 close();
                 exit();}
                   ">
            </form>
        </div>
    </div>

    <div id="modal_blur" class="hidden">
    </div>

 <script src="scriptGlobal.js"></script>
</body>
</html>