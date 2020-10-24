$(document).on("turbolinks:load", function() {
  $("#heroSearch").keyup(function() {
    searchHero();
  });
  $("#teamSearch").keyup(function() {
    searchTeam();
  });
});
function searchHero() {
  // Declare variables
  var input, filter, li, i, txtValue;
  input = $("#heroSearch")[0];
  filter = input.value.toUpperCase();
  li = $("#heroList li");

  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < li.length; i++) {
    txtValue = li[i].textContent || li[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}

function searchTeam() {
  // Declare variables
  var input, filter, ul, li, a, i, txtValue;
  input = $("#teamSearch")[0];
  filter = input.value.toUpperCase();
  tr = $("#teamList tr td.team-name");

  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    txtValue = tr[i].textContent || tr[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      tr[i].parentElement.style.display = "";
    } else {
      tr[i].parentElement.style.display = "none";
    }
  }
}

