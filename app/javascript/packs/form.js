if(document.querySelector('.pages.home')) {

// Login

  document.querySelector('#login').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.login').style.display = 'flex';

  });


  document.querySelector('.close').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.login').style.display = 'none';
  });


// Signup

  document.querySelector('#signup').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.signup').style.display = 'flex';

  });


  document.querySelector('.close').addEventListener('click', function(event) {
    event.preventDefault()
    document.querySelector('.bg-modal.signup').style.display = 'none';
  });
}

