class Publication < ActiveRecord::Base
  attr_accessible :author, :name, :year

  has_and_belongs_to_many :user_profiles

  def title
    name
  end
end
