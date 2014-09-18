require 'pry'
require 'httparty'
require 'json'

puts "Who is your favorite author?"

author = gets.chomp.gsub(" ", "+")

author_page = HTTParty.get("https://www.goodreads.com/api/author_url/#{author}?key=0416RtP6JtDIuXaEJmkjhQ")
author_id = author_page["GoodreadsResponse"]["author"]["id"]
response = HTTParty.get("https://www.goodreads.com/author/show/#{author_id}.xml?key=0416RtP6JtDIuXaEJmkjhQ")
author_stuff = response["GoodreadsResponse"]["author"]
author_name = author_stuff["name"]
author_home = author_stuff["hometown"]
author_birth = author_stuff["born_at"]
author_death = author_stuff["died_at"]
author_photo = author_stuff["image_url"]
author_about = author_stuff["about"]

author_books = HTTParty.get("https://www.goodreads.com/author/list/#{author_id}.xml?key=0416RtP6JtDIuXaEJmkjhQ")

books = author_books["GoodreadsResponse"]["author"]["books"]["book"]

all_books = books.map do |book|
  book["title"]
end
binding.pry

# puts "What is your favorite book?"

# book = gets.chomp.gsub(" ", "+")
# book_page = HTTParty.get("https://www.goodreads.com/search.xml?key=0416RtP6JtDIuXaEJmkjhQ&q=#{book}")
# book_results = book_page["GoodreadsResponse"]["search"]["results"]["work"]
# num_results = book_page["GoodreadsResponse"]["search"]["results_end"]
# all_book_results = book_results.map do |book_result|
#   book_result["best_book"]["title"]
# end
# binding.pry
# puts "Your search yielded #{num_results} results:"
# puts all_book_results


