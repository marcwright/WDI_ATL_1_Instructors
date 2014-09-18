if(typeof Object.create !== 'function') {
  Object.create = function (o) {
    var F = function () {};
    F.prototype = o;
    return new F();
  };
}

var todoApp = {

  todoTasks: function() {
    return $('#todo-items');
  },

  completedTasks: function() {
    return $('#completed-items');
  },

  createTask: function(text) {
    var task = Object.create(todoItem);
    task.setTaskText(text);
    this.appendTask(task);
  },

  appendTask: function(task) {
    if(task.taskName.length !== 0) {
      this.todoTasks().append(task.render());
    }
  }
}

var todoItem = {

  setTaskText: function(text) {
    this.taskName = text;
  },

  render: function() {
    var newTask = $('<li>');
    var text = $('<div>');
    var actions = $('<div>');
    var metaData = $('<span>');

    text.addClass('items');
    actions.addClass("actions");
    metaData.addClass("meta-data");

    var date = new Date();
    metaData.html("Created on: " + date.toLocaleDateString() + " ");
    actions.append(metaData);

    actions.append(this.completedButton());
    actions.append(this.deleteButton());

    text.html(this.taskName);
    text.append(actions);

    newTask.append(text);
    return newTask;
  },

  completedButton: function() {
    var button = $('<button>');
    button.addClass("complete");
    button.html("completed");

    var that = this;

    button.click(function() {
      var button = $(this);
      var task = that.getTask(button);
      task.detach();

      var metaData = that.getMetaData(button);
      var date = new Date();
      metaData.html("Completed on: " + date.toLocaleDateString() + " ");

      button.remove();
      todoApp.completedTasks().append(task);
    });
    return button;
  },

  deleteButton: function() {
    var button = $('<button>');
    button.addClass("delete");
    button.html("delete");

    var that = this;

    button.click(function() {
      var task = that.getTask($(this));
      task.remove()
    });
    return button;
  },

  getTask: function(element) {
    return element.parent().parent().parent();
  },

  getMetaData: function(element) {
    return element.parent().children("span").eq(0);
  }
}

$(function() {
  var userInput = $("#new-task-field");
  var button = $('#add-item');

  var inputEvent = function(event) {
    //keyCode of 'enter' is 13, keyCode of leftclick is 0
    if(event.keyCode === 13 || event.type === 'click') {
      todoApp.createTask(userInput.val());
      userInput.val('');
    }
  }

  button.click(inputEvent);
  userInput.keypress(inputEvent);
});
