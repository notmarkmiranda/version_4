class Game < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :buy_in
  validates_presence_of :season_id
  validates_presence_of :attendees

  belongs_to :season
  delegate :league, to: :season
  has_many :players

  def finished_players
    players.where.not(finishing_place: nil)
  end

  def player_count
    players.count
  end

  def score_game
    players.each do |player|
      player.update(score: player.get_score)
    end
  end
end
