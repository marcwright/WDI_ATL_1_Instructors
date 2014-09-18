// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}


var IdeaModel = Backbone.Model.extend({

	defaults: {
		'this': 'chair',
		'that': 'dog'
	}

});



var IdeaView = Backbone.View.extend ({

	el: '#idea',

	initialize: function() {
		this.listenTo(this.model, 'change', this.render);
		this.render();
	}, 

	render: function() {
		var message = (this.model.get('this') +' for '+ this.model.get( 'that '));
		 this.$el.html.message
	}
});


var idea = new IdeaModel();
var ideaView = new IdeaView({model: idea}); 