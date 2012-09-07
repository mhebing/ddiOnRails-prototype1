# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  name       :string(255)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publication < ActiveRecord::Base
  attr_accessible :author, :name, :year

  has_and_belongs_to_many :user_profiles

  def title
    name
  end
  def self.import
    CSV.foreach(filename = "import/publications.csv", headers: true) do |row|
      @row = row.to_hash
      Publication.create(@row)
    end
  end
end
