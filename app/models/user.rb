class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  has_many :leagues
  has_many :participants

  def unfinished_participants(game, current_participant=nil)
    ids = participants.joins(:players).where(players: { game_id: game.id }).pluck(:id)
    participants.where.not(id: ids)
  end

  def no_leagues
    leagues.count == 0
  end
end
