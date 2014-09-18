$(document).ready(function() {
  var EventBus = _.clone(Backbone.Events);

  var AppView = Backbone.View.extend({
    el: '#container',
    initialize: function() {
      _.bindAll(this, 'showAlbum'); // so "this" refers to the AppView, not the album

      this.gallery = new Gallery();
      var album = new Album({title: 'Bill Murray'});
      var image1 = new Image({title: 'Steve Zizzou', url: 'http://www.fillmurray.com/200/310'});
      var image2 = new Image({title: 'Venkman', url: 'http://www.fillmurray.com/205/320'});

      EventBus.on('display:album', this.showAlbum);

      album.add(image1);
      album.add(image2);
      this.gallery.add(album);
      this.render();
    },

    showGallery: function() {
      var galleryView = new GalleryView({collection: this.gallery});
      this.$el.html(galleryView.render().el);
      return this;
    },

    showAlbum: function(album) {
      var albumView = new AlbumView({model: album});
      this.$el.html(albumView.render().el);
      return this;
    },

    render: function() {
      this.showGallery();
      return this;
    }

  });

  var Image = Backbone.Model.extend({
    defaults: {
      title: '',
      url: ''
    },

    initialize: function() {
      _.extend(this, Backbone.Events);
    }
  });

  var ImageView = Backbone.View.extend({
    tagName: 'li',
    events: {'click .closebutton': 'remove'},

    remove: function() { 
      this.$el.remove();
      EventBus.trigger('image:removed');
    },

    render: function() {
      var my_template = _.template($('#tmpl_image').html());
      this.$el.html(my_template({title: this.model.get('title'), url: this.model.get('url')}));
      return this;
    }
  });

  var ImageContainer = Backbone.Collection.extend({
      model: Image
    });

  
  var Album = Backbone.Model.extend({
      defaults: {
          title: '',
          images: null
      },

      initialize: function() {
        _.extend(Backbone.events);
        this.set({images: new ImageContainer()});
      },

      add: function(image) {
        var images = this.get('images');
        images.add(image);
        this.trigger('add', image);
      }

    });


  var AlbumView = Backbone.View.extend({
      tagName: 'div',
      events: {'submit form.add': 'addImageFromForm'},

      initialize: function() {
        var that = this;
        // this.model = new Album();
        this.model.bind('add', this.appendItem, this);
        EventBus.on('image:added', function() { $('.empty_album', that.$el).hide(); } );
        EventBus.on('image:removed', function() { 
          if (0 === that.$el.find('li').length) {
            $('.empty_album', that.$el).show(); 
          }
        });
        this.render();
      },

      addImageFromForm: function(ev) {
          ev.preventDefault();
          var $titleInput = $('#title');
          var $urlInput = $('#url');
          this.add($titleInput.val(), $urlInput.val());
          $titleInput.val('');
          $urlInput.val('');
      },

      render: function() {
        var my_template = _.template($('#tmpl_album').html());
        this.$el.html(my_template());
        return this;
      },

      add: function(title, url) {
          var image = new Image();
          image.set('title', title);
          image.set('url', url);
          this.model.add(image);
          image.trigger('added');
          EventBus.trigger('image:added');
      },

      appendItem: function(image) {
          var imageView = new ImageView({ model: image });
          $('ul', this.$el).append(imageView.render().el);
      }
  });


  var FlashView = Backbone.View.extend({
    el: '#flash',

    initialize: function() {
      var that = this;
      EventBus.on('image:added', function() {that.showMessageThenFade("image added successfully"); });
      EventBus.on('image:removed', function() {that.showMessageThenFade("image removed successfully"); });
    },

    render: function(message) {
      var my_template = _.template($('#tmpl_flash').html());
      this.$el.html(my_template({message: message}));
      this.$el.slideDown();
      return this;
    },

    showMessageThenFade: function(message) {
      var that = this;
      this.render(message);
      setTimeout(function() { that.$el.slideUp(); }, 1000);
    }
  });

  var Gallery = Backbone.Collection.extend({ model: Album });

  var GalleryView = Backbone.View.extend({ 
    tagname: 'div', 
    events: {'click li.album': "showAlbum" },

    showAlbum: function(ev) { 
      var $clickedItem = $(ev.currentTarget);
      var id = $clickedItem.data('id');
      EventBus.trigger('display:album', this.collection.get(id));
    },

    render: function() { 
      var my_template = _.template($('#tmpl_gallery').html());
      this.$el.html(my_template({albums: this.collection}));
      return this;
    }
  });



  var appView = new AppView();
  var flashview = new FlashView();

});










