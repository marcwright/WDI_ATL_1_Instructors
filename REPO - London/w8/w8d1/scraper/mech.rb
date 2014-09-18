  require 'rubygems'
  require 'mechanize'
  require 'pry'

  def main
    agent = Mechanize.new

    page = agent.get('http://www.google.co.uk/')

    binding.pry
  end

  main
