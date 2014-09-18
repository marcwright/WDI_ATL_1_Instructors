function TicTacView(){
  this.tictac = new TicTac();
  this.initialize();
}

TicTacView.prototype = {
  initialize: function(){
    this.uiBoard = document.querySelector('[data-ui="board"]');
    this.uiResult = document.querySelector('[data-ui="result"]')
    for(i = 0; i < 9; i++){
      var divs = document.createElement('div');
      divs.classList.add('square');
      divs.addEventListener('click', function(){
        this.innerhtml = this.tictac.spaces[i];
      });
    }
    this.uiBoard.appendChild(divs);
  }
}
