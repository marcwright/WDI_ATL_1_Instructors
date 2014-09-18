# Movies with Database Demo

How does our Ruby code connect to a DB? (can we remember any SQL?!)

## SQL Refresher

### PSQL reminder

```
    create database movie_app;
    \l   # list databases
    \d   # describe database
```

Create movies table with SQL and then run some some queries to create, read, update, and delete records



movies_app sql:
https://gist.github.com/Pavling/c5c7723bca637e2e5cc3

createdb movie_app

psql -d movie_app -f movie_app.sql




```
    gem install httparty json
    rbenv rehash
    name = params[:title].gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{name}"
    html = HTTParty.get(url)
    @hash = JSON(html)
```





## DB with Sinatra
- PG gem
- 'get' rows from db
- Present results in views




