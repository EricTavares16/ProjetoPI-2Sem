(function(){
    const editButton = document.querySelector(".edit_button")
    const buttonCloseModal = document.querySelector(".modal .close")
    const modalEditUser = document.querySelector(".modal_edit_user_info")
    const blur = document.querySelector("#modal_blur")
    
    const openCloseModal = (modalRef)=>{
        modalEditUser.classList.toggle("hidden")
        if(modalEditUser.classList.contains("hidden")){
            blur.classList.toggle("hidden")
        }else{
            blur.classList.toggle("hidden")
        }
    }
    editButton.addEventListener("click", openCloseModal)
    buttonCloseModal.addEventListener("click", openCloseModal)

})()