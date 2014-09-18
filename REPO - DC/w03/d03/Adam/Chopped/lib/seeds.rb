
require_relative './chopped'

Chef.delete_all

Chef.create(
  [
    { name: "John" },
    { name: "Sam" },
    { name: "Bob" },
    { name: "Dave" },
  ]
)







#  "psql -d chopped_db -f chopped.sql"
