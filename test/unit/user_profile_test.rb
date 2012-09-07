# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
