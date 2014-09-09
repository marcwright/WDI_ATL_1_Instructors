# Validations

## Objectives

* What is validation, and where do we do it?
* What are common validations?
* What are validation errors?

## Reading

[Docs Page](http://guides.rubyonrails.org/active_record_validations.html)

* Section 1.1, discuss
* Section 1.2, discuss
* Section 1.4-1.5
* Section 2 => split out 1-13
* Section 3 => what are these?
* Section 6.2 => what's this?
* Section 7

## Common Validation Methods

* acceptance
* confirmation
* exclusion
* format
* inclusion
* length
* numericality
* presence
* absence
* uniqueness

## Custom Validations

```
class Invoice < ActiveRecord::Base
  validate :valued_customer, on: :create
 
  def valued_customer
  	if name != "Bob"
  		errors.add(:valued_customer, "is not valued")
  	end
  end
end
```

## Errors

* `.errors` … The store of errors.
* `.errors.empty?` … Are there any errors?
* `.errors.full_messages` … All errors, formatted with field name.