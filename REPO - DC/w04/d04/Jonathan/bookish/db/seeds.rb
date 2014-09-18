# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

# Author.create(name: 'Leo Tolstoy', dob: '01-01-1937', gender: 'male', has_pseudonym: 'false')
# Author.create(name: 'Agatha Christie', dob: '04-10-1889', gender: 'female', has_pseudonym: 'false')
# Author.create(name: 'Barbara Cartland', dob: '03-09-1954', gender: 'female', has_pseudonym: 'false')
# Author.create(name: 'J.K. Rowling', dob: '12-12-1967', gender: 'female', has_pseudonym: 'true')
# Author.create(name: 'William Shakespeare', dob: '01-08-1835', gender: 'male', has_pseudonym: 'false')

Book.create(
  title: 'War and Peace',
  release_date: '01-01-1869',
  genre: 'Historical',
  author_id: 1
  )

Book.create(
  title: 'The Murder of Roger Ackroyd',
  release_date: '06-09-1926',
  genre: 'Fiction',
  author_id: 2
  )
