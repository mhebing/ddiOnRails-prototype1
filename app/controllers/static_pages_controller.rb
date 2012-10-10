class StaticPagesController < ApplicationController
  def home
    @studies = Study.find(:all, order: "sort_id, id")
    @concept_groups = ConceptGroup.find_all_by_parent_id(nil)
  end
end
