class Participant < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :first_name , scope: :last_name
  belongs_to :user
  has_many :players

  def global_attendance(league)
    (player_count / league.game_count.to_f) * 100
  end
  def global_score(league)
    players.sum(&:raw_score) / player_count
  end

  def global_win_or_placed(league)
    (top_three_count / player_count.to_f) * 100
  end

  def longest_streak(league)
    eligible_players = players.joins(:game).where("games.season_id = ?", league.season_ids).pluck(:finishing_place)
    eligible_players.chunk do |place|
      place == 1 || place == 2 || place == 3
    end.map { |_, x| x.size }.max
  end

  def player_count
    players.count
  end

  def top_three_count
    players.where(finishing_place: [1, 2, 3]).count
  end
end
