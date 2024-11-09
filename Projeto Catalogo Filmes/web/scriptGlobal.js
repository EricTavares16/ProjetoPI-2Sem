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
    });
});



// Exemplo para utilizar a função de abrir modal
// botaoDeAbrirModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))
// botaoDeFecharModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))