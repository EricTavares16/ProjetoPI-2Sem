<%-- 
    Document   : favorite
    Created on : 9 de nov. de 2024, 22:05:56
    Author     : OMINI-X
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favorito : Nome do usuário</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="./favorite.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>

       <main class="big_container flex-center">
        <div class="container">


            <div class="cockpit_favorite flex">
                <div class="content flex">
                    <a href="./index.html" class="voltar_btn input_style flex-center">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
                    </a>
                    <h1>Meus favoritos</h1>
                </div>
                <a href="userPage.jsp" class="avatar_image flex-center">
                    <img src="" alt="">
                </a>
            </div>

            
            <section id="filmes_container">
                <div class="filme_content flex-center">
                    <img src="./imgs/bg_filme.png" alt="Nome do filme">
                    <button class="btn_favoritar_filme flex-center">
                        <svg width="16" height="14" viewBox="0 0 16 14" fill="#A411D4" xmlns="http://www.w3.org/2000/svg">
                            <path id="Vector" d="M13.7965 2.05694C13.4616 1.72186 13.064 1.45605 12.6263 1.27469C12.1886 1.09334 11.7195 1 11.2457 1C10.772 1 10.3028 1.09334 9.86516 1.27469C9.42748 1.45605 9.02983 1.72186 8.6949 2.05694L7.99982 2.75202L7.30474 2.05694C6.62822 1.38042 5.71066 1.00035 4.75392 1.00035C3.79718 1.00035 2.87962 1.38042 2.2031 2.05694C1.52658 2.73345 1.14651 3.65101 1.14651 4.60775C1.14651 5.5645 1.52658 6.48206 2.2031 7.15858L2.89818 7.85366L7.99982 12.9553L13.1015 7.85366L13.7965 7.15858C14.1316 6.82365 14.3974 6.42599 14.5788 5.98832C14.7601 5.55064 14.8535 5.08152 14.8535 4.60775C14.8535 4.13399 14.7601 3.66487 14.5788 3.22719C14.3974 2.78952 14.1316 2.39186 13.7965 2.05694Z" stroke="#A411D4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>                            
                    </button>
                </div>
                <div class="filme_content flex-center">
                    <img src="./imgs/bg_filme.png" alt="Nome do filme">
                    <button class="btn_favoritar_filme flex-center">
                        <svg width="16" height="14" viewBox="0 0 16 14" fill="#A411D4" xmlns="http://www.w3.org/2000/svg">
                            <path id="Vector" d="M13.7965 2.05694C13.4616 1.72186 13.064 1.45605 12.6263 1.27469C12.1886 1.09334 11.7195 1 11.2457 1C10.772 1 10.3028 1.09334 9.86516 1.27469C9.42748 1.45605 9.02983 1.72186 8.6949 2.05694L7.99982 2.75202L7.30474 2.05694C6.62822 1.38042 5.71066 1.00035 4.75392 1.00035C3.79718 1.00035 2.87962 1.38042 2.2031 2.05694C1.52658 2.73345 1.14651 3.65101 1.14651 4.60775C1.14651 5.5645 1.52658 6.48206 2.2031 7.15858L2.89818 7.85366L7.99982 12.9553L13.1015 7.85366L13.7965 7.15858C14.1316 6.82365 14.3974 6.42599 14.5788 5.98832C14.7601 5.55064 14.8535 5.08152 14.8535 4.60775C14.8535 4.13399 14.7601 3.66487 14.5788 3.22719C14.3974 2.78952 14.1316 2.39186 13.7965 2.05694Z" stroke="#A411D4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>                            
                    </button>
                </div>
                <div class="filme_content flex-center">
                    <img src="./imgs/bg_filme.png" alt="Nome do filme">
                    <button class="btn_favoritar_filme flex-center">
                        <svg width="16" height="14" viewBox="0 0 16 14" fill="#A411D4" xmlns="http://www.w3.org/2000/svg">
                            <path id="Vector" d="M13.7965 2.05694C13.4616 1.72186 13.064 1.45605 12.6263 1.27469C12.1886 1.09334 11.7195 1 11.2457 1C10.772 1 10.3028 1.09334 9.86516 1.27469C9.42748 1.45605 9.02983 1.72186 8.6949 2.05694L7.99982 2.75202L7.30474 2.05694C6.62822 1.38042 5.71066 1.00035 4.75392 1.00035C3.79718 1.00035 2.87962 1.38042 2.2031 2.05694C1.52658 2.73345 1.14651 3.65101 1.14651 4.60775C1.14651 5.5645 1.52658 6.48206 2.2031 7.15858L2.89818 7.85366L7.99982 12.9553L13.1015 7.85366L13.7965 7.15858C14.1316 6.82365 14.3974 6.42599 14.5788 5.98832C14.7601 5.55064 14.8535 5.08152 14.8535 4.60775C14.8535 4.13399 14.7601 3.66487 14.5788 3.22719C14.3974 2.78952 14.1316 2.39186 13.7965 2.05694Z" stroke="#A411D4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>                            
                    </button>
                </div>
                <div class="filme_content flex-center">
                    <img src="./imgs/bg_filme.png" alt="Nome do filme">
                    <button class="btn_favoritar_filme flex-center">
                        <svg width="16" height="14" viewBox="0 0 16 14" fill="#A411D4" xmlns="http://www.w3.org/2000/svg">
                            <path id="Vector" d="M13.7965 2.05694C13.4616 1.72186 13.064 1.45605 12.6263 1.27469C12.1886 1.09334 11.7195 1 11.2457 1C10.772 1 10.3028 1.09334 9.86516 1.27469C9.42748 1.45605 9.02983 1.72186 8.6949 2.05694L7.99982 2.75202L7.30474 2.05694C6.62822 1.38042 5.71066 1.00035 4.75392 1.00035C3.79718 1.00035 2.87962 1.38042 2.2031 2.05694C1.52658 2.73345 1.14651 3.65101 1.14651 4.60775C1.14651 5.5645 1.52658 6.48206 2.2031 7.15858L2.89818 7.85366L7.99982 12.9553L13.1015 7.85366L13.7965 7.15858C14.1316 6.82365 14.3974 6.42599 14.5788 5.98832C14.7601 5.55064 14.8535 5.08152 14.8535 4.60775C14.8535 4.13399 14.7601 3.66487 14.5788 3.22719C14.3974 2.78952 14.1316 2.39186 13.7965 2.05694Z" stroke="#A411D4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>                            
                    </button>
                </div>
            </section>
            
        </div>
    </main>

    <script src="scriptGlobal.js"></script>
    <script src="./favorite.js"></script>
</body>
</html>