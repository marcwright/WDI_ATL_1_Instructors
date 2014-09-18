// Empty module for our app.
var notesApp = notesApp || {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    init: function() {}
};

// Model for our note.
notesApp.Models.Note = Backbone.Model.extend({});

// Collection of Notes.
notesApp.Collections.NoteCollection = Backbone.Collection.extend({
    model: notesApp.Models.Note,
    url: '/notes'
});

// View for new note form.
notesApp.Views.NoteCreationView = Backbone.View.extend({
    el: '#container',
    events: {'submit form': 'createNewNote'},
    initialize: function() {
        _.bindAll(this, 'render', 'createNewNote');
    },

    render: function() {
        var template = _.template($('#tmpl_newnote').html());
        this.$el.html(template());
        return this;
    },

    createNewNote: function(ev) {
        ev.preventDefault();
        var $target = $(ev.currentTarget);
        var title = $('input[name="title"]').val();
        var note = new notesApp.Models.Note({title: title});
        notesApp.allNotes.add(note);
        note.save();
        notesApp.router.navigate("", {trigger: true});
    }
});

// View for a single Note.
notesApp.Views.NoteView = Backbone.View.extend({
    tagName: 'div',
    events: {'click h2': 'changeToEditView',
             'blur input': 'saveChanges',
             'keyup input': 'keyboardSaveChanges'
    },

    initialize: function() {
        this.listenTo(this.model, "change", this.render);
    },

    changeToEditView: function(ev) {
        var $target = $(ev.currentTarget);
        var headline = $target.text();
        var newInput = $('<input>');
        newInput.val(headline);
        $target.replaceWith(newInput);
    },

    keyboardSaveChanges: function(ev) {
        if (13 == ev.keyCode) { // Enter key
            this.saveChanges(ev);
        }
    },

    saveChanges: function(ev) {
        var $target = $(ev.currentTarget);
        var newHeadline = $target.val();
        this.model.set('title', newHeadline);
        this.model.save();
    },


    render: function() {
        var template =  _.template($('#tmpl_note').html());
        this.$el.html(template({note: this.model}));
        return this;
    }
});


// View for all notes.
notesApp.Views.NoteCollectionView = Backbone.View.extend({
    el: '#container',

    render: function() {
        var that = this;
        this.$el.empty();
        this.collection.each(function(noteModel) {
            var noteView = new notesApp.Views.NoteView({model: noteModel});
            that.$el.append(noteView.render().el);
        });
    }
});

notesApp.Routers.AppRouter = Backbone.Router.extend({
    routes: {
        "": "showIndex",
        "new": "createNewNote"
    },

    showIndex: function() {
        var collectionView = new notesApp.Views.NoteCollectionView({collection: notesApp.allNotes});
        collectionView.render();
    },

   createNewNote: function() {
        new notesApp.Views.NoteCreationView().render();
    }
});


// Initialiser for our notes.
notesApp.init = function(data) {
    notesApp.router = new notesApp.Routers.AppRouter();
    notesApp.allNotes = new notesApp.Collections.NoteCollection(data);
    Backbone.history.start();
};

