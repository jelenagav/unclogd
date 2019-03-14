const initFlash = () => {

  const flashButton = document.querySelector("#flash-button");

  if (!flashButton){
    return false;
  }

  const flashScreen = document.querySelector(".flash-screen");

  flashButton.addEventListener("click", () => {
    flashScreen.addEventListener("transitionend", () => {
      flashScreen.remove();
    });
    flashScreen.classList.add("disappear");
  });
}

initFlash();
