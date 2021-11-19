// const buttonListener = () => {
  const buttonDashToConfirmed = document.querySelectorAll("#confirm");
  console.log(buttonDashToConfirmed)
  buttonDashToConfirmed.addEventListener('click', (event) => {
    event.currentTarget.classList.remove('btn-warning')
    event.currentTarget.classList.add('btn-success')
  });
// };
export { buttonDashToConfirmed };
// export { buttonListener };




// const button = document.querySelector('.button-home');
// const audio = new Audio('sound.mp3');

// button.addEventListener('click', (e) => {
//   e.target.classList.add('disabled');
//   e.target.innerText = 'Bingo!';
//   audio.play();
// });
