class ConceptGroup < ActiveRecord::Base
  attr_accessible :abstract, :label, :name

  has_many :concepts
end
