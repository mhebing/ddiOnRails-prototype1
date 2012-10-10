# == Schema Information
#
# Table name: study_units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  study_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sort_id    :integer
#

require 'test_helper'

class StudyUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
