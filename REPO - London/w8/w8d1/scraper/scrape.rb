
require 'rubygems'
require 'mechanize'
require 'pry'

def main
  agent = Mechanize.new

  page = agent.get('http://www.google.co.uk/')

  search_term = 'pavling'

  google_form = page.form('f')
  google_form.q = search_term
  page = agent.submit(google_form, google_form.buttons.first)

  puts "searching page"
  links = map_links(page.links, search_term)

  page.links_with(text: Regexp.new(search_term, :i)).map do |link|
    # match anything beginning `http` which is followed by an ampersand (the `(?=x)` is a 'lookahead'), but only to the first ampersand (using the `?` as a non-greedy modifier on the `.*` quantifier)
    matched_uri = /http.*?(?=&)/.match(link.uri.to_s).to_s

    if !matched_uri.empty?
      {
        text: link.text,
        uri: matched_uri,
      }
    end
  end

  links.compact!

  binding.pry
end


def map_links(links, search_term)
  links.map do |link|
    if link.text =~ Regexp.new(search_term, :i) && !((matched_uri = /http.*?(?=&)/.match(link.uri.to_s).to_s).empty?)
      {
        text: link.text,
        uri: matched_uri,
      }
    end
  end
end

main

