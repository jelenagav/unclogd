
// Login

if (document.querySelector('.pages.home')) {
  document.getElementById('login').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.login').style.display = 'flex';

  });


  document.querySelector('.login .close').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.login').style.display = 'none';
  });


  // Signup

  document.getElementById('signup').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.signup').style.display = 'flex';

  });


  document.querySelector('.signup .close').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.signup').style.display = 'none';
  });

}
