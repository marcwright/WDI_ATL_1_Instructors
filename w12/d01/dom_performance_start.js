// REPAINT VERSUS REFLOW:
// ----------------------

<h1>Greek</h1>
<ul id="greek">
  <li class="alpha">Alpha</li>
  <li class="beta">Beta</li>
  <li class="omega">Omega</li>
</ul>


$('.alpha').css({color: 'red'});

$('.alpha').css({width: 400});















// MANIPULATION REFLOWS:
// ---------------------

<h1>Greek</h1>
<ul id="greek"></ul>

var letters = ['alpha', 'beta', 'omega'];

for (var i=0; i < letters.length; i++) {
  $('#greek').append('<li>'+ letters[i] +'</li>');
}


var rendered = '';

for (var i=0; i < letters.length; i++) {
  rendered += '<li>'+ letters[i] +'</li>';
}

$('#greek').html(rendered);
















// GARBAGE COLLECTION:
// -------------------

<h1>Greek</h1>
<div id="greek"></div>


var ListView = Backbone.View.extend({
  tagName: 'ul',
  className: 'greek-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove sync', this.render);
  },

  render: function() {
    // render all <li> items...
    return this.$el;
  }
});


var list = new ListView();
list.remove();











// RELATED READING:
// - http://blog.letitialew.com/post/30425074101/repaints-and-reflows-manipulating-the-dom-responsibly
// - http://www.html5rocks.com/en/tutorials/memory/effectivemanagement/