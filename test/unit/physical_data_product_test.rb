# == Schema Information
#
# Table name: physical_data_products
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  label              :string(255)
#  group_id           :integer
#  logical_product_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class PhysicalDataProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
