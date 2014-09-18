require 'redcarpet'

module MarkdownHandler

  def self.rc_options
    {
      :fenced_code_blocks => true,
      :disable_indented_code_blocks => true,
      :autolink           => true,
      :no_intra_emphasis  => true,
      :strikethrough      => true,
      :highlight          => true
    }
  end

  def self.rc
    @rc ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, rc_options)
  end

  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template)
    compiled_source = erb.call(template)
    "MarkdownHandler.rc.render(begin;#{compiled_source};end)"
  end
end

ActionView::Template.register_template_handler :md, MarkdownHandler

module Haml::Filters

  remove_filter("Markdown") #remove the existing Markdown filter

  module Markdown

    include Haml::Filters::Base

    def render(text)
      MarkdownHandler.rc.render(text)
    end

  end
end