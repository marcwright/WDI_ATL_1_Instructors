class Snippet < ActiveRecord::Base
  attr_accessible :description, :haml_input, :scss_input, :title

  validates :title, presence: true

  validate :haml_valid, :scss_valid

  def haml_valid
    html_output
  rescue => e
    errors.add(:haml_input, e.message)
  end

  def scss_valid
    css_output
  rescue => e
    errors.add(:scss_input, e.message)
  end

  def html_output
    Haml::Engine.new(haml_input).render.html_safe
  end

  def css_output
    Sass::Engine.new(scss_input, :syntax => :scss).render.html_safe
  end

  def html_id
    "snippet-#{id}"
  end

  def namespaced_css_output
    namespaced_scss = <<-NAMESPACED_SCSS.strip_heredoc
      ##{html_id} {
        #{css_output}
      }
    NAMESPACED_SCSS
    Sass::Engine.new(namespaced_scss, :syntax => :scss).render
  end

  def result
    output = <<-HTML_OUTPUT.strip_heredoc
      <style>
        #{namespaced_css_output}
      </style>
      <div id=#{html_id} class="clearfix">
        #{html_output}
      </div>
    HTML_OUTPUT
    output.html_safe
  end

end
