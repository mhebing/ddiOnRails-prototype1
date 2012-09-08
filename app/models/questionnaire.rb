class Questionnaire < ActiveRecord::Base
  attr_accessible :abstract, :data_collection_id, :label, :name

  belongs_to :data_collection
  has_many :questions

  def title
    if label.blank? then name else label end
  end
end
