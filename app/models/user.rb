class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  has_many :leagues

  def no_leagues
    leagues.count == 0
  end
end
