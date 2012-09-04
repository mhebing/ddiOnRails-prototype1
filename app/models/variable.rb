class Variable < ActiveRecord::Base
  attr_accessible :label, :name, :physical_data_product_id, :variable_group_id

  belongs_to :physical_data_product
  belongs_to :variable_group

  has_many :variable_statistics

  has_many :variable_categories

  has_one :group, through: :physical_data_product

  def title
    if label.blank? then name else label end
  end
end
