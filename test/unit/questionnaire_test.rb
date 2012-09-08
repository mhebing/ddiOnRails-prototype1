# == Schema Information
#
# Table name: questionnaires
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  label              :string(255)
#  abstract           :text
#  data_collection_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
