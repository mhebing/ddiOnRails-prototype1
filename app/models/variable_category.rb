class VariableCategory < ActiveRecord::Base
  attr_accessible :frequency, :label, :value, :variable_id

  belongs_to :variable

  def title
    if label.blank? then value else label end
  end
end
