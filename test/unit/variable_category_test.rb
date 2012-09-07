# == Schema Information
#
# Table name: variable_categories
#
#  id          :integer          not null, primary key
#  variable_id :integer
#  value       :integer
#  label       :string(255)
#  frequency   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class VariableCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
