class Player < ApplicationRecord
  validates_presence_of :participant_id
  validates_presence_of :game_id
  validates_uniqueness_of :participant_id, scope: :game_id

  belongs_to :participant
  belongs_to :game
  delegate :season, to: :game
  delegate :league, to: :season

  # def raw_score
  #   score * (1 - game.score_deprecation / 100.0)
  # end

  def score
    weighted_score = score_math
    (weighted_score * 1000).floor / 1000.0
  end

  private

  def score_math
    player_count   = game.player_count
    buy_in         = game.buy_in
    total_expense  = buy_in + additional_expense
    numerator      = (player_count * buy_in * (buy_in / total_expense.to_f))
    denominator    = (finishing_place + 1.0)
    score          = Math.sqrt(numerator) / (denominator)
  end
end


# =SQRT((COUNTIF(A:A, A2) * 15 * 15 / (15+D2))) / (B2 + 1)
