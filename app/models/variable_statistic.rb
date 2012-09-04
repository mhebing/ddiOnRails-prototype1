class VariableStatistic < ActiveRecord::Base
  attr_accessible :variable_id, :statistic, :value

  belongs_to :variable

  def title
    variable.title
  end
end
