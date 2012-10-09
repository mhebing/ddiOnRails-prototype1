# == Schema Information
#
# Table name: variable_groups
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  label              :string(255)
#  logical_product_id :integer
#  question_id        :integer
#  concept_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class VariableGroup < ActiveRecord::Base
  attr_accessible :concept_id, :label, :logical_product_id, :name, :question_id

  belongs_to :logical_product
  belongs_to :concept
  belongs_to :question
  has_many :variables
  has_and_belongs_to_many :baskets

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
