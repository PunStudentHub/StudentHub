class BlogController < ApplicationController

  before_action -> {has_permission(:moderate)}, not: [:show]

  def new
    
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
