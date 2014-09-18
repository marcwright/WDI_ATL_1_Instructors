class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'Person'
  belongs_to :moderator, class_name: 'Person'
  attr_accessible :content, :published_at, :title, :author_id, :moderator_id

  scope :published, where("published_at is not null")
  scope :moderated_by, Proc.new { |moderator| where("moderator_id = ?", moderator.id) }
  scope :authored_by, Proc.new { |author_id|  where(author_id: author_id) }

  validates :title, presence: true
  validates :author, presence: true
  validate :needs_both_published_at_and_moderator_or_neither
  validate :cant_publish_own_articles

  def published?
    !!published_at
  end

  def publish!(moderator)
    raise "cannot publish unsaved article" if changes.any?
    raise "already published" if published?
    update_attributes!(moderator_id: moderator.id, published_at: Time.now)
  end

  private
  def needs_both_published_at_and_moderator_or_neither
    if (moderator_id || published_at) && (published_at.nil? || Person.find_by_id(moderator_id).nil?)
      errors.add :base, "needs both a 'published at' date and a moderator if either are given"
    end
  end

  private
  def cant_publish_own_articles
    if moderator_id && moderator_id == author_id
      errors.add :base, "author can't publish their own articles"
    end
  end

end
