# == Schema Information
#
# Table name: concepts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  label            :string(255)
#  abstract         :text
#  concept_group_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Concept < ActiveRecord::Base
  attr_accessible :abstract, :concept_group_id, :label, :name

  belongs_to :concept_group
  has_many :variable_groups

  has_many :variables, through: :variable_groups

  def title
    if label.blank? then name else title end
  end
end
