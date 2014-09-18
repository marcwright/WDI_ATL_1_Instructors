
var MuppetModel = Backbone.Model.extend({

  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  changeVote: function(number) {
    var newRating = this.get('rating') + parseInt(number);
    this.save({rating: newRating});
  }
});

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppets'),

  // comparator: function(model) {
  //   return -model.get('rating');
  // },

  comparator: function (model1, model2) {
    if (model1.get('rating') > model2.get('rating')) {
      return -1;
    } else if (model1.get('rating') < model2.get('rating')) {
      return 1;
    } else if (model1.get('rating') === model2.get('rating')) {

      // Alphabetizes muppets in the case of a ratings tie
      if (model1.get('name') > model2.get('name')) {
        return 1;
      } else if (model1.get('name') < model2.get('name')) {
        return -1;
      } else if (model1.get('name') === model2.get('name')) {
        return 0;
      }

    }
  }
});

var muppets = new MuppetsCollection();

