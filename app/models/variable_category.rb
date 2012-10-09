# == Schema Information
#
# Table name: variable_categories
#
#  id          :integer          not null, primary key
#  variable_id :integer
#  value       :integer
#  label       :string(255)
#  frequency   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VariableCategory < ActiveRecord::Base
  attr_accessible :frequency, :label, :value, :variable_id

  belongs_to :variable

  def title
    if label.blank? then value else label end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
