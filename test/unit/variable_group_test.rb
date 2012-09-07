# == Schema Information
#
# Table name: variable_groups
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  label              :string(255)
#  logical_product_id :integer
#  question_id        :integer
#  concept_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class VariableGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
