# == Schema Information
#
# Table name: study_units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  study_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudyUnit < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id

  belongs_to :study
  has_many :logical_products
  has_many :data_collections

  def title
    if label.blank? then name else label end
  end

  def self.import(filename="import/study_units.csv", study_name="core")
    @study = Study.find_or_create_by_name(study_name)
    CSV.foreach(filename, headers: true) do |row|
      @row = row.to_hash
      @study_unit = StudyUnit.where(study_id: @study.id, name: @row["study_unit.name"]).first ||
                    StudyUnit.create(study_id: @study.id, name: @row["study_unit.name"])
      @logical_product = LogicalProduct.where(study_unit_id: @study_unit.id, name: @row["logical_product.name"]).first ||
                         LogicalProduct.create(study_unit_id: @study_unit.id, name: @row["logical_product.name"])
      @concept = Concept.find_or_create_by_name(@row["concept.name"])
      @variable_group = VariableGroup.where(logical_product_id: @logical_product.id, concept_id: @concept.id,
                                            name: @row["variable_group.name"]).first ||
                        VariableGroup.create(logical_product_id: @logical_product.id, concept_id: @concept.id,
                                             name: @row["variable_group.name"], label: @row["variable_group.label"])
    end
  end
end
