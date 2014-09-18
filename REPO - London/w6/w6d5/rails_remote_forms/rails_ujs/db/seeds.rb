Category.delete_all
Product.delete_all

f = Category.create! name: 'Food'
e = Category.create! name: 'Electrical'
b = Category.create! name: 'Book'
t = Category.create! name: 'Toy'

Product.create! name: 'LCD TV', price: 299.99, category_id: e.id
Product.create! name: 'Bread', price: 1.40, category_id: f.id
Product.create! name: 'LCD bedside clock', price: 13.99, category_id: e.id
Product.create! name: 'The Catcher in the Rye', price: 4.99, category_id: b.id
Product.create! name: 'Monopoly', price: 15.99, category_id: t.id
Product.create! name: 'Cauliflower', price: 2.50, category_id: f.id
Product.create! name: 'How to win friends and influence people', price: 12.99, category_id: b.id







