module ArticlesHelper
  def article_row(article)
    [
      article.title,
      ("written by #{article.author.name}" if article.author),
      ("published #{time_ago_in_words(article.published_at)} ago by #{article.moderator.try(:name)}" if article.published?), 
    ].delete_if(&:blank?).join(', ')
  end
end
