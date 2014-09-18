#Angular MoneyWatch?!$ o.O
Introducing Angular's digest cycle. The digest cycle can be understood as a continuos loop, during which AngularJS checks for any changes within all watched $scope variables. If you have $scope.watchme defined in your controller and that variable was marked for being watched, then you are explicitly telling AngularJS to monitor the changes on watchme in each iteration of the digest cycle.

You can watch for changes on a variable by:

* using it in the html with swirly curlies <span>{{ watchme }}</span> (or with some directives)
* manually adding it via $watch in the controller

##$watch - observing model mutations

    $watch(watchExpression, [listener], [objectEquality], [deregisterNotifier]);
Registers a **listener** callback to be executed whenever the **watchExpression** changes.

* The **watchExpression** is called on every call to **$digest()** and should return the value that will be watched.
* The listener is called only when the value from the current watchExpression and the previous call to watchExpression are not equal (*with the exception of the initial run*). Inequality is determined according to reference inequality, strict comparison via the !== Javascript operator, unless objectEquality == true (see next point)
* When **objectEquality** == true, inequality of the watchExpression is determined according to the angular.equals function. To save the value of the object for later comparison, the angular.copy function is used. This therefore means that watching complex objects will have adverse memory and performance implications.
* The watch listener may change the model, which may trigger other listeners to fire. This is achieved by rerunning the watchers until no changes are detected. The **rerun iteration limit is 10** to prevent an infinite loop deadlock.

> You'll find a simple example on how you could use $watch in the folder **watch_example**.

##$apply - stuff you don't need to know
Now if we weren't actually AngularJS masters already, but instead use inferior ~~libraries~~ frameworks like jQuery and it's unclassy $.ajax() handler for a $scope variable, we need to use $apply() to start the digest cycle explicitly. You should only use this to migrate some data to Angular (integration with other frameworks), but never use this method combined with regular Angular code, as Angular will throw errors at you - rightfully so.


###What does this mean???

![image](https://docs.angularjs.org/img/guide/concepts-runtime.png)

Reading documentation is one thing, actually understanding and digesting the info is another... So I want you to be able to explain in your own words/illustrations/code how AngularJS [integrates with the browser event loop](https://docs.angularjs.org/guide/scope) and what this digest cycle is all about.