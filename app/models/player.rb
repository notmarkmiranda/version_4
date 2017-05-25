class Player < ApplicationRecord
  validates_presence_of :participant_id
  validates_presence_of :game_id
  validates_uniqueness_of :participant_id, scope: :game_id

  belongs_to :participant
  belongs_to :game
  delegate :season, to: :game
  delegate :league, to: :season

  def raw_score
    score * (1 - game.score_deprecation / 100.0)
  end

  def score
    weighted_score = score_math
    (weighted_score * 100).floor / 100.0
  end

  private

  def score_math
    player_count   = game.player_count
    buy_in         = game.buy_in
    total_expense  = buy_in + additional_expense
    numerator      = (player_count * buy_in ** 2 / total_expense)
    denominator    = (finishing_place + 1.0)
    score          = Math.sqrt(numerator) / (denominator)
    weighted_score = score - (score * game.score_deprecation)
  end
end
