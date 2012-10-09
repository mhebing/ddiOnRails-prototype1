# == Schema Information
#
# Table name: question_scales
#
#  id          :integer          not null, primary key
#  question_id :integer
#  value       :integer
#  label       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionScale < ActiveRecord::Base
  attr_accessible :label, :question_id, :value

  belongs_to :question

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
