class SectionsController < ApplicationController
  before_action -> {logged_in?}
  before_action -> {has_permission :teach}, only: [:new, :create, :edit, :update, :destroy]

  def show
    @section = Section.find_by_hash_id(params[:id])
  end
  def index
    @sections = Section.all
  end
  def new
    @section = current_user.sections.build
  end
  def create
    @section = current_user.sections.build(section_params)
    @section.user_id = current_user.id
    if (@section.save)
      flash[:success] = "Section created!"
      redirect_to @section
    else
      render 'new'
    end
  end
  def edit
    @section = Section.find_by_hash_id(params[:id])
  end
  def update
    @section = Section.find_by_hash_id(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "Section updated"
      redirect_to @section
    else
      render 'edit'
    end
  end
  def destroy
    Section.find_by_hash_id(params[:id]).destroy
    flash[:success] = "Section Deleted"
    redirect_to sections_url
  end
  private
    def section_params
      params.require(:section).permit(:name, :description, :location, :user_id)
    end
end
