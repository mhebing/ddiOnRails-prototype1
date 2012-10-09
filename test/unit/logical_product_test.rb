# == Schema Information
#
# Table name: logical_products
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  label                 :string(255)
#  abstract              :text
#  study_unit_id         :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  conceptual_product_id :integer
#

require 'test_helper'

class LogicalProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
