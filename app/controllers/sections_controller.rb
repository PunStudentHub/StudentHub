class SectionsController < ApplicationController
  def new

  end
  private
    def section_params
      params.require(:name).permit(:description)
    end
end
