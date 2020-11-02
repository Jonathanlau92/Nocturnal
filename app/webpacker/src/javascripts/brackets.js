$(document).on("turbolinks:load", function() {
  $(".tournament-bracket__match").mouseenter(function(){
    length = $(this)[0].classList.length;
    $("." + $(this)[0].classList[length-1]).addClass('hover');
  })
  $(".tournament-bracket__match").mouseleave(function(){
    length = $(this)[0].classList.length;
    $("." + $(this)[0].classList[length-1]).removeClass('hover');
  })
})
