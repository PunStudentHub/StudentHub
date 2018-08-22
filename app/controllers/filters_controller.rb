class FiltersController < ApplicationController

  def get
    @classyears = session[:class_year_ids]
  end


  def update
    session[:class_year_ids] = params[:class_year_ids]
  end

end
