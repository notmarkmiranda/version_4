class Game < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :buy_in
  validates_presence_of :season_id
  validates_presence_of :attendees

  belongs_to :season
  delegate :league, to: :season
  has_many :players

  def actual_pot
    players.count > 0 ? pot_calculator : 0
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

  def in_place(place)
    players.where(finishing_place: place).first
  end

  def player_count
    players.count
  end

  def pot_calculator
    additional = players.pluck(:additional_expense).reduce(:+)
    player_count * buy_in + additional
  end

  def score_deprecation
    numerator = (season.games.pluck(:id).index(self.id) + 1)
    100 - ((numerator / season.game_count.to_f * 100) * 100).floor / 100.0
  end

end
