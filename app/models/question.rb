# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  label       :string(255)
#  fix_name    :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :description, :fix_name, :label, :name

  has_many :variable_groups

  def title
    if label.blank? then name else label end
  end
end
