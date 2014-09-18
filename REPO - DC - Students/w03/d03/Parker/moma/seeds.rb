require_relative './moma'

Artist.delete_all
Paiting.delete_all

# Artist.create(
#   [
#     { title: "Monet", year: "1920", type: "painting", era: "Modern" }
#   ]
# )

vangogh.paintings.create (
    [ 
        {title: "Starry Night"}
    ]
)