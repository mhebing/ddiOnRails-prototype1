# == Schema Information
#
# Table name: variable_statistics
#
#  id          :integer          not null, primary key
#  variable_id :integer
#  value       :decimal(, )
#  statistic   :string(255)
#

class VariableStatistic < ActiveRecord::Base
  attr_accessible :variable_id, :statistic, :value

  belongs_to :variable

  def title
    variable.title
  end
end
