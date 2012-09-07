# == Schema Information
#
# Table name: data_collections
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  label         :string(255)
#  abstract      :text
#  study_unit_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class DataCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
