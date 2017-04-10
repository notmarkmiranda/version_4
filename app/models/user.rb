class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  has_many :leagues
  has_many :participants

  def unfinished_participants(game)
    participants.includes(:players).where(players: { game_id: nil })
  end

  def no_leagues
    leagues.count == 0
  end
end
