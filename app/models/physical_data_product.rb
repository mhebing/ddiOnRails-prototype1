class PhysicalDataProduct < ActiveRecord::Base
  attr_accessible :group_id, :label, :logical_product_id, :name

  belongs_to :group
  belongs_to :logical_product
  has_many :variables
  has_many :physical_instances

  def title
    if label.blank? then name else label end
  end
end
