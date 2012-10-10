# == Schema Information
#
# Table name: concept_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  sort_id    :integer
#

require 'test_helper'

class ConceptGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
