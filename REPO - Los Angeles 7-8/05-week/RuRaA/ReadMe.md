#RuRaA
With your Ruby, Ruby on Rails and AngularJS knowledge, you have great power. This lesson is designed to help you tie it all together.

- Start with a new rails app (we don't need tests nor active record)
- Create a new controller
- Create a new index.html.erb view for the created controller
- change the routes, so that the index action is hooked up as the root
- embed angular.js via cdn in the application.html.erb

Then include a simple script like this:



    <script>
      angular.module('angulartest', []).controller('aCtrl', ['$scope', function($scope) {
        alert('test');
      }]);
    </script>



- add necessary attributes
- start rails
- start coding
- be happy
