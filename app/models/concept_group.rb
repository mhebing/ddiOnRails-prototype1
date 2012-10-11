# == Schema Information
#
# Table name: concept_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  label      :string(255)
#  abstract   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  sort_id    :integer
#

class ConceptGroup < ActiveRecord::Base
  attr_accessible :abstract, :label, :name, :parent_id, :sort_id

  has_many :concepts
  has_many :concept_groups, class_name: "ConceptGroup", foreign_key: "parent_id"
  belongs_to :parent, class_name: "ConceptGroup"

  def title
    if label.blank? then name else label end
  end

  def self.import(filename="import/concept_groups.csv")
    require 'csv'
    CSV.foreach(filename, :headers => true) do |row|
      @row = row.to_hash
      @concept_group = ConceptGroup.find_or_create_by_name(@row["name"])
      unless @row["parent"].blank?
        @concept_group.parent = ConceptGroup.find_or_create_by_name(@row["parent"])
      else
        @concept_group.parent = nil
      end
      @concept_group.label = @row["label"] unless @row["label"].blank?
      @concept_group.sort_id = @row["sort_id"] unless @row["sort_id"].blank?
      @concept_group.save
    end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end


end
