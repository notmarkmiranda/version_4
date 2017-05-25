class Season < ApplicationRecord
  belongs_to :league
  has_many :games
  has_many :players, through: :games

  def average_pot_size
    total_pot_size / game_count.to_f
  end

  def game_count
    games.count
  end

  def leader
    season_participants = Participant.joins(:players).uniq
    season_participants.max_by { |part| part.players.sum(&:raw_score) / part.players.count }
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
