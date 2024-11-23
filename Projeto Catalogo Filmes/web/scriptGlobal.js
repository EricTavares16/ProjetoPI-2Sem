document.addEventListener("DOMContentLoaded", () => {
    const blur = document.querySelector("#modal_blur");
    const botaoDeFecharModal = document.querySelectorAll("[data-modal-close]");

    const openCloseModal = (modalClass, openOrClose = 1) => {
        console.log("Modal class recebida:", modalClass);
        const modalRef = document.querySelector(modalClass);
        if (modalRef && blur) {
            if (openOrClose) {
                modalRef.classList.remove("hidden");
                blur.classList.remove("hidden");
                window.scrollTo(0, 0);
            } else {
                modalRef.classList.add("hidden");
                blur.classList.add("hidden");
            }
        } else {
            console.log("Erro, modal ou blur não encontrado: ", modalClass);
        }
    };

    // Fechar modal ao clicar no botão de fechar
    botaoDeFecharModal.forEach(close => {
        close.addEventListener("click", () => {
            document.querySelectorAll(".modal").forEach(modal => {
                modal.classList.add("hidden");
            });
            blur.classList.add("hidden");
        });
    });

    // Prevenir comportamento padrão do botão dentro de formulários
    document.querySelectorAll("button").forEach(button => {
        button.addEventListener("click", (event) => {
            if (event.target.getAttribute("onclick")) {
                event.preventDefault();
            }
        });
    });

    // Torna a função `openCloseModal` acessível globalmente
    window.openCloseModal = openCloseModal;
});


function handleFileChange(event, idImgSrc) {
    const file = event.target.files[0]; 
    const preview = document.querySelector(`#${idImgSrc}`);

    if (file) {
        const reader = new FileReader();
        
        // Quando o arquivo for carregado, exibe-o na imagem de pré-visualização
        reader.onload = function(e) {
            preview.src = e.target.result;
        };
        
        reader.readAsDataURL(file); // Ler o arquivo como uma URL de dados
    }
   
}