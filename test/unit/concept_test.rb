# == Schema Information
#
# Table name: concepts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  label            :string(255)
#  abstract         :text
#  concept_group_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
