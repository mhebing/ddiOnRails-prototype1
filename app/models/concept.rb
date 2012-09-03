class Concept < ActiveRecord::Base
  attr_accessible :abstract, :concept_group_id, :label, :name

  belongs_to :concept_group
  has_many :variable_groups
end
