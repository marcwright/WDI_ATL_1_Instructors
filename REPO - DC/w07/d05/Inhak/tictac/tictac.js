function TicTac(){
  this.reset();
}

TicTac.prototype = {
  playerXMove: true,
  playerOMove: false,
  spaces: [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ],
  turnDisplay: "X's move",
  active: true,
  winner: null,

  reset: function(){
    for(var i = 0; i < this.spaces; i++){
      this.spaces[i] = null;
    }
    this.active = true;
    this.winner = null;
  },

  makeMove: function(space){
    if(!this.active) return;

    var movePiece = this.playerXMove ? "X" : "O";
    if(this.spaces[space] === null){
      this.spaces[space] = movePiece;
      this.playerXMove = !this.playerXMove;
      this.playerOMove = !this.playerOMove;
    }

    if( this.playerOMove === true ){
      this.turnDisplay = "O's move";
    } else{
      this.turnDisplay = "X's move";
    }
    this.update();
  },

  update: function(){
    var display = [];
    for(var i = 0; i < 3; i++){
      if (this.spaces[i] === this.spaces[i+3] && this.spaces[i+3] === this.spaces[i+6]){
        if (this.spaces[i] === "X"){
          this.winner = "player X";
          this.active = false;
        } else if (this.spaces[i] === "O") {
          this.winner = "player O";
          this.active = false;
        }
      }
    }
    if (this.spaces[0] === this.spaces[4] && this.spaces[4] === this.spaces[8]){
      if(this.spaces[0] === "X"){
        this.winner = "player X";
        this.active = false;
      } else if (this.spaces[0] === "O"){
        this.winner = "player O";
        this.active = false;
      }
    } else if (this.spaces[2] === this.spaces[4] && this.spaces[4] === this.spaces[6]){
      if(this.spaces[2] === "X"){
        this.winner = "player X";
        this.active = false;
      } else if (this.spaces[2] === "O"){
        this.winner = "player O";
        this.active = false;
      }
    }
    for(i = 0; i < this.spaces.length; i = i + 3){
      if (this.spaces[i] === this.spaces[i+1] && this.spaces [i+1] === this.spaces [i+2]){
        if(this.spaces[i] === "X"){
          this.winner = "player X";
          this.active = false;
        } else if(this.spaces[i] === "O"){
          this.winner = "player O";
          this.active = false;
        }
      }
    }
  }
}
