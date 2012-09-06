class ConceptGroup < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :parent_id

  has_many :concepts
  has_many :concept_groups, class_name: "ConceptGroup", foreign_key: "parent_id"
  belongs_to :parent, class_name: "ConceptGroup"

  def title
    if label.blank? then name else label end
  end
end
