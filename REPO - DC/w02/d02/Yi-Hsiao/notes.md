# W02D02 Notes #

## Self keyword ##

## Software Testing ##
an investigation conducted to provide stakeholders with information about the quality of the product or service under test.

- meets the requirements that guided its design and development
- works as expected
- can be implemented with the same characteristics
- satisfies the needs of stakeholders

### Test-Driven Development ###
Relies on the repetition of a very short development cycle.

1. The developer writes an (initially failing) automated test case that defines a desired improvement or new function
2. Produces the minimum amount of code to pass that test
3. Refactors the new code to acceptable standards

#### Agile vs. Waterfall ####
Main differences is that testing of the software is conducted at different stages during the software development lifecycle.

**Agile**: testing is done concurrently with coding and in early iterations
**Waterfall**: testing is done separately near the implementation

### Unit Testing ###
A software testing method by which individual units of source code are tested to determine if they are fit for use.

#### RSpec ####
```ruby
describe User do
  context 'with admin privileges' do
    before :each do
      @admin = Admin.get(1)
    end
 
    it 'should exist' do
      expect(@admin).not_to be_nil
    end
 
    it 'should have a name' do
      expect(@admin.name).to be_false
    end
  end
end
```


