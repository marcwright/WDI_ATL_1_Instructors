// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {

  $('#search').on('keyup', function(e){
    e.preventDefault();
    $('#search_form').submit();
  });

  $( "#tasks-high ul" ).sortable({
    stop: function(event, ui) {
 //     console.log(ui.item.index());
//      console.log(ui.item.data('task_id'));

      task_id = ui.item.data('task_id');
      position = ui.item.index();
      $.post('/tasks/' + task_id + '/update_position', {'position': position});

    }
  });


//     $.post('/to_do_items/' + item_id + '/update_list_and_position', {
//       'position': position,
//       'new_list': new_list
//       });




// function runConnectedSortable(){
//   $( ".connectedSortable" ).sortable({
//   connectWith: ".connectedSortable",
//    stop: function(event, ui) {
//     $(ui.item).effect("highlight");
//     var item_id = $(ui.item).attr('id').replace(/[^\d]+/g, '');
//     var position = ui.item.prevAll().length;
//     var new_list = $(ui.item).parent().attr('id').replace(/[^\d]+/g, '');
//     $.post('/to_do_items/' + item_id + '/update_list_and_position', {
//       'position': position,
//       'new_list': new_list
//       });
//       $(ui.item).effect("highlight");
//       }
//   }).disableSelection();
// };






  $( "#tasks-medium li" ).draggable({
    appendTo: "body",
    revert: "invalid",
    cursor: "move",
    helper: "clone"
  });

  $( "#tasks-low li" ).draggable({
    appendTo: "body",
    revert: "invalid",
    cursor: "move",
    helper: "clone"
  });


  $( "#tasks-today ol" ).droppable({
        activeClass: "ui-state-default",
        hoverClass: "ui-state-hover",
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
          $( this ).find( ".placeholder" ).remove();
          $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
      }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
          $( this ).removeClass( "ui-state-default" );
        }
      });


  $( "#tasks-high ul" ).droppable({
        activeClass: "ui-state-default",
        hoverClass: "ui-state-hover",
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
          $( this ).find( ".placeholder" ).remove();
          $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
      }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
          $( this ).removeClass( "ui-state-default" );
        }
      });

  $( "#tasks-medium ul" ).droppable({
        activeClass: "ui-state-default",
        hoverClass: "ui-state-hover",
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
          $( this ).find( ".placeholder" ).remove();
          $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
      }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
          $( this ).removeClass( "ui-state-default" );
        }
      });

  $( "#tasks-low ul" ).droppable({
        activeClass: "ui-state-default",
        hoverClass: "ui-state-hover",
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
          $( this ).find( ".placeholder" ).remove();
          $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
      }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
          $( this ).removeClass( "ui-state-default" );
        }
      });


});