class PhysicalInstance < ActiveRecord::Base
  attr_accessible :description, :filename, :fingerprint, :format, :label, :name, :physical_data_product_id

  belongs_to :physical_data_product

  def title
    if label.blank? then name else label end
  end
end
