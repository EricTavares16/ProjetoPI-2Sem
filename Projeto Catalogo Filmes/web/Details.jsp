
<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="model.Comentario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  
  Filme film = new Filme();
  String idzinho = request.getParameter("valor");
  int id =  Integer.parseInt(idzinho);
  Filme FilmeBuscado = film.getFilmeById(id);
  
  String LancamentoBruto = FilmeBuscado.getDataLancamento();
  String Lancamento = LancamentoBruto.substring(0, 4);
  
  String comentInput = request.getParameter("comentario");
  
  Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado"); 

  Comentario coment = new Comentario();

  coment.setIdFilme(id);
  
  coment.setIdUser(userLogado.getPkuser());
  
  if(comentInput != null && !comentInput.trim().isEmpty()){
    coment.setComentario(comentInput);
    coment.IncluirComentario();
  }
    
  ArrayList<Comentario> listaComent = coment.listarComentarios();
  

%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=FilmeBuscado.getNome()%> - Feedback Cinema</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="./details.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="big_container flex-center" id="banner_details" style="background-image: url('data:image/png;base64,<% if (FilmeBuscado.bannerimagemBase64 != null) out.print(FilmeBuscado.bannerimagemBase64); %>');">
        <div class="gradient"></div>
        <div class="container">
            <div class="content">
                <a href="Home.jsp" class="voltar_btn input_style flex-center">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
                </a>
                <h1><%= FilmeBuscado.getNome() %> </h1>
                <div class="info_details flex">
                    <span>Documentario</span>
                    <span><%= FilmeBuscado.getAvaliacao()%></span>
                    <span><%= Lancamento%></span>
                    <span><%= FilmeBuscado.getClassificacao()%></span>
                    <span><%= FilmeBuscado.getDuracao() %></span>
                </div>
                <p><%= FilmeBuscado.getSinopse() %> </p>
                <div class="buttons_container flex">
                    <button class="favoritar input_style">Favoritar</button>
                    <a href="#comentar_no_filme" class="comentar input_style">Comentar</a>
                </div>
            </div>
        </div>
    </div>
    <main class="big_container flex-center">
        <div class="container ">

            <section id="atores_principais">
                <h1>Atores Principais</h1>
                <div class="atores_container flex">
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                    <div class="ator">
                        <img src="./imgs/foto34.png" alt="Foto do ator principal do filme">
                        <div class="details_in_hover flex">
                            <span>Steve jobs</span>
                            <h3>Michael Fassbender</h3>
                        </div>
                    </div>
                </div>
            </section>

            <section id="movie_comments" class="flex">
                <div class="comentarios">
                    <h1>Comentários</h1>
                    <div class="comentarios_container">
                        <%for(Comentario comentario:listaComent){%>
                        <div class="comentario flex">
                            <h3><%= comentario.getNomeUser() %></h3>
                            <p><%= comentario.getComentario() %></p>
                            <span><%= comentario.getDataComentario() %></span>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="form_comentarios" id="comentar_no_filme">
                    <form method="POST" class="flex">
                        <textarea class="input_style textarea_comment" name="comentario" placeholder="Digite seu comentário"></textarea>
                        <div class="flex-between w-full">
                            <input class="input_style" type="submit">
                        </div>
                    </form>
                </div>
            </section>
            
        </div>
    </main>
</body>