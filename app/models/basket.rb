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
#  make_public :boolean
#

class Basket < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :variable_groups
  has_and_belongs_to_many :variables

  def title
    name
  end
end
