# == Schema Information
#
# Table name: studies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  universe   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StudyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
