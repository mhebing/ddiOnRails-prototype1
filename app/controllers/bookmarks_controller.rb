class BookmarksController < ApplicationController
  def variable
    @study = Study.find_by_name(params[:study_name])
    @group = @study.groups.find_by_name(params[:group_name]) unless @study.blank?
    @physical_data_product = @group.physical_data_products.find_by_name(params[:physical_data_product_name]) unless @group.blank?
    @variable = @physical_data_product.variables.find_by_name(params[:variable_name]) unless @physical_data_product.blank?
    unless @variable.blank? then
      redirect_to variable_path(@variable)
    else 
      redirect_to "static_pages#home"
    end
  end
end
