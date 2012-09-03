class Variable < ActiveRecord::Base
  attr_accessible :label, :name, :physical_data_product_id, :variable_group_id

  belongs_to :physical_data_product
  belongs_to :variable_group

  def title
    if label.blank? then name else label end
  end
end
