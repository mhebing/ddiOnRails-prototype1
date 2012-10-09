# == Schema Information
#
# Table name: physical_instances
#
#  id                       :integer          not null, primary key
#  physical_data_product_id :integer
#  name                     :string(255)
#  label                    :string(255)
#  description              :text
#  filename                 :string(255)
#  format                   :string(255)
#  fingerprint              :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class PhysicalInstance < ActiveRecord::Base
  attr_accessible :description, :filename, :fingerprint, :format, :label, :name, :physical_data_product_id

  belongs_to :physical_data_product

  has_one :group, through: :physical_data_product

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
