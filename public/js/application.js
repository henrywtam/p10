$(document).ready(function() {
  $(".player-reroll").on("click", function(e){
    console.log("after click");
    console.log(e)
    var player_id = parseInt(e.target.pathname.match(/\d+/)[0])
    console.log(player_id)
    e.preventDefault();
    var ajax = $.ajax({
      url: e.target.pathname,
      type: "get",
      data: {id: player_id}
    })
    console.log("after ajax");
    ajax.done(function(data){
      console.log("in done");
      console.log(data)
      alert("You got a new batch!");
      replaceYourBatch(data);
    })
    ajax.fail(function(){
      console.log("in fail");
      alert("fuuuuuuuuu");
    })
  })
});

function replaceYourBatch(array) {
  var $location = $(".your-pokemon")
  $location.empty()
  $location.append("<h2>Your Pokemon</h2>")
  for(var i=0;i<array.length;i++){
    var link = "<div><a href=\"/pokemon/"+array[i].id.toString()+"\">"+array[i].name+"</a></div>"
    $location.append(link)
  }
}
