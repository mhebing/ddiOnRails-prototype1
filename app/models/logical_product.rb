class LogicalProduct < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_unit_id

  belongs_to :study_unit
  has_many :physical_data_products
  has_many :variable_groups

  def title
    if label.blank? then name else label end
  end
end
