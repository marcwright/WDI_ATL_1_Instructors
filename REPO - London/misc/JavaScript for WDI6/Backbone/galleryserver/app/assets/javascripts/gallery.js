$(document).ready(function() {
    EventBus = _.clone(Backbone.Events);

    // Model for images.
    Image = Backbone.Model.extend({
        defaults: {
            title: '',
            url: '',
            caption: ''
        },

        urlRoot: '/images'
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
    ImageContainer = Backbone.Collection.extend({
        model: Image,
        url: function() {
            return "/albums/" + this.id;
        },

        parse: function(data) {
            return data.images;
        },

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
            _.bindAll(this, 'remove', 'render');
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
            _(this.model.get('images').models).each(that.appendItem, this);
            return this;
        },

        // Handle form submission.
        addImageFromForm: function(ev) {
            ev.preventDefault();
            var $titleInput = $('#title');
            var $urlInput = $('#url');
            this.model.addNew($titleInput.val(), $urlInput.val());
            $titleInput.val('');
            $urlInput.val('');
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
            images: null
        },
        urlRoot: '/albums',

        initialize: function() {
            var container = new ImageContainer();
            container.id = this.id;
            this.set({images: container});
        },

        add: function(image) {
            image.set('album_id', this.id);
            image.save();
            var images = this.get('images');
            images.add(image);
            this.trigger('add', image);
        },

        // Adds a new image to this collection.
        addNew: function(title, url) {
            var image = new Image();
            image.set('title', title);
            image.set('url', url);
            image.set('album_id', this.id);
            image.save();
            this.add(image);
            EventBus.trigger('image:added', this);
        },

        initFromData: function(imageData) {
            var images = this.get('images');
            images.add(imageData);
        },

        remove: function(id) {
            var images = this.get('images');
            var image = images.get(id);
            images.remove(image);
            image.destroy();
        },

        size: function() { return this.get('images').length; },

        isEmpty: function() {
            return this.get('images').length === 0;
        }
    });


    // Collection of galleries.
    var Gallery = Backbone.Collection.extend({
        model: Album,
        url: '/albums'
    });

    // View a collection of galleries.
    var GalleryView = Backbone.View.extend({
        tagname: 'div',
        render: function() {
            var my_template = _.template($('#tmpl_gallery').html());
            this.$el.html(my_template({albums: this.collection}));
            return this;
        }
    });


    var MenuView = Backbone.View.extend({
        el: '#menubar',
        initialize: function() {
            _.bindAll(this, 'render', 'setAppView');
            EventBus.on('display:album display:gallery image:added image:removed', this.render);
            this.render();
        },

        render: function(albumId) {
            var album;
            if (albumId !== undefined) {
                album = this.appView.getAlbumById(albumId);
            }
            var my_template = _.template($('#tmpl_menu').html());
            this.$el.html(my_template({album: album}));
            return this;
        },

        setAppView: function(appView) {
            this.appView = appView;
        }
    });


    // Overall view for our app.
    var AppView = Backbone.View.extend({
        el: '#container',

        initialize: function(data) {
            _.bindAll(this, 'showAlbum', 'showGallery', 'showAbout', 'show404', 'getAlbumById', 'render');
            // Create a new gallery.
            this.gallery = new Gallery();

            // Set up events.
            EventBus.on('display:album', this.showAlbum);
            EventBus.on('display:gallery', this.showGallery);
            EventBus.on('display:about', this.showAbout);
            EventBus.on('display:404', this.show404);

            // Display app.
            this.render();
        },

        // Constructs new albums from the data passed in.
        initFromData: function(data) {
            var that = this;
            _.each(data, function(item) {
                var album = new Album(_.pick(item, ['id', 'title']));
                album.initFromData(item.images);
                that.gallery.add(album);
            });
        },

        render: function() {
            this.showGallery();
            return this;
        },

        getAlbumById: function(id) {
            return this.gallery.get(id);
        },

        showGallery: function() {
            var galleryView = new GalleryView({collection: this.gallery});
            this.$el.html(galleryView.render().el);
            return this;
        },

        show404: function(details) {
            var my_template = _.template($('#tmpl_404').html());
            this.$el.html(my_template({stuff: details}));
            return this;
        },

        showAlbum: function(albumId) {
            var album = this.gallery.get(albumId);
            var albumView = new AlbumView({model: album});
            this.$el.html(albumView.render().el);
            return this;
        },

        showAbout: function() {
            this.$el.html("<h3>All about my app</h3><p>This is a simple linkblog for photos, like pinterest, but ours.</p>");
            return this;
        }
    });

    var AppRouter = Backbone.Router.extend({
        routes: {
        "": "index",
        "about": "about",
        "albums/:id": "showAlbum",
        "*stuff": "show404"
        },

        index: function() {
            EventBus.trigger('display:gallery');
        },

        about: function() {
            EventBus.trigger('display:about');
        },

        showAlbum: function(id) {
            EventBus.trigger('display:album', id);
        },

        show404: function(stuff) {
            EventBus.trigger('display:404', stuff);
        }
    });

    var appView = new AppView();
    appView.initFromData(albumData);
    var menuView = new MenuView();
    menuView.setAppView(appView);

    var router = new AppRouter();
    Backbone.history.start();
});
