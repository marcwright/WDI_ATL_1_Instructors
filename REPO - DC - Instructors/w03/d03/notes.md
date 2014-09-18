## LO
- Explain how to use ActiveRecord to manage relationships
- Set up an ActiveRecord Association for a one-to-many relationship
- Set up an ActiveRecord Association for a many-to-many relationship

### Reading
Sections 1, 2.1-3
* http://guides.rubyonrails.org/association_basics.html
* What is it? What problem does it solve? how?
* Don't worry about Migrations, it is a handy way of altering table. Will dive into when we get to Rails.

### MUSICALS
* adding a song model, update our ERD
* Update our SQL Schema
* Add a Song Model

### AR Associations 1:many
* has_many
* belongs to

### MOMA App

* http://guides.rubyonrails.org/association_basics.html
Sections 2.4

### AR Associations many:many
* has_many :through

---

## LO 

### Concepts
- Explain what shoulda matchers are and why they are useful

### Mechanics
- Use shoulda matchers for model validation
- Use shoulda matchers for ActiveRecord associations

### Shoulda matchers
* gem install shoulda-matchers
* gem install database_cleaner
* Fix spec_helper

### Demo on Musicals
* validations
* associations

### Refactor nightclub tests

--- 

### TDD

Activity [Pairs w/ check ins]:
* Chopped

```markdown
**Chopped**
- 3 rounds, 4 chefs.
- Chef makes a dish as part of a round.
- Judges judge each dish and give it a rating on a score of 1 - 5.
- The chef with the lowest scoring dish is chopped, and cannot participate in the next round
    - In the event of a tie, the chopped chef is picked randomly
- The last chef standing is the winner and wins $10,000
```

* Checkpoints
  * Model in pairs - make sure all have same ERD
  * TDD it out. Check in variously.

### Goal:
* Set up Schema, Associations, Validations & Tests for Validations and Associations
* Bonus : Behavior