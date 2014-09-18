Game.delete_all
Move.delete_all
Score.delete_all
User.delete_all

User.create!(name: 'Michael', email: 'mgp@pavling.co.uk', password: 'password', password_confirmation: 'password')
User.create!(name: 'Dave', email: 'dave@pavling.co.uk', password: 'password', password_confirmation: 'password')


