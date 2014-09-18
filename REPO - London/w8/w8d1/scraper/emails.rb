require 'rubygems'
require 'mechanize'

puts "\nEmail Scraper\n=============\n\nscraping emails...\n"

agent = Mechanize.new

#methods
def extract_links(page)
  links = page.search("table table:nth-child(3) tr:not(.tealbg) td:nth-child(2) a")

  links.map do |link|
     "http://www.phil-job.net/?#{link.attribute("href").value}"
  end
end

#constants
EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

#lists
link_list = []
email_list = []

#go to website
page = agent.get('http://www.phil-job.net/')

#search
search_form = page.form('form1')

("a".."z").each do |letter|
  puts "\nNow on Letter #{letter}.."
  search_form.req_searchfield = letter
  page = agent.submit(search_form, search_form.buttons.first)

  #get links from page
  puts "\nExtracting Links...\n\n"
  current_page = 1

  puts "..extracting links on page #{current_page}"
  link_list << extract_links(page)
  page = agent.page.link_with(:text => 'Next').click if(page.search('table table:nth-child(2) a').to_html.include?("Next"))
  current_page = current_page + 1

  while(page.search('table table:nth-child(2) a').to_html.include?("Next") && current_page < 3) do
    puts "..extracting links on page #{current_page}"
    link_list = link_list + extract_links(page)
    page = agent.page.link_with(:text => 'Next').click
    current_page = current_page + 1
  end
  puts "\nDone Extracting Links!\n"
end

#get emails from page after following links
puts "\nExtracting Emails..\n"
link_list.uniq.each_with_index do |link, index|
  begin
    puts "#{(index + 1)} / #{link_list.uniq.count}"
    page = agent.get(link)
    email_list << page.search("table table:nth-child(4) table:first tr:nth-child(3) td:last").to_html.match(EMAIL_REGEX).to_s
  rescue
  end
end
puts "\nDone Extracting Emails!.\n"

#output
email_list = email_list.uniq.compact.reject { |s| s.empty? }

# File.open('emails.txt', 'w') do |f1|
  email_list.each_with_index do |email, index|
    puts email
  end
# end

puts "\n#{email_list.count} emails stored on emails.txt\n"
puts "\nDone Scraping!\n"