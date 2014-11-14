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
      alert("You got a new batch!");
      replaceYourBatch(data);
    })
    ajax.fail(function(){
      alert("fuuuuuuuuu");
    })
  })

  // $(".pokemon-next").on("click", function(e){
  //   console.log(e);
  //   var pokemon_id = parseInt(e.target.pathname.match(/\d+/)[0]);
  //   e.preventDefault();
  //   var ajax = $.ajax({
  //     url: e.target.pathname,
  //     type: "get",
  //     data: {id: pokemon_id}
  //   })
  //   ajax.done(function(data){
  //     console.log(data);
  //     replaceYourPokemon(data)
  //   })
  // })
});

// function replaceYourPokemon(obj) {
//   var $pic_location = $(".pokemon-portrait")
//   $pic_location.empty()
//   pic_link = "<img class=\"home-image\" src=\"http://img.pokemondb.net/artwork/"+obj.name.toLowerCase()+".jpg\"/></div></p>"
//   $pic_location.append(pic_link)
//   var $prof_location = $(".pokemon-profile")
//   $prof_location.empty()
//   prof_link = "<br><h2>Name: "+obj.name+"</h2><h4>Number: "+obj.pkdx_id.toString()+"</h4><h4>Height: "+obj.height.toString()+"</h4><h4>Weight: "+obj.weight.toString()+"</h4><h4>Attack: "+obj.attack.toString()+"</h4><h4>Defense: "+obj.defense.toString()+"</h4><h4>Speed: "+obj.speed.toString()+"</h4><h4>HP: "+obj.hp.toString()+"</h4>"
//   prof_location.append(prof_link)
// }

function replaceYourBatch(array) {
  var $location = $(".your-pokemon")
  $location.empty()
  $location.append("<h2>Your Pokemon</h2>")
  for(var i=0;i<array.length;i++){
    var link = "<div><a href=\"/pokemon/"+array[i].id.toString()+"\">"+array[i].name+"</a></div>"
    $location.append(link)
  }
}
