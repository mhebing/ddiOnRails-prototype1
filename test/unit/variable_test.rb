# == Schema Information
#
# Table name: variables
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  label                    :string(255)
#  physical_data_product_id :integer
#  variable_group_id        :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class VariableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
