class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  scope :excluding, lambda { |*users| where(["users.id NOT IN (?)", users.compact.flatten.map(&:id) << 0]) }
  scope :leaderboard, select('users.*, sum(scores.value) as total_score').joins('left join scores on users.id = scores.player_id').group('users.id').order('total_score DESC')

  validates :name, presence: true

  has_many :games_as_player1, foreign_key: :player1_id, class_name: 'Game'
  has_many :games_as_player2, foreign_key: :player2_id, class_name: 'Game'
  has_many :moves, foreign_key: :player_id
  has_many :scores, foreign_key: :player_id

  def games
    @games = Game.where("games.player1_id = :id OR games.player2_id = :id", id: id)
  end

  def total_score
    @_total_score ||= scores.select('sum(scores.value) as total_score').group('scores.player_id').first.try(:total_score).to_i
  end

  def leaderboard_position
    User.joins(:scores).group('users.id').having('sum(scores.value) > ?', total_score).all.count + 1
  end
end
