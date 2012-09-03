class StudyUnit < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id

  belongs_to :study
  has_many :logical_products
  has_many :data_collections

  def title
    if label.blank? then name else label end
  end
end
