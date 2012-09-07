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

  def title
    if label.blank? then name else label end
  end
end
