$(document).scroll(function() {
	console.log("HEYYO: ", $('.container').hasClass('league-container'))
  if ($('.container').hasClass('league-container')) {
    if ($(document).scrollTop() > 30) {
      $('.main-header').addClass('d-none');
    }
    else {
      $('.main-header').removeClass('d-none');
    }
  }
});

