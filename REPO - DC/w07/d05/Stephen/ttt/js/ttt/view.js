/*
* @Author: stephenstanwood
* @Date:   2014-06-07 08:17:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-07 11:52:21
*/

function TTTView( model ) {
  this.model = model;
  this.initialize();
}

TTTView.prototype = {
  initialize: function() {
    this.NUM_SQ = Math.pow( this.model.DIMENSION, 2 );
    this.uiNewGame = $( '[ data-ui = "newgame" ]' );
    this.uiResult = $( '[ data-ui = "result" ]' );

    // add an event listener for each square on the board
    for ( var i = 1; i <= this.NUM_SQ; i++ ) {
      var $sq = $('[ data-ui = ' + i + ' ]');
      $sq.on( 'click', this.onSquare );
    }

    // set up reset button
    this.uiNewGame.on( 'click', _.bind( this.onReset, this ) );

    this.render();
  },

  onSquare: function() {
    var squareNum = parseInt( this.getAttribute( 'data-ui' ) );
    game.model.guess( squareNum );
    game.render();
  },

  onReset: function() {
    this.model.reset();
    this.render();
  },

  render: function() {
    for ( var i = 1; i <= this.NUM_SQ; i++ ) {
      var str = this.model.squareToString( i );
      $( '[ data-ui = ' + i + '] ').text( str );
    }

    var result = 'Play on!';

    if( !this.model.active ) {
      // if there is a victory, whoever went last has won
      if ( this.model.victory ) {
        result = this.model.xTurn ? 'Xs win!' : 'Os win!';
      } else {
        // otherwise, cat's game
        result = 'this one is for the cats...';
      }
    }

    this.uiResult.text( result );
  }
};
