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
#  sort_id    :integer
#

class Study < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :universe, :sort_id

  has_many :groups
  has_many :study_units

  has_many :variable_groups, through: :groups

  #
  # == Title
  #
  # Returns the title of the Study:
  # * +label+, if +label+ exists, otherwise
  # * +name+.
  #
  def title
    if label.blank? then name else label end
  end

  #
  # == Import
  #
  # Import StudyUnits from CSV file.
  # This corresponds to the logical level.
  #
  # *Args:*
  # * +filename+ (Default: import/study_units.csv)
  #
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

  #
  # == Import SOEPinfo1
  #
  # Import for data from SOEPinfo v.1.
  # This corresponds to the physical level
  #
  # *Args:*
  # * +filename+ (Default: "import/soepinfo1.csv")
  # * +group+ (Default: "v1")
  #
  def import_soepinfo1(filename="import/soepinfo1.csv", group="v1")
    @group = Group.find_or_create_by_name_and_study_id(group, id)
    Study.transaction do
      CSV.foreach(filename = filename, headers: true) do |row|
      @row = row.to_hash
      @study_unit = StudyUnit.find_or_create_by_name_and_study_id(@row["study_unit"], id)
      @logical_product = LogicalProduct.find_or_create_by_name_and_study_unit_id(@row["product"], @study_unit.id)
      @physical_data_product = PhysicalDataProduct.find_or_create_by_name_and_group_id(@row["product"], @group.id)
      @concept = Concept.find_or_create_by_name(@row["concept"])
      @variable_group = VariableGroup.find_or_create_by_name_and_logical_product_id_and_concept_id(@row["variable"], @logical_product.id, @concept.id)
      @variable = Variable.find_or_create_by_name_and_physical_data_product_id_and_variable_group_id(@row["variable"], @physical_data_product.id, @variable_group.id)
      @variable_category = VariableCategory.create(value: @row["category_val"], label: @row["category_lab"], variable_id: @variable.id)
      end
    end

  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
