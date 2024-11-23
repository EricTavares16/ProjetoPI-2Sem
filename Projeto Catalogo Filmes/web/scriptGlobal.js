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

function inputClearorNot(event){
    
    console.log(event);
    console.log(event.target);
    let input = document.getElementById( event.target.id);
    console.log(input.value);
    if(input.value != null){
        input.value = "";
    }else{
        input.value;
    }
}

// const blur = document.querySelector("#modal_blur");
// const botaoDeFecharModal = document.querySelectorAll("[data-modal-close]");

// const openCloseModal = (modalClass, openOrClose = 1) => {
//     const modalRef = document.querySelector(modalClass);
//     const blur = document.querySelector("#modal_blur");
//     if (modalRef && blur) {
//         if (openOrClose) {
//             modalRef.classList.remove("hidden");
//             blur.classList.remove("hidden");
//             window.scrollTo(0,0)
//         } else {
//             modalRef.classList.add("hidden");
//             blur.classList.add("hidden");
//         }
//     } else {
//         console.log("Erro, modal ou blur não encontrado: ", modalClass)
//     }
// };
// botaoDeFecharModal.forEach(close => {
//     close.addEventListener("click", () => {
//         document.querySelectorAll(".modal").forEach(modal => {
//             modal.classList.add("hidden");
//         });
//         blur.classList.add("hidden");
//         preview.src = ''; 
//        preview.style.display = 'none'; 
//       fileInput.value = ''; 
//       removeButton.style.display = 'none'; 
//     });
// });


// function handleFileChange(event) {
//     const id = event.target.dataset.id;
//     const file = event.target.files[0]; // Obter o primeiro arquivo selecionado
//     const preview = document.getElementById(`imagePreview`);

//     if (file) {
//         const reader = new FileReader();
        
//         // Quando o arquivo for carregado, exibe-o na imagem de pré-visualização
//         reader.onload = function(e) {
//             preview.src = e.target.result;
//         };
        
//         reader.readAsDataURL(file); // Ler o arquivo como uma URL de dados
//     }
   
// }
// Exemplo para utilizar a função de abrir modal
// botaoDeAbrirModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))
// botaoDeFecharModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))