# == Schema Information
#
# Table name: data_collections
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  label         :string(255)
#  abstract      :text
#  study_unit_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class DataCollection < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_unit_id

  belongs_to :study_unit
  has_many :questionnaires

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
