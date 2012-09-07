# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  name       :string(255)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
