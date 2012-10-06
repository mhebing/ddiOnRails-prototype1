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

  def title
    if label.blank? then name else label end
  end

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
end
