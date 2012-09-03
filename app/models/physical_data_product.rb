class PhysicalDataProduct < ActiveRecord::Base
  attr_accessible :group_id, :label, :logical_product_id, :name

  belongs_to :group
  belongs_to :logical_product
  has_many :variables
end
