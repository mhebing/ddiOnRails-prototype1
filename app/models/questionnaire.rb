class Questionnaire < ActiveRecord::Base
  attr_accessible :abstract, :data_collection_id, :label, :name

  belongs_to :data_collection
  has_many :questions

  def title
    if label.blank? then name else label end
  end

  def import(filename="import/questionnaire.xml")
    file = File.open(filename)
    questionnaire = Nokogiri::XML(file)
    file.close

    questionnaire.xpath("//Single | //Multi | //Open | //Grid").each do |question|
      @question = Question.new
      @question.questionnaire_id = id
      @question.number = question.xpath("./Name").text
      @question.name   = question.xpath(".//FormText/Title").text
      @question.label  = question.xpath(".//FormText/Text").text
      question.xpath(".//Answers/Answer").each do |answer|
        @question.question_answers << QuestionAnswer.new(
          value: answer.xpath("@Precode").to_s,
          label: answer.xpath(".//Text").text)
      end
      question.xpath(".//Scales/Scale").each do |scale|
        @question.question_scales << QuestionScale.new(
          value: scale.xpath("@Precode").to_s,
          label: scale.xpath(".//Text").text)
      end
      @question.save
    end
  end
   
end
