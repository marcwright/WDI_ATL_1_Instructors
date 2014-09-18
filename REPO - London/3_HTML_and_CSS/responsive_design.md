Responsive Design
=================

What is responsive design?
-----------------

### Check out these fixed sites:
<https://www.yeovalley.co.uk/>  
<http://www.hmrc.gov.uk/>  

Open these up and resize the page,

### Now checkout these responsive sites:
<http://www.bostonglobe.com/>  
<https://generalassemb.ly/>  

What's the difference between these?  Let's resize again.

Instead of manually resizing the page which can be a pain we can use this tool:  
<http://bradfrostweb.com/demo/ish/>

You can easily resize the screen and play around and see how the differnt sites look like.

Let's have a play around:
Create a folder in your working directory.  
mkdir responsive_design  
cd responsive_design  
touch index.html  

Make a new index.html file in your working directory.

<https://gist.github.com/mikemjharris/eded4369f68421c0f3bc>

In the head:  
```
<style>  
*{
      box-sizing: border-box;   
      margin: 0px;  
      padding: 0px;  
    }  
    .col {  
      padding: 10px;  
      border: 1px solid black;  
      vertical-align: top;  
    }  
</style>
```

In the body:    
```
  <div class="col"><h2>Column one</h2></div>  
  <div class="col"><h2>Column two</h2></div>  
  <div class="col"><h2>Column three</h2></div>  
```

Setting the max-width of elements
------------------------

How do we go about splitting these across the page?
For the .col set the width 33.33% and the float: left:  

```
  width: 33.33%;  
  float: left;  
```  
But this can be hard to read - there may be lots of text in each column.  Let's paste in some hipster ipsum:  
<http://hipsum.co/>

Get a paragraph from here and paste it into each of the columns.
When you resize the page this get's hard to read at small page widths.  

### How can we fix this?

Can set the min width.  
```
min-width:320px;
```  

Why 320px?  That's the width of an iphone 3g.

Looks good at small and large but what about in the middle?

We will come to that later. 

Images
------------

Let's use one of the images from the general assembly website. Two finger click on Benji and choose "copy image url"

``` 
  <img src="https://d3o09jpaxs6yh2.cloudfront.net/production/assets/student_stories/circles/benji-169871d5357b18227f521f85cfdf5990.jpg" />  
```

When we resize the image overflows our page.  What can we do?

Try  
```  
width: 100%;  
```

Hmm- what happens when the page is really wide?

To solve this we do  

```
max-width: 100%  
```


Now text flows nice and easily throughout the page. Try maximising and minimizing.

 

Media Queries
------------

Great we can resize - but when the right column flows to the next row what happens.  It stays the same width - it sits around on it's own.  

Look at the boston globe website - when the add goes to the next line it's width.

Let's play around with our website - move the width of the page so that the last box drops on the second line.  Let's check out in web inspector what we want the css to be - we want 50% width for the first two boxes and 100% for the last.

 We can use media queries to change the css on our page depending on the width of the window.  This makes use of the cascading nature of css.

```
@media only screen and (max-width: 800px) {  
/* styles only apply when viewport width < 800px */  
}  
```

Let's try it in our app:  
```  
  @media only screen and (max-width: 960px) {  
      .col {  
        width: 50%;  
      }  
      .col:last-child {  
        width: 100%;  
      }  
    }  
```  

Hmm - but now when we get to less than 640px what happens?  our div's float over to the left with a big gap.  Maybe now we want to set the width's of our elements to 100%  when the screen width is less than 640px.

```  
  @media only screen and (max-width: 640px) {  
      .col {  
        width: 100%;  
      }  
    }  
```  

Great - this is looking good!  Combining this with a bit more styling and we can get a great looking responsive site. This should look awesome on our phone!  Let's check it out.

First let's add a little styling:
``` 
     h2 {
      text-align: center;
      padding: 5px;
    }

    .col {
      
      padding: 10px;
    }
```

Seeing your website on your phone
------------------------------------

Well if we want to check out the site we'd have to upload the file to a webserver.  We probably don't all have sites and it is probably a pain.  So let's run a little server from our computers and check out our site on our phones.

Run the following in the folder where you saved your index.html  
``` 
python -m SimpleHTTPServer  
```

To check it out on your computer go to:

http://0.0.0.0:8000

Great you are running a simple web server.  We could have put this index.html page into a rails app and run that but that would be overkill.

If you are on the same wifi network on your computer and your phone you can check out the site on your phone.  First we need the ip address of our computer.

Type in ifconfig in the terminal. There should be something like:

inet 10.0.1.85

On your phone if you goto 

http://10.0.1.85:8000

and you should see your awesome website.....

doh... it will probably look like it does on our desktop.

Mobile's are clever - they pretend they have a width of 960px and scale the website.  We need to overide this and force the mobile to respond to our media queries.

Put the following code into our header.

```
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```











