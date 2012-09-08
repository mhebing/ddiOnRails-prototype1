# == Schema Information
#
# Table name: question_answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  value       :integer
#  label       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class QuestionAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
