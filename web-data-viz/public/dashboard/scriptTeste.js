// Captura elementos HTML
const addContentBtn = document.getElementById("addContentBtn");
const contentSection = document.getElementById("contentSection");
const modal = document.getElementById("myModal");
const closeModalBtn = document.getElementsByClassName("close")[0];
const confirmAddBtn = document.getElementById("confirmAddBtn");
const newContentInput1 = document.getElementById("newContentNumMaquina");
const newContentInput2 = document.getElementById("newContentTipoChoc");

// Adiciona evento de clique ao botão "Adicionar Div"
addContentBtn.addEventListener("click", function() {
  modal.style.display = "block"; // Exibe o modal ao clicar no botão
});

// Fecha o modal ao clicar no botão de fechar
closeModalBtn.addEventListener("click", function() {
  modal.style.display = "none";
});

// Fecha o modal ao clicar fora dele
window.addEventListener("click", function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
});

// Adiciona um novo conteúdo ao confirmar no modal
confirmAddBtn.addEventListener("click", function() {
  const newDiv = document.createElement("div"); // Cria uma nova div
  
  // Define o conteúdo da div como uma concatenação das duas informações
  newDiv.innerHTML = "Máquina: " + newContentInput1.value + "<br> Tipo de Chocolate: " + newContentInput2.value ;
//   newDiv.textContent = "Máquina: " + newContentInput1.value +  " Tipo de Chocolate: " + newContentInput2.value;

  contentSection.appendChild(newDiv); // Adiciona a div à seção de conteúdo
  modal.style.display = "none"; // Fecha o modal
});
