const blur = document.querySelector("#modal_blur");
const botaoDeFecharModal = document.querySelectorAll("[data-modal-close]");

const openCloseModal = (modalClass, openOrClose = 1) => {
    const modalRef = document.querySelector(modalClass);
    const blur = document.querySelector("#modal_blur");
    if (modalRef && blur) {
        if (openOrClose) {
            modalRef.classList.remove("hidden");
            blur.classList.remove("hidden");
            window.scrollTo(0,0)
        } else {
            modalRef.classList.add("hidden");
            blur.classList.add("hidden");
        }
    } else {
        console.log("Erro, modal ou blur não encontrado: ", modalClass)
    }
};


botaoDeFecharModal.forEach(close => {
    close.addEventListener("click", () => {
        document.querySelectorAll(".modal").forEach(modal => {
            modal.classList.add("hidden");
        });
        blur.classList.add("hidden");
        preview.src = ''; 
      preview.style.display = 'none'; 
      fileInput.value = ''; 
      removeButton.style.display = 'none'; 
    });
});


// PARA APRESENTAR A IMAGEM
const fileInput = document.getElementById('fileInput');
    const preview = document.getElementById('preview');

    // Adicionar evento de mudança ao input
    fileInput.addEventListener('change', function() {
      const file = fileInput.files[0]; // Obter o arquivo selecionado
      if (file) {
        const reader = new FileReader();

        // Quando a leitura estiver concluída, definir a fonte da imagem
        reader.onload = function(event) {
          preview.src = event.target.result; // Definir a URL da imagem
          preview.style.display = 'block'; // Tornar a imagem visível
        };

        // Ler o conteúdo do arquivo (como URL de dados)
        reader.readAsDataURL(file);
      }
    });
// Exemplo para utilizar a função de abrir modal
// botaoDeAbrirModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))
// botaoDeFecharModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))