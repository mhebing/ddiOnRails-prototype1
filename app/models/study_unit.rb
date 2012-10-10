# == Schema Information
#
# Table name: study_units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  study_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sort_id    :integer
#

class StudyUnit < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id, :sort_id

  belongs_to :study
  has_many :logical_products
  has_many :data_collections

  def title
    if label.blank? then name else label end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
