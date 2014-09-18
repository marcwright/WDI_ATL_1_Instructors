var SiteView = Backbone.View.extend({
  tagName: 'li',
  className: 'site',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render();
  },

  events: {
    'click .upvote' : 'upVote',
    'click .downvote' : 'downVote'
  },

  template: _.template($('#site-html').html()),

  upVote: function() {
    this.model.ratingChange(1);
  },

  downVote: function() {
    this.model.ratingChange(-1);
  },

  render: function() {
    var rendered = this.template({site: this.model});
    this.$el.html(rendered);
  }

});

var ListView = Backbone.View.extend({
  el: '#sites-list',

  initialize: function() {
    this.listenTo(this.collection, 'add sort', this.render);
  },

  render: function() {
    this.$el.empty();
    this.collection.each(function(site) {
      var view = new SiteView({model: site});
      this.$el.append(view.el);
    }, this);
  }
});

var FormView = Backbone.View.extend({
  el: 'form',

  events: {
    'submit' : 'createSite'
  },

  createSite: function(evt) {
    evt.preventDefault();

    var site_url = this.$('[name="site_url"]').val();
    this.el.reset();

    this.collection.create({
      site_url: site_url
    });
  }
});
