$(document).scroll(function() {
  if ($('.container').hasClass('league-container')) {
    if ($(document).scrollTop() > 30) {
      $('.main-header').addClass('d-none');
    }
    else {
      $('.main-header').removeClass('d-none');
    }
  }
});

