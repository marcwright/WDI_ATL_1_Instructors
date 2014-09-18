$(document).ready(function() {
    EventBus = _.clone(Backbone.Events);

    // Model for images.
    Image = Backbone.Model.extend({
        defaults: {
            title: '',
            url: '',
            caption: ''
        }
    });

    // View for each image.
    ImageView = Backbone.View.extend({
        tagName: 'li',

        render: function() {
            var my_template = _.template($('#tmpl_image').html());
            this.$el.html(my_template({title: this.model.get('title'), url: this.model.get('url'), id: this.model.cid}));
            return this;
        }
    });

    // A collection of images.
    PictureContainer = Backbone.Collection.extend({
        model: Image,

        initialize: function() {
            _.extend(this, Backbone.Events); // Make event stuff available to us.
        }
    });

    // View for a specific album.
    AlbumView = Backbone.View.extend({
        tagName: 'div',
        events: {'submit form.add': 'addImageFromForm',
                 'click .remove': 'remove'
        },

        initialize: function(options) {
            _.bindAll(this, 'remove', 'add', 'render');
            this.render();
            this.model.bind('add', this.appendItem, this);
        },

        remove: function(ev) {
            var id = $(ev.currentTarget).data('id');
            this.model.remove(id);
            EventBus.trigger('image:removed', this.model);
            this.render();
        },

        render: function() {
            var my_template = _.template($('#tmpl_album').html());
            this.$el.html(my_template());
            var that = this;
            _(this.model.get('pictures').models).each(that.appendItem, this);
            return this;
        },

        // Handle form submission.
        addImageFromForm: function(ev) {
            ev.preventDefault();
            var $titleInput = $('#title');
            var $urlInput = $('#url');
            this.add($titleInput.val(), $urlInput.val());
            $titleInput.val('');
            $urlInput.val('');
        },

        // Adds to the collection
        add: function(title, url) {
            var image = new Image();
            image.set('title', title);
            image.set('url', url);
            this.model.add(image);
            EventBus.trigger('image:added', this.model);
        },

        // Updates the view (by delegating to the individual items).
        appendItem: function(image) {
            var imageView = new ImageView({ model: image });
            $('ul', this.$el).append(imageView.render().el);
            $('.empty_album', this.$el).hide();
        }
    });

    // Our Album Model, which contains a bunch of pictures and extra Images.
    var Album = Backbone.Model.extend({
        defaults: {
            title: '',
            pictures: null
        },

        initialize: function() {
            this.set({pictures: new PictureContainer()});
        },

        add: function(image) {
            var pictures = this.get('pictures');
            pictures.add(image);
            this.trigger('add', image);
        },

        remove: function(id) {
            var pictures = this.get('pictures');
            var picture = pictures.get(id);
            pictures.remove(picture);
            picture.destroy();
        },

        size: function() { return this.get('pictures').length; },

        isEmpty: function() {
            return this.get('pictures').length === 0;
        }
    });


    // Collection of galleries.
    var Gallery = Backbone.Collection.extend({
        model: Album
    });

    // View a collection of galleries.
    var GalleryView = Backbone.View.extend({
        tagname: 'div',
        events: {
            'click li.album': "showAlbum"
        },
        initialize: function() {
            _.bindAll(this, 'showAlbum');
        },

        render: function() {
            var my_template = _.template($('#tmpl_gallery').html());
            this.$el.html(my_template({albums: this.collection}));
            return this;
        },

        showAlbum: function(ev) {
            EventBus.trigger('display:album', this.collection.get($(ev.currentTarget).data('id')));
        }
    });


    var MenuView = Backbone.View.extend({
        el: '#menubar',
        events: {
            'click a.albums': "showGallery"
        },

        initialize: function() {
            _.bindAll(this, 'render');
            EventBus.on('display:album display:gallery image:added image:removed', this.render);
            this.render();
        },

        showGallery: function(ev) {
            ev.preventDefault();
            EventBus.trigger('display:gallery');
        },

        render: function(album) {
            var my_template = _.template($('#tmpl_menu').html());
            this.$el.html(my_template({album: album}));
            return this;
        }
    });


    // Overall view for our app.
    var AppView = Backbone.View.extend({
        el: '#container',

        initialize: function() {
            // Create a new gallery.
            this.gallery = new Gallery();
            var album = new Album({title: 'Bill Murray'});
            var image1 = new Image({title: 'Steve Zizzou', url: 'http://www.fillmurray.com/200/310'});
            var image2 = new Image({title: 'Venkman', url: 'http://www.fillmurray.com/205/320'});
            album.add(image1);
            album.add(image2);
            var album2 = new Album({title: 'Kittens'});
            album2.add(new Image({title: 'Kitten!', url: 'http://placekitten.com/205/200'}));
            album2.add(new Image({title: 'Another kitten!', url: 'http://placekitten.com/205/320'}));
            this.gallery.add(album);
            this.gallery.add(album2);

            // Set up events.
            _.bindAll(this, 'showAlbum', 'showGallery');
            EventBus.on('display:album', this.showAlbum);
            EventBus.on('display:gallery', this.showGallery);

            // Display app.
            this.render();
        },

        render: function() {
            this.showGallery();
            return this;
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
        }
    });

    var appView = new AppView();
    var menuView = new MenuView();
});
