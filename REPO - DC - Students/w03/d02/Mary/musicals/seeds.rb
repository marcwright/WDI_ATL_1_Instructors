require_relative './musical'

Musical.delete_all

Musical.create(
  [
    { title: "The Sound of Music", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1959 },
    { title: "Les Miserables", composer: "Claude-Michel Schonberg", lyricist: "Herbert Kretzmer", year: 1985 },
    { title: "West Side Story", composer: "Leonard Bernstein", lyricist: "Stephen Sondheim", year: 1957 },
    { title: "Oklahoma", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1943 },
    { title: "Sweeney Todd", composer: "Stephen Sondheim", lyricist: "Stephen Sondheim", year: 1979 },
    { title: "Wicked", composer: "Stephen Schwartz", lyricist: "Stephen Schwartz", year: 2003 }
    { title: "The Lion King", composer: "Elton John", lyricist: "Tim Rice", year: 1997 },
    { title: "Cats", composer: "Andrew Lloyd Webber", lyricist: "TS Eliot", year: 1981 },
    { title: "Spamalot", composer: "John Du Prez", lyricist: "Eric Idle", year: 2005 }
  ]
)
