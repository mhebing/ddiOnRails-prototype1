class Question < ActiveRecord::Base
  attr_accessible :description, :fix_name, :label, :name

  has_many :variable_groups

  def title
    if label.blank? then name else label end
  end
end
