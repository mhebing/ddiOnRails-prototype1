class Group < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id

  belongs_to :study
  has_many :physical_data_products
end