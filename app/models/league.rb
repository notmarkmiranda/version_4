class League < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :user

  def find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    name.parameterize
  end

end
