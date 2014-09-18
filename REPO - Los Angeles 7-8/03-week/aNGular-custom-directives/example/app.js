angular.module('custom-directives', [])
  .directive('sticky', ['$document', function($document) {
    return function(s, e, attr) {
      var start_x = 0,
          start_y = 0,
          x = 0,
          y = 0;

      e.css({
        position: 'relative',
        border: '1px solid red',
        borderRadius: '10px',
        backgroundColor: 'pink',
        padding: '5px',
        cursor: "url('cat.gif') 30 30, auto"
      });

      e.on('mouseenter', function(event) {
        event.preventDefault();
        start_x = event.pageX - x;
        start_y = event.pageY - y;
        $document.on('mousemove', mousemove);
        $document.on('mouseup', mouseup);
      });

      function mousemove(event) {
        x = event.pageX - start_x;
        y = event.pageY - start_y;
        e.css({
          top: y + 'px',
          left: x + 'px'
        });
      }

      function mouseup() {
        $document.off('mousemove', mousemove);
        $document.off('mouseup', mouseup);
      }
    }
  }])
  .directive('floatInput', function() {
    return {
      require: 'ngModel',
      link: function(s, e, attr, ngModelCtrl) {
        e.addClass('form-control');
        function fromUser(text) {
          var strippedInput = text.replace(/[^0-9.]/g, '');
          if ((strippedInput.split(".").length - 1) > 1) {
            strippedInput = strippedInput.slice(0, -1);
          }
          if (attr.max) {
            if(Number(strippedInput) > Number(attr.max)) {
              strippedInput = "" + attr.max;
              console.log("Set to maximum " + attr.max);
            }
          }
          if (strippedInput != text) {
            console.log("Only digits and one decimal point allowed.");
            ngModelCtrl.$setViewValue(strippedInput);
            ngModelCtrl.$render();
          }
          return strippedInput;
        }
        ngModelCtrl.$parsers.push(fromUser);
      }
    };
  })
;
