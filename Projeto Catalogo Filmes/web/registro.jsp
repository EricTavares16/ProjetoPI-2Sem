<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario user = new Usuario(); // Instancia o objeto Usuario 

 
 // preenche os atributos do objeto usuario
    String senhas = request.getParameter("senha");
    String rpsenhas = request.getParameter("rpsenha");
    String buttonval = request.getParameter("oper");
    String sHTML = "";
    
    if(senhas != null && rpsenhas != null && senhas.equals(rpsenhas) && "1".equals(buttonval)){
        user.nome = request.getParameter("nome");
        user.email = request.getParameter("email");
        user.senha = senhas;
        if (buttonval.equals("1")) {
        if (user.buscarEmail()) {
            sHTML = "<br><br><center>Usuário alterado com Sucesso!<br>"
                    + "<a href = './login.jsp'> Voltar </a></center>";
        } else {
            user.incluir();
            sHTML = "<br><br><center>Usuário criado com Sucesso!<br>"
                    + "<a href = './login.jsp'> Voltar </a></center>";
        }
    }   
    sHTML = user.statusSQL;out.print(sHTML);
        
        if(user.getLogin() == true){
            response.sendRedirect("login.jsp");
        }
    }else if ("1".equals(buttonval)){
    sHTML = "<br><br><center><div class=\" popup-erro\">Erro! senha Invalida!<br>"
                    + "</center>";
    out.print(sHTML);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <title> Cadastro de Usuários </title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="Login.css">
    <link rel="stylesheet" href="global.css">
</head>

<body>
    <main class="main flex-center formularioLogin container">
        <div class="SenacBusterLogin flex-center"> <!--LOGO-->
            <svg width="184" height="69" viewBox="0 0 184 69" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M69.47 32.352C67.5713 32.352 65.918 32.064 64.51 31.488C63.1233 30.912 61.854 30.0053 60.702 28.768L64.318 25.12C65.1073 25.952 65.95 26.592 66.846 27.04C67.742 27.4667 68.7553 27.68 69.886 27.68C70.846 27.68 71.582 27.52 72.094 27.2C72.6273 26.8587 72.894 26.4 72.894 25.824C72.894 25.2907 72.702 24.8533 72.318 24.512C71.934 24.1493 71.422 23.84 70.782 23.584C70.1633 23.3067 69.47 23.0507 68.702 22.816C67.9553 22.56 67.198 22.2613 66.43 21.92C65.6833 21.5573 64.99 21.12 64.35 20.608C63.7313 20.096 63.23 19.456 62.846 18.688C62.462 17.92 62.27 16.9707 62.27 15.84C62.27 14.3893 62.6113 13.152 63.294 12.128C63.998 11.104 64.9686 10.3147 66.206 9.76C67.4433 9.20533 68.8833 8.928 70.526 8.928C72.1686 8.928 73.6833 9.20533 75.07 9.76C76.4566 10.3147 77.598 11.0827 78.494 12.064L74.846 15.68C74.1633 14.9973 73.47 14.4853 72.766 14.144C72.062 13.8027 71.294 13.632 70.462 13.632C69.6726 13.632 69.054 13.7707 68.606 14.048C68.158 14.3253 67.934 14.72 67.934 15.232C67.934 15.744 68.126 16.16 68.51 16.48C68.894 16.8 69.3953 17.088 70.014 17.344C70.654 17.5787 71.3473 17.824 72.094 18.08C72.862 18.336 73.6193 18.6347 74.366 18.976C75.1126 19.3173 75.7953 19.7547 76.414 20.288C77.054 20.8213 77.566 21.4933 77.95 22.304C78.334 23.1147 78.526 24.096 78.526 25.248C78.526 27.5093 77.726 29.2587 76.126 30.496C74.5473 31.7333 72.3286 32.352 69.47 32.352ZM81.4285 32V9.312H87.1565V32H81.4285ZM85.9725 32V27.168H98.2605V32H85.9725ZM85.9725 22.784V18.08H97.1085V22.784H85.9725ZM85.9725 14.144V9.312H98.0685V14.144H85.9725ZM101.491 32V9.312H105.491L107.219 13.952V32H101.491ZM117.139 32L103.891 15.168L105.491 9.312L118.771 26.144L117.139 32ZM117.139 32L115.667 27.232V9.312H121.395V32H117.139ZM123.764 32L132.564 9.312H138.1L146.804 32H140.82L134.26 12.928H136.34L129.62 32H123.764ZM129.108 28.032V23.488H141.62V28.032H129.108ZM158.78 32.352C157.052 32.352 155.452 32.064 153.98 31.488C152.508 30.8907 151.218 30.0693 150.108 29.024C149.02 27.9573 148.167 26.7093 147.548 25.28C146.951 23.8507 146.652 22.304 146.652 20.64C146.652 18.9547 146.951 17.408 147.548 16C148.167 14.5707 149.02 13.3333 150.108 12.288C151.218 11.2427 152.498 10.4213 153.948 9.824C155.42 9.22667 157.01 8.928 158.716 8.928C160.508 8.928 162.119 9.216 163.548 9.792C164.978 10.3467 166.236 11.1253 167.324 12.128L163.484 15.968C162.951 15.3707 162.29 14.9013 161.5 14.56C160.711 14.2187 159.783 14.048 158.716 14.048C157.799 14.048 156.956 14.1973 156.188 14.496C155.442 14.7947 154.791 15.2427 154.236 15.84C153.682 16.416 153.244 17.1093 152.924 17.92C152.626 18.7307 152.476 19.6373 152.476 20.64C152.476 21.6427 152.626 22.5493 152.924 23.36C153.244 24.1707 153.682 24.8747 154.236 25.472C154.791 26.048 155.442 26.496 156.188 26.816C156.956 27.1147 157.799 27.264 158.716 27.264C159.783 27.264 160.722 27.104 161.532 26.784C162.343 26.4427 163.036 25.9627 163.612 25.344L167.452 29.184C166.343 30.1867 165.084 30.9653 163.676 31.52C162.29 32.0747 160.658 32.352 158.78 32.352Z" fill="white"/>
                <path d="M65.91 61V56.744H70.646C71.542 56.744 72.246 56.4987 72.758 56.008C73.2913 55.496 73.558 54.8347 73.558 54.024C73.558 53.4907 73.4406 53.0213 73.206 52.616C72.9713 52.1893 72.63 51.8693 72.182 51.656C71.7553 51.4213 71.2433 51.304 70.646 51.304H65.91V47.176H70.294C71.0406 47.176 71.6486 46.9947 72.118 46.632C72.6086 46.248 72.854 45.6613 72.854 44.872C72.854 44.0827 72.6086 43.5067 72.118 43.144C71.6486 42.76 71.0406 42.568 70.294 42.568H65.91V38.312H71.67C73.078 38.312 74.294 38.5787 75.318 39.112C76.3633 39.6453 77.1633 40.36 77.718 41.256C78.2726 42.152 78.55 43.1653 78.55 44.296C78.55 45.8107 78.0273 47.0693 76.982 48.072C75.958 49.0533 74.4646 49.6613 72.502 49.896V47.976C74.678 48.232 76.342 48.936 77.494 50.088C78.646 51.2187 79.222 52.648 79.222 54.376C79.222 55.656 78.902 56.7973 78.262 57.8C77.622 58.7813 76.7153 59.56 75.542 60.136C74.39 60.712 73.0246 61 71.446 61H65.91ZM61.366 61V38.312H66.998V61H61.366ZM91.5225 61.352C89.6025 61.352 87.9065 60.9573 86.4345 60.168C84.9838 59.3573 83.8531 58.2373 83.0425 56.808C82.2318 55.3787 81.8265 53.7573 81.8265 51.944V38.312H87.5225V52.36C87.5225 53.1707 87.6931 53.8747 88.0345 54.472C88.3971 55.048 88.8771 55.496 89.4745 55.816C90.0931 56.1147 90.7758 56.264 91.5225 56.264C92.2905 56.264 92.9625 56.1147 93.5385 55.816C94.1145 55.496 94.5731 55.048 94.9145 54.472C95.2558 53.896 95.4265 53.2027 95.4265 52.392V38.312H101.186V51.976C101.186 53.7893 100.781 55.4107 99.9705 56.84C99.1598 58.248 98.0291 59.3573 96.5785 60.168C95.1491 60.9573 93.4638 61.352 91.5225 61.352ZM111.689 61.352C109.79 61.352 108.137 61.064 106.729 60.488C105.342 59.912 104.073 59.0053 102.921 57.768L106.537 54.12C107.326 54.952 108.169 55.592 109.065 56.04C109.961 56.4667 110.974 56.68 112.105 56.68C113.065 56.68 113.801 56.52 114.313 56.2C114.846 55.8587 115.113 55.4 115.113 54.824C115.113 54.2907 114.921 53.8533 114.537 53.512C114.153 53.1493 113.641 52.84 113.001 52.584C112.382 52.3067 111.689 52.0507 110.921 51.816C110.174 51.56 109.417 51.2613 108.649 50.92C107.902 50.5573 107.209 50.12 106.569 49.608C105.95 49.096 105.449 48.456 105.065 47.688C104.681 46.92 104.489 45.9707 104.489 44.84C104.489 43.3893 104.83 42.152 105.513 41.128C106.217 40.104 107.187 39.3147 108.425 38.76C109.662 38.2053 111.102 37.928 112.745 37.928C114.387 37.928 115.902 38.2053 117.289 38.76C118.675 39.3147 119.817 40.0827 120.713 41.064L117.065 44.68C116.382 43.9973 115.689 43.4853 114.985 43.144C114.281 42.8027 113.513 42.632 112.681 42.632C111.891 42.632 111.273 42.7707 110.825 43.048C110.377 43.3253 110.153 43.72 110.153 44.232C110.153 44.744 110.345 45.16 110.729 45.48C111.113 45.8 111.614 46.088 112.233 46.344C112.873 46.5787 113.566 46.824 114.313 47.08C115.081 47.336 115.838 47.6347 116.585 47.976C117.331 48.3173 118.014 48.7547 118.633 49.288C119.273 49.8213 119.785 50.4933 120.169 51.304C120.553 52.1147 120.745 53.096 120.745 54.248C120.745 56.5093 119.945 58.2587 118.345 59.496C116.766 60.7333 114.547 61.352 111.689 61.352ZM128.37 61V38.472H134.098V61H128.37ZM121.426 43.24V38.312H141.042V43.24H121.426ZM143.647 61V38.312H149.375V61H143.647ZM148.191 61V56.168H160.479V61H148.191ZM148.191 51.784V47.08H159.327V51.784H148.191ZM148.191 43.144V38.312H160.287V43.144H148.191ZM168.254 51.816V47.72H172.574C173.512 47.72 174.227 47.496 174.718 47.048C175.23 46.5787 175.486 45.9493 175.486 45.16C175.486 44.392 175.23 43.7733 174.718 43.304C174.227 42.8133 173.512 42.568 172.574 42.568H168.254V38.312H173.374C174.91 38.312 176.254 38.6 177.406 39.176C178.579 39.752 179.496 40.5413 180.158 41.544C180.819 42.5467 181.15 43.72 181.15 45.064C181.15 46.408 180.808 47.592 180.126 48.616C179.464 49.6187 178.536 50.408 177.342 50.984C176.147 51.5387 174.75 51.816 173.15 51.816H168.254ZM163.71 61V38.312H169.438V61H163.71ZM175.998 61L169.406 51.272L174.558 50.024L182.622 61H175.998Z" fill="white"/>
                <path d="M65.91 61V56.744H70.646C71.542 56.744 72.246 56.4987 72.758 56.008C73.2913 55.496 73.558 54.8347 73.558 54.024C73.558 53.4907 73.4406 53.0213 73.206 52.616C72.9713 52.1893 72.63 51.8693 72.182 51.656C71.7553 51.4213 71.2433 51.304 70.646 51.304H65.91V47.176H70.294C71.0406 47.176 71.6486 46.9947 72.118 46.632C72.6086 46.248 72.854 45.6613 72.854 44.872C72.854 44.0827 72.6086 43.5067 72.118 43.144C71.6486 42.76 71.0406 42.568 70.294 42.568H65.91V38.312H71.67C73.078 38.312 74.294 38.5787 75.318 39.112C76.3633 39.6453 77.1633 40.36 77.718 41.256C78.2726 42.152 78.55 43.1653 78.55 44.296C78.55 45.8107 78.0273 47.0693 76.982 48.072C75.958 49.0533 74.4646 49.6613 72.502 49.896V47.976C74.678 48.232 76.342 48.936 77.494 50.088C78.646 51.2187 79.222 52.648 79.222 54.376C79.222 55.656 78.902 56.7973 78.262 57.8C77.622 58.7813 76.7153 59.56 75.542 60.136C74.39 60.712 73.0246 61 71.446 61H65.91ZM61.366 61V38.312H66.998V61H61.366ZM91.5225 61.352C89.6025 61.352 87.9065 60.9573 86.4345 60.168C84.9838 59.3573 83.8531 58.2373 83.0425 56.808C82.2318 55.3787 81.8265 53.7573 81.8265 51.944V38.312H87.5225V52.36C87.5225 53.1707 87.6931 53.8747 88.0345 54.472C88.3971 55.048 88.8771 55.496 89.4745 55.816C90.0931 56.1147 90.7758 56.264 91.5225 56.264C92.2905 56.264 92.9625 56.1147 93.5385 55.816C94.1145 55.496 94.5731 55.048 94.9145 54.472C95.2558 53.896 95.4265 53.2027 95.4265 52.392V38.312H101.186V51.976C101.186 53.7893 100.781 55.4107 99.9705 56.84C99.1598 58.248 98.0291 59.3573 96.5785 60.168C95.1491 60.9573 93.4638 61.352 91.5225 61.352ZM111.689 61.352C109.79 61.352 108.137 61.064 106.729 60.488C105.342 59.912 104.073 59.0053 102.921 57.768L106.537 54.12C107.326 54.952 108.169 55.592 109.065 56.04C109.961 56.4667 110.974 56.68 112.105 56.68C113.065 56.68 113.801 56.52 114.313 56.2C114.846 55.8587 115.113 55.4 115.113 54.824C115.113 54.2907 114.921 53.8533 114.537 53.512C114.153 53.1493 113.641 52.84 113.001 52.584C112.382 52.3067 111.689 52.0507 110.921 51.816C110.174 51.56 109.417 51.2613 108.649 50.92C107.902 50.5573 107.209 50.12 106.569 49.608C105.95 49.096 105.449 48.456 105.065 47.688C104.681 46.92 104.489 45.9707 104.489 44.84C104.489 43.3893 104.83 42.152 105.513 41.128C106.217 40.104 107.187 39.3147 108.425 38.76C109.662 38.2053 111.102 37.928 112.745 37.928C114.387 37.928 115.902 38.2053 117.289 38.76C118.675 39.3147 119.817 40.0827 120.713 41.064L117.065 44.68C116.382 43.9973 115.689 43.4853 114.985 43.144C114.281 42.8027 113.513 42.632 112.681 42.632C111.891 42.632 111.273 42.7707 110.825 43.048C110.377 43.3253 110.153 43.72 110.153 44.232C110.153 44.744 110.345 45.16 110.729 45.48C111.113 45.8 111.614 46.088 112.233 46.344C112.873 46.5787 113.566 46.824 114.313 47.08C115.081 47.336 115.838 47.6347 116.585 47.976C117.331 48.3173 118.014 48.7547 118.633 49.288C119.273 49.8213 119.785 50.4933 120.169 51.304C120.553 52.1147 120.745 53.096 120.745 54.248C120.745 56.5093 119.945 58.2587 118.345 59.496C116.766 60.7333 114.547 61.352 111.689 61.352ZM128.37 61V38.472H134.098V61H128.37ZM121.426 43.24V38.312H141.042V43.24H121.426ZM143.647 61V38.312H149.375V61H143.647ZM148.191 61V56.168H160.479V61H148.191ZM148.191 51.784V47.08H159.327V51.784H148.191ZM148.191 43.144V38.312H160.287V43.144H148.191ZM168.254 51.816V47.72H172.574C173.512 47.72 174.227 47.496 174.718 47.048C175.23 46.5787 175.486 45.9493 175.486 45.16C175.486 44.392 175.23 43.7733 174.718 43.304C174.227 42.8133 173.512 42.568 172.574 42.568H168.254V38.312H173.374C174.91 38.312 176.254 38.6 177.406 39.176C178.579 39.752 179.496 40.5413 180.158 41.544C180.819 42.5467 181.15 43.72 181.15 45.064C181.15 46.408 180.808 47.592 180.126 48.616C179.464 49.6187 178.536 50.408 177.342 50.984C176.147 51.5387 174.75 51.816 173.15 51.816H168.254ZM163.71 61V38.312H169.438V61H163.71ZM175.998 61L169.406 51.272L174.558 50.024L182.622 61H175.998Z" fill="url(#paint0_linear_196_156)"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M4.7 16.473C4.7 14.9415 5.94151 13.7 7.473 13.7H11.75V20.75H4.7V16.473ZM4.7 25.45H11.75V32.5H4.7V25.45ZM0 16.473V23.1V34.85V46.6V53.227C0 57.3542 3.34577 60.7 7.473 60.7H14.1H37.6H44.227C48.3542 60.7 51.7 57.3542 51.7 53.227V46.6V34.85V23.1V16.473C51.7 12.3458 48.3542 9 44.227 9H37.6H14.1H7.473C3.34578 9 0 12.3458 0 16.473ZM47 20.75V16.473C47 14.9415 45.7585 13.7 44.227 13.7H39.95V20.75H47ZM39.95 25.45H47V32.5H39.95V25.45ZM35.25 23.1V13.7H16.45L16.45 23.1L16.45 32.5H35.25V23.1ZM47 37.2V44.25H39.95V37.2H47ZM47 48.95H39.95V56H44.227C45.7585 56 47 54.7585 47 53.227V48.95ZM35.25 37.2V46.6V56H16.45L16.45 46.6L16.45 37.2H35.25ZM4.7 48.95V53.227C4.7 54.7585 5.94151 56 7.473 56H11.75V48.95H4.7ZM11.75 44.25H4.7V37.2H11.75V44.25Z" fill="url(#paint1_linear_196_156)"/>
                <defs>
                <linearGradient id="paint0_linear_196_156" x1="104.35" y1="29" x2="112.35" y2="61" gradientUnits="userSpaceOnUse">
                <stop stop-color="#F4DB4B"/>
                <stop offset="1" stop-color="#CBAE0C"/>
                </linearGradient>
                <linearGradient id="paint1_linear_196_156" x1="-10.9432" y1="34.85" x2="61.6091" y2="34.85" gradientUnits="userSpaceOnUse">
                <stop stop-color="#C648EF"/>
                <stop offset="1" stop-color="#8501B0"/>
                </linearGradient>
                </defs>
                </svg> 
        </div>
        <div class="form_content">
            <div class="titulo">
                <h2>Cadastrar</h2>
            </div>

            <form action="registro.jsp" name=formreg method="get" class="form_container gap">

                <label>
                    <input class="input_style" type="hidden" name=oper id="idoper">
                </label>
                <label class="input_style input_style_icon"> <!-- LABEL REFERENTE AO NOME -->
                    <div class="input_icon  flex-center">
                        <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M15 16.875V15.125C15 14.1967 14.6313 13.3065 13.9749 12.6501C13.3185 11.9937 12.4283 11.625 11.5 11.625H4.5C3.57174 11.625 2.6815 11.9937 2.02513 12.6501C1.36875 13.3065 1 14.1967 1 15.125V16.875"
                                stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M8 8.125C9.933 8.125 11.5 6.558 11.5 4.625C11.5 2.692 9.933 1.125 8 1.125C6.067 1.125 4.5 2.692 4.5 4.625C4.5 6.558 6.067 8.125 8 8.125Z"
                                stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </div>
                    <input class="input_test" type="text" name=nome placeholder="Nome" required>
                </label>
                <label class="input_style input_style_icon"> <!-- LABEL REFERENTE AO EMAIL-->
                    <div class="input_icon  flex-center">
                        <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M15 16.875V15.125C15 14.1967 14.6313 13.3065 13.9749 12.6501C13.3185 11.9937 12.4283 11.625 11.5 11.625H4.5C3.57174 11.625 2.6815 11.9937 2.02513 12.6501C1.36875 13.3065 1 14.1967 1 15.125V16.875"
                                stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M8 8.125C9.933 8.125 11.5 6.558 11.5 4.625C11.5 2.692 9.933 1.125 8 1.125C6.067 1.125 4.5 2.692 4.5 4.625C4.5 6.558 6.067 8.125 8 8.125Z"
                                stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </div>
                    <input class="input_test" type="text" name=email placeholder="E-mail" required>
                </label>
                <label class="input_style input_style_icon"> <!-- LABEL REFERENTE A SENHA-->
                    <div class="input_icon  flex-center">
                        <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M13.4444 8H2.55556C1.69645 8 1 8.69645 1 9.55556V15C1 15.8591 1.69645 16.5556 2.55556 16.5556H13.4444C14.3036 16.5556 15 15.8591 15 15V9.55556C15 8.69645 14.3036 8 13.4444 8Z"
                                stroke="#665E66" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M4.11108 8V4.88889C4.11108 3.85749 4.52081 2.86834 5.25011 2.13903C5.97942 1.40972 6.96858 1 7.99997 1C9.03137 1 10.0205 1.40972 10.7498 2.13903C11.4791 2.86834 11.8889 3.85749 11.8889 4.88889V8"
                                stroke="#665E66" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </div>
                    <input class="input_style" type="password" name=senha placeholder="Senha" required>
                </label>
                <label class="input_style input_style_icon"> <!-- LABEL REFERENTE AO "REPITA SUA SENHA"-->
                    <div class="input_icon  flex-center">
                        <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M13.4444 8H2.55556C1.69645 8 1 8.69645 1 9.55556V15C1 15.8591 1.69645 16.5556 2.55556 16.5556H13.4444C14.3036 16.5556 15 15.8591 15 15V9.55556C15 8.69645 14.3036 8 13.4444 8Z"
                                stroke="#665E66" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M4.11108 8V4.88889C4.11108 3.85749 4.52081 2.86834 5.25011 2.13903C5.97942 1.40972 6.96858 1 7.99997 1C9.03137 1 10.0205 1.40972 10.7498 2.13903C11.4791 2.86834 11.8889 3.85749 11.8889 4.88889V8"
                                stroke="#665E66" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </div>
                    <input class="input_style" type="password" name=rpsenha placeholder="Repita sua senha" required>
                </label>

                <input class="input_style botaoLogin" type="submit" value="Enviar" onclick="formreg.oper.value = '1';">

                <hr class="linhaLogin">

                <!--<input class="input_style" type="submit" value="Enviar" name="Enviar"
                    onclick="formreg.oper.value = '1';"> -->
                <ul class="fazerCadastro">
                    <p>Ja tem login? <a class="Cadastrar" href="login.jsp">Entrar</a></p>
                </ul>

            </form>
        </div>
    </main>
</body>

</html>