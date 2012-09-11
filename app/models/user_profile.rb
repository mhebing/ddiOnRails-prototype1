# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  make_public :boolean
#

class UserProfile < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :make_public

  belongs_to :user
  has_and_belongs_to_many :publications
  has_many :baskets, through: :user

  def title
    name
  end
end
