# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  label            :string(255)
#  fix_name         :string(255)
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  number           :integer
#  type             :string(255)
#  questionnaire_id :integer
#

class Question < ActiveRecord::Base
  attr_accessible :description, :fix_name, :label, :name, :questionnaire_id

  belongs_to :questionnaire
  has_many :variable_groups
  has_many :question_answers
  has_many :question_scales

  def title
    if label.blank? then name else label end
  end
end
