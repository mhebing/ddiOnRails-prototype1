class QuestionScale < ActiveRecord::Base
  attr_accessible :label, :question_id, :value

  belongs_to :question
end
