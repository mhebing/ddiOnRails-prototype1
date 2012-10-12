# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  study_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  current    :boolean
#

class Group < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id, :current

  belongs_to :study
  has_many :physical_data_products

  has_many :variables, through: :physical_data_products
  has_many :variable_groups, through: :variables

  #
  # ==== title()
  #
  def title
    if label.blank? then name else label end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

  #
  # ==== import(filename)
  #
  # Import DDI 2.5 compliant XML file with dataset descriptions.
  #
  def import_product(filename = "import/group.xml", physical_product = "default")
    file = File.open(filename)
    group = Nokogiri::XML(file)
    file.close

    group.xpath("//var").each do |var|
      if var.xpath("@files").blank?
        @physical_data_product = PhysicalDataProduct.find_create(
          name: physical_product, group_id: id)
      else
        @physical_data_product = PhysicalDataProduct.find_create(
          name: var.xpath("@files"), group_id: id)
      end

      @logical_product = study.logical_products.find_by_name(@physical_data_product.name)
      if @logical_product.blank?
        @study_unit = StudyUnit.find_create(name: "default", study_id: study.id)
        @logcial_product = LogicalProduct.find_create(name: physical_product, study_unit_id: @study_unit.id)
      end
      @variable = Variable.new
      @variable.name = var.xpath("@name").to_s unless var.xpath("@name").blank?
      @variable.variable_group = VariableGroup.find_create(
        name: @variable.name, logical_product_id: @logical_product.id)
      @variable.label = var.xpath(".//labl").children.to_s unless var.xpath(".//labl").blank?
      @variable.physical_data_product = @physical_data_product
      var.xpath(".//sumStat").each do |sumStat|
        @variable.variable_statistics << VariableStatistic.new(
           statistic: sumStat.xpath("@type").to_s,
           value: sumStat.text)
      end
      var.xpath(".//catgry").each do |catgry|
        @variable.variable_categories << VariableCategory.new(
           label: catgry.xpath(".//catValu").text,
           frequency: catgry.xpath(".//catStat").text)
      end
      @variable.save
    end
  end


end
