# == Schema Information
#
# Table name: logical_products
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  label         :string(255)
#  abstract      :text
#  study_unit_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LogicalProduct < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_unit_id

  belongs_to :study_unit
  has_many :physical_data_products
  has_many :variable_groups

  def title
    if label.blank? then name else label end
  end
end
