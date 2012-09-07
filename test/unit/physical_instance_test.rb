# == Schema Information
#
# Table name: physical_instances
#
#  id                       :integer          not null, primary key
#  physical_data_product_id :integer
#  name                     :string(255)
#  label                    :string(255)
#  description              :text
#  filename                 :string(255)
#  format                   :string(255)
#  fingerprint              :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class PhysicalInstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
