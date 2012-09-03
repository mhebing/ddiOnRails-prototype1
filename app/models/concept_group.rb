class ConceptGroup < ActiveRecord::Base
  attr_accessible :abstract, :label, :name

  has_many :concepts

  def title
    if label.blank? then name else label end
  end
end
