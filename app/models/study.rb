# == Schema Information
#
# Table name: studies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  universe   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Study < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :universe

  has_many :groups
  has_many :study_units

  def title
    if label.blank? then name else label end
  end
end
