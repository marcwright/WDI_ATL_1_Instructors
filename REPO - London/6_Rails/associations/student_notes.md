# Associations

Associations between models make common operations simpler and easier in your code. 

Consider a simple Rails application that includes a model for customers and a model for orders. Each customer can have lots of (many) orders, and a order belongs to a customer.

```
  rails new associations
  cd associations

  rails g model Customer name:string
  rails g model Order customer_id:integer value:decimal
  rake db:migrate

  rails c

  c = Customer.create name: "michael"
  c2 = Customer.create name: "james"
  c3 = Customer.create name: "kim"

  Order.create customer_id: c.id, value: 10.32
  Order.create customer_id: c.id, value: 15.73
  Order.create customer_id: c2.id, value: 1.29
  Order.create customer_id: c2.id, value: 99.99
  Order.create customer_id: c.id, value: 110.33
  Order.create customer_id: c.id, value: 21.15
  Order.create customer_id: c2.id, value: 201.91
  Order.create customer_id: c3.id, value: 98.89
```

How do I find all the orders for Kim?

`Order.where customer_id: c3.id`

All easy enough... easier than manual SQL. But there are some clunky bits (like needing to know the customer's id to create an order. And I'm lazy so I'd still prefer it easier.... 

What happens if I delete "james"? His orders are left in the system... or I have to check and delete them first.

With Active Record associations, we tell Rails that there is a connection between the two models. 


```
  class Customer < ActiveRecord::Base
    has_many :orders, dependent: :destroy
  end
     
  class Order < ActiveRecord::Base
    belongs_to :customer
  end

  // in console
  reload!

  Customer.first.orders

  Orders.count
  Customer.first.destroy # remeber I said to use 'destroy' not 'delete'? this is why :-)
  Orders.count

  Customer.first.orders.create(value: 100.00)

  Order.first.customer.orders
```

## Types of association

### belongs_to

Sets up a connection between one model and another - it's the table upon which the foreign key resides.

- We set up our Order model to belong_to Customer


### has_one

Sets up a one-to-one connection - essentially the same as belongs_to, but implies the foreign-key is on the associated table. It's used when there's only one Thing connected to one OtherThing

- For instance, a Car has_one SteeringWheel, and a SteeringWheel belongs_to a Car.
- Which side has_one and which belongs_to can be contencious


### has_many

Defines a one-to-many relationship. It would generally imply zero-or-more Things associated (but the scope could be restricted).

- We said our Customer has_many Orders. 


### has_and_belongs_to_many

Sets up a many-to-many association. For instance, a Person can drive many Cars, and a Car can be driven by many People. It's a "traditional" join-table design - with two foreign keys. If you need any other information about the relationship between drives and cars (like the date the driving occurred, or how far the trip was), then another association type might be better....


### has_many :through

This sets up a many-to-many relationship "through" another associated model.
For instance, a Game and Person could join through a "Playing" model. This would allow a Game to have_many Players (People), and for a Person to be Playing many Games.

- If we add a DeliveryAddress model

```
  rails g model DeliveryAddress directions:text

  class DeliveryAddress < ActiveRecord::Base
    has_one :order
  end
```

- and change Order to belong_to a DeliveryAddress

```
  rails g migration AddDeliveryAddressIdToOrders delivery_address_id:integer

  class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :delivery_address
  end
```

- we can set our Customer to have_many DeliveryAddresses through Orders

```
  class Customer < ActiveRecord::Base
    has_many :orders, dependent: :destroy
    has_many :delivery_addresses, through: :orders
  end
```

- migrate and test in the console

```
  rake db:migrate
  rails c

  Order.all.each do |order|
    order.build_delivery_address directions: rand
    order.save
  end

  Customer.first.delivery_addresses
```

### has_one :through

Gives a single-association to another model, but through a third model.

- we can reciprocate from DeliveryAddresses to set it to be able to access the Customer through its Order

```
  class DeliveryAddress < ActiveRecord::Base
    has_one :order
    has_one :customer, through: :order
  end
```

### You can also associate a model to itself

```
  rails g model Employee name:string manager:references
  rake db:migrate
  rails c
  Employee

  Employee.create name: 'Bob'
  Employee.create name: 'John'
```

- Rails has set up our foreign-key field, and also an association in Employee.

We don't have a Manager model (though maybe in our OO world we might think to use inheritance to differentiate), but in this case, our managers are already in our DB as Employees themselves. 

```
  class Employee < ActiveRecord::Base
    belongs_to :manager, class_name: 'Employee'
    has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  end

  reload!

  e = Employee.first
  m = Employee.last
  e.manager = m
  e.save
  Employee.first.manager
```

Be careful of circular references - don't associate people (even indirectly) to themselves! :-)


## Query Caching - benefits of associations

```
  c = Customer.first
  c.orders # note the query that's run
  c.orders # what query runs this time?
```

  - http://guides.rubyonrails.org/v3.2.19/association_basics.html

