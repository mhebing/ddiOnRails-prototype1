# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  label       :string(255)
#  fix_name    :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
