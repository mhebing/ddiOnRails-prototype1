# == Schema Information
#
# Table name: conceptual_products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  abstract   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label      :string(255)
#  sort_id    :integer
#

class ConceptualProduct < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :sort_id

  has_many :logical_products

  #
  # ==== title()
  #
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
