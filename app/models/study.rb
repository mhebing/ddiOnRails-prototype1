# == Schema Information
#
# Table name: studies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  universe   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Study < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :universe

  has_many :groups
  has_many :study_units

  has_many :variable_groups, through: :groups

  def title
    if label.blank? then name else label end
  end


  def import(filename="import/study_units.csv")
    require 'csv'
    CSV.foreach(filename, headers: true) do |row|
      @row = row.to_hash
      @study_unit = StudyUnit.where(study_id: id, name: @row["study_unit.name"]).first ||
                    StudyUnit.create(study_id: id, name: @row["study_unit.name"])
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
