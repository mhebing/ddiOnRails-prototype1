# == Schema Information
#
# Table name: baskets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  make_public :boolean
#

require 'test_helper'

class BasketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
