class Season < ApplicationRecord
  belongs_to :league
  has_many :games
  has_many :players, through: :games
  has_many :participants, through: :players

  def average_pot_size
    total_pot_size / game_count.to_f
  end

  def game_count
    games.count
  end

  def leader
    participants.max_by { |part| part.players.sum(&:raw_score) / part.players.count }
  end

  def player_count
    players.count
  end

  def players_per_game
    player_count / game_count.to_f
  end

  def total_pot_size
    games.sum(&:actual_pot)
  end
end
