class Season < ApplicationRecord
  belongs_to :league
  has_many :games

  def game_count
    games.count
  end
end
