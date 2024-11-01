const blur = document.querySelector("#modal_blur")
const botaoDeFecharModal = document.querySelectorAll("[data-modal-close]")
const arrModais = document.querySelectorAll(".modal")

const openCloseModal = (modalClass, openOrClose = 1) => {
    const modalRef = document.querySelector(modalClass)
    if(openOrClose){
        modalRef.classList.remove("hidden")
        blur.classList.remove("hidden")
    }else{
        modalRef.classList.add("hidden")
        blur.classList.add("hidden")
    }
}

botaoDeFecharModal.forEach(close =>{
    close.addEventListener("click", ()=> {
        arrModais.forEach(modal =>{
            const arrClass = modal.className.split(" ")
            openCloseModal(`.${arrClass[1]}`, 0)
        })
    })
})


// Exemplo para utilizar a função de abrir modal
// botaoDeAbrirModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))
// botaoDeFecharModal.addEventListener("click", ()=> openCloseModal(nomeVariavelModal))