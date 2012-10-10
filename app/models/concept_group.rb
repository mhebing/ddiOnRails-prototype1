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
    CSV.foreach(filename, :headers => true) do |row|
      @row = row.to_hash
      if !@row["parent"].blank? &
         !ConceptGroup.find_by_name(@row["parent"]).blank?
      then
        @row["parent_id"] = ConceptGroup.find_by_name(@row["parent"]).id
      else
        @row["parent_id"] = nil
      end
      ConceptGroup.create(name: @row["name"],
                          parent_id: @row["parent_id"])
    end
  end

  #
  # ==== find_create(attribute_hash)
  #
  def self.find_create(attribute_hash)
    self.where(attribute_hash).first || self.create(attribute_hash)
  end


end
