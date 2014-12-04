# Validations

(this takes about and hour-plus to teach... and need time to play with it)

So far, we've not been checking for whether or not the values that users have been entering in forms have been valid for our needs.

Checking that model attributes are within the bounds we want for saving in the database is called "validation".


## Create an app to play in

```
  rails new validations_app
  cd validations_app

  rails g model Customer name:string
  rails g model Order customer_id:integer value:decimal
  rake db:migrate
```

ActiveRecord objects either correspond to a DB row, or they've not been saved yet.

```
  cust = Customer.new(name: "John Doe")
  cust.new_record?
  cust.save
  cust.new_record?
```

Validations are run before a record is saved. If any validations fail, the object does not get saved to the database.


##  Some validations

### presence

```
  # customer.rb
  validates :name, presence: true
```


### length

```
  # customer.rb
  validates :name, length: { minimum: 2 } 
  validates :name, length: { maximum: 500 }
  validates :name, length: { in: 8..255 }
```


### numericality

```
  # order.rb
  validates :value, numericality: true
  validates :value, numericality: { only_integer: true }
```

Also allows for `:greater_than`, `:less_than`, `:odd`, `:even`, `:equal`, et al.


### uniqeness

```
  validates :name, uniqueness: true
```


### lots more besides

We're not going into them, they're in the api


Some AR methods do skip validations, but `create`, `save`, and `update_attributes` (and their bang alternatives) require validations to pass.

To skip manually you can pass the `validate: false` option:

`c.save(validate: false)`


To check manually without saving you can ask if an object is valid or invalid:

```
  cust.valid?
  cust.invalid?
```


## Errors

Any errors from validations which fail are placed into the `errors` collection of each AR object.

```
  # customer.rb
  validates :name, presence: true

  c = Customer.new
  c.errors # also call `.class` and `.to_a`
  c.valid?
  c.errors # .to_a
  c.error.full_messages

  c.save
  c.save!
  c.name = "gimme a name"

  c.save
```


## Conditionally validating

Sometimes we only want to validate if certain conditions are met, and the validations can take options for `:if` and `:unless`:

```
  # with symbol for method
  class Order < ActiveRecord::Base
    validates :card_number, presence: true, if: :paid_with_card?
   
    def paid_with_card?
      payment_type == "card"
    end
  end

  # with Proc
  class User < ActiveRecord::Base
    validates :password, confirmation: true, unless: Proc.new { |u| u.password.blank? }
    validates :password, confirmation: true, unless: -> (u) { u.password.blank? }
  end
```

We can also specify when the validation should take place - whether the record needs create/update/save (defaults to 'save')

```
  class Person < ActiveRecord::Base
    # it will be possible to update email with a duplicated value
    validates :email, uniqueness: true, on: :create
   
    # it will be possible to create the record with a non-numerical age
    validates :age, numericality: true, on: :update
   
    # the default (validates on both create and update)
    validates :name, presence: true, on: :save
  end
```


## Custom Validation 

Write your own methods to verify the state of your objects.

```
  class Invoice < ActiveRecord::Base
    validate :active_customer, on: :create
   
    def active_customer
      errors.add(:customer_id, "is not active") unless customer.active?
    end
  end
```

Add errors to attributes of the model or to the 'base' to cause the validations to fail, and to interrupt the save/create/update.


http://guides.rubyonrails.org/v3.2.19/active_record_validations_callbacks.html 
