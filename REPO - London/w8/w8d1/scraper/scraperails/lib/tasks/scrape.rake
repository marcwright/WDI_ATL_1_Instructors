namespace :scrape do

  desc "Scrape Google for links referring to a given search term"
  task :for_search_term => :environment do
    search_term = ARGV.last.to_s
    puts search_term

    raise "you've gotta give me a search term" if search_term.empty?

    agent = Mechanize.new

    page = agent.get('http://www.google.co.uk/')

    google_form = page.form('f')
    google_form.q = search_term
    page = agent.submit(google_form, google_form.buttons.first)

    links = map_links(page.links, search_term)
    puts "searching page"
    search_term_for_querystring = search_term.gsub(' ', '\+')

    page.links_with(href: Regexp.new("/search\\?q=#{search_term_for_querystring}&"), text: %r{\d+}).each do |result_page_link|
      puts "searching page"
      next_page = result_page_link.click
      links += map_links(next_page.links, search_term)
    end

    links.compact!

    links.each do |link|
      Link.where(search_term: search_term, text: link[:text], uri: link[:uri]).first_or_create!
    end

    task search_term.to_sym do ; end
  end

  def map_links(links, search_term)
    links.map do |link|
      if link.text =~ Regexp.new(search_term, :i) && !((matched_uri = /http.*?&/.match(link.uri.to_s).to_s).empty?)
        {
          text: link.text,
          uri: matched_uri,
        }
      end
    end
  end



end


