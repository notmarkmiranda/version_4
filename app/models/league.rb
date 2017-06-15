class League < ApplicationRecord
  after_create :create_first_season
  validates_presence_of :name
  validates_uniqueness_of :name
  before_save :slugify
  belongs_to :user
  has_many :seasons, dependent: :destroy
  has_many :games, through: :seasons

  def biggest_game
    games.max_by(&:actual_pot)
  end

  def current_season
    seasons.where(active: true).first
  end

  def current_season_games
    current_season.games
  end

  def game_count
    games.count
  end

  def leader
    user.participants.joins(:players).empty? ? nil : user.participants.max_by { |part| participant_sum_score(part) }
  end

  def participant_count
    user.participants.count
  end

  def seasons_count
    seasons.count
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    name.parameterize
  end

  def unscored_games
    games.where(completed: false)
  end

  private

  def participant_sum_score(part)
    part.players.count == 0 ? 0 : part.players.sum(&:score) / part.players.count
  end

  def slugify
    self.slug = to_param
  end

  def create_first_season
    seasons.create!(active: true)
  end

end
