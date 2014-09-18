require_relative './musical'

Musical.delete_all

Musical.create(
  [
    { title: "The Sound of Music", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1959 },
    { title: "Les Miserables", composer: "Claude-Michel Schonberg", lyricist: "Herbert Kretzmer", year: 1985 },
    { title: "West Side Story", composer: "Leonard Bernstein", lyricist: "Stephen Sondheim", year: 1957 },
    { title: "Oklahoma", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1943 },
    { title: "Sweeney Todd", composer: "Stephen Sondheim", lyricist: "Stephen Sondheim", year: 1979 },
    { title: "Wicked", composer: "Stephen Schwartz", lyricist: "Stephen Schwartz", year: 2003 },
    {:title => "The Producers", :year => 1968, :composer => "Mel Brooks",:lyricist => "Mel Brooks" }
  ]
)



# Return all musicals
# **Musical.all**

# Find the first musical in the table
# ** Musical.first

# Find a musical by its title
# **Musical.find_by(title: "The Producers")

# Find all musicals composed by Richard Rodgers
# **Musical.where(composer: "Richard Rodgers")

# Order the musicals by year
# **Musical.order(:year)
# To reverse order
# **Musical.order(year: :desc)

# Find all musicals more recent than 1980
# *** Musical.where("year > 1980")
# Musical.select{|year| year[:year] > 1980}

# **Bonus**
# Return a list of just the titles of the musicals(without using .map)
# Musical.select{|title| title[:title]}
