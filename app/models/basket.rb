class Basket < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :variable_groups

  def title
    name
  end
end
