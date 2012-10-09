# == Schema Information
#
# Table name: logical_products
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  label                 :string(255)
#  abstract              :text
#  study_unit_id         :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  conceptual_product_id :integer
#

class LogicalProduct < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_unit_id, :conceptual_product_id

  belongs_to :study_unit
  belongs_to :conceptual_product
  has_many :physical_data_products
  has_many :variable_groups

  has_one :study, through: :study_unit

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
