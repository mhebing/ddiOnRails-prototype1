class Concept < ActiveRecord::Base
  attr_accessible :abstract, :concept_group_id, :label, :name

  belongs_to :concept_group
  has_many :variable_groups

  def title
    if label.blank? then name else title end
  end
end
