# == Schema Information
#
# Table name: variables
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  label                    :string(255)
#  physical_data_product_id :integer
#  variable_group_id        :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Variable < ActiveRecord::Base
  attr_accessible :label, :name, :physical_data_product_id, :variable_group_id

  belongs_to :physical_data_product
  belongs_to :variable_group

  has_many :variable_statistics

  has_many :variable_categories

  has_one :group, through: :physical_data_product
  has_one :question, through: :variable_group
  has_one :concept, through: :variable_group

  has_and_belongs_to_many :baskets

  #
  # ==== title()
  #
  # Returns (1) +label+ if exists, (2) otherwise +name+.
  #
  def title
    if label.blank? then name else label end
  end

  #
  # ==== to_compare()
  #
  # Generates string representation of the Variable and
  # its VariableCategories and VariableStatistics.
  #
  def to_compare
    @compare = {"name" => name, "label" => label}
    variable_categories.each do |category|
      if category.value.blank?
      then
      @compare["strings"] ||= []
      @compare["strings"] << category.label
      else
      @compare["value_labels"] ||= {}
      @compare["value_labels"][category.value.to_s] = category.label
      end
    end
    return @compare
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end

end
