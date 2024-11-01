
<%@page import="model.Usuario"%>
<%Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P�gina do usu�rio: nome do usu�rio</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="userPage.css">
</head>
<body>
    <div class="container flex-center">

        <div class="user_content flex-center">

            <div class="avatar_container flex-center">
                <img src="" alt="">
            </div>
            <div class="flex">
                <h1><%= userLogado.getNome() %></h1> 
                <button class="edit_button" id="edit_user_info_button">edit</button>
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
            <p>Editar usu�rio</p>
            <button class="close">X</button>
        </div>
        <div class="modal_content">
            <form class="flex">  
                <div class="avatar flex-center">
                    <div class="avatar_img flex-center">
                        <img src="" alt="Avatar">
                    </div>
                    <label class="avatar_input">
                        <input type="file" class="input_style">
                    </label>
                </div>
                <label class="new_name_label">
                    <span>Novo nome:</span>
                    <input type="text" name="" id="" class="input_style">
                </label>
                <input type="submit" value="Atualizar" class="input_style update_button">
            </form>
        </div>
    </div>

    <div id="modal_blur" class="hidden">
    </div>

    <script src="./userPage.js"></script>
</body>
</html>