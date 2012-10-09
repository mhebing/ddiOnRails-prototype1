# == Schema Information
#
# Table name: physical_data_products
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  label              :string(255)
#  group_id           :integer
#  logical_product_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PhysicalDataProduct < ActiveRecord::Base
  attr_accessible :group_id, :label, :logical_product_id, :name

  belongs_to :group
  belongs_to :logical_product
  has_many :variables
  has_many :physical_instances
  has_one :study_unit, through: :logical_product
  has_one :study, through: :logical_product

  def title
    if label.blank? then name else label end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
