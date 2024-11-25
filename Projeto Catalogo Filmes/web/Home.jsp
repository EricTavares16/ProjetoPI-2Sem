
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="java.util.ArrayList"%>

<% 

Usuario user = new Usuario();
Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
String nomeUser = (String) session.getAttribute("nome");

Filme filmeT = new Filme();
int idFilme = 3;

ArrayList<Filme> lista = filmeT.listarFilmes();   
 
String genero = request.getParameter("genero");
String query = request.getParameter("query");

if(query != null && !query.trim().isEmpty()){
    filmeT.setNome(query);
    lista = filmeT.listarFilmes_PorNome();
}

if(genero != null && !genero.trim().isEmpty()){
    if(genero.equalsIgnoreCase("Todos")){
        lista = filmeT.listarFilmes(); 
    }
    if(genero.equalsIgnoreCase("Romance")){
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }
    if(genero.equalsIgnoreCase("Acao")){
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }
    if(genero.equalsIgnoreCase("Aventura")){
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }
    if(genero.equalsIgnoreCase("Desenho")){
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }
    if(genero.equalsIgnoreCase("Ficcao")){
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }
 }
   
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Cinema - Cliente</title>
    <link rel="stylesheet" href="global.css">
    <link rel="stylesheet" href="home.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- DESTAQUES DA PLATAFORMA -->
    <header class="big_container flex-center" id="Destaques">
        <div class="destaques_carrossel">
            <img src="./imgs/destaque_foto.png" alt="Foto do filme destaque do sistema">
        </div>
        <div class="container">
            <a href="userPage.jsp" class="avatar_image">
                <%
                    if (userLogado == null) {
                        response.sendRedirect("login.jsp"); // Substitua "login.jsp" pela página de destino
                    }
                %>

            <img src="data:image/png;base64,<%if(userLogado.imagemBase64 != null)out.print(userLogado.imagemBase64);%>" alt="<%out.print(userLogado.email);%>">
            </a>
            <a href="Details.jsp" class="input_style btn_detalhes_destaque" onclick="window.location.href='Details.jsp?valor=<%=idFilme%>'; return false;">Detalhes</a>
        </div>
    </header>
    <main class="big_container flex-center">
        <div class="container">

            <!-- MENU DE FILTROS DO FILME -->
            <div class="cockpit_filmes flex">
                <div class="cockpit_item flex-center">
                    <form id="searchForm"  method="GET">
                        <input type="text"  id="searchInput" name="query"  placeholder="Pesquisar" class="input_style">
                    </form>
                    <a href="#" class="input_style">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="22" viewBox="0 0 18 22" fill="none">
                            <path d="M17 21L9 15.4444L1 21V3.22222C1 2.63285 1.24082 2.06762 1.66947 1.65087C2.09812 1.23413 2.67951 1 3.28571 1H14.7143C15.3205 1 15.9019 1.23413 16.3305 1.65087C16.7592 2.06762 17 2.63285 17 3.22222V21Z" stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </a>
                </div>
               <ul class="cockpit_item flex-center">
                   <form method="GET">
                        <input type="hidden" name="Todos" value="Todos">
                        <button type="submit" class="input_style filters_button">Todos</button>
                    </form>
                    <form method="GET">
                        <input type="hidden" name="genero" value="Romance">
                        <button type="submit" class="input_style filters_button">Romance</button>
                    </form>
                    <form method="GET">
                        <input type="hidden" name="genero" value="Acao">
                        <button type="submit" class="input_style filters_button">Ação</button>
                    </form>
                    <form method="GET">
                        <input type="hidden" name="genero" value="Aventura">
                        <button type="submit" class="input_style filters_button">Aventura</button>
                    </form>
                    <form method="GET">
                        <input type="hidden" name="genero" value="Desenho">
                        <button type="submit" class="input_style filters_button">Desenho</button>
                    </form>
                    <form method="GET">
                        <input type="hidden" name="genero" value="Ficcao">
                        <button type="submit" class="input_style filters_button">Ficção</button>
                    </form>
                </ul>
            </div>

            <section id="filmes_container">
                <% for(Filme filme:lista){%>
                    <div class="filme_content flex-center">
                       <img src="data:image/png;base64,<%if(filme.capaimagemBase64 != null)out.print(filme.capaimagemBase64);%>" alt="<%out.print(filme.getNome());%>"  onclick="window.location.href='Details.jsp?valor=<%=filme.getId() %>'; return false;"></img>
                    </div>
                <%}%>
                <div class="filme_content flex-center">
                    <img src="./imgs/bg_filme.png" alt="Nome do filme">
                    <button class="btn_favoritar_filme flex-center">
                        <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path id="Vector" d="M13.7965 2.05694C13.4616 1.72186 13.064 1.45605 12.6263 1.27469C12.1886 1.09334 11.7195 1 11.2457 1C10.772 1 10.3028 1.09334 9.86516 1.27469C9.42748 1.45605 9.02983 1.72186 8.6949 2.05694L7.99982 2.75202L7.30474 2.05694C6.62822 1.38042 5.71066 1.00035 4.75392 1.00035C3.79718 1.00035 2.87962 1.38042 2.2031 2.05694C1.52658 2.73345 1.14651 3.65101 1.14651 4.60775C1.14651 5.5645 1.52658 6.48206 2.2031 7.15858L2.89818 7.85366L7.99982 12.9553L13.1015 7.85366L13.7965 7.15858C14.1316 6.82365 14.3974 6.42599 14.5788 5.98832C14.7601 5.55064 14.8535 5.08152 14.8535 4.60775C14.8535 4.13399 14.7601 3.66487 14.5788 3.22719C14.3974 2.78952 14.1316 2.39186 13.7965 2.05694Z" stroke="#A411D4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>                            
                    </button>
                </div>
            </section>

        </div>
    </main>
     
    <script>
        document.getElementById('searchInput').addEventListener('keypress', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault(); // Impede o comportamento padrão do Enter
                document.getElementById('searchForm').submit(); // Submete o formulário
            }
        });
    </script>
    <script src="scriptGlobal.js"></script>
</body>
</html>