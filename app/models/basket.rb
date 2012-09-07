# == Schema Information
#
# Table name: baskets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Basket < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :variable_groups

  def title
    name
  end
end
