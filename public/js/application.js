$(document).ready(function() {
  $(".player-reroll").on("click", function(e){
    e.preventDefault();
    var response = $.ajax({
      url: "/add_todo",
      type: "get"
    })
    ajax.done(function(data){
      alert("good job");
    })
    ajax.fail(function(data){
      alert("fuuuuuuuuu");
    })
});