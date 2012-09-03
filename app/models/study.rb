class Study < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :universe

  has_many :groups
  has_many :study_units

  def title
    if label.blank? then name else label end
  end
end
