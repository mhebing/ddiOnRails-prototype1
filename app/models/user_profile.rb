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
    unless name.blank? then name else "Anonymous User" end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
