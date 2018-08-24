class FiltersController < ApplicationController

  def get
    @classyears = session[:class_year_ids]
  end


  def update
    session[:class_year_ids] = params[:class_year_ids].map(&:to_s)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

end
