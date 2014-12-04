# Migrations - c. 1hr

Migrations are a way for us to manage the creation and alteration of our database tables in a structured and organized manner.

Each migration is a seperate file, which Rails runs for us when we instruct it. Rails keeps track of what's been run, so changes don't get attempted more than once.

We describe the DB changes using Ruby, and it doesn't matter which DB engine we use - Rails has connectors for each different DB engine we might use, which translates the ruby structure into the appropriate DB commands.

## Let's create a migration

```
rails new migrations_app # without specifying a DB, Rails will use SQLite3)
```

```
rails g migration CreateProducts
```

This will have created a migration file in our `RAILS_ROOT/db/migrate` folder. The purpose of this file is to describe what actions we want to take to move our DB schema from its current state to the new state, and also, what would need to happen to move the migration back to the old state again (should we need to).

Add content to the 'up' and 'down' methods:

```
class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
 
      t.timestamps
    end
  end
 
  def down
    drop_table :products
  end
end
```

We'll re-write this migration to use an even simpler syntax:

```    
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
 
      t.timestamps
    end
  end
end
```

We run migrations with the command `rake db:migrate`

- read the screen... did it run?

We could check this by firing up our trust old command line tools:

```
sqlite3 db/development.sqlite3

.schema products

.exit
```

## Adding columns to tables

So far, we dropped and recreated our tables when we wanted to add columns to them. But this is not a practical, real-world solution. So we use migrations to do this in Rails.

Rails gives us some help to generate migration files - we can list the fields and their types in the generate command, and if we name the migration appropriately, Rails even guesses the name of the table:

```
rails generate migration AddPriceAndAvailabilityToProducts price:integer available:boolean
```

- by putting Add....To.... Rails knows we are adding these columns to which table, and the migration can be written automatically

- available column types:
  * :binary
  * :boolean
  * :date
  * :datetime
  * :decimal
  * :float
  * :integer
  * :primary_key
  * :string
  * :text
  * :time
  * :timestamp


## Schema.rb

When migrations run, Rails also updates the schema.rb file - it contains the migration commands all combined into each table.

The schema is the snapshot of your current database tables and fields.


## Rollbacks

We can undo running migrations with:

`rake db:rollback`

  - Beware:
    - don't rollback migrations which have been run on other machines (essentially, if they're in source code control)
    - instead, write a new migration to undo the changes


## Models and Migrations

Since AR models map to tables, when you create a model, it should create a table migration:

```
rails g model Customer name:string description:text active:boolean credit_limit:decimal last_contact_at:datetime
```

## Removing columns from tables

We can use the same naming convention as create to automatically generate the migration file:

```
rails g migration RemoveNameFromCustomers name:string
```

Notice it has "up" and "down"... there isn't enough information in the 'down' to do a "change"
