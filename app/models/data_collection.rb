class DataCollection < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_unit_id

  belongs_to :study_unit

  def title
    if label.blank? then name else label end
  end
end
