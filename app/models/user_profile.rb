class UserProfile < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :publications
  has_many :baskets, through: :user

  def title
    name
  end
end
