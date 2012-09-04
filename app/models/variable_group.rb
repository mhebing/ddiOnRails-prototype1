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
end
