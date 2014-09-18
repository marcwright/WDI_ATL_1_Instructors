#Firebase - How to Deploy

##Learning Objectives:

How to deploy your Angular app to the world.

##Code-a-long

0 step:

- copy the adopt-a-kittah app into a new directory. 
	
	(located here: 02-week/angular-app-from-scratch/kitties-complete)

1 step: 

- setup an account on [firebase.com](firebase.com)


2 step:

- Navigate to your dashboard

- Create a new app and give it your name 

	(note: you can only use this name once...if you ever delete this app firebase will not let you use the name again)

```
YOURNAME.firebaseOI.com
```

3 step: 

cd into your local directory and begin...


###do this npm command only once - (we did this in class so you are fine)
```
$ npm install -g firebase-tools

```

```
$ firebase init
```
- choose the name of the app you created in step 2

```
$ firebase deploy
$ firebase open
```

4 step:

- bask in how awesome you are




##extra

- Learn about the firebase command. At the command prompt type...

	```
	firebase -help
	```

- Take a peek at the AngularJS + Firebase page

	[https://www.firebase.com/quickstart/angularjs.html](https://www.firebase.com/quickstart/angularjs.html)

- Take a look at some example apps

	[https://www.firebase.com/docs/examples.html](https://www.firebase.com/docs/examples.html)

##challenge

In a new directory, download the github code from one of the sample apps listed above.

Using the above instructions, create a new firebase app of your own with this code.

Play and poke around in the code to see how it changes.

