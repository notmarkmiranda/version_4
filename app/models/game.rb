class Game < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :buy_in
  validates_presence_of :season_id
  validates_presence_of :attendees

  belongs_to :season
  delegate :league, to: :season
  has_many :players

  def actual_pot
    additional = players.pluck(:additional_expense).reduce(:+)
    player_count * buy_in + additional
  end

  def available_places
    available = [*1..attendees]
    places = players.pluck(:finishing_place)
    available - places
  end

  def estimated_or_pot
    completed ? actual_pot : buy_in * attendees
  end

  def finished_players
    players.where.not(finishing_place: nil).sort_by(&:finishing_place)
  end

  def finished_players_count_greater_than_zero
    finished_players.count > 0
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
