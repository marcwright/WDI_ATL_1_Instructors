require "sinatra"
require "sinatra/reloader"

get "/hello/:name" do |name|
  "
  <head>
  <style>
    body {
      background: url('http://ih2.redbubble.net/image.7836650.0679/sticker,375x360.png');
      background-size: cover;
    }
    div {
      position: fixed;
      bottom: 40px;
      left: 40%;
      font-size: 100px;
      font-family: Helvetica;
    }
  </style>
  </head>
  <body>
    <div>#{ params[:name] }</div>
  </body>
  "
end

get "/coffee" do
"<head>
<style>
  body {
    background: url('http://31.media.tumblr.com/tumblr_ldktqp1Aea1qcg7dio1_500.jpg');
    background-size: cover;
  }
</style>
</head>
<body>
</body>"
end

get "/lunch" do
"<head>
<style>
  body {
    background: url('http://media.tumblr.com/tumblr_m4dgbwpUyS1qgeygd.jpg');
    background-size: cover;
  }
</style>
</head>
<body>
</body>"
end

get "/drunk" do

"<head>
  <style>
    body {
      background: url('http://31.media.tumblr.com/tumblr_m7ih0gtOfw1r5i2ggo1_500.jpg');
      background-size: cover;
    }
  </style>
</head>
<body>
</body>"

end
