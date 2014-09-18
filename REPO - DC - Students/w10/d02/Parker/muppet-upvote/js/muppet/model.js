var Muppet = Backbone.Model.extend({
	defaults: {
		name: '',
		image: '',
		rating: 0
	}
});

var Muppets = Backbone.Collection.extend({
	model: Muppet,
	localStorage: new Backbone.LocalStorage("muppets")
});

var muppets = new Muppets();