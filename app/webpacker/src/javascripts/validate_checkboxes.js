$(document).on("turbolinks:load", function() {
  $("input.checkbox-form").on("click", function(){
    if ($('.checkbox-form:checked').length >= 5) {
      event.preventDefault();
      alert("You have selected more than 4 heroes. Please unchecked before adding.")
    }
  })
})
