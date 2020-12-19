$(document).on("turbolinks:load", function() {
  $('[data-tooltip="tooltip"]').tooltip();

  if ($('.container').hasClass('league-container')) {
    var navbarHeight = $('.main-header').outerHeight();

    $('.main-header').removeClass("sticky-top");
    $(window).scroll(function(event){
      $('.subheader').css("top", Math.max(0, navbarHeight - $(window)[0].scrollY));
    });
  }

  setTimeout(function(){
    $('.flash-messages').slideUp(500);
  }, 3000);
});
