module ApplicationHelper
  def possessive(value)
    value.downcase.ends_with?('s') ? "#{value}'" : "#{value}'s"
  end
end
