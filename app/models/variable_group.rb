class VariableGroup < ActiveRecord::Base
  attr_accessible :concept_id, :label, :logical_product_id, :name, :question_id

  belongs_to :logical_product
  belongs_to :concept
  belongs_to :question
  has_many :variables
end
