class StaticPagesController < ApplicationController
  def home
    @studies = Study.all
    @concept_groups = ConceptGroup.find_all_by_parent_id(nil)
  end
end
