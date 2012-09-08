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

require 'test_helper'

class QuestionScaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
