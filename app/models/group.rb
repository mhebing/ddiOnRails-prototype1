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
#

class Group < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :study_id

  belongs_to :study
  has_many :physical_data_products

  def title
    if label.blank? then name else label end
  end

  def import(filename = "import/group.xml")
    file = File.open(filename)
    group = Nokogiri::XML(file)
    file.close

    group.xpath("//var").each do |var|
      if var.xpath("@files").blank?
        then @physical_data_product = PhysicalDataProduct.find_or_create_by_name_and_group_id("default", id)
        else @physical_data_product = PhysicalDataProduct.find_or_create_by_name_and_group_id(var.xpath("@files"), id)
      end
      @variable = Variable.new
      @variable.name = var.xpath("@name").to_s unless var.xpath("@name").blank?
      @variable.label = var.xpath(".//labl").children.to_s unless var.xpath(".//labl").blank?
      @variable.physical_data_product = @physical_data_product
      var.xpath(".//sumStat").each do |sumStat|
        @variable.variable_statistics << VariableStatistic.new(
           statistic: sumStat.xpath("@type").to_s,
           value: sumStat.children.to_s)
      end
      var.xpath(".//catgry").each do |catgry|
        @variable.variable_categories << VariableCategory.new(
           label: catgry.xpath(".//catValu").children.to_s,
           frequency: catgry.xpath(".//catStat").children.to_s)
      end
      @variable.save
    end
  end
end
