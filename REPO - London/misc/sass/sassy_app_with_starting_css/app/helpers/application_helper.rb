module ApplicationHelper
  def markdown(str)
    MarkdownHandler.rc.render(str).html_safe
  end
end
