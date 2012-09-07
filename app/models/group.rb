# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  study_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id

  belongs_to :study
  has_many :physical_data_products

  def title
    if label.blank? then name else label end
  end
end
