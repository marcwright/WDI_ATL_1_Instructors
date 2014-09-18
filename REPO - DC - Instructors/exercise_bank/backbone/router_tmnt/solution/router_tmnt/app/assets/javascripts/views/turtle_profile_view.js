var TurtleProfileView = Backbone.View.extend({
  tagName: 'div',
  className: 'profile',

  // grab the template specified in the spec sheet
  template: _.template( $("#turtle-profile-template").html() ),

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function(){
    var html = this.template( this.model.toJSON() );
    return this.$el.html(html);
  },
});
