# Harry Potter characters

[Author, Book, Character].each do |model|
  model.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
end

jk_rowling = Author.create(
  name: "J. K. Rowling",
  dob: "1965-07-31",
  gender: "f",
  has_pseudonym: false
)

jk_rowling.books.create(
  title: "Harry Potter and the Philosopher's Stone",
  release_date: "1997-06-26",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Chamber of Secrets",
  release_date: "1998-07-02",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Prisoner of Azkaban",
  release_date: "1999-07-08",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Goblet of Fire",
  release_date: "2000-07-08",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Order of the Phoenix",
  release_date: "2003-06-21",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Half-Blood Prince",
  release_date: "2005-07-16",
  genre: "Fantasy"
)

jk_rowling.books.create(
  title: "Deathly Hallows",
  release_date: "2007-07-21",
  genre: "Fantasy"
)

harry_potter = Character.find_or_create_by(
  name: "Harry Potter",
  gender: "m",
  quirk: "impatient"
)

ron_weasley = Character.find_or_create_by(
  name: "Ron Weasley",
  gender: "m",
  quirk: "jealous"
)

hermione_granger = Character.find_or_create_by(
  name: "Hermione Granger",
  gender: "f",
  quirk: "bossy"
)

jk_rowling.books.each do |book|
  book.characters.push(harry_potter, ron_weasley, hermione_granger)  
end




