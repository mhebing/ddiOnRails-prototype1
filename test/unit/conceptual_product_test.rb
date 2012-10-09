# == Schema Information
#
# Table name: conceptual_products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  abstract   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label      :string(255)
#

require 'test_helper'

class ConceptualProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
